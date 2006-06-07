From: Marcos Dione <mdione@fcq.unc.edu.ar>
Date: Wed, 07 Jun 2006 17:57:50 +0000
Subject: Re: (4 ADSL lines)
Message-Id: <20060607145750.ozvprvxwhhlwcgok@webmail.fcq.unc.edu.ar>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=_tx2gelfuwm8"
List-Id: <linux-ppp.vger.kernel.org>
References: <17536.56952.835156.343138@cargo.ozlabs.ibm.com>
In-Reply-To: <17536.56952.835156.343138@cargo.ozlabs.ibm.com>
To: linux-ppp@vger.kernel.org

This message is in MIME format.

--=_tx2gelfuwm8
Content-Type: text/plain;
	charset=ISO-8859-1;
	format="flowed"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Quoting Marcos Dione <mdione@fcq.unc.edu.ar>:
> Quoting Paul Mackerras <paulus@samba.org>:
>> This patch might help.  It adds an option for the rp-pppoe pppd plugin
>> that lets you specify that pppd should only listen to one specific
>> ethernet MAC address.  You should then be able to run 4 instances of
>> pppd on the one machine, all using the one ethernet NIC on that
>> machine, and give each instance of pppd the ethernet MAC address of
>> one of the 4 ADSL modems.  I haven't tested this sort of setup myself,
>> so let me know if this helps.  The new option is called "pppoe-mac"
>> and takes one argument, the MAC address formatted as xx:xx:xx:xx:xx:xx.
>
>  it's not a grave bug. I'll be trying the patch anyway today. I hope to h=
ave
> news soon.

  well, it *was* a rather grave bug: the pppoe plugin didn't compile.
a fixed version is attached (applies to debian's ppp-2.4.4b1 source code; I
hope debian's patches aren't breaking anything).

  so I give it a try. first, bringing up one line at a time, just to make
sure the option doesn't break anything:

Jun  7 14:17:19 pigmea pppd[20083]: Plugin rp-pppoe.so loaded.
Jun  7 14:17:19 pigmea pppd[20086]: pppd 2.4.4b1 started by root, uid 0
Jun  7 14:17:19 pigmea pppd[20086]: Serial connection established.
Jun  7 14:17:19 pigmea pppd[20086]: Using interface ppp0
Jun  7 14:17:19 pigmea pppd[20086]: Connect: ppp0 <--> /dev/pts/4
Jun  7 14:17:26 pigmea pppd[20086]: PAP authentication succeeded
Jun  7 14:17:26 pigmea pppd[20086]: local  IP address 201.252.177.160
Jun  7 14:17:26 pigmea pppd[20086]: remote IP address 200.3.60.3
Jun  7 14:18:16 pigmea pppd[20111]: Plugin rp-pppoe.so loaded.
Jun  7 14:18:16 pigmea pppd[20114]: pppd 2.4.4b1 started by root, uid 0
Jun  7 14:18:16 pigmea pppd[20114]: Serial connection established.
Jun  7 14:18:16 pigmea pppd[20114]: Using interface ppp1
Jun  7 14:18:16 pigmea pppd[20114]: Connect: ppp1 <--> /dev/pts/5
Jun  7 14:18:19 pigmea pppd[20114]: PAP authentication succeeded
Jun  7 14:18:19 pigmea pppd[20114]: local  IP address 200.82.93.161
Jun  7 14:18:19 pigmea pppd[20114]: remote IP address 200.3.60.3
Jun  7 14:18:28 pigmea pppd[20086]: Terminating on signal 15
Jun  7 14:18:28 pigmea pppd[20086]: Connect time 1.1 minutes.
Jun  7 14:18:28 pigmea pppd[20086]: Sent 0 bytes, received 688 bytes.
Jun  7 14:18:28 pigmea pppd[20086]: Connection terminated.
Jun  7 14:18:28 pigmea pppd[20086]: Exit.
Jun  7 14:18:29 pigmea pppd[20114]: Terminating on signal 15
Jun  7 14:18:29 pigmea pppd[20114]: Connect time 0.2 minutes.
Jun  7 14:18:29 pigmea pppd[20114]: Sent 0 bytes, received 0 bytes.
Jun  7 14:18:29 pigmea pppd[20114]: Connection terminated.
Jun  7 14:18:30 pigmea pppd[20114]: Exit.

  then I try both lines at the same time. they locked a while and aborted:

