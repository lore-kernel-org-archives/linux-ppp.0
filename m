From: Arvin Schnell <arvin@suse.de>
Date: Fri, 16 Jul 2004 09:59:08 +0000
Subject: rename ppp interface
Message-Id: <20040716095908.GA32556@suse.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="huq684BweRXVnRxX"
List-Id: <linux-ppp.vger.kernel.org>
To: linux-ppp@vger.kernel.org


--huq684BweRXVnRxX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Hi,

as you might know with the linux kernel 2.6 it is possible to
rename network interfaces.  I have made a small patch to allow
the pppd to rename it is ppp interface.  The patch is only to
demonstrate the issue - it is far from complete (no option, no
documentation, pppstats needs adaption).  If there is willingness
to include this feature in the mainline I can make a complete
patch.

Besides that, does anybody see problems with renaming of ppp
interfaces?

ciao Arvin

-- 
Dipl.-Phys. Arvin Schnell
SuSE Linux AG
Research & Development
email: arvin@suse.de

--huq684BweRXVnRxX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="ppp-2.4.2-nameif.diff"

--- ./pppd/main.c.orig	2004-07-15 14:16:09.000000000 +0000
+++ ./pppd/main.c	2004-07-15 15:01:24.000000000 +0000
@@ -777,8 +777,11 @@
 set_ifunit(iskey)
     int iskey;
 {
-    info("Using interface %s%d", PPP_DRV_NAME, ifunit);
+    if (1)
+	slprintf(ifname, sizeof(ifname), "modem");
+    else
     slprintf(ifname, sizeof(ifname), "%s%d", PPP_DRV_NAME, ifunit);
+    info("Using interface %s", ifname);
     script_setenv("IFNAME", ifname, iskey);
     if (iskey) {
 	create_pidfile(getpid());	/* write pid to file */
--- ./pppd/sys-linux.c.orig	2004-07-15 14:16:18.000000000 +0000
+++ ./pppd/sys-linux.c	2004-07-16 09:36:24.373838222 +0000
@@ -647,6 +647,17 @@
 	}
 	if (x < 0)
 		error("Couldn't create new ppp unit: %m");
+
+	if (1) {
+		struct ifreq ifr;
+		memset(&ifr, 0, sizeof(struct ifreq));
+		strcpy(ifr.ifr_name, "ppp0");
+		strcpy(ifr.ifr_newname, "modem");
+		x = ioctl(sock_fd, SIOCSIFNAME, &ifr);
+		if (x < 0)
+		    error("Couldn't rename interface %s to %s: %m", "ppp0", "modem");
+	}
+
 	return x;
 }
 

--huq684BweRXVnRxX--
