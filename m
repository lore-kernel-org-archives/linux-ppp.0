From: Gao Yan <gao.yanB@h3c.com>
Date: Mon, 28 Dec 2020 07:15:50 +0000
Subject: [PATCH] net: remove disc_data_lock in ppp line discipline
Message-Id: <20201228071550.15745-1-gao.yanB@h3c.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: paulus@samba.org, davem@davemloft.net, kuba@kernel.org
Cc: linux-ppp@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Gao Yan <gao.yanB@h3c.com>

In tty layer, it use tty->ldisc_sem to proect tty_ldisc_ops.
So I think tty->ldisc_sem can also protect tty->disc_data;
For examlpe,
When cpu A is running ppp_synctty_ioctl that hold the tty->ldisc_sem,
at the same time  if cpu B calls ppp_synctty_close, it will wait until
cpu A release tty->ldisc_sem. So I think it is unnecessary to have the
disc_data_lock;

cpu A                           cpu B
tty_ioctl                       tty_reopen
 ->hold tty->ldisc_sem            ->hold tty->ldisc_sem(write), failed
 ->ld->ops->ioctl                 ->wait...
 ->release tty->ldisc_sem         ->wait...OK,hold tty->ldisc_sem
                                    ->tty_ldisc_reinit
                                      ->tty_ldisc_close
                                        ->ld->ops->close

Signed-off-by: Gao Yan <gao.yanB@h3c.com>
---
 drivers/net/ppp/ppp_async.c   | 11 ++---------
 drivers/net/ppp/ppp_synctty.c | 12 ++----------
 2 files changed, 4 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ppp/ppp_async.c b/drivers/net/ppp/ppp_async.c
index 29a0917a8..20b50facd 100644
--- a/drivers/net/ppp/ppp_async.c
+++ b/drivers/net/ppp/ppp_async.c
@@ -127,17 +127,13 @@ static const struct ppp_channel_ops async_ops = {
  * FIXME: this is no longer true. The _close path for the ldisc is
  * now guaranteed to be sane.
  */
-static DEFINE_RWLOCK(disc_data_lock);
 
 static struct asyncppp *ap_get(struct tty_struct *tty)
 {
-	struct asyncppp *ap;
+	struct asyncppp *ap = tty->disc_data;
 
-	read_lock(&disc_data_lock);
-	ap = tty->disc_data;
 	if (ap != NULL)
 		refcount_inc(&ap->refcnt);
-	read_unlock(&disc_data_lock);
 	return ap;
 }
 
@@ -214,12 +210,9 @@ ppp_asynctty_open(struct tty_struct *tty)
 static void
 ppp_asynctty_close(struct tty_struct *tty)
 {
-	struct asyncppp *ap;
+	struct asyncppp *ap = tty->disc_data;
 
-	write_lock_irq(&disc_data_lock);
-	ap = tty->disc_data;
 	tty->disc_data = NULL;
-	write_unlock_irq(&disc_data_lock);
 	if (!ap)
 		return;
 
diff --git a/drivers/net/ppp/ppp_synctty.c b/drivers/net/ppp/ppp_synctty.c
index 0f338752c..53fb68e29 100644
--- a/drivers/net/ppp/ppp_synctty.c
+++ b/drivers/net/ppp/ppp_synctty.c
@@ -129,17 +129,12 @@ ppp_print_buffer (const char *name, const __u8 *buf, int count)
  *
  * FIXME: Fixed in tty_io nowadays.
  */
-static DEFINE_RWLOCK(disc_data_lock);
-
 static struct syncppp *sp_get(struct tty_struct *tty)
 {
-	struct syncppp *ap;
+	struct syncppp *ap = tty->disc_data;
 
-	read_lock(&disc_data_lock);
-	ap = tty->disc_data;
 	if (ap != NULL)
 		refcount_inc(&ap->refcnt);
-	read_unlock(&disc_data_lock);
 	return ap;
 }
 
@@ -213,12 +208,9 @@ ppp_sync_open(struct tty_struct *tty)
 static void
 ppp_sync_close(struct tty_struct *tty)
 {
-	struct syncppp *ap;
+	struct syncppp *ap = tty->disc_data;
 
-	write_lock_irq(&disc_data_lock);
-	ap = tty->disc_data;
 	tty->disc_data = NULL;
-	write_unlock_irq(&disc_data_lock);
 	if (!ap)
 		return;
 
-- 
2.17.1
