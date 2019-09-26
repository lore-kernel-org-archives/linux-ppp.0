From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Date: Thu, 26 Sep 2019 07:21:02 +0000
Subject: [PATCH 5/9] pppd: fix GLIBC version test for non-glibc toolchains
Message-Id: <1569482466-9551-6-git-send-email-dev.kurt@vandijck-laurijssen.be>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Non-glibc toolchains have their include files arranged more similar
to newer glibc's than to older.

Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
---
 pppd/sys-linux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/pppd/sys-linux.c b/pppd/sys-linux.c
index 46e1ed4..a3f7fa6 100644
--- a/pppd/sys-linux.c
+++ b/pppd/sys-linux.c
@@ -102,7 +102,7 @@
 #define MAX_ADDR_LEN 7
 #endif
 
-#if __GLIBC__ >= 2
+#if !defined(__GLIBC__) || __GLIBC__ >= 2
 #include <asm/types.h>		/* glibc 2 conflicts with linux/types.h */
 #include <net/if.h>
 #include <net/if_arp.h>
-- 
1.8.5.rc3