Jun  7 14:24:02 pigmea pppd[20304]: Plugin rp-pppoe.so loaded.
Jun  7 14:24:02 pigmea pppd[20307]: pppd 2.4.4b1 started by root, uid 0
Jun  7 14:24:02 pigmea pppd[20313]: Plugin rp-pppoe.so loaded.
Jun  7 14:24:02 pigmea pppd[20316]: pppd 2.4.4b1 started by root, uid 0
Jun  7 14:24:02 pigmea pppd[20307]: Serial connection established.
Jun  7 14:24:02 pigmea pppd[20307]: Using interface ppp0
Jun  7 14:24:02 pigmea pppd[20307]: Connect: ppp0 <--> /dev/pts/5
Jun  7 14:24:02 pigmea pppd[20316]: Serial connection established.
Jun  7 14:24:02 pigmea pppd[20316]: Using interface ppp1
Jun  7 14:24:02 pigmea pppd[20316]: Connect: ppp1 <--> /dev/pts/6
Jun  7 14:24:17 pigmea pppd[20316]: Remote message: Request Denied
Jun  7 14:24:17 pigmea pppd[20316]: Connection terminated.
Jun  7 14:24:17 pigmea pppd[20307]: Modem hangup
Jun  7 14:24:17 pigmea pppd[20307]: Connection terminated.

  then a second run was successfull, but only after a failure (the peers ar=
e
configured to persist):

Jun  7 14:25:32 pigmea pppd[20408]: Plugin rp-pppoe.so loaded.
Jun  7 14:25:32 pigmea pppd[20411]: pppd 2.4.4b1 started by root, uid 0
Jun  7 14:25:32 pigmea pppd[20417]: Plugin rp-pppoe.so loaded.
Jun  7 14:25:32 pigmea pppd[20420]: pppd 2.4.4b1 started by root, uid 0
Jun  7 14:25:32 pigmea pppd[20411]: Serial connection established.
Jun  7 14:25:32 pigmea pppd[20411]: Using interface ppp0
Jun  7 14:25:32 pigmea pppd[20411]: Connect: ppp0 <--> /dev/pts/5
Jun  7 14:25:32 pigmea pppd[20420]: Serial connection established.
Jun  7 14:25:33 pigmea pppd[20420]: Using interface ppp1
Jun  7 14:25:33 pigmea pppd[20420]: Connect: ppp1 <--> /dev/pts/6
Jun  7 14:28:21 pigmea pppd[20420]: Remote message: Request Denied
Jun  7 14:28:21 pigmea pppd[20420]: Connection terminated.
Jun  7 14:28:21 pigmea pppd[20411]: Modem hangup
Jun  7 14:28:21 pigmea pppd[20411]: Connection terminated.
Jun  7 14:28:51 pigmea pppd[20420]: Serial connection established.
Jun  7 14:28:51 pigmea pppd[20420]: Using interface ppp0
Jun  7 14:28:51 pigmea pppd[20420]: Connect: ppp0 <--> /dev/pts/5
Jun  7 14:28:51 pigmea pppd[20411]: Serial connection established.
Jun  7 14:28:51 pigmea pppd[20411]: Using interface ppp1
Jun  7 14:28:51 pigmea pppd[20411]: Connect: ppp1 <--> /dev/pts/6
Jun  7 14:28:53 pigmea pppd[20411]: PAP authentication succeeded
Jun  7 14:28:53 pigmea pppd[20411]: local  IP address 200.117.137.233
Jun  7 14:28:53 pigmea pppd[20411]: remote IP address 200.3.60.3
Jun  7 14:29:18 pigmea pppd[20420]: Remote message: Authentication failed
Jun  7 14:29:18 pigmea pppd[20420]: Connection terminated.
Jun  7 14:29:48 pigmea pppd[20420]: Serial connection established.
Jun  7 14:29:48 pigmea pppd[20420]: Using interface ppp0
Jun  7 14:29:48 pigmea pppd[20420]: Connect: ppp0 <--> /dev/pts/5
Jun  7 14:29:52 pigmea pppd[20420]: PAP authentication succeeded
Jun  7 14:29:52 pigmea pppd[20420]: local  IP address 201.252.167.4
Jun  7 14:29:52 pigmea pppd[20420]: remote IP address 200.3.60.3
Jun  7 14:35:17 pigmea pppd[20411]: Terminating on signal 15
Jun  7 14:35:17 pigmea pppd[20411]: Connect time 6.4 minutes.
Jun  7 14:35:17 pigmea pppd[20411]: Sent 0 bytes, received 5660 bytes.
Jun  7 14:35:17 pigmea pppd[20411]: Connection terminated.
Jun  7 14:35:17 pigmea pppd[20420]: Terminating on signal 15
Jun  7 14:35:17 pigmea pppd[20420]: Connect time 5.5 minutes.
Jun  7 14:35:17 pigmea pppd[20420]: Sent 0 bytes, received 17399 bytes.
Jun  7 14:35:17 pigmea pppd[20420]: Connection terminated.
Jun  7 14:35:17 pigmea pppd[20411]: Exit.
Jun  7 14:35:17 pigmea pppd[20420]: Exit.

  the tcpdump output of this last try can be obtained here:

