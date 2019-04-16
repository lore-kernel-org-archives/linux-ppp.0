From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 16 Apr 2019 20:19:40 +0000
Subject: [PATCH v3 02/26] compat_ioctl: move simple ppp command handling into driver
Message-Id: <20190416202013.4034148-3-arnd@arndb.de>
List-Id: <linux-ppp.vger.kernel.org>
References: <20190416202013.4034148-1-arnd@arndb.de>
In-Reply-To: <20190416202013.4034148-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org, y2038@lists.linaro.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Paul Mackerras <paulus@samba.org>, "David S. Miller" <davem@davemloft.net>, Michal Ostrowski <mostrows@earthlink.net>, Dmitry Kozlov <xeb@mail.ru>, James Chapman <jchapman@katalix.com>, linux-ppp@vger.kernel.org, netdev@vger.kernel.org

There are multiple implementations of the PPP ioctl interface in the
kernel:

- drivers/net/ppp/ppp_generic.c implements a generic interface
  for the /dev/ppp chardev used by some subdrivers.
- drivers/net/ppp/pppox.c implements a socket based interface
  for pppoe, pptp and l2tp.
- drivers/isdn/i4l/isdn_ppp.c is for the i4l ISDN stack

All ioctl commands in the respective functions are compatible between
32-bit and 64-bit kernels, so we can simply mark the handlers themselves
as compatible and stop listing the commands individually.

Four commands (PPPIOCSCOMPRESS, PPPIOCSPASS, PPPIOCSACTIVE, and
PPPIOCGIDLE) are incompatible on the user level but have a translation
handler to make them compatible. I'm simplifying that compat handling
in separate patches.

The PPPIOCGUNIT and PPPIOCGCHAN ioctl commands are special, they are
implemented on various other file descriptors, so we have to keep them
listed as COMPATIBLE_IOCTL().

