From: Paulius Zaleckas <paulius.zaleckas@teltonika.lt>
Date: Mon, 23 Feb 2009 14:59:43 +0000
Subject: [PATCH] ppp_generic: Simplify tx_dropped stats
Message-Id: <20090223145942.8588.78220.stgit@Programuotojas>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, linux-ppp@vger.kernel.org

Local variable dev = ppp->dev

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@teltonika.lt>
---

 drivers/net/ppp_generic.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)


diff --git a/drivers/net/ppp_generic.c b/drivers/net/ppp_generic.c
index 7b2728b..78606f5 100644
--- a/drivers/net/ppp_generic.c
+++ b/drivers/net/ppp_generic.c
@@ -908,7 +908,7 @@ ppp_start_xmit(struct sk_buff *skb, struct net_device *dev)
 
  outf:
 	kfree_skb(skb);
-	++ppp->dev->stats.tx_dropped;
+	++dev->stats.tx_dropped;
 	return 0;
 }
 

