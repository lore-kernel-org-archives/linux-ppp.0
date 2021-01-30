From: Emil Renner Berthing <kernel@esmil.dk>
Date: Sat, 30 Jan 2021 23:47:30 +0000
Subject: [PATCH 9/9] net: usb: rtl8150: use new tasklet API
Message-Id: <20210130234730.26565-10-kernel@esmil.dk>
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
 drivers/net/usb/rtl8150.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/usb/rtl8150.c b/drivers/net/usb/rtl8150.c
index bf8a60533f3e..7656f2a3afd9 100644
--- a/drivers/net/usb/rtl8150.c
+++ b/drivers/net/usb/rtl8150.c
@@ -577,9 +577,9 @@ static void free_skb_pool(rtl8150_t *dev)
 		dev_kfree_skb(dev->rx_skb_pool[i]);
 }
 
-static void rx_fixup(unsigned long data)
+static void rx_fixup(struct tasklet_struct *t)
 {
-	struct rtl8150 *dev = (struct rtl8150 *)data;
+	struct rtl8150 *dev = from_tasklet(dev, t, tl);
 	struct sk_buff *skb;
 	int status;
 
@@ -878,7 +878,7 @@ static int rtl8150_probe(struct usb_interface *intf,
 		return -ENOMEM;
 	}
 
-	tasklet_init(&dev->tl, rx_fixup, (unsigned long)dev);
+	tasklet_setup(&dev->tl, rx_fixup);
 	spin_lock_init(&dev->rx_pool_lock);
 
 	dev->udev = udev;
-- 
2.30.0
