From: Cyrill Gorcunov <gorcunov@gmail.com>
Date: Thu, 27 Nov 2008 20:12:37 +0000
Subject: [PATCH] net: ppp_asynctty_ioctl - remove dead code
Message-Id: <20081127201237.GB18691@localhost>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: paulus@samba.org
Cc: linux-ppp@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

ap already checked to be not null. remove useless checks.

Signed-off-by: Cyrill Gorcunov <gorcunov@gmail.com>
---

Please review

diff --git a/drivers/net/ppp_async.c b/drivers/net/ppp_async.c
index 451bdb5..6567fab 100644
--- a/drivers/net/ppp_async.c
+++ b/drivers/net/ppp_async.c
@@ -293,9 +293,6 @@ ppp_asynctty_ioctl(struct tty_struct *tty, struct file *file,
 	err = -EFAULT;
 	switch (cmd) {
 	case PPPIOCGCHAN:
-		err = -ENXIO;
-		if (!ap)
-			break;
 		err = -EFAULT;
 		if (put_user(ppp_channel_index(&ap->chan), p))
 			break;
@@ -303,9 +300,6 @@ ppp_asynctty_ioctl(struct tty_struct *tty, struct file *file,
 		break;
 
 	case PPPIOCGUNIT:
-		err = -ENXIO;
-		if (!ap)
-			break;
 		err = -EFAULT;
 		if (put_user(ppp_unit_number(&ap->chan), p))
 			break;
