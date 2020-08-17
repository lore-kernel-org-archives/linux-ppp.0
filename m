From: Allen Pais <allen.cryptic@gmail.com>
Date: Mon, 17 Aug 2020 08:58:07 +0000
Subject: [PATCH 2/9] net: ppp: convert tasklets to use new tasklet_setup() API
Message-Id: <20200817084614.24263-6-allen.cryptic@gmail.com>
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
 drivers/net/ppp/ppp_async.c   | 8 ++++----
 drivers/net/ppp/ppp_synctty.c | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ppp/ppp_async.c b/drivers/net/ppp/ppp_async.c
index 29a0917a81e6..2b66cf301b0e 100644
--- a/drivers/net/ppp/ppp_async.c
+++ b/drivers/net/ppp/ppp_async.c
@@ -101,7 +101,7 @@ static void ppp_async_input(struct asyncppp *ap, const unsigned char *buf,
 			    char *flags, int count);
 static int ppp_async_ioctl(struct ppp_channel *chan, unsigned int cmd,
 			   unsigned long arg);
-static void ppp_async_process(unsigned long arg);
+static void ppp_async_process(struct tasklet_struct *t);
 
 static void async_lcp_peek(struct asyncppp *ap, unsigned char *data,
 			   int len, int inbound);
@@ -179,7 +179,7 @@ ppp_asynctty_open(struct tty_struct *tty)
 	ap->lcp_fcs = -1;
 
 	skb_queue_head_init(&ap->rqueue);
-	tasklet_init(&ap->tsk, ppp_async_process, (unsigned long) ap);
+	tasklet_setup(&ap->tsk, ppp_async_process);
 
 	refcount_set(&ap->refcnt, 1);
 	init_completion(&ap->dead);
@@ -488,9 +488,9 @@ ppp_async_ioctl(struct ppp_channel *chan, unsigned int cmd, unsigned long arg)
  * to the ppp_generic code, and to tell the ppp_generic code
  * if we can accept more output now.
  */
-static void ppp_async_process(unsigned long arg)
+static void ppp_async_process(struct tasklet_struct *t)
 {
-	struct asyncppp *ap = (struct asyncppp *) arg;
+	struct asyncppp *ap = from_tasklet(ap, t, tsk);
 	struct sk_buff *skb;
 
 	/* process received packets */
diff --git a/drivers/net/ppp/ppp_synctty.c b/drivers/net/ppp/ppp_synctty.c
index 0f338752c38b..86ee5149f4f2 100644
--- a/drivers/net/ppp/ppp_synctty.c
+++ b/drivers/net/ppp/ppp_synctty.c
@@ -90,7 +90,7 @@ static struct sk_buff* ppp_sync_txmunge(struct syncppp *ap, struct sk_buff *);
 static int ppp_sync_send(struct ppp_channel *chan, struct sk_buff *skb);
 static int ppp_sync_ioctl(struct ppp_channel *chan, unsigned int cmd,
 			  unsigned long arg);
-static void ppp_sync_process(unsigned long arg);
+static void ppp_sync_process(struct tasklet_struct *t);
 static int ppp_sync_push(struct syncppp *ap);
 static void ppp_sync_flush_output(struct syncppp *ap);
 static void ppp_sync_input(struct syncppp *ap, const unsigned char *buf,
@@ -177,7 +177,7 @@ ppp_sync_open(struct tty_struct *tty)
 	ap->raccm = ~0U;
 
 	skb_queue_head_init(&ap->rqueue);
-	tasklet_init(&ap->tsk, ppp_sync_process, (unsigned long) ap);
+	tasklet_setup(&ap->tsk, ppp_sync_process);
 
 	refcount_set(&ap->refcnt, 1);
 	init_completion(&ap->dead_cmp);
@@ -480,9 +480,9 @@ ppp_sync_ioctl(struct ppp_channel *chan, unsigned int cmd, unsigned long arg)
  * to the ppp_generic code, and to tell the ppp_generic code
  * if we can accept more output now.
  */
-static void ppp_sync_process(unsigned long arg)
+static void ppp_sync_process(struct tasklet_struct *t)
 {
-	struct syncppp *ap = (struct syncppp *) arg;
+	struct syncppp *ap = from_tasklet(ap, t, tsk);
 	struct sk_buff *skb;
 
 	/* process received packets */
-- 
2.17.1
