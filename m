From: Paul Mackerras <paulus@samba.org>
Date: Sat, 03 Jun 2006 00:57:28 +0000
Subject: Re: (4 ADSL lines)
Message-Id: <17536.56952.835156.343138@cargo.ozlabs.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

Marcos Dione writes:

>   I'm setting up a machine with 4 ADSL lines connected to the same nic vi=
a a
> switch. I'm not sure this is `supported=B4 or if I should add the 3 extra=
 nics
> it `should=B4 have.

[snip]

>   I'm starting to think that those are configure-acks `routed=B4 to the w=
rong
> pppd, because if I bring up one line at a time, all establish the connect=
ion
> succesfully. I just wanted to make sure I was reaching to the correct
> conclusion.

This patch might help.  It adds an option for the rp-pppoe pppd plugin
that lets you specify that pppd should only listen to one specific
ethernet MAC address.  You should then be able to run 4 instances of
pppd on the one machine, all using the one ethernet NIC on that
machine, and give each instance of pppd the ethernet MAC address of
one of the 4 ADSL modems.  I haven't tested this sort of setup myself,
so let me know if this helps.  The new option is called "pppoe-mac"
and takes one argument, the MAC address formatted as xx:xx:xx:xx:xx:xx.

Paul.

diff -urN a/ppp/pppd/plugins/rp-pppoe/discovery.c b/ppp/pppd/plugins/rp-ppp=
oe/discovery.c
--- a/ppp/pppd/plugins/rp-pppoe/discovery.c	2005-03-22 21:22:32.000000000 +=
1100
+++ b/ppp/pppd/plugins/rp-pppoe/discovery.c	2006-03-01 22:27:13.000000000 +=
1100
@@ -308,7 +308,7 @@
 * Waits for a PADO packet and copies useful information
 ***********************************************************************/
 void
-waitForPADO(PPPoEConnection *conn, int timeout)
+waitForPADO(PPPoEConnection *conn, int timeout, unsigned char *reqd_mac)
 {
     fd_set readable;
     int r;
@@ -369,6 +369,11 @@
 		printErr("Ignoring PADO packet from broadcast MAC address");
 		continue;
 	    }
+	    if (reqd_mac !=3D NULL
+		&& memcmp(packet.ethHdr.h_source, reqd_mac, ETH_ALEN) !=3D 0) {
+		error("Ignoring PADO packet from wrong MAC address");
+		continue;
+	    }
 	    parsePacket(&packet, parsePADOTags, &pc);
 	    if (!pc.seenACName) {
 		printErr("Ignoring PADO packet with no AC-Name tag");
@@ -574,7 +579,7 @@
 * Performs the PPPoE discovery phase
 ***********************************************************************/
 void
-discovery(PPPoEConnection *conn)
+discovery(PPPoEConnection *conn, unsigned char *reqd_mac)
 {
     int padiAttempts =3D 0;
     int padrAttempts =3D 0;
@@ -605,7 +610,7 @@
 	}
 	sendPADI(conn);
 	conn->discoveryState =3D STATE_SENT_PADI;
-	waitForPADO(conn, timeout);
+	waitForPADO(conn, timeout, reqd_mac);
=20
 	/* If we're just probing for access concentrators, don't do
 	   exponential backoff.  This reduces the time for an unsuccessful
diff -urN a/ppp/pppd/plugins/rp-pppoe/plugin.c b/ppp/pppd/plugins/rp-pppoe/=
plugin.c
--- a/ppp/pppd/plugins/rp-pppoe/plugin.c	2006-05-30 09:29:16.000000000 +1000
+++ b/ppp/pppd/plugins/rp-pppoe/plugin.c	2006-06-03 10:49:56.000000000 +1000
@@ -63,6 +63,8 @@
 static char *acName =3D NULL;
 static char *existingSession =3D NULL;
 static int printACNames =3D 0;
+static char *pppoe_reqd_mac =3D NULL;
+unsigned char pppoe_reqd_mac_addr[6];
=20
 static int PPPoEDevnameHook(char *cmd, char **argv, int doit);
 static option_t Options[] =3D {
@@ -78,6 +80,8 @@
       "Attach to existing session (sessid:macaddr)" },
     { "rp_pppoe_verbose", o_int, &printACNames,
       "Be verbose about discovered access concentrators"},
+    { "pppoe-mac", o_string, &pppoe_reqd_mac,
+      "Only connect to specified MAC address" },
     { NULL }
 };
=20
@@ -142,7 +146,7 @@
 	    conn->peerEth[i] =3D (unsigned char) mac[i];
 	}
     } else {
-	discovery(conn);
+	discovery(conn, (pppoe_reqd_mac? pppoe_reqd_mac_addr: NULL));
 	if (conn->discoveryState !=3D STATE_SESSION) {
 	    error("Unable to complete PPPoE Discovery");
 	    return -1;
@@ -381,6 +385,20 @@
=20
 void pppoe_check_options(void)
 {
+    unsigned int mac[6];
+    int i;
+
+    if (pppoe_reqd_mac !=3D NULL) {
+	if (sscanf(pppoe_reqd_mac, "%x:%x:%x:%x:%x:%x",
+		   &mac[0], &mac[1], &mac[2], &mac[3],
+		   &mac[4], &mac[5]) !=3D 6) {
+	    option_error("cannot parse pppoe-mac option value");
+	    exit(EXIT_OPTION_ERROR);
+	}
+	for (i =3D 0; i < 6; ++i)
+	    pppoe_reqd_mac_addr[i] =3D mac[i];
+    }
+
     lcp_allowoptions[0].neg_accompression =3D 0;
     lcp_wantoptions[0].neg_accompression =3D 0;
=20
diff -urN a/ppp/pppd/plugins/rp-pppoe/pppoe.h b/ppp/pppd/plugins/rp-pppoe/p=
ppoe.h
--- a/ppp/pppd/plugins/rp-pppoe/pppoe.h	2004-11-04 21:07:37.000000000 +1100
+++ b/ppp/pppd/plugins/rp-pppoe/pppoe.h	2006-03-01 22:13:24.000000000 +1100
@@ -303,7 +303,7 @@
 void clampMSS(PPPoEPacket *packet, char const *dir, int clampMss);
 UINT16_t computeTCPChecksum(unsigned char *ipHdr, unsigned char *tcpHdr);
 UINT16_t pppFCS16(UINT16_t fcs, unsigned char *cp, int len);
-void discovery(PPPoEConnection *conn);
+void discovery(PPPoEConnection *conn, unsigned char *reqd_addr);
 unsigned char *findTag(PPPoEPacket *packet, UINT16_t tagType,
 		       PPPoETag *tag);
=20