For the isdn_ppp code, additional ioctl commands are needed that have
never had working compat handling, so I'm leaving that part out: If
they are remaining users of i4l's ippp, they are not using compat
mode today, and are highly unlikely in the future before the last
ISDN network gets shut down. I4L has been deprecated since 2002.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/net/ppp/ppp_generic.c |  1 +
 drivers/net/ppp/pppoe.c       |  3 +++
 drivers/net/ppp/pptp.c        |  3 +++
 fs/compat_ioctl.c             | 31 -------------------------------
 net/l2tp/l2tp_ppp.c           |  3 +++
 5 files changed, 10 insertions(+), 31 deletions(-)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index c708400fff4a..04252c3492ee 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -899,6 +899,7 @@ static const struct file_operations ppp_device_fops = {
 	.write		= ppp_write,
 	.poll		= ppp_poll,
 	.unlocked_ioctl	= ppp_ioctl,
+	.compat_ioctl	= ppp_ioctl,
 	.open		= ppp_open,
 	.release	= ppp_release,
 	.llseek		= noop_llseek,
diff --git a/drivers/net/ppp/pppoe.c b/drivers/net/ppp/pppoe.c
index c5e7435db86c..5eccb49bcd2e 100644
--- a/drivers/net/ppp/pppoe.c
+++ b/drivers/net/ppp/pppoe.c
@@ -1124,6 +1124,9 @@ static const struct proto_ops pppoe_ops = {
 	.recvmsg	= pppoe_recvmsg,
 	.mmap		= sock_no_mmap,
 	.ioctl		= pppox_ioctl,
+#ifdef CONFIG_COMPAT
+	.compat_ioctl	= pppox_ioctl,
+#endif
 };
 
 static const struct pppox_proto pppoe_proto = {
diff --git a/drivers/net/ppp/pptp.c b/drivers/net/ppp/pptp.c
index 50c60550f295..7cf56ad50d07 100644
--- a/drivers/net/ppp/pptp.c
+++ b/drivers/net/ppp/pptp.c
@@ -628,6 +628,9 @@ static const struct proto_ops pptp_ops = {
 	.recvmsg    = sock_no_recvmsg,
 	.mmap       = sock_no_mmap,
 	.ioctl      = pppox_ioctl,
+#ifdef CONFIG_COMPAT
+	.compat_ioctl = pppox_ioctl,
+#endif
 };
 
 static const struct pppox_proto pppox_pptp_proto = {
diff --git a/fs/compat_ioctl.c b/fs/compat_ioctl.c
index f1065d116b55..54f26a9fa9f2 100644
--- a/fs/compat_ioctl.c
+++ b/fs/compat_ioctl.c
@@ -608,39 +608,8 @@ COMPATIBLE_IOCTL(SG_SET_KEEP_ORPHAN)
 COMPATIBLE_IOCTL(SG_GET_KEEP_ORPHAN)
 #endif
 /* PPP stuff */
-COMPATIBLE_IOCTL(PPPIOCGFLAGS)
-COMPATIBLE_IOCTL(PPPIOCSFLAGS)
-COMPATIBLE_IOCTL(PPPIOCGASYNCMAP)
-COMPATIBLE_IOCTL(PPPIOCSASYNCMAP)
 COMPATIBLE_IOCTL(PPPIOCGUNIT)
-COMPATIBLE_IOCTL(PPPIOCGRASYNCMAP)
-COMPATIBLE_IOCTL(PPPIOCSRASYNCMAP)
-COMPATIBLE_IOCTL(PPPIOCGMRU)
-COMPATIBLE_IOCTL(PPPIOCSMRU)
-COMPATIBLE_IOCTL(PPPIOCSMAXCID)
-COMPATIBLE_IOCTL(PPPIOCGXASYNCMAP)
-COMPATIBLE_IOCTL(PPPIOCSXASYNCMAP)
-COMPATIBLE_IOCTL(PPPIOCXFERUNIT)
-/* PPPIOCSCOMPRESS is translated */
-COMPATIBLE_IOCTL(PPPIOCGNPMODE)
-COMPATIBLE_IOCTL(PPPIOCSNPMODE)
-COMPATIBLE_IOCTL(PPPIOCGDEBUG)
-COMPATIBLE_IOCTL(PPPIOCSDEBUG)
-/* PPPIOCSPASS is translated */
-/* PPPIOCSACTIVE is translated */
-/* PPPIOCGIDLE is translated */
-COMPATIBLE_IOCTL(PPPIOCNEWUNIT)
-COMPATIBLE_IOCTL(PPPIOCATTACH)
-COMPATIBLE_IOCTL(PPPIOCDETACH)
-COMPATIBLE_IOCTL(PPPIOCSMRRU)
-COMPATIBLE_IOCTL(PPPIOCCONNECT)
-COMPATIBLE_IOCTL(PPPIOCDISCONN)
-COMPATIBLE_IOCTL(PPPIOCATTCHAN)
 COMPATIBLE_IOCTL(PPPIOCGCHAN)
-COMPATIBLE_IOCTL(PPPIOCGL2TPSTATS)
-/* PPPOX */
-COMPATIBLE_IOCTL(PPPOEIOCSFWD32)
-COMPATIBLE_IOCTL(PPPOEIOCDFWD)
 /* Big A */
 /* sparc only */
 /* Big Q for sound/OSS */
diff --git a/net/l2tp/l2tp_ppp.c b/net/l2tp/l2tp_ppp.c
index 04d9946dcdba..8ef66513fbe0 100644
--- a/net/l2tp/l2tp_ppp.c
+++ b/net/l2tp/l2tp_ppp.c
@@ -1686,6 +1686,9 @@ static const struct proto_ops pppol2tp_ops = {
 	.recvmsg	= pppol2tp_recvmsg,
 	.mmap		= sock_no_mmap,
 	.ioctl		= pppox_ioctl,
+#ifdef CONFIG_COMPAT
+	.compat_ioctl = pppox_ioctl,
+#endif
 };
 
 static const struct pppox_proto pppol2tp_proto = {
-- 
2.20.0
