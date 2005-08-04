From: "Hmamouche, Youssef" <youssef@ece.utexas.edu>
Date: Thu, 04 Aug 2005 06:08:16 +0000
Subject: [PATCH][PPP] ppp_generic: Add checks for NULL pointers
Message-Id: <Pine.LNX.4.61.0508040053050.14176@linux08.ece.utexas.edu>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: linux-ppp@vger.kernel.org, youssef@ece.utexas.edu


This patch adds two checks for NULL pointers.

Signed-off-by: Youssef Hmamouche <hyoussef@gmail.com>



--- a/drivers/net/ppp_generic.c 2005-07-15 14:18:57.000000000 -0700
+++ b/drivers/net/ppp_generic.c 2005-08-03 21:11:14.000000000 -0700
@@ -2644,6 +2644,11 @@
                 do {
                         /* need a new top level */
                         struct cardmap *np = kmalloc(sizeof(*np), GFP_KERNEL);
+                       if(np = NULL) {
+                               printk(KERN_ERR "ppp_generic: Couldn't allocate "
+                                       "memory for cardmap.\n");
+                               continue;
+                       }
                         memset(np, 0, sizeof(*np));
                         np->ptr[0] = p;
                         if (p != NULL) {
@@ -2659,6 +2664,11 @@
                 i = (nr >> p->shift) & CARDMAP_MASK;
                 if (p->ptr[i] = NULL) {
                         struct cardmap *np = kmalloc(sizeof(*np), GFP_KERNEL);
+                       if(np = NULL) {
+                               printk(KERN_ERR "ppp_generic: Couldn't allocate "
+                                       "memory for cardmap.\n");
+                               continue;
+                       }
                         memset(np, 0, sizeof(*np));
                         np->shift = p->shift - CARDMAP_ORDER;
                         np->parent = p;

