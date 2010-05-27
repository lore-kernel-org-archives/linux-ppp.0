From: Alexey Mahotkin <squadette@gmail.com>
Date: Thu, 27 May 2010 18:21:38 +0000
Subject: [PATCH 5/6] Refactor out set_calling_station_id()
Message-Id: <1274984499-9633-5-git-send-email-squadette@gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

---
 pppd/plugins/radius/radius.c |   41 ++++++++++++++++-------------------------
 1 files changed, 16 insertions(+), 25 deletions(-)

diff --git a/pppd/plugins/radius/radius.c b/pppd/plugins/radius/radius.c
index 44d1911..b882e7a 100644
--- a/pppd/plugins/radius/radius.c
+++ b/pppd/plugins/radius/radius.c
@@ -170,6 +170,16 @@ plugin_init(void)
     info("RADIUS plugin initialized.");
 }
 
+static void
+set_calling_station_id(VALUE_PAIR **sendp)
+{
+    if (*remote_number) {
+	rc_avpair_add(sendp, PW_CALLING_STATION_ID, remote_number, 0, VENDOR_NONE);
+    } else if (ipparam) {
+	rc_avpair_add(sendp, PW_CALLING_STATION_ID, ipparam, 0, VENDOR_NONE);
+    }
+}
+
 /**********************************************************************
 * %FUNCTION: add_avp
 * %ARGUMENTS:
@@ -281,11 +291,8 @@ radius_pap_auth(char *user,
 
     rc_avpair_add(&send, PW_USER_NAME, rstate.user , 0, VENDOR_NONE);
     rc_avpair_add(&send, PW_USER_PASSWORD, passwd, 0, VENDOR_NONE);
-    if (*remote_number) {
-	rc_avpair_add(&send, PW_CALLING_STATION_ID, remote_number, 0,
-		       VENDOR_NONE);
-    } else if (ipparam)
-	rc_avpair_add(&send, PW_CALLING_STATION_ID, ipparam, 0, VENDOR_NONE);
+
+    set_calling_station_id(&send);
 
     /* Add user specified vp's */
     if (rstate.avp)
@@ -448,11 +455,7 @@ radius_chap_verify(char *user, char *ourname, int id,
 #endif
     }
 
-    if (*remote_number) {
-	rc_avpair_add(&send, PW_CALLING_STATION_ID, remote_number, 0,
-		       VENDOR_NONE);
-    } else if (ipparam)
-	rc_avpair_add(&send, PW_CALLING_STATION_ID, ipparam, 0, VENDOR_NONE);
+    set_calling_station_id(&send);
 
     /* Add user specified vp's */
     if (rstate.avp)
@@ -874,11 +877,7 @@ radius_acct_start(void)
     av_type = PW_PPP;
     rc_avpair_add(&send, PW_FRAMED_PROTOCOL, &av_type, 0, VENDOR_NONE);
 
-    if (*remote_number) {
-	rc_avpair_add(&send, PW_CALLING_STATION_ID,
-		       remote_number, 0, VENDOR_NONE);
-    } else if (ipparam)
-	rc_avpair_add(&send, PW_CALLING_STATION_ID, ipparam, 0, VENDOR_NONE);
+    set_calling_station_id(&send);
 
     av_type = PW_RADIUS;
     rc_avpair_add(&send, PW_ACCT_AUTHENTIC, &av_type, 0, VENDOR_NONE);
@@ -982,11 +981,7 @@ radius_acct_stop(void)
 	rc_avpair_add(&send, PW_ACCT_INPUT_PACKETS, &av_type, 0, VENDOR_NONE);
     }
 
-    if (*remote_number) {
-	rc_avpair_add(&send, PW_CALLING_STATION_ID,
-		       remote_number, 0, VENDOR_NONE);
-    } else if (ipparam)
-	rc_avpair_add(&send, PW_CALLING_STATION_ID, ipparam, 0, VENDOR_NONE);
+    set_calling_station_id(&send);
 
     av_type = ( using_pty ? PW_VIRTUAL : ( sync_serial ? PW_SYNC : PW_ASYNC ) );
     rc_avpair_add(&send, PW_NAS_PORT_TYPE, &av_type, 0, VENDOR_NONE);
@@ -1130,11 +1125,7 @@ radius_acct_interim(void *ignored)
 	rc_avpair_add(&send, PW_ACCT_INPUT_PACKETS, &av_type, 0, VENDOR_NONE);
     }
 
-    if (*remote_number) {
-	rc_avpair_add(&send, PW_CALLING_STATION_ID,
-		       remote_number, 0, VENDOR_NONE);
-    } else if (ipparam)
-	rc_avpair_add(&send, PW_CALLING_STATION_ID, ipparam, 0, VENDOR_NONE);
+    set_calling_station_id(&send);
 
     av_type = ( using_pty ? PW_VIRTUAL : ( sync_serial ? PW_SYNC : PW_ASYNC ) );
     rc_avpair_add(&send, PW_NAS_PORT_TYPE, &av_type, 0, VENDOR_NONE);
-- 
1.6.2.5