http://martina.fcq.unc.edu.ar/~mdione/pppoes_20060706.dump

-- 
Marcos Dione
Departamento de C=F3mputos
Facultad de Ciencias Qu=EDmicas - UNC

----------------------------------------------------------------
Facultad de Ciencias Qu=C3micas - Universidad Nacional de C=C3rdoba


--=_tx2gelfuwm8
Content-Type: text/x-diff;
	charset=UTF-8;
	name="zzz_pppoe-mac_option.diff"
Content-Disposition: attachment;
	filename="zzz_pppoe-mac_option.diff"
Content-Transfer-Encoding: 7bit

diff -ur build-tree/ppp-2.4.4b1/pppd/plugins/rp-pppoe/discovery.c build-tree.new/ppp-2.4.4b1/pppd/plugins/rp-pppoe/discovery.c
--- build-tree/ppp-2.4.4b1/pppd/plugins/rp-pppoe/discovery.c	2006-06-07 14:46:36.000000000 -0300
+++ build-tree.new/ppp-2.4.4b1/pppd/plugins/rp-pppoe/discovery.c	2006-06-07 12:54:20.000000000 -0300
@@ -295,7 +295,7 @@
 * Waits for a PADO packet and copies useful information
 ***********************************************************************/
 void
-waitForPADO(PPPoEConnection *conn, int timeout)
+waitForPADO(PPPoEConnection *conn, int timeout, unsigned char *reqd_mac)
 {
     fd_set readable;
     int r;
@@ -355,6 +355,11 @@
 		error("Ignoring PADO packet from broadcast MAC address");
 		continue;
 	    }
