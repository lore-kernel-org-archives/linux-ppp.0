From: Allen Pais <allen.cryptic@gmail.com>
Date: Mon, 17 Aug 2020 08:58:13 +0000
Subject: [PATCH 8/9] net: rtl8150: convert tasklets to use new tasklet_setup() API
Message-Id: <20200817084614.24263-12-allen.cryptic@gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20200817084614.24263-1-allen.cryptic@gmail.com>
In-Reply-To: <20200817084614.24263-1-allen.cryptic@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: m.grzeschik@pengutronix.de, davem@davemloft.net, paulus@samba.org, oliver@neukum.org, woojung.huh@microchip.com, petkan@nucleusys.com
Cc: keescook@chromium.org, netdev@vger.kernel.org, linux-ppp@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, Allen Pais <allen.lkml@gmail.com>, Romain Perier <romain.perier@gmail.com>

From: Allen Pais <allen.lkml@gmail.com>

In preparation for unconditionally passing the
struct tasklet_struct pointer to all tasklet
callbacks, switch to using the new tasklet_setup()
and from_tasklet() to pass the tasklet pointer explicitly.

Signed-off-by: Romain Perier <romain.perier@gmail.com>
Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/net/usb/rtl8150.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/usb/rtl8150.c b/drivers/net/usb/rtl8150.c
index e7c630d37589..b6d70716321c 100644
--- a/drivers/net/usb/rtl8150.c
+++ b/drivers/net/usb/rtl8150.c
@@ -589,9 +589,9 @@ static void free_skb_pool(rtl8150_t *dev)
 		dev_kfree_skb(dev->rx_skb_pool[i]);
 }
 
-static void rx_fixup(unsigned long data)
+static void rx_fixup(struct tasklet_struct *t)
 {
-	struct rtl8150 *dev = (struct rtl8150 *)data;
+	struct rtl8150 *dev = from_tasklet(dev, t, tl);
 	struct sk_buff *skb;
 	int status;
 
@@ -890,7 +890,7 @@ static int rtl8150_probe(struct usb_interface *intf,
 		return -ENOMEM;
 	}
 
-	tasklet_init(&dev->tl, rx_fixup, (unsigned long)dev);
+	tasklet_setup(&dev->tl, rx_fixup);
 	spin_lock_init(&dev->rx_pool_lock);
 
 	dev->udev = udev;
-- 
2.17.1
