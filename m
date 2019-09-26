From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Date: Thu, 26 Sep 2019 07:21:04 +0000
Subject: [PATCH 7/9] pppoe: remove the use of cdefs
Message-Id: <1569482466-9551-8-git-send-email-dev.kurt@vandijck-laurijssen.be>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
---
 pppd/plugins/rp-pppoe/config.h | 3 ---
 pppd/plugins/rp-pppoe/pppoe.h  | 4 ----
 2 files changed, 7 deletions(-)

diff --git a/pppd/plugins/rp-pppoe/config.h b/pppd/plugins/rp-pppoe/config.h
index 5703087..a708859 100644
--- a/pppd/plugins/rp-pppoe/config.h
+++ b/pppd/plugins/rp-pppoe/config.h
@@ -101,9 +101,6 @@
 /* Define if you have the <netpacket/packet.h> header file.  */
 #define HAVE_NETPACKET_PACKET_H 1
 
-/* Define if you have the <sys/cdefs.h> header file.  */
-#define HAVE_SYS_CDEFS_H 1
-
 /* Define if you have the <sys/dlpi.h> header file.  */
 /* #undef HAVE_SYS_DLPI_H */
 
diff --git a/pppd/plugins/rp-pppoe/pppoe.h b/pppd/plugins/rp-pppoe/pppoe.h
index 813dcf3..55f0ca3 100644
--- a/pppd/plugins/rp-pppoe/pppoe.h
+++ b/pppd/plugins/rp-pppoe/pppoe.h
@@ -39,10 +39,6 @@
 #error Unknown method for accessing raw Ethernet frames
 #endif
 
-#ifdef HAVE_SYS_CDEFS_H
-#include <sys/cdefs.h>
-#endif
-
 #ifdef HAVE_SYS_SOCKET_H
 #include <sys/socket.h>
 #endif
-- 
1.8.5.rc3
