From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 29 Aug 2018 14:03:26 +0000
Subject: [PATCH net-next 1/5] pppoe: fix PPPOEIOCSFWD compat handling
Message-Id: <20180829140409.833488-1-arnd@arndb.de>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: paulus@samba.org, linux-ppp@vger.kernel.org, netdev@vger.kernel.org
Cc: mitch@sfgoth.com, mostrows@earthlink.net, jchapman@katalix.com, xeb@mail.ru, davem@davemloft.net, viro@zeniv.linux.org.uk, y2038@lists.linaro.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>

Support for handling the PPPOEIOCSFWD ioctl in compat mode was added in
linux-2.5.69 along with hundreds of other commands, but was always broken
sincen only the structure is compatible, but the command number is not,
due to the size being sizeof(size_t), or at first sizeof(sizeof((struct
sockaddr_pppox)), which is different on 64-bit architectures.

Fix it by defining a separate command code that matches the 32-bit
version, and marking that one as compatible.

This should apply to all stable kernels.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/net/ppp/pppoe.c  | 4 ++++
 fs/compat_ioctl.c        | 2 +-
 include/linux/if_pppox.h | 2 ++
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ppp/pppoe.c b/drivers/net/ppp/pppoe.c
index ce61231e96ea..d1c3f9292c54 100644
--- a/drivers/net/ppp/pppoe.c
+++ b/drivers/net/ppp/pppoe.c
@@ -57,6 +57,7 @@
  *
  */
 
+#include <linux/compat.h>
 #include <linux/string.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
@@ -780,6 +781,9 @@ static int pppoe_ioctl(struct socket *sock, unsigned int cmd,
 		err = 0;
 		break;
 
+#ifdef CONFIG_COMPAT
+	case PPPOEIOCSFWD32:
+#endif
 	case PPPOEIOCSFWD:
 	{
 		struct pppox_sock *relay_po;
diff --git a/fs/compat_ioctl.c b/fs/compat_ioctl.c
index a9b00942e87d..a8bb193fdfd5 100644
--- a/fs/compat_ioctl.c
+++ b/fs/compat_ioctl.c
@@ -895,7 +895,7 @@ COMPATIBLE_IOCTL(PPPIOCATTCHAN)
 COMPATIBLE_IOCTL(PPPIOCGCHAN)
 COMPATIBLE_IOCTL(PPPIOCGL2TPSTATS)
 /* PPPOX */
-COMPATIBLE_IOCTL(PPPOEIOCSFWD)
+COMPATIBLE_IOCTL(PPPOEIOCSFWD32)
 COMPATIBLE_IOCTL(PPPOEIOCDFWD)
 /* Big A */
 /* sparc only */
diff --git a/include/linux/if_pppox.h b/include/linux/if_pppox.h
index ba7a9b0c7c57..d221f1465f41 100644
--- a/include/linux/if_pppox.h
+++ b/include/linux/if_pppox.h
@@ -85,6 +85,8 @@ extern void unregister_pppox_proto(int proto_num);
 extern void pppox_unbind_sock(struct sock *sk);/* delete ppp-channel binding */
 extern int pppox_ioctl(struct socket *sock, unsigned int cmd, unsigned long arg);
 
+#define PPPOEIOCSFWD32    _IOW(0xB1 ,0, compat_size_t)
+
 /* PPPoX socket states */
 enum {
     PPPOX_NONE		= 0,  /* initial state */
-- 
2.18.0
