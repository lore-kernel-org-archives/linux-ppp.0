From: "Marco d'Itri" <md@linux.it>
Date: Sun, 19 Aug 2007 01:37:43 +0000
Subject: [patch 03/14] be sure to close /dev/ppp when reconnecting
Message-Id: <20070819014009.015076277@bongo.bofh.it>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

From: Simon Peter <dn.tlp@gmx.net>
Subject: [patch 03/14] Bug#306261: pppd does not properly close /dev/ppp on persist

When using the kernel PPPoE driver, pppd never
closes /dev/ppp when the link has come down.

It opens superfluous fds to the device each time it re-opens the
connection, with the unclosed ones falsely reported always ready for
data by select().

This makes pppd eat up 100% CPU time after the first persist because of
the always instantly returning select() on the unclosed fds.

The problem also occurs with the upstream version, but does not occur
when a pty/tty device is used for the ppp connection.


diff -u -r ppp-2.4.3/pppd/sys-linux.c ppp-2.4.3/pppd/sys-linux.c
--- ppp-2.4.3/pppd/sys-linux.c	2005-04-29 20:08:37.000000000 +0200
+++ ppp-2.4.3/pppd/sys-linux.c	2005-04-29 20:07:03.000000000 +0200
@@ -455,6 +455,13 @@
     if (new_style_driver) {
 	int flags;
 
+        /* if a ppp_fd is already open, close it first */
+        if(ppp_fd > 0) {
+          close(ppp_fd);
+          remove_fd(ppp_fd);
+          ppp_fd = -1;
+        }
+
 	/* Open an instance of /dev/ppp and connect the channel to it */
 	if (ioctl(fd, PPPIOCGCHAN, &chindex) = -1) {
 	    error("Couldn't get channel number: %m");

-- 
ciao,
Marco

