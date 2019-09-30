From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Date: Mon, 30 Sep 2019 12:45:08 +0000
Subject: Re: [PATCH 7/9] pppoe: remove the use of cdefs
Message-Id: <20190930124508.GA27078@x1.vandijck-laurijssen.be>
List-Id: <linux-ppp.vger.kernel.org>
References: <1569482466-9551-8-git-send-email-dev.kurt@vandijck-laurijssen.be>
In-Reply-To: <1569482466-9551-8-git-send-email-dev.kurt@vandijck-laurijssen.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

sys/cdefs.h contains the __P() macro.
The header doesn't exist in my musl toolchain,
the __P() macro has been obsoleted even by glibc,
and it's never used in the code.
This commit removes the need for this remainder.

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
