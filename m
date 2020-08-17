From: Allen Pais <allen.cryptic@gmail.com>
Date: Mon, 17 Aug 2020 08:58:06 +0000
Subject: [PATCH 2/2] net: caif: convert tasklets to use new tasklet_setup() API
Message-Id: <20200817084614.24263-5-allen.cryptic@gmail.com>
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
 drivers/net/caif/caif_virtio.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/net/caif/caif_virtio.c b/drivers/net/caif/caif_virtio.c
index 80ea2e913c2b..23c2eb8ceeec 100644
--- a/drivers/net/caif/caif_virtio.c
+++ b/drivers/net/caif/caif_virtio.c
@@ -598,9 +598,9 @@ static netdev_tx_t cfv_netdev_tx(struct sk_buff *skb, struct net_device *netdev)
 	return NETDEV_TX_OK;
 }
 
-static void cfv_tx_release_tasklet(unsigned long drv)
+static void cfv_tx_release_tasklet(struct tasklet_struct *t)
 {
-	struct cfv_info *cfv = (struct cfv_info *)drv;
+	struct cfv_info *cfv = from_tasklet(cfv, t, tx_release_tasklet);
 	cfv_release_used_buf(cfv->vq_tx);
 }
 
@@ -716,9 +716,7 @@ static int cfv_probe(struct virtio_device *vdev)
 	cfv->ctx.head = USHRT_MAX;
 	netif_napi_add(netdev, &cfv->napi, cfv_rx_poll, CFV_DEFAULT_QUOTA);
 
-	tasklet_init(&cfv->tx_release_tasklet,
-		     cfv_tx_release_tasklet,
-		     (unsigned long)cfv);
+	tasklet_setup(&cfv->tx_release_tasklet, cfv_tx_release_tasklet);
 
 	/* Carrier is off until netdevice is opened */
 	netif_carrier_off(netdev);
-- 
2.17.1
