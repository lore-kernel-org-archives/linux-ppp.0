From: Ben McKeegan <ben@netservers.co.uk>
Date: Thu, 29 Jun 2006 09:37:30 +0000
Subject: Re: Radius plugin bug.
Message-Id: <44A39F5A.6070206@netservers.co.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------070107010005080002010203"
List-Id: <linux-ppp.vger.kernel.org>
References: <20060629065205.GA18383@digitalpath.net>
In-Reply-To: <20060629065205.GA18383@digitalpath.net>
To: linux-ppp@vger.kernel.org

This is a multi-part message in MIME format.
--------------070107010005080002010203
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Ray Van Dolson wrote:
> I have a busy Linux-based PPTP concentrator (backed by pppd) using Radius
> authentication and am seeing some situations where a user connects and gets
> no /var/run/radattr file.
> 
> I've determined the situation is occuring as a result of User A connecting
> and being assigned interface ppp0; disconnecting, and while disconnecting
> user B connects and is assigned interface ppp0 (it apparently is made
> available before User A's disconnection process or plugins complete
> running).  User B's radattr script is written before user A's disconnect
> process is completed.  User A's process removes the radattr file (which is
> actually for user B!).
> 
> Here is an example from my logs of this type of situation occurring:
> ...
> I hacky fix idea I had in mind was to have cleanup() in radattr.c check the
> file modification time on the file in question to ensure it hasn't been
> written to by another process.  If so, don't remove it.
> 
> Maybe the proper fix would be to do some file locking or to reserve the
> interface from being assigned to another pppd until the previous connection
> has completed?
> 

Hi Ray,

That's not the only problem with the way radattr handles its files. 
With multilink enabled it doesn't work at all as it always misses the 
interface name out of the filename, so all pppd processes write to 
exactly the same file!

Attached is a patch I put together recently to work around the multilink 
issue. (This is against the 2.4.4b1 package from Debian Unstable.) It 
delays creating the file if the interface name is unavailable at the 
time of authentication.  Perhaps you could modify this to always delay. 
  Also, there's a section of radattr:

#if 0
     /* calling cleanup() on link down is problematic because 
print_attributes()
        is called only after PAP or CHAP authentication, but not when 
the link
        should go up again for any other reason */
     add_notifier(&link_down_notifier, cleanup, NULL);
#endif

     /* Just in case... */
     add_notifier(&exitnotify, cleanup, NULL);

As you can see until someone macro'd out a chunk of code it originally 
removed the file on link down, and again on exit (long after the ppp 
device has been reassigned).  Perhaps by storing a copy of the 
attributes (as I am doing in my multilink patch) and rewriting the file 
whenever the link goes up, we can work around the issue that prompted 
someone to macro out the first call to cleanup(), and get rid of the 
second call.

Ben.

-- 
Ben McKeegan
Netservers Limited


--------------070107010005080002010203
Content-Type: text/x-patch;
 name="radattr.c.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="radattr.c.patch"

--- ppp-2.4.4b1/pppd/plugins/radius/radattr.c.orig	2004-10-28 01:24:40.000000000 +0100
+++ ppp-2.4.4b1/pppd/plugins/radius/radattr.c	2006-06-27 16:21:39.000000000 +0100
@@ -22,11 +22,17 @@
 #include <stdio.h>
 
 extern void (*radius_attributes_hook)(VALUE_PAIR *);
+void (*radattr_attributes_oldhook)(VALUE_PAIR *) = NULL;
+void (*radattr_ip_choose_oldhook) __P((u_int32_t *)) = NULL;
 static void print_attributes(VALUE_PAIR *);
 static void cleanup(void *opaque, int arg);
 
 char pppd_version[] = VERSION;
 
+char fname[512];
+VALUE_PAIR *saved_vp=NULL;
+static radattr_ip_choose_hooked=0;
+
 /**********************************************************************
 * %FUNCTION: plugin_init
 * %ARGUMENTS:
@@ -39,8 +45,11 @@
 void
 plugin_init(void)
 {
+    radattr_attributes_oldhook = radius_attributes_hook;
     radius_attributes_hook = print_attributes;
 
+    fname[0]='\0';
+
 #if 0
     /* calling cleanup() on link down is problematic because print_attributes()
        is called only after PAP or CHAP authentication, but not when the link
@@ -63,11 +72,8 @@
 *  Prints the attribute pairs to /var/run/radattr.pppN.  Each line of the
 *  file contains "name value" pairs.
 ***********************************************************************/
-static void
-print_attributes(VALUE_PAIR *vp)
-{
+void print_attributes_to_file(VALUE_PAIR *vp) {
     FILE *fp;
-    char fname[512];
     char name[2048];
     char value[2048];
     int cnt = 0;
@@ -90,6 +96,47 @@
     dbglog("RADATTR plugin wrote %d line(s) to file %s.", cnt, fname);
 }
 
+
+static void radattr_ip_choose_hook(u_int32_t *addrp) {
+  if (saved_vp && ifname[0]) {
+    /* If multilink is enabled this is first available
+       hook after setting ifname.
+       Thankfully IPCP is first network protocol to be started
+       and this hook will get called before any other
+       protocols are started.
+       We're assuming IP is always enabled if multilink is!  */
+
+    print_attributes_to_file(saved_vp);
+    rc_avpair_free(saved_vp);
+    saved_vp=NULL;
+  }
+  if (radattr_ip_choose_oldhook) {
+    radattr_ip_choose_oldhook(addrp);
+  }
+}
+
+static void
+print_attributes(VALUE_PAIR *vp)
+{
+
+    if (radattr_attributes_oldhook) {
+      radattr_attributes_oldhook(vp);
+    }
+
+    if (ifname[0]) {
+      print_attributes_to_file(vp);
+    } else {
+      if (saved_vp) 
+	rc_avpair_free(saved_vp);
+      saved_vp=rc_avpair_copy(vp);
+      if (saved_vp && ! radattr_ip_choose_hooked) {
+	radattr_ip_choose_oldhook=ip_choose_hook;
+	ip_choose_hook=radattr_ip_choose_hook;
+	radattr_ip_choose_hooked=1;
+      }
+    }
+}
+
 /**********************************************************************
 * %FUNCTION: cleanup
 * %ARGUMENTS:
@@ -103,9 +150,8 @@
 static void
 cleanup(void *opaque, int arg)
 {
-    char fname[512];
-
-    slprintf(fname, sizeof(fname), "/var/run/radattr.%s", ifname);
+  if (fname[0]) {
     (void) remove(fname);
     dbglog("RADATTR plugin removed file %s.", fname);
+  }
 }

--------------070107010005080002010203--
