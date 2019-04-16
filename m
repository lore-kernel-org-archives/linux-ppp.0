From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 16 Apr 2019 20:19:43 +0000
Subject: [PATCH v3 05/26] compat_ioctl: move PPPIOCSPASS32/PPPIOCSACTIVE32 to ppp_generic.c
Message-Id: <20190416202013.4034148-6-arnd@arndb.de>
List-Id: <linux-ppp.vger.kernel.org>
References: <20190416202013.4034148-1-arnd@arndb.de>
In-Reply-To: <20190416202013.4034148-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org, y2038@lists.linaro.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Paul Mackerras <paulus@samba.org>, "David S. Miller" <davem@davemloft.net>, linux-ppp@vger.kernel.org, netdev@vger.kernel.org

PPPIOCSPASS and PPPIOCSACTIVE are implemented in ppp_generic and isdn_ppp,
but the latter one doesn't work for compat mode in general, so we can
move these two into the generic code.

Again, the best implementation I could come up with was to merge
the compat handling into the regular ppp_ioctl() function and
treating all ioctl commands as compatible.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/net/ppp/ppp_generic.c | 39 ++++++++++++++++++++++++++++++-----
 fs/compat_ioctl.c             | 37 ---------------------------------
 2 files changed, 34 insertions(+), 42 deletions(-)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index 8d211c9c2e4e..b8a867fdd5ad 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -22,6 +22,7 @@
  * =FILEVERSION 20041108=
  */
 
+#include <linux/compat.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/sched/signal.h>
@@ -567,14 +568,36 @@ struct ppp_option_data32 {
 #endif
 
 #ifdef CONFIG_PPP_FILTER
-static int get_filter(void __user *arg, struct sock_filter **p)
+#ifdef CONFIG_COMPAT
+struct sock_fprog32 {
+	unsigned short	len;
+	compat_caddr_t	filter;
+};
+#define PPPIOCSPASS32	_IOW('t', 71, struct sock_fprog32)
+#define PPPIOCSACTIVE32	_IOW('t', 70, struct sock_fprog32)
+#endif
+
+static int get_filter(void __user *arg, struct sock_filter **p, bool compat)
 {
 	struct sock_fprog uprog;
 	struct sock_filter *code = NULL;
 	int len;
 
-	if (copy_from_user(&uprog, arg, sizeof(uprog)))
-		return -EFAULT;
+#ifdef CONFIG_COMPAT
+	if (compat) {
+		struct sock_fprog32 uprog32;
+
+		if (copy_from_user(&uprog32, arg, sizeof(uprog32)))
+			return -EFAULT;
+
+		uprog.len = uprog32.len;
+		uprog.filter = compat_ptr(uprog32.filter);
+	} else
+#endif
+	{
+		if (copy_from_user(&uprog, arg, sizeof(uprog)))
+			return -EFAULT;
+	}
 
 	if (!uprog.len) {
 		*p = NULL;
@@ -772,10 +795,13 @@ static long ppp_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 
 #ifdef CONFIG_PPP_FILTER
 	case PPPIOCSPASS:
+#ifdef CONFIG_COMPAT
+	case PPPIOCSPASS32:
+#endif
 	{
 		struct sock_filter *code;
 
-		err = get_filter(argp, &code);
+		err = get_filter(argp, &code, cmd != PPPIOCSPASS);
 		if (err >= 0) {
 			struct bpf_prog *pass_filter = NULL;
 			struct sock_fprog_kern fprog = {
@@ -798,10 +824,13 @@ static long ppp_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		break;
 	}
 	case PPPIOCSACTIVE:
+#ifdef CONFIG_COMPAT
+	case PPPIOCSACTIVE32:
+#endif
 	{
 		struct sock_filter *code;
 
-		err = get_filter(argp, &code);
+		err = get_filter(argp, &code, cmd != PPPIOCSACTIVE);
 		if (err >= 0) {
 			struct bpf_prog *active_filter = NULL;
 			struct sock_fprog_kern fprog = {
diff --git a/fs/compat_ioctl.c b/fs/compat_ioctl.c
index a7cea8f9c771..d507b7189958 100644
--- a/fs/compat_ioctl.c
+++ b/fs/compat_ioctl.c
@@ -271,40 +271,6 @@ static int sg_grt_trans(struct file *file,
 }
 #endif /* CONFIG_BLOCK */
 
-struct sock_fprog32 {
-	unsigned short	len;
-	compat_caddr_t	filter;
-};
-
-#define PPPIOCSPASS32	_IOW('t', 71, struct sock_fprog32)
-#define PPPIOCSACTIVE32	_IOW('t', 70, struct sock_fprog32)
-
-static int ppp_sock_fprog_ioctl_trans(struct file *file,
-		unsigned int cmd, struct sock_fprog32 __user *u_fprog32)
-{
-	struct sock_fprog __user *u_fprog64 = compat_alloc_user_space(sizeof(struct sock_fprog));
-	void __user *fptr64;
-	u32 fptr32;
-	u16 flen;
-
-	if (get_user(flen, &u_fprog32->len) ||
-	    get_user(fptr32, &u_fprog32->filter))
-		return -EFAULT;
-
-	fptr64 = compat_ptr(fptr32);
-
-	if (put_user(flen, &u_fprog64->len) ||
-	    put_user(fptr64, &u_fprog64->filter))
-		return -EFAULT;
-
-	if (cmd = PPPIOCSPASS32)
-		cmd = PPPIOCSPASS;
-	else
-		cmd = PPPIOCSACTIVE;
-
-	return do_ioctl(file, cmd, (unsigned long) u_fprog64);
-}
-
 struct ppp_idle32 {
 	compat_time_t xmit_idle;
 	compat_time_t recv_idle;
@@ -874,9 +840,6 @@ static long do_ioctl_trans(unsigned int cmd,
 	switch (cmd) {
 	case PPPIOCGIDLE32:
 		return ppp_gidle(file, cmd, argp);
-	case PPPIOCSPASS32:
-	case PPPIOCSACTIVE32:
-		return ppp_sock_fprog_ioctl_trans(file, cmd, argp);
 #ifdef CONFIG_BLOCK
 	case SG_IO:
 		return sg_ioctl_trans(file, cmd, argp);
-- 
2.20.0
