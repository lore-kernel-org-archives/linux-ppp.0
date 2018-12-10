From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 10 Dec 2018 21:52:56 +0000
Subject: [PATCH] hamradio, ppp: change semaphore to completion
Message-Id: <20181210215318.1982562-1-arnd@arndb.de>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Koensgen <ajk@comnets.uni-bremen.de>, "David S. Miller" <davem@davemloft.net>, Paul Mackerras <paulus@samba.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Al Viro <viro@zeniv.linux.org.uk>, Colin Ian King <colin.king@canonical.com>, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-ppp@vger.kernel.org

ppp and hamradio have copies of the same code that uses a semaphore
in place of a completion for historic reasons. Make it use the
proper interface instead in all copies.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/net/hamradio/6pack.c | 10 +++++-----
 drivers/net/hamradio/mkiss.c |  8 ++++----
 drivers/net/ppp/ppp_async.c  |  8 ++++----
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/net/hamradio/6pack.c b/drivers/net/hamradio/6pack.c
index 17e6dcd2eb42..28c749980359 100644
--- a/drivers/net/hamradio/6pack.c
+++ b/drivers/net/hamradio/6pack.c
@@ -120,7 +120,7 @@ struct sixpack {
 	struct timer_list	tx_t;
 	struct timer_list	resync_t;
 	refcount_t		refcnt;
-	struct semaphore	dead_sem;
+	struct completion	dead;
 	spinlock_t		lock;
 };
 
@@ -389,7 +389,7 @@ static struct sixpack *sp_get(struct tty_struct *tty)
 static void sp_put(struct sixpack *sp)
 {
 	if (refcount_dec_and_test(&sp->refcnt))
-		up(&sp->dead_sem);
+		complete(&sp->dead);
 }
 
 /*
@@ -576,7 +576,7 @@ static int sixpack_open(struct tty_struct *tty)
 
 	spin_lock_init(&sp->lock);
 	refcount_set(&sp->refcnt, 1);
-	sema_init(&sp->dead_sem, 0);
+	init_completion(&sp->dead);
 
 	/* !!! length of the buffers. MTU is IP MTU, not PACLEN!  */
 
@@ -670,10 +670,10 @@ static void sixpack_close(struct tty_struct *tty)
 	 * we have to wait for all existing users to finish.
 	 */
 	if (!refcount_dec_and_test(&sp->refcnt))
-		down(&sp->dead_sem);
+		wait_for_completion(&sp->dead);
 
 	/* We must stop the queue to avoid potentially scribbling
-	 * on the free buffers. The sp->dead_sem is not sufficient
+	 * on the free buffers. The sp->dead completion is not sufficient
 	 * to protect us from sp->xbuff access.
 	 */
 	netif_stop_queue(sp->dev);
diff --git a/drivers/net/hamradio/mkiss.c b/drivers/net/hamradio/mkiss.c
index 802233d41b25..4938cf4c184c 100644
--- a/drivers/net/hamradio/mkiss.c
+++ b/drivers/net/hamradio/mkiss.c
@@ -81,7 +81,7 @@ struct mkiss {
 #define CRC_MODE_SMACK_TEST	4
 
 	atomic_t		refcnt;
-	struct semaphore	dead_sem;
+	struct completion	dead;
 };
 
 /*---------------------------------------------------------------------------*/
@@ -687,7 +687,7 @@ static struct mkiss *mkiss_get(struct tty_struct *tty)
 static void mkiss_put(struct mkiss *ax)
 {
 	if (atomic_dec_and_test(&ax->refcnt))
-		up(&ax->dead_sem);
+		complete(&ax->dead);
 }
 
 static int crc_force = 0;	/* Can be overridden with insmod */
@@ -715,7 +715,7 @@ static int mkiss_open(struct tty_struct *tty)
 
 	spin_lock_init(&ax->buflock);
 	atomic_set(&ax->refcnt, 1);
-	sema_init(&ax->dead_sem, 0);
+	init_completion(&ax->dead);
 
 	ax->tty = tty;
 	tty->disc_data = ax;
@@ -795,7 +795,7 @@ static void mkiss_close(struct tty_struct *tty)
 	 * we have to wait for all existing users to finish.
 	 */
 	if (!atomic_dec_and_test(&ax->refcnt))
-		down(&ax->dead_sem);
+		wait_for_completion(&ax->dead);
 	/*
 	 * Halt the transmit queue so that a new transmit cannot scribble
 	 * on our buffers
diff --git a/drivers/net/ppp/ppp_async.c b/drivers/net/ppp/ppp_async.c
index bdc4d23627c5..288cf099876b 100644
--- a/drivers/net/ppp/ppp_async.c
+++ b/drivers/net/ppp/ppp_async.c
@@ -70,7 +70,7 @@ struct asyncppp {
 	struct tasklet_struct tsk;
 
 	refcount_t	refcnt;
-	struct semaphore dead_sem;
+	struct completion dead;
 	struct ppp_channel chan;	/* interface to generic ppp layer */
 	unsigned char	obuf[OBUFSIZE];
 };
@@ -148,7 +148,7 @@ static struct asyncppp *ap_get(struct tty_struct *tty)
 static void ap_put(struct asyncppp *ap)
 {
 	if (refcount_dec_and_test(&ap->refcnt))
-		up(&ap->dead_sem);
+		complete(&ap->dead);
 }
 
 /*
@@ -186,7 +186,7 @@ ppp_asynctty_open(struct tty_struct *tty)
 	tasklet_init(&ap->tsk, ppp_async_process, (unsigned long) ap);
 
 	refcount_set(&ap->refcnt, 1);
-	sema_init(&ap->dead_sem, 0);
+	init_completion(&ap->dead);
 
 	ap->chan.private = ap;
 	ap->chan.ops = &async_ops;
@@ -235,7 +235,7 @@ ppp_asynctty_close(struct tty_struct *tty)
 	 * by the time it returns.
 	 */
 	if (!refcount_dec_and_test(&ap->refcnt))
-		down(&ap->dead_sem);
+		wait_for_completion(&ap->dead);
 	tasklet_kill(&ap->tsk);
 
 	ppp_unregister_channel(&ap->chan);
-- 
2.20.0
