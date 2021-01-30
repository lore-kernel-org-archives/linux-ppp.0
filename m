From: Emil Renner Berthing <kernel@esmil.dk>
Date: Sat, 30 Jan 2021 23:47:22 +0000
Subject: [PATCH 1/9] arcnet: use new tasklet API
Message-Id: <20210130234730.26565-2-kernel@esmil.dk>
List-Id: <linux-ppp.vger.kernel.org>
References: <20210130234730.26565-1-kernel@esmil.dk>
In-Reply-To: <20210130234730.26565-1-kernel@esmil.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, linux-usb@vger.kernel.org, linux-ppp@vger.kernel.org
Cc: Emil Renner Berthing <kernel@esmil.dk>, Michael Grzeschik <m.grzeschik@pengutronix.de>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paul Mackerras <paulus@samba.org>, Woojung Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com, Petko Manolov <petkan@nucleusys.com>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, Jing Xiangfeng <jingxiangfeng@huawei.com>, Oliver Neukum <oneukum@suse.com>, linux-kernel@vger.kernel.org

This converts the driver to use the new tasklet API introduced in
commit 12cc923f1ccc ("tasklet: Introduce new initialization API")

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
---
 drivers/net/arcnet/arcnet.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/net/arcnet/arcnet.c b/drivers/net/arcnet/arcnet.c
index e04efc0a5c97..69d8920e394b 100644
--- a/drivers/net/arcnet/arcnet.c
+++ b/drivers/net/arcnet/arcnet.c
@@ -393,9 +393,9 @@ static void arcnet_timer(struct timer_list *t)
 	}
 }
 
-static void arcnet_reply_tasklet(unsigned long data)
+static void arcnet_reply_tasklet(struct tasklet_struct *t)
 {
-	struct arcnet_local *lp = (struct arcnet_local *)data;
+	struct arcnet_local *lp = from_tasklet(lp, t, reply_tasklet);
 
 	struct sk_buff *ackskb, *skb;
 	struct sock_exterr_skb *serr;
@@ -483,8 +483,7 @@ int arcnet_open(struct net_device *dev)
 		arc_cont(D_PROTO, "\n");
 	}
 
-	tasklet_init(&lp->reply_tasklet, arcnet_reply_tasklet,
-		     (unsigned long)lp);
+	tasklet_setup(&lp->reply_tasklet, arcnet_reply_tasklet);
 
 	arc_printk(D_INIT, dev, "arcnet_open: resetting card.\n");
 
-- 
2.30.0
