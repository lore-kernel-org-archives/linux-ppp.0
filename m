From: Matteo Croce <matteo@openwrt.org>
Date: Fri, 20 Nov 2015 00:34:43 +0000
Subject: [PATCH] pppoe: custom host-uniq tag
Message-Id: <1447979683-11439-1-git-send-email-matteo@openwrt.org>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Add pppoe 'host-uniq' option to set an arbitrary
host-uniq tag instead of the pppd pid.
---
 pppd/plugins/rp-pppoe/common.c          | 12 ++++++------
 pppd/plugins/rp-pppoe/discovery.c       | 34 ++++++++++++++++-----------------
 pppd/plugins/rp-pppoe/plugin.c          |  8 +++++++-
 pppd/plugins/rp-pppoe/pppoe-discovery.c | 16 ++++++++++++++--
 pppd/plugins/rp-pppoe/pppoe.h           |  2 +-
 5 files changed, 45 insertions(+), 27 deletions(-)

diff --git a/pppd/plugins/rp-pppoe/common.c b/pppd/plugins/rp-pppoe/common.c
index 89c633c..ea1c651 100644
--- a/pppd/plugins/rp-pppoe/common.c
+++ b/pppd/plugins/rp-pppoe/common.c
@@ -121,13 +121,13 @@ sendPADT(PPPoEConnection *conn, char const *msg)
     /* If we're using Host-Uniq, copy it over */
     if (conn->useHostUniq) {
 	PPPoETag hostUniq;
-	pid_t pid = getpid();
+	int len = strlen(conn->useHostUniq);
 	hostUniq.type = htons(TAG_HOST_UNIQ);
-	hostUniq.length = htons(sizeof(pid));
-	memcpy(hostUniq.payload, &pid, sizeof(pid));
-	memcpy(cursor, &hostUniq, sizeof(pid) + TAG_HDR_SIZE);
-	cursor += sizeof(pid) + TAG_HDR_SIZE;
-	plen += sizeof(pid) + TAG_HDR_SIZE;
+	hostUniq.length = htons(len);
+	memcpy(hostUniq.payload, conn->useHostUniq, len);
+	memcpy(cursor, &hostUniq, len + TAG_HDR_SIZE);
+	cursor += len + TAG_HDR_SIZE;
+	plen += len + TAG_HDR_SIZE;
     }
 
     /* Copy error message */
