From: Matt Domsch <Matt_Domsch@dell.com>
Date: Tue, 12 Oct 2004 17:14:13 +0000
Subject: Re: [pptp-devel] Re: [2/2]: ppp_mppe inclusion
Message-Id: <20041012171413.GB32018@lists.us.dell.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20040720204723.GC27576@lists.us.dell.com>
In-Reply-To: <20040720204723.GC27576@lists.us.dell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Mon, Aug 30, 2004 at 05:42:05PM -0500, Matt Domsch wrote:
> On Fri, Jul 30, 2004 at 11:33:09PM +0400, Oleg Makarenko wrote:
> > Please find attached somewhat (I hope) improved patches that finaly do 
> > work for me
> 
> Thanks much.  I've merged these into my bk tree at
> http://mdomsch.bkbits.net/linux-2.6-mppe

Oleg, reviewing this code again finally.

Patch below moves these out of the per-connection struct into a
driver-local struct.  It's a win if you've got more than one mppe
connection, saving 80 bytes.

Everyone - have you been using this code?  How's it work for you?
Does the approach to using must_compress=1 work?  Is there ever a case
where compression is enabled and running, but somehow a message is
sent to disable it, and a packet isn't compressed(encrypted)?  That
was Paul's concern before considering merging it into mainline.

Thanks,
Matt

-- 
Matt Domsch
Sr. Software Engineer, Lead Engineer
Dell Linux Solutions linux.dell.com & www.dell.com/linux
Linux on Dell mailing lists @ http://lists.us.dell.com

=== drivers/net/ppp_mppe.c 1.3 vs edited ==--- 1.3/drivers/net/ppp_mppe.c	2004-08-30 14:28:51 -05:00
+++ edited/drivers/net/ppp_mppe.c	2004-10-12 11:59:18 -05:00
@@ -61,7 +61,7 @@
 MODULE_DESCRIPTION("Point-to-Point Protocol Microsoft Point-to-Point Encryption support");
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_ALIAS("ppp-compress-" __stringify(CI_MPPE));
-MODULE_VERSION("1.0.1");
+MODULE_VERSION("1.0.2");
 
 static void
 setup_sg(struct scatterlist *sg, const void *address, unsigned int length)
@@ -74,6 +74,23 @@
 #define SHA1_PAD_SIZE 40
 
 /*
+ * kernel crypto API needs its arguments to be in kmalloc'd memory, not in the module
+ * static data area.  That means sha_pad needs to be kmalloc'd.
+ */
+
+struct sha_pad {
+	unsigned char sha_pad1[SHA1_PAD_SIZE];
+	unsigned char sha_pad2[SHA1_PAD_SIZE];
+};
+static struct sha_pad *sha_pad;
+
+static inline void sha_pad_init(struct sha_pad *shapad)
+{
+	memset(shapad->sha_pad1, 0x00, sizeof(shapad->sha_pad1));
+	memset(shapad->sha_pad2, 0xF2, sizeof(shapad->sha_pad2));
+}
+
+/*
  * State for an MPPE (de)compressor.
  */
 struct ppp_mppe_state {
@@ -82,9 +99,6 @@
 	unsigned char *sha1_digest;
 	unsigned char master_key[MPPE_MAX_KEY_LEN];
 	unsigned char session_key[MPPE_MAX_KEY_LEN];
-	unsigned char SHApad1[SHA1_PAD_SIZE];
-	unsigned char SHApad2[SHA1_PAD_SIZE];
-
 	unsigned keylen;	/* key length in bytes             */
 	/* NB: 128-bit = 16, 40-bit = 8! */
 	/* If we want to support 56-bit,   */
@@ -124,9 +138,9 @@
 	struct scatterlist sg[4];
 
 	setup_sg(&sg[0], state->master_key, state->keylen);
-	setup_sg(&sg[1], state->SHApad1, sizeof(state->SHApad1));
+	setup_sg(&sg[1], sha_pad->sha_pad1, sizeof(sha_pad->sha_pad1));
 	setup_sg(&sg[2], state->session_key, state->keylen);
-	setup_sg(&sg[3], state->SHApad2, sizeof(state->SHApad2));
+	setup_sg(&sg[3], sha_pad->sha_pad2, sizeof(sha_pad->sha_pad2));
 
 	crypto_digest_digest (state->sha1, sg, 4, state->sha1_digest);
 
@@ -203,8 +217,6 @@
 	memcpy(state->session_key, state->master_key,
 	       sizeof(state->master_key));
 
-	memset(state->SHApad2, 0xf2, sizeof(state->SHApad2));
-
 	/*
 	 * We defer initial key generation until mppe_init(), as mppe_alloc()
 	 * is called frequently during negotiation.
@@ -686,6 +698,11 @@
 	if (!(crypto_alg_available("arc4", 0) &&
 	      crypto_alg_available("sha1", 0)))
 		return -ENODEV;
+
+	sha_pad = kmalloc(sizeof(struct sha_pad), GFP_KERNEL);
+	if (!sha_pad)
+		return -ENOMEM;
+	sha_pad_init(sha_pad);
 
 	answer = ppp_register_compressor(&ppp_mppe);
 