+            if (reqd_mac != NULL
+	        && memcmp(packet.ethHdr.h_source, reqd_mac, ETH_ALEN) != 0) {
+    		error("Ignoring PADO packet from wrong MAC address");
+    		continue;
+	    }
 	    parsePacket(&packet, parsePADOTags, &pc);
 	    if (!pc.seenACName) {
 		error("Ignoring PADO packet with no AC-Name tag");
@@ -560,7 +565,7 @@
 * Performs the PPPoE discovery phase
 ***********************************************************************/
 void
-discovery(PPPoEConnection *conn)
+discovery(PPPoEConnection *conn, unsigned char *reqd_mac)
 {
     int padiAttempts = 0;
     int padrAttempts = 0;
@@ -589,9 +594,9 @@
 	    conn->discoverySocket = -1;
 	    return;
 	}
-	sendPADI(conn);
+     	sendPADI(conn);
 	conn->discoveryState = STATE_SENT_PADI;
-	waitForPADO(conn, timeout);
+	waitForPADO(conn, timeout, reqd_mac);
 
 	/* If we're just probing for access concentrators, don't do
 	   exponential backoff.  This reduces the time for an unsuccessful
diff -ur build-tree/ppp-2.4.4b1/pppd/plugins/rp-pppoe/plugin.c build-tree.new/ppp-2.4.4b1/pppd/plugins/rp-pppoe/plugin.c
--- build-tree/ppp-2.4.4b1/pppd/plugins/rp-pppoe/plugin.c	2006-06-07 14:46:36.000000000 -0300
+++ build-tree.new/ppp-2.4.4b1/pppd/plugins/rp-pppoe/plugin.c	2006-06-07 12:54:20.000000000 -0300
@@ -62,6 +62,8 @@
 static char *acName = NULL;
 static char *existingSession = NULL;
 static int printACNames = 0;
+static char *pppoe_reqd_mac = NULL;
+unsigned char pppoe_reqd_mac_addr[6];
 
 static int PPPoEDevnameHook(char *cmd, char **argv, int doit);
 static option_t Options[] = {
@@ -77,7 +79,9 @@
       "Attach to existing session (sessid:macaddr)" },
     { "rp_pppoe_verbose", o_int, &printACNames,
       "Be verbose about discovered access concentrators"},
-    { NULL }
+    { "pppoe-mac", o_string, &pppoe_reqd_mac,
+      "Only connect to specified MAC address" },
+     { NULL }
 };
 
 static PPPoEConnection *conn = NULL;
@@ -141,7 +145,7 @@
 	    conn->peerEth[i] = (unsigned char) mac[i];
 	}
     } else {
-	discovery(conn);
+	discovery(conn, (pppoe_reqd_mac? pppoe_reqd_mac_addr: NULL));
 	if (conn->discoveryState != STATE_SESSION) {
 	    error("Unable to complete PPPoE Discovery");
 	    return -1;
@@ -366,6 +370,20 @@
 
 void pppoe_check_options(void)
 {
+    unsigned int mac[6];
+    int i;
+
+    if (pppoe_reqd_mac != NULL) {
+        if (sscanf(pppoe_reqd_mac, "%x:%x:%x:%x:%x:%x",
+                   &mac[0], &mac[1], &mac[2], &mac[3],
+                   &mac[4], &mac[5]) != 6) {
+            option_error("cannot parse pppoe-mac option value");
+            exit(EXIT_OPTION_ERROR);
+        }
+        for (i = 0; i < 6; ++i)
+            pppoe_reqd_mac_addr[i] = mac[i];
+    }
+ 
     lcp_allowoptions[0].neg_accompression = 0;
     lcp_wantoptions[0].neg_accompression = 0;
 
diff -ur build-tree/ppp-2.4.4b1/pppd/plugins/rp-pppoe/pppoe-discovery.c build-tree.new/ppp-2.4.4b1/pppd/plugins/rp-pppoe/pppoe-discovery.c
--- build-tree/ppp-2.4.4b1/pppd/plugins/rp-pppoe/pppoe-discovery.c	2006-06-07 14:46:36.000000000 -0300
+++ build-tree.new/ppp-2.4.4b1/pppd/plugins/rp-pppoe/pppoe-discovery.c	2006-06-07 13:53:16.000000000 -0300
@@ -22,6 +22,7 @@
 int main(int argc, char *argv[])
 {
     int opt;
+    char *mac = NULL;
     PPPoEConnection *conn;
 
     conn = malloc(sizeof(PPPoEConnection));
@@ -30,7 +31,7 @@
 
     memset(conn, 0, sizeof(PPPoEConnection));
 
-    while ((opt = getopt(argc, argv, "I:D:VUAS:C:h")) > 0) {
+    while ((opt = getopt(argc, argv, "I:D:VUAS:C:hM:")) > 0) {
 	switch(opt) {
 	case 'S':
 	    conn->serviceName = strDup(optarg);
@@ -56,6 +57,9 @@
 	case 'A':
 	    /* this is the default */
 	    break;
+	case 'M':
+	    mac = strDup(optarg);
+	    break;
 	case 'V':
 	case 'h':
 	    usage();
@@ -74,7 +78,7 @@
     conn->sessionSocket = -1;
     conn->printACNames = 1;
 
-    discovery(conn);
+    discovery(conn, mac);
     exit(0);
 }
 
diff -ur build-tree/ppp-2.4.4b1/pppd/plugins/rp-pppoe/pppoe.h build-tree.new/ppp-2.4.4b1/pppd/plugins/rp-pppoe/pppoe.h
--- build-tree/ppp-2.4.4b1/pppd/plugins/rp-pppoe/pppoe.h	2006-06-07 14:46:36.000000000 -0300
+++ build-tree.new/ppp-2.4.4b1/pppd/plugins/rp-pppoe/pppoe.h	2006-06-07 12:54:20.000000000 -0300
@@ -303,7 +303,7 @@
 void clampMSS(PPPoEPacket *packet, char const *dir, int clampMss);
 UINT16_t computeTCPChecksum(unsigned char *ipHdr, unsigned char *tcpHdr);
 UINT16_t pppFCS16(UINT16_t fcs, unsigned char *cp, int len);
-void discovery(PPPoEConnection *conn);
+void discovery(PPPoEConnection *conn, unsigned char *reqd_addr);
 unsigned char *findTag(PPPoEPacket *packet, UINT16_t tagType,
 		       PPPoETag *tag);
 

--=_tx2gelfuwm8--
