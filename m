From: Tejun Heo <tj@kernel.org>
Date: Wed, 06 Feb 2013 19:40:27 +0000
Subject: [PATCH 55/77] ppp: convert to idr_alloc()
Message-Id: <1360179649-22465-56-git-send-email-tj@kernel.org>
List-Id: <linux-ppp.vger.kernel.org>
References: <1360179649-22465-1-git-send-email-tj@kernel.org>
In-Reply-To: <1360179649-22465-1-git-send-email-tj@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>, Paul Mackerras <paulus@samba.org>, linux-ppp@vger.kernel.org

Convert to the much saner new idr interface.

Only compile tested.

Signed-off-by: Tejun Heo <tj@kernel.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: linux-ppp@vger.kernel.org
---
 drivers/net/ppp/ppp_generic.c | 33 ++++-----------------------------
 1 file changed, 4 insertions(+), 29 deletions(-)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index 0b2706a..7efdb91 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -2946,46 +2946,21 @@ static void __exit ppp_cleanup(void)
  * by holding all_ppp_mutex
  */
 
-static int __unit_alloc(struct idr *p, void *ptr, int n)
-{
-	int unit, err;
-
-again:
-	if (!idr_pre_get(p, GFP_KERNEL)) {
-		pr_err("PPP: No free memory for idr\n");
-		return -ENOMEM;
-	}
-
-	err = idr_get_new_above(p, ptr, n, &unit);
-	if (err < 0) {
-		if (err = -EAGAIN)
-			goto again;
-		return err;
-	}
-
-	return unit;
-}
-
 /* associate pointer with specified number */
 static int unit_set(struct idr *p, void *ptr, int n)
 {
 	int unit;
 
-	unit = __unit_alloc(p, ptr, n);
-	if (unit < 0)
-		return unit;
-	else if (unit != n) {
-		idr_remove(p, unit);
-		return -EINVAL;
-	}
-
+	unit = idr_alloc(p, ptr, n, n + 1, GFP_KERNEL);
+	if (unit = -ENOSPC)
+		unit = -EINVAL;
 	return unit;
 }
 
 /* get new free unit number and associate pointer with it */
 static int unit_get(struct idr *p, void *ptr)
 {
-	return __unit_alloc(p, ptr, 0);
+	return idr_alloc(p, ptr, 0, 0, GFP_KERNEL);
 }
 
 /* put unit number back to a pool */
-- 
1.8.1

