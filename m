From: domen@coderock.org
Date: Sun, 31 Jul 2005 11:11:25 +0000
Subject: [patch 1/1] drivers/net/ppp_async.c : Use of the time_after_eq() macro
Message-Id: <20050731111125.402802000@homer>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

From: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>



Use of the time_after_eq() macro, defined at linux/jiffies.h, which deal
with wrapping correctly and are nicer to read.

Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
Signed-off-by: Domen Puncer <domen@coderock.org>

---
 ppp_async.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletion(-)

Index: quilt/drivers/net/ppp_async.c
=================================--- quilt.orig/drivers/net/ppp_async.c
+++ quilt/drivers/net/ppp_async.c
@@ -30,6 +30,7 @@
 #include <linux/ppp_channel.h>
 #include <linux/spinlock.h>
 #include <linux/init.h>
+#include <linux/jiffies.h>
 #include <asm/uaccess.h>
 
 #define PPP_VERSION	"2.4.2"
@@ -576,7 +577,7 @@ ppp_async_encode(struct asyncppp *ap)
 		 * character if necessary.
 		 */
 		if (islcp || flag_time = 0
-		    || jiffies - ap->last_xmit >= flag_time)
+		    || time_after_eq(jiffies, ap->last_xmit + flag_time))
 			*buf++ = PPP_FLAG;
 		ap->last_xmit = jiffies;
 		fcs = PPP_INITFCS;

--
