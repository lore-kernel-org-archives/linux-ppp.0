From: Alan <gnomes@lxorguk.ukuu.org.uk>
Date: Thu, 19 Feb 2015 21:39:55 +0000
Subject: [PATCH] ppp_synctty: remove unneeded NULL check
Message-Id: <20150219213944.10851.83760.stgit@localhost.localdomain>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Fix a random whine found by coverity. Had it been NULL it would have
showered us with oopses long before.

Signed-off-by: Alan Cox <alan@linux.intel.com>
---
 drivers/net/ppp/ppp_synctty.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ppp/ppp_synctty.c b/drivers/net/ppp/ppp_synctty.c
index 925d3e2..b5592b8 100644
--- a/drivers/net/ppp/ppp_synctty.c
+++ b/drivers/net/ppp/ppp_synctty.c
@@ -549,7 +549,7 @@ ppp_sync_txmunge(struct syncppp *ap, struct sk_buff *skb)
 
 	ap->last_xmit = jiffies;
 
-	if (skb && ap->flags & SC_LOG_OUTPKT)
+	if (ap->flags & SC_LOG_OUTPKT)
 		ppp_print_buffer ("send buffer", skb->data, skb->len);
 
 	return skb;

