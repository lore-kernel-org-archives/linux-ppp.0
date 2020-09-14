From: Allen Pais <allen.lkml@gmail.com>
Date: Mon, 14 Sep 2020 07:43:31 +0000
Subject: [RESEND net-next v2 12/12] net: usbnet: convert tasklets to use new tasklet_setup() API
Message-Id: <20200914073131.803374-13-allen.lkml@gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20200914073131.803374-1-allen.lkml@gmail.com>
In-Reply-To: <20200914073131.803374-1-allen.lkml@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davem@davemloft.net
Cc: m.grzeschik@pengutronix.de, kuba@kernel.org, paulus@samba.org, oliver@neukum.org, woojung.huh@microchip.com, UNGLinuxDriver@microchip.com, petkan@nucleusys.com, netdev@vger.kernel.org, linux-usb@vger.kernel.org, linux-ppp@vger.kernel.org, Allen Pais <apais@linux.microsoft.com>, Romain Perier <romain.perier@gmail.com>

From: Allen Pais <apais@linux.microsoft.com>

In preparation for unconditionally passing the
struct tasklet_struct pointer to all tasklet
callbacks, switch to using the new tasklet_setup()
and from_tasklet() to pass the tasklet pointer explicitly
and remove the .data field.

Signed-off-by: Romain Perier <romain.perier@gmail.com>
Signed-off-by: Allen Pais <apais@linux.microsoft.com>
---
 drivers/net/usb/usbnet.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/usb/usbnet.c b/drivers/net/usb/usbnet.c
index 2b2a841cd938..d63485b858ba 100644
--- a/drivers/net/usb/usbnet.c
+++ b/drivers/net/usb/usbnet.c
@@ -1708,8 +1708,7 @@ usbnet_probe (struct usb_interface *udev, const struct usb_device_id *prod)
 	skb_queue_head_init (&dev->txq);
 	skb_queue_head_init (&dev->done);
 	skb_queue_head_init(&dev->rxq_pause);
-	dev->bh.func = usbnet_bh_tasklet;
-	dev->bh.data = (unsigned long)&dev->delay;
+	dev->bh.func = (void(*) (unsigned long))usbnet_bh_tasklet;
 	INIT_WORK (&dev->kevent, usbnet_deferred_kevent);
 	init_usb_anchor(&dev->deferred);
 	timer_setup(&dev->delay, usbnet_bh, 0);
-- 
2.25.1
