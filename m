From: Julia Lawall <julia@diku.dk>
Date: Sat, 22 May 2010 08:18:59 +0000
Subject: [PATCH 2/27] drivers/net: Use memdup_user
Message-Id: <Pine.LNX.4.64.1005221018350.13021@ask.diku.dk>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paul Mackerras <paulus@samba.org>, linux-ppp@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Use memdup_user when user data is immediately copied into the
allocated region.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression from,to,size,flag;
position p;
identifier l1,l2;
@@

-  to = \(kmalloc@p\|kzalloc@p\)(size,flag);
+  to = memdup_user(from,size);
   if (
-      to=NULL
+      IS_ERR(to)
                 || ...) {
   <+... when != goto l1;
-  -ENOMEM
+  PTR_ERR(to)
   ...+>
   }
-  if (copy_from_user(to, from, size) != 0) {
-    <+... when != goto l2;
-    -EFAULT
-    ...+>
-  }
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/net/ppp_generic.c |   11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ppp_generic.c b/drivers/net/ppp_generic.c
index 5441688..da7943d 100644
--- a/drivers/net/ppp_generic.c
+++ b/drivers/net/ppp_generic.c
@@ -539,14 +539,9 @@ static int get_filter(void __user *arg, struct sock_filter **p)
 	}
 
 	len = uprog.len * sizeof(struct sock_filter);
-	code = kmalloc(len, GFP_KERNEL);
-	if (code = NULL)
-		return -ENOMEM;
-
-	if (copy_from_user(code, uprog.filter, len)) {
-		kfree(code);
-		return -EFAULT;
-	}
+	code = memdup_user(uprog.filter, len);
+	if (IS_ERR(code))
+		return PTR_ERR(code);
 
 	err = sk_chk_filter(code, uprog.len);
 	if (err) {
