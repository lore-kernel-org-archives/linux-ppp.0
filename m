From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 31 Mar 2020 03:40:20 +0000
Subject: [PATCH] pppd: add missing header for musl
Message-Id: <20200331034020.3457868-1-rosenp@gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 pppd/pppd.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/pppd/pppd.h b/pppd/pppd.h
index b31b78d..50c0e95 100644
--- a/pppd/pppd.h
+++ b/pppd/pppd.h
@@ -53,6 +53,7 @@
 #include <stdlib.h>		/* for encrypt */
 #include <unistd.h>		/* for setkey */
 #include <limits.h>		/* for NGROUPS_MAX */
+#include <sys/cdefs.h>		/* for __P */
 #include <sys/param.h>		/* for MAXPATHLEN and BSD4_4, if defined */
 #include <sys/types.h>		/* for u_int32_t, if defined */
 #include <sys/time.h>		/* for struct timeval */
-- 
2.25.1
