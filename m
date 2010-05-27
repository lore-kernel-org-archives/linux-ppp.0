From: Alexey Mahotkin <squadette@gmail.com>
Date: Thu, 27 May 2010 18:21:39 +0000
Subject: [PATCH 6/6] Use Disconnect-Cause=Admin-Reset if SIGTERM received
Message-Id: <1274984499-9633-6-git-send-email-squadette@gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

---
 pppd/main.c                  |    2 +-
 pppd/plugins/radius/radius.c |    5 ++++-
 pppd/pppd.h                  |    1 +
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/pppd/main.c b/pppd/main.c
index 3cc2624..f97c8ad 100644
--- a/pppd/main.c
+++ b/pppd/main.c
@@ -633,7 +633,7 @@ handle_events()
 	kill_link = 1;
 	asked_to_quit = 1;
 	persist = 0;
-	status = EXIT_USER_REQUEST;
+	status = EXIT_SIGTERM;
 	got_sigterm = 0;
     }
     if (got_sigchld) {
diff --git a/pppd/plugins/radius/radius.c b/pppd/plugins/radius/radius.c
index b882e7a..5d1c619 100644
--- a/pppd/plugins/radius/radius.c
+++ b/pppd/plugins/radius/radius.c
@@ -989,10 +989,13 @@ radius_acct_stop(void)
     av_type = PW_NAS_ERROR;
     switch( status ) {
 	case EXIT_OK:
-	case EXIT_USER_REQUEST:
 	    av_type = PW_USER_REQUEST;
 	    break;
 
+	case EXIT_SIGTERM:
+	    av_type = PW_ADMIN_RESET;
+	    break;
+
 	case EXIT_HANGUP:
 	case EXIT_PEER_DEAD:
 	case EXIT_CONNECT_FAILED:
diff --git a/pppd/pppd.h b/pppd/pppd.h
index cf9840a..dfa9112 100644
--- a/pppd/pppd.h
+++ b/pppd/pppd.h
@@ -808,6 +808,7 @@ extern void (*snoop_send_hook) __P((unsigned char *p, int len));
 #define EXIT_TRAFFIC_LIMIT	20
 #endif
 #define EXIT_CNID_AUTH_FAILED	21
+#define EXIT_SIGTERM	        23
 
 /*
  * Debug macros.  Slightly useful for finding bugs in pppd, not particularly
-- 
1.6.2.5

