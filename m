From: Ben McKeegan <ben@netservers.co.uk>
Date: Mon, 30 Nov 2009 10:47:27 +0000
Subject: [PATCH] Re: [Openl2tp-users] OpenL2TP, radius, radattr, multilink
Message-Id: <Pine.LNX.4.58.0911301040380.32491@benxen>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


On Fri, 27 Nov 2009, Johannes Jakob wrote:

> As far as openl2tp goes, it seems to work quite fine, but in combination with radius AND multilink, I'm having some serious trouble.
> We need working multilink support (that's why we started looking into switching to openl2tp in the first place) and we need the option to do static routing on the LNS, so I need to parse /var/run/radattr.pppX for "Framed-Route" entries.
>
> With multilink disabled, radattr works fine and creates /var/run/radattr.ppp0:
>
> RADATTR plugin wrote 8 line(s) to file /var/run/radattr.ppp0.
>
> but with enabled multilink it doesn't:
>
> rc_map2id: can't find tty /dev/ in map database
> RADATTR plugin wrote 8 line(s) to file /var/run/radattr..
>
>
> pppd in both cases did attach to ppp0, and ip-up gets called with iface=ppp0, but at the time /var/run/radattr.$iface was written pppd-radattr didn't know the interface the session had been attached to.


Here's a patch we use for radattr that delays writing the file until the
interface name is known.


--- radattr.c	2004-10-28 01:24:40.000000000 +0100
+++ radattr-multilink.c	2009-11-30 10:34:22.000000000 +0000
@@ -22,11 +22,17 @@ static char const RCSID[]  #include <stdio.h>

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
@@ -39,8 +45,11 @@ char pppd_version[] = VERSION;
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
@@ -63,11 +72,8 @@ plugin_init(void)
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
@@ -90,6 +96,47 @@ print_attributes(VALUE_PAIR *vp)
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
@@ -103,9 +150,8 @@ print_attributes(VALUE_PAIR *vp)
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
