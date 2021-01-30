From: Emil Renner Berthing <kernel@esmil.dk>
Date: Sat, 30 Jan 2021 23:47:26 +0000
Subject: [PATCH 5/9] net: usb: hso: use new tasklet API
Message-Id: <20210130234730.26565-6-kernel@esmil.dk>
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
 drivers/net/usb/hso.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/usb/hso.c b/drivers/net/usb/hso.c
index ef6dd012b8c4..31d51346786a 100644
--- a/drivers/net/usb/hso.c
+++ b/drivers/net/usb/hso.c
@@ -1213,9 +1213,10 @@ static void hso_std_serial_read_bulk_callback(struct urb *urb)
  * This needs to be a tasklet otherwise we will
  * end up recursively calling this function.
  */
-static void hso_unthrottle_tasklet(unsigned long data)
+static void hso_unthrottle_tasklet(struct tasklet_struct *t)
 {
-	struct hso_serial *serial = (struct hso_serial *)data;
+	struct hso_serial *serial = from_tasklet(serial, t,
+						 unthrottle_tasklet);
 	unsigned long flags;
 
 	spin_lock_irqsave(&serial->serial_lock, flags);
@@ -1264,9 +1265,8 @@ static int hso_serial_open(struct tty_struct *tty, struct file *filp)
 		serial->rx_state = RX_IDLE;
 		/* Force default termio settings */
 		_hso_serial_set_termios(tty, NULL);
-		tasklet_init(&serial->unthrottle_tasklet,
-			     hso_unthrottle_tasklet,
-			     (unsigned long)serial);
+		tasklet_setup(&serial->unthrottle_tasklet,
+			      hso_unthrottle_tasklet);
 		result = hso_start_serial_device(serial->parent, GFP_KERNEL);
 		if (result) {
 			hso_stop_serial_device(serial->parent);
-- 
2.30.0
