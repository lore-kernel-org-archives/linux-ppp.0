From: Ray Van Dolson <rayvd@digitalpath.net>
Date: Wed, 05 Jul 2006 19:40:21 +0000
Subject: Re: Radius plugin bug.
Message-Id: <20060705194021.GA13527@digitalpath.net>
List-Id: <linux-ppp.vger.kernel.org>
References: <20060629065205.GA18383@digitalpath.net>
In-Reply-To: <20060629065205.GA18383@digitalpath.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Well have been working on this a little, and may have found a potential
solution that works.

Feedback would be appreciate from real programmers as to negative
consequences of reorganizing the code a little...

Basically, I am removing the calls to free the ppp interface from the
link_terminated function and relocating them to later in the process --
after the plugin cleanup functions have been called removing the radius
attribute file.

Seems to be working OK so far on our server...

diff -uNrp ppp-2.4.3.orig/pppd/auth.c ppp-2.4.3/pppd/auth.c
--- ppp-2.4.3.orig/pppd/auth.c	2004-11-12 02:30:51.000000000 -0800
+++ ppp-2.4.3/pppd/auth.c	2006-07-05 12:03:47.000000000 -0700
@@ -83,6 +83,7 @@
 #include <sys/socket.h>
 #include <utmp.h>
 #include <fcntl.h>
 #if defined(_PATH_LASTLOG) && defined(__linux__)
 #include <lastlog.h>
 #endif
@@ -621,6 +622,7 @@ link_terminated(unit)
      * the ppp unit back to the loopback.  Set the
      * real serial device back to its normal mode of operation.
      */
+    /*
     if (fd_ppp >= 0) {
 	remove_fd(fd_ppp);
 	clean_check();
@@ -629,6 +631,8 @@ link_terminated(unit)
 	    mp_exit_bundle();
 	fd_ppp = -1;
     }
+    */
     if (!hungup)
 	lcp_lowerdown(0);
     if (!doing_multilink && !demand)
@@ -638,10 +642,14 @@ link_terminated(unit)
      * Run disconnector script, if requested.
      * XXX we may not be able to do this if the line has hung up!
      */
+    /*
     if (devfd >= 0 && the_channel->disconnect) {
 	the_channel->disconnect();
 	devfd = -1;
     }
+    */
 
     if (doing_multilink && multilink_master) {
 	if (!bundle_terminating)
diff -uNrp ppp-2.4.3.orig/pppd/main.c ppp-2.4.3/pppd/main.c
--- ppp-2.4.3.orig/pppd/main.c	2004-11-13 04:05:48.000000000 -0800
+++ ppp-2.4.3/pppd/main.c	2006-07-05 12:03:52.000000000 -0700
@@ -1098,8 +1108,9 @@ die(status)
 {
     if (!doing_multilink || multilink_master)
 	print_link_stats();
-    cleanup();
     notify(exitnotify, status);
+    cleanup();
     syslog(LOG_INFO, "Exit.");
     exit(status);
 }
@@ -1113,10 +1124,46 @@ cleanup()
 {
     sys_cleanup();
 
-    if (fd_ppp >= 0)
+    /*
+    if (fd_ppp >= 0) {
+        syslog(LOG_INFO, "Calling disestablish_ppp from cleanup()");
 	the_channel->disestablish_ppp(devfd);
-    if (the_channel->cleanup)
+    }
+    */
+
+    /*
+     * If we may want to bring the link up again, transfer
+     * the ppp unit back to the loopback.  Set the
+     * real serial device back to its normal mode of operation.
+     */
+
+    if (fd_ppp >= 0) {
+	remove_fd(fd_ppp);
+	clean_check();
+        syslog(LOG_INFO, "Calling disestablish_ppp from cleanup()");
+	the_channel->disestablish_ppp(devfd);
+	if (doing_multilink)
+	    mp_exit_bundle();
+	fd_ppp = -1;
+    }
+
+    /*
+     * Run disconnector script, if requested.
+     * XXX we may not be able to do this if the line has hung up!
+     */
+    if (devfd >= 0 && the_channel->disconnect) {
+	syslog(LOG_INFO, "Running disconnector scripts...");
+	the_channel->disconnect();
+	devfd = -1;
+	syslog(LOG_INFO, "Finished running disconnector scripts...");
+    }
+
+    if (the_channel->cleanup) {
+        syslog(LOG_INFO, "Calling cleanup from cleanup()");
 	(*the_channel->cleanup)();
+    }
+
+    syslog(LOG_INFO, "Removing pidfiles.");
     remove_pidfiles();
 
 #ifdef USE_TDB
