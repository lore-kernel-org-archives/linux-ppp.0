From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 16 Apr 2019 20:19:42 +0000
Subject: [PATCH v3 04/26] compat_ioctl: move PPPIOCSCOMPRESS32 to ppp-generic.c
Message-Id: <20190416202013.4034148-5-arnd@arndb.de>
List-Id: <linux-ppp.vger.kernel.org>
References: <20190416202013.4034148-1-arnd@arndb.de>
In-Reply-To: <20190416202013.4034148-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org, y2038@lists.linaro.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Paul Mackerras <paulus@samba.org>, "David S. Miller" <davem@davemloft.net>, linux-ppp@vger.kernel.org, netdev@vger.kernel.org

PPPIOCSCOMPRESS is only implemented in ppp_generic, so it's best to move
the compat handling there. My first approach was to keep it in a new
ppp_compat_ioctl() function, but it turned out to be much simpler to do
it in the regular ioctl handler, by allowing both structure layouts to
be handled directly there.

Aside from moving the code to the right place, this also avoids
a round-trip through compat_alloc_user_space() allocated memory.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/net/ppp/ppp_generic.c | 40 ++++++++++++++++++++++++++++++-----
 fs/compat_ioctl.c             | 32 ----------------------------
 2 files changed, 35 insertions(+), 37 deletions(-)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index 04252c3492ee..8d211c9c2e4e 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -274,7 +274,7 @@ static void ppp_mp_insert(struct ppp *ppp, struct sk_buff *skb);
 static struct sk_buff *ppp_mp_reconstruct(struct ppp *ppp);
 static int ppp_mp_explode(struct ppp *ppp, struct sk_buff *skb);
 #endif /* CONFIG_PPP_MULTILINK */
-static int ppp_set_compress(struct ppp *ppp, unsigned long arg);
+static int ppp_set_compress(struct ppp *ppp, unsigned long arg, bool compat);
 static void ppp_ccp_peek(struct ppp *ppp, struct sk_buff *skb, int inbound);
 static void ppp_ccp_closed(struct ppp *ppp);
 static struct compressor *find_compressor(int type);
@@ -557,6 +557,15 @@ static __poll_t ppp_poll(struct file *file, poll_table *wait)
 	return mask;
 }
 
+#ifdef CONFIG_COMPAT
+struct ppp_option_data32 {
+	compat_caddr_t	ptr;
+	u32			length;
+	compat_int_t		transmit;
+};
+#define PPPIOCSCOMPRESS32	_IOW('t', 77, struct ppp_option_data32)
+#endif
+
 #ifdef CONFIG_PPP_FILTER
 static int get_filter(void __user *arg, struct sock_filter **p)
 {
@@ -683,8 +692,14 @@ static long ppp_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		break;
 
 	case PPPIOCSCOMPRESS:
-		err = ppp_set_compress(ppp, arg);
+		err = ppp_set_compress(ppp, arg, false);
+		break;
+
+#ifdef CONFIG_COMPAT
+	case PPPIOCSCOMPRESS32:
+		err = ppp_set_compress(ppp, arg, true);
 		break;
+#endif
 
 	case PPPIOCGUNIT:
 		if (put_user(ppp->file.index, p))
@@ -2739,7 +2754,7 @@ ppp_output_wakeup(struct ppp_channel *chan)
 
 /* Process the PPPIOCSCOMPRESS ioctl. */
 static int
-ppp_set_compress(struct ppp *ppp, unsigned long arg)
+ppp_set_compress(struct ppp *ppp, unsigned long arg, bool compat)
 {
 	int err;
 	struct compressor *cp, *ocomp;
@@ -2748,8 +2763,23 @@ ppp_set_compress(struct ppp *ppp, unsigned long arg)
 	unsigned char ccp_option[CCP_MAX_OPTION_LENGTH];
 
 	err = -EFAULT;
-	if (copy_from_user(&data, (void __user *) arg, sizeof(data)))
-		goto out;
+#ifdef CONFIG_COMPAT
+	if (compat) {
+		struct ppp_option_data32 data32;
+
+		if (copy_from_user(&data32, (void __user *) arg,
+				   sizeof(data32)))
+			goto out;
+
+		data.ptr = compat_ptr(data32.ptr);
+		data.length = data32.length;
+		data.transmit = data32.transmit;
+	} else
+#endif
+	{
+		if (copy_from_user(&data, (void __user *) arg, sizeof(data)))
+			goto out;
+	}
 	if (data.length > CCP_MAX_OPTION_LENGTH)
 		goto out;
 	if (copy_from_user(ccp_option, (void __user *) data.ptr, data.length))
diff --git a/fs/compat_ioctl.c b/fs/compat_ioctl.c
index 2772b539674d..a7cea8f9c771 100644
--- a/fs/compat_ioctl.c
+++ b/fs/compat_ioctl.c
@@ -305,13 +305,6 @@ static int ppp_sock_fprog_ioctl_trans(struct file *file,
 	return do_ioctl(file, cmd, (unsigned long) u_fprog64);
 }
 
-struct ppp_option_data32 {
-	compat_caddr_t	ptr;
-	u32			length;
-	compat_int_t		transmit;
-};
-#define PPPIOCSCOMPRESS32	_IOW('t', 77, struct ppp_option_data32)
-
 struct ppp_idle32 {
 	compat_time_t xmit_idle;
 	compat_time_t recv_idle;
@@ -339,29 +332,6 @@ static int ppp_gidle(struct file *file, unsigned int cmd,
 	return err;
 }
 
-static int ppp_scompress(struct file *file, unsigned int cmd,
-	struct ppp_option_data32 __user *odata32)
-{
-	struct ppp_option_data __user *odata;
-	__u32 data;
-	void __user *datap;
-
-	odata = compat_alloc_user_space(sizeof(*odata));
-
-	if (get_user(data, &odata32->ptr))
-		return -EFAULT;
-
-	datap = compat_ptr(data);
-	if (put_user(datap, &odata->ptr))
-		return -EFAULT;
-
-	if (copy_in_user(&odata->length, &odata32->length,
-			 sizeof(__u32) + sizeof(int)))
-		return -EFAULT;
-
-	return do_ioctl(file, PPPIOCSCOMPRESS, (unsigned long) odata);
-}
-
 #ifdef CONFIG_BLOCK
 struct mtget32 {
 	compat_long_t	mt_type;
@@ -904,8 +874,6 @@ static long do_ioctl_trans(unsigned int cmd,
 	switch (cmd) {
 	case PPPIOCGIDLE32:
 		return ppp_gidle(file, cmd, argp);
-	case PPPIOCSCOMPRESS32:
-		return ppp_scompress(file, cmd, argp);
 	case PPPIOCSPASS32:
 	case PPPIOCSACTIVE32:
 		return ppp_sock_fprog_ioctl_trans(file, cmd, argp);
-- 
2.20.0
