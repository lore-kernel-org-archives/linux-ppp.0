From: Allen Pais <allen.cryptic@gmail.com>
Date: Mon, 17 Aug 2020 08:58:05 +0000
Subject: [PATCH] net: mvpp2: Prepare to use the new tasklet API
Message-Id: <20200817084614.24263-4-allen.cryptic@gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20200817084614.24263-1-allen.cryptic@gmail.com>
In-Reply-To: <20200817084614.24263-1-allen.cryptic@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: m.grzeschik@pengutronix.de, davem@davemloft.net, paulus@samba.org, oliver@neukum.org, woojung.huh@microchip.com, petkan@nucleusys.com
Cc: keescook@chromium.org, netdev@vger.kernel.org, linux-ppp@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, Romain Perier <romain.perier@viveris.fr>, Romain Perier <romain.perier@gmail.com>, Allen Pais <allen.lkml@gmail.com>

From: Romain Perier <romain.perier@viveris.fr>

The future tasklet API will no longer allow to pass an arbitrary
"unsigned long" data parameter. The tasklet data structure will need to
be embedded into a data structure that will be retrieved from the tasklet
handler. Currently, there are no ways to retrieve the "struct mvpp2_port
*" from a given "struct mvpp2_port_pcpu *". This commit adds a new field
to get the address of the main port for each pcpu context.

Signed-off-by: Romain Perier <romain.perier@gmail.com>
Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/net/ethernet/marvell/mvpp2/mvpp2.h      | 1 +
 drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/marvell/mvpp2/mvpp2.h b/drivers/net/ethernet/marvell/mvpp2/mvpp2.h
index 32753cc771bf..198860a4527d 100644
--- a/drivers/net/ethernet/marvell/mvpp2/mvpp2.h
+++ b/drivers/net/ethernet/marvell/mvpp2/mvpp2.h
@@ -861,6 +861,7 @@ struct mvpp2_port_pcpu {
 	struct hrtimer tx_done_timer;
 	struct net_device *dev;
 	bool timer_scheduled;
+	struct mvpp2_port *port;
 };
 
 struct mvpp2_queue_vector {
diff --git a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
index 2a8a5842eaef..fb45f86dcb12 100644
--- a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
+++ b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
@@ -6025,6 +6025,7 @@ static int mvpp2_port_probe(struct platform_device *pdev,
 		err = -ENOMEM;
 		goto err_free_txq_pcpu;
 	}
+	port->pcpu->port = port;
 
 	if (!port->has_tx_irqs) {
 		for (thread = 0; thread < priv->nthreads; thread++) {
-- 
2.17.1
