From: Allen Pais <allen.lkml@gmail.com>
Date: Mon, 14 Sep 2020 07:43:29 +0000
Subject: [RESEND net-next v2 10/12] net: r8152: convert tasklets to use new tasklet_setup() API
Message-Id: <20200914073131.803374-11-allen.lkml@gmail.com>
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
and from_tasklet() to pass the tasklet pointer explicitly.

Signed-off-by: Romain Perier <romain.perier@gmail.com>
Signed-off-by: Allen Pais <apais@linux.microsoft.com>
---
 drivers/net/usb/r8152.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
index b1770489aca5..2d706cdbf9a2 100644
--- a/drivers/net/usb/r8152.c
+++ b/drivers/net/usb/r8152.c
@@ -2410,11 +2410,9 @@ static void tx_bottom(struct r8152 *tp)
 	} while (res = 0);
 }
 
-static void bottom_half(unsigned long data)
+static void bottom_half(struct tasklet_struct *t)
 {
-	struct r8152 *tp;
-
-	tp = (struct r8152 *)data;
+	struct r8152 *tp = from_tasklet(tp, t, tx_tl);
 
 	if (test_bit(RTL8152_UNPLUG, &tp->flags))
 		return;
@@ -6730,7 +6728,7 @@ static int rtl8152_probe(struct usb_interface *intf,
 	mutex_init(&tp->control);
 	INIT_DELAYED_WORK(&tp->schedule, rtl_work_func_t);
 	INIT_DELAYED_WORK(&tp->hw_phy_work, rtl_hw_phy_work_func_t);
-	tasklet_init(&tp->tx_tl, bottom_half, (unsigned long)tp);
+	tasklet_setup(&tp->tx_tl, bottom_half);
 	tasklet_disable(&tp->tx_tl);
 
 	netdev->netdev_ops = &rtl8152_netdev_ops;
-- 
2.25.1