diff --git a/pppd/plugins/rp-pppoe/discovery.c b/pppd/plugins/rp-pppoe/discovery.c
index 04877cb..0bce013 100644
--- a/pppd/plugins/rp-pppoe/discovery.c
+++ b/pppd/plugins/rp-pppoe/discovery.c
@@ -104,7 +104,7 @@ parseForHostUniq(UINT16_t type, UINT16_t len, unsigned char *data,
 static int
 packetIsForMe(PPPoEConnection *conn, PPPoEPacket *packet)
 {
-    int forMe = 0;
+    char *uniq = conn->useHostUniq;
 
     /* If packet is not directed to our MAC address, forget it */
     if (memcmp(packet->ethHdr.h_dest, conn->myEth, ETH_ALEN)) return 0;
@@ -112,8 +112,8 @@ packetIsForMe(PPPoEConnection *conn, PPPoEPacket *packet)
     /* If we're not using the Host-Unique tag, then accept the packet */
     if (!conn->useHostUniq) return 1;
 
-    parsePacket(packet, parseForHostUniq, &forMe);
-    return forMe;
+    parsePacket(packet, parseForHostUniq, &uniq);
+    return uniq != 0;
 }
 
 /**********************************************************************
@@ -303,14 +303,14 @@ sendPADI(PPPoEConnection *conn)
     /* If we're using Host-Uniq, copy it over */
     if (conn->useHostUniq) {
 	PPPoETag hostUniq;
-	pid_t pid = getpid();
+	int len = strlen(conn->useHostUniq);
 	hostUniq.type = htons(TAG_HOST_UNIQ);
-	hostUniq.length = htons(sizeof(pid));
-	memcpy(hostUniq.payload, &pid, sizeof(pid));
-	CHECK_ROOM(cursor, packet.payload, sizeof(pid) + TAG_HDR_SIZE);
-	memcpy(cursor, &hostUniq, sizeof(pid) + TAG_HDR_SIZE);
-	cursor += sizeof(pid) + TAG_HDR_SIZE;
-	plen += sizeof(pid) + TAG_HDR_SIZE;
+	hostUniq.length = htons(len);
+	memcpy(hostUniq.payload, conn->useHostUniq, len);
+	CHECK_ROOM(cursor, packet.payload, len + TAG_HDR_SIZE);
+	memcpy(cursor, &hostUniq, len + TAG_HDR_SIZE);
+	cursor += len + TAG_HDR_SIZE;
+	plen += len + TAG_HDR_SIZE;
     }
 
     /* Add our maximum MTU/MRU */
@@ -480,14 +480,14 @@ sendPADR(PPPoEConnection *conn)
     /* If we're using Host-Uniq, copy it over */
     if (conn->useHostUniq) {
 	PPPoETag hostUniq;
-	pid_t pid = getpid();
+	int len = strlen(conn->useHostUniq);
 	hostUniq.type = htons(TAG_HOST_UNIQ);
-	hostUniq.length = htons(sizeof(pid));
-	memcpy(hostUniq.payload, &pid, sizeof(pid));
-	CHECK_ROOM(cursor, packet.payload, sizeof(pid)+TAG_HDR_SIZE);
-	memcpy(cursor, &hostUniq, sizeof(pid) + TAG_HDR_SIZE);
-	cursor += sizeof(pid) + TAG_HDR_SIZE;
-	plen += sizeof(pid) + TAG_HDR_SIZE;
+	hostUniq.length = htons(len);
+	memcpy(hostUniq.payload, conn->useHostUniq, len);
+	CHECK_ROOM(cursor, packet.payload, len+TAG_HDR_SIZE);
+	memcpy(cursor, &hostUniq, len + TAG_HDR_SIZE);
+	cursor += len + TAG_HDR_SIZE;
+	plen += len + TAG_HDR_SIZE;
     }
 
     /* Add our maximum MTU/MRU */
diff --git a/pppd/plugins/rp-pppoe/plugin.c b/pppd/plugins/rp-pppoe/plugin.c
index a8c2bb4..1ce2d8b 100644
--- a/pppd/plugins/rp-pppoe/plugin.c
+++ b/pppd/plugins/rp-pppoe/plugin.c
@@ -68,6 +68,7 @@ static char *existingSession = NULL;
 static int printACNames = 0;
 static char *pppoe_reqd_mac = NULL;
 unsigned char pppoe_reqd_mac_addr[6];
+static char *host_uniq = NULL;
 
 static int PPPoEDevnameHook(char *cmd, char **argv, int doit);
 static option_t Options[] = {
@@ -85,6 +86,8 @@ static option_t Options[] = {
       "Be verbose about discovered access concentrators"},
     { "pppoe-mac", o_string, &pppoe_reqd_mac,
       "Only connect to specified MAC address" },
+    { "host-uniq", o_string, &host_uniq,
+      "Specify custom Host-Uniq" },
     { NULL }
 };
 int (*OldDevnameHook)(char *cmd, char **argv, int doit) = NULL;
@@ -110,7 +113,7 @@ PPPOEInitDevice(void)
     conn->ifName = devnam;
     conn->discoverySocket = -1;
     conn->sessionSocket = -1;
-    conn->useHostUniq = 1;
+    conn->useHostUniq = NULL;
     conn->printACNames = printACNames;
     conn->discoveryTimeout = PADI_TIMEOUT;
     return 1;
@@ -166,6 +169,9 @@ PPPOEConnectDevice(void)
     if (lcp_wantoptions[0].mru > ifr.ifr_mtu - TOTAL_OVERHEAD)
 	lcp_wantoptions[0].mru = ifr.ifr_mtu - TOTAL_OVERHEAD;
 
+    if(host_uniq)
+	conn->useHostUniq = host_uniq;
+
     conn->acName = acName;
     conn->serviceName = pppd_pppoe_service;
     strlcpy(ppp_devnam, devnam, sizeof(ppp_devnam));
diff --git a/pppd/plugins/rp-pppoe/pppoe-discovery.c b/pppd/plugins/rp-pppoe/pppoe-discovery.c
index 3d3bf4e..36cca88 100644
--- a/pppd/plugins/rp-pppoe/pppoe-discovery.c
+++ b/pppd/plugins/rp-pppoe/pppoe-discovery.c
@@ -644,7 +644,7 @@ int main(int argc, char *argv[])
 
     memset(conn, 0, sizeof(PPPoEConnection));
 
-    while ((opt = getopt(argc, argv, "I:D:VUAS:C:h")) > 0) {
+    while ((opt = getopt(argc, argv, "I:D:VUW:AS:C:h")) > 0) {
 	switch(opt) {
 	case 'S':
 	    conn->serviceName = xstrdup(optarg);
@@ -653,7 +653,19 @@ int main(int argc, char *argv[])
 	    conn->acName = xstrdup(optarg);
 	    break;
 	case 'U':
-	    conn->useHostUniq = 1;
+	    if(conn->useHostUniq) {
+		fprintf(stderr, "-U and -W are mutually exclusive\n");
+		exit(EXIT_FAILURE);
+	    }
+	    conn->useHostUniq = malloc(12);
+	    snprintf(conn->useHostUniq, 12, "%d", getpid());
+	    break;
+	case 'W':
+	    if(conn->useHostUniq) {
+		fprintf(stderr, "-U and -W are mutually exclusive\n");
+		exit(EXIT_FAILURE);
+	    }
+	    conn->useHostUniq = xstrdup(optarg);
 	    break;
 	case 'D':
 	    conn->debugFile = fopen(optarg, "w");
diff --git a/pppd/plugins/rp-pppoe/pppoe.h b/pppd/plugins/rp-pppoe/pppoe.h
index 9ab2eee..c79232d 100644
--- a/pppd/plugins/rp-pppoe/pppoe.h
+++ b/pppd/plugins/rp-pppoe/pppoe.h
@@ -235,7 +235,7 @@ typedef struct PPPoEConnectionStruct {
     char *serviceName;		/* Desired service name, if any */
     char *acName;		/* Desired AC name, if any */
     int synchronous;		/* Use synchronous PPP */
-    int useHostUniq;		/* Use Host-Uniq tag */
+    char *useHostUniq;		/* Use Host-Uniq tag */
     int printACNames;		/* Just print AC names */
     FILE *debugFile;		/* Debug file for dumping packets */
     int numPADOs;		/* Number of PADO packets received */
-- 
2.5.0

