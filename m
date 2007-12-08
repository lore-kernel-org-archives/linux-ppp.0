From: Matthias Kaehlcke <matthias.kaehlcke@gmail.com>
Date: Sat, 08 Dec 2007 15:09:54 +0000
Subject: [PATCH] PPP synchronous tty: convert dead_sem to completion
Message-Id: <20071208150954.GA8467@traven>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: paulus@samba.org, linux-ppp@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

PPP synchronous tty channel driver: convert the semaphore dead_sem to
a completion

Signed-off-by: Matthias Kaehlcke <matthias.kaehlcke@gmail.com>

--

diff --git a/drivers/net/ppp_synctty.c b/drivers/net/ppp_synctty.c
index f0c6a19..f7472c8 100644
--- a/drivers/net/ppp_synctty.c
+++ b/drivers/net/ppp_synctty.c
@@ -42,9 +42,9 @@
 #include <linux/if_ppp.h>
 #include <linux/ppp_channel.h>
 #include <linux/spinlock.h>
+#include <linux/completion.h>
 #include <linux/init.h>
 #include <asm/uaccess.h>
-#include <asm/semaphore.h>
 
 #define PPP_VERSION	"2.4.2"
 
@@ -70,7 +70,7 @@ struct syncppp {
 	struct tasklet_struct tsk;
 
 	atomic_t	refcnt;
-	struct semaphore dead_sem;
+	struct completion dead_cmp;
 	struct ppp_channel chan;	/* interface to generic ppp layer */
 };
 
@@ -195,7 +195,7 @@ static struct syncppp *sp_get(struct tty_struct *tty)
 static void sp_put(struct syncppp *ap)
 {
 	if (atomic_dec_and_test(&ap->refcnt))
-		up(&ap->dead_sem);
+		complete(&ap->dead_cmp);
 }
 
 /*
@@ -225,7 +225,7 @@ ppp_sync_open(struct tty_struct *tty)
 	tasklet_init(&ap->tsk, ppp_sync_process, (unsigned long) ap);
 
 	atomic_set(&ap->refcnt, 1);
-	init_MUTEX_LOCKED(&ap->dead_sem);
+	init_completion(&ap->dead_cmp);
 
 	ap->chan.private = ap;
 	ap->chan.ops = &sync_ops;
@@ -273,7 +273,7 @@ ppp_sync_close(struct tty_struct *tty)
 	 * by the time it returns.
 	 */
 	if (!atomic_dec_and_test(&ap->refcnt))
-		down(&ap->dead_sem);
+		wait_for_completion(&ap->dead_cmp);
 	tasklet_kill(&ap->tsk);
 
 	ppp_unregister_channel(&ap->chan);

-- 
Matthias Kaehlcke
Linux System Developer
Barcelona

      In itself, homosexuality is as limiting as heterosexuality: the
     ideal should be to be capable of loving a woman or a man; either,
      a human being, without  feeling fear, restraint, or obligation
                          (Simone de Beauvoir)
                                                                 .''`.
    using free software / Debian GNU/Linux | http://debian.org  : :'  :
                                                                `. `'`
gpg --keyserver pgp.mit.edu --recv-keys 47D8E5D4                  `-
