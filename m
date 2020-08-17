From: Allen Pais <allen.cryptic@gmail.com>
Date: Mon, 17 Aug 2020 08:58:11 +0000
Subject: [PATCH 6/9] net: pegasus: convert tasklets to use new tasklet_setup() API
Message-Id: <20200817084614.24263-10-allen.cryptic@gmail.com>
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
 drivers/net/usb/pegasus.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/usb/pegasus.c b/drivers/net/usb/pegasus.c
index 0ef7e1f443e3..addf904e7c65 100644
--- a/drivers/net/usb/pegasus.c
+++ b/drivers/net/usb/pegasus.c
@@ -565,12 +565,12 @@ static void read_bulk_callback(struct urb *urb)
 	tasklet_schedule(&pegasus->rx_tl);
 }
 
-static void rx_fixup(unsigned long data)
+static void rx_fixup(struct tasklet_struct *t)
 {
 	pegasus_t *pegasus;
 	int status;
 
-	pegasus = (pegasus_t *) data;
+	pegasus = from_tasklet(pegasus, t, rx_tl);
 	if (pegasus->flags & PEGASUS_UNPLUG)
 		return;
 
@@ -1141,7 +1141,7 @@ static int pegasus_probe(struct usb_interface *intf,
 		goto out1;
 	}
 
-	tasklet_init(&pegasus->rx_tl, rx_fixup, (unsigned long) pegasus);
+	tasklet_setup(&pegasus->rx_tl, rx_fixup);
 
 	INIT_DELAYED_WORK(&pegasus->carrier_check, check_carrier);
 
-- 
2.17.1
