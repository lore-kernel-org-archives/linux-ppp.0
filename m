From: "Marco d'Itri" <md@linux.it>
Date: Sun, 19 Aug 2007 01:37:41 +0000
Subject: [patch 01/14] fix minor issues
Message-Id: <20070819014008.810139034@bongo.bofh.it>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Fix warnings, missing prototypes, an incomplete clean target.

--- a/chat/chat.c
+++ b/chat/chat.c
@@ -1303,7 +1303,7 @@ register char *s;
 
     if (verbose) {
 	if (quiet)
-	    msgf("send (??????)");
+	    msgf("send (?)");
 	else
 	    msgf("send (%v)", s);
     }
--- a/pppd/ipv6cp.c
+++ b/pppd/ipv6cp.c
@@ -1120,7 +1120,7 @@ ipv6_check_options()
 
     if (demand && (eui64_iszero(wo->ourid) || eui64_iszero(wo->hisid))) {
 	option_error("local/remote LL address required for demand-dialling\n");
-	exit(1);
+	die(1);
     }
 }
 
--- a/pppd/pppd.h
+++ b/pppd/pppd.h
@@ -642,6 +642,8 @@ int  sif6addr __P((int, eui64_t, eui64_t
 				/* Configure IPv6 addresses for i/f */
 int  cif6addr __P((int, eui64_t, eui64_t));
 				/* Remove an IPv6 address from i/f */
+int  ether_to_eui64 __P((eui64_t *));
+				/* Convert Ethernet address into 64-bit EUI */
 #endif
 int  sifdefaultroute __P((int, u_int32_t, u_int32_t));
 				/* Create default route through i/f */
--- a/pppd/plugins/rp-pppoe/Makefile.linux
+++ b/pppd/plugins/rp-pppoe/Makefile.linux
@@ -44,7 +44,7 @@ install: all
 	$(INSTALL) -s -c -m 555 pppoe-discovery $(BINDIR)
 
 clean:
-	rm -f *.o *.so
+	rm -f *.o *.so pppoe-discovery
 
 plugin.o: plugin.c
 	$(CC) '-DRP_VERSION="$(VERSION)"' $(CFLAGS) -I../../..  -c -o plugin.o -fPIC plugin.c

-- 
ciao,
Marco

