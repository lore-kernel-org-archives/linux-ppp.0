From: Matt Domsch <Matt_Domsch@dell.com>
Date: Tue, 20 Jul 2004 20:47:23 +0000
Subject: Re: [2/2]: ppp_mppe inclusion
Message-Id: <20040720204723.GC27576@lists.us.dell.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

On Tue, Jul 20, 2004 at 03:45:40PM -0500, Matt Domsch wrote:
> This mail will be followed by two patches, for comment on proposed
> solution.  I've compiled this, but am not able to test this week.
>
> 2: ppp_mppe.patch adds the ppp_mppe compressor, which implements
> Microsoft Point-to-Point Tunnelling Protocol.

--=20
Matt Domsch
Sr. Software Engineer, Lead Engineer
Dell Linux Solutions linux.dell.com & www.dell.com/linux
Linux on Dell mailing lists @ http://lists.us.dell.com

You can import this changeset into BK by piping this whole message to
'| bk receive [path to repository]' or apply the patch as usual.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D

ChangeSet@1.1850, 2004-07-20 16:29:53-04:00, Matt_Domsch@dell.com
  PPP: Add drivers/net/ppp_mppe.c, Makefile and Kconfig entries
 =20
  Microsoft Point-to-Point Tunnelling Protocol support
  utilizes ppp_generic and kernel crypto routines.


 Kconfig    |    6=20
 Makefile   |    1=20
 ppp_mppe.c |  706 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++
 ppp_mppe.h |   87 +++++++
 4 files changed, 800 insertions(+)


diff -Nru a/drivers/net/Kconfig b/drivers/net/Kconfig
--- a/drivers/net/Kconfig	2004-07-20 16:37:04 -04:00
+++ b/drivers/net/Kconfig	2004-07-20 16:37:04 -04:00
@@ -2460,6 +2460,12 @@
 	  module; it is called bsd_comp and will show up in the directory
 	  modules once you have said "make modules". If unsure, say N.
=20
+config PPP_MPPE
+       tristate "PPP MPPE compression (encryption)"
+       depends on PPP
+       ---help---
+         Support for the MPPE Encryption protocol.
+
 config PPPOE
 	tristate "PPP over Ethernet (EXPERIMENTAL)"
 	depends on EXPERIMENTAL && PPP
diff -Nru a/drivers/net/Makefile b/drivers/net/Makefile
--- a/drivers/net/Makefile	2004-07-20 16:37:04 -04:00
+++ b/drivers/net/Makefile	2004-07-20 16:37:04 -04:00
@@ -100,6 +100,7 @@
 obj-$(CONFIG_PPP_SYNC_TTY) +=3D ppp_synctty.o
 obj-$(CONFIG_PPP_DEFLATE) +=3D ppp_deflate.o
 obj-$(CONFIG_PPP_BSDCOMP) +=3D bsd_comp.o
+obj-$(CONFIG_PPP_MPPE) +=3D ppp_mppe.o
 obj-$(CONFIG_PPPOE) +=3D pppox.o pppoe.o
=20
 obj-$(CONFIG_SLIP) +=3D slip.o
diff -Nru a/drivers/net/ppp_mppe.c b/drivers/net/ppp_mppe.c
--- /dev/null	Wed Dec 31 16:00:00 196900
+++ b/drivers/net/ppp_mppe.c	2004-07-20 16:37:04 -04:00
@@ -0,0 +1,706 @@
+/*
+ * ppp_mppe_compress.c - interface MPPE to the PPP code.
+ * This version is for use with Linux kernel 2.2.19+, 2.4.18+ and 2.6.2+.
+ *
+ * By Frank Cusack <frank@google.com>.
+ * Copyright (c) 2002,2003,2004 Google, Inc.
+ * All rights reserved.
+ *
+ * License:
+ * Permission to use, copy, modify, and distribute this software and its
+ * documentation is hereby granted, provided that the above copyright
+ * notice appears in all copies.  This software is provided without any
+ * warranty, express or implied.
+ *
+ * ALTERNATIVELY, provided that this notice is retained in full, this prod=
uct
+ * may be distributed under the terms of the GNU General Public License (G=
PL),
+ * in which case the provisions of the GPL apply INSTEAD OF those given ab=
ove.
+ *
+ *   This program is free software; you can redistribute it and/or modify
+ *   it under the terms of the GNU General Public License as published by
+ *   the Free Software Foundation; either version 2 of the License, or
+ *   (at your option) any later version.
+ *
+ *   This program is distributed in the hope that it will be useful,
+ *   but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *   GNU General Public License for more details.
+ *
+ *   You should have received a copy of the GNU General Public License
+ *   along with this program; if not, write to the Free Software
+ *   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307 =
 USA
+ *
+ *
+ * Changelog:
+ *      06/18/04 - Matt Domsch <Matt_Domsch@dell.com>
+ *                 Use Linux kernel 2.6 arc4 and sha1 routines rather than
+ *                 providing our own.
+ *      2/15/04 - TS: added #include <version.h> and testing for Kernel
+ *                    version before using=20
+ *                    MOD_DEC_USAGE_COUNT/MOD_INC_USAGE_COUNT which are
+ *                    deprecated in 2.6
+ */
+
+#include <linux/config.h>
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/version.h>
+#include <linux/init.h>
+#include <linux/types.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/crypto.h>
+#include <linux/mm.h>
+#include <linux/ppp_defs.h>
+#include <linux/ppp-comp.h>
+#include <asm/scatterlist.h>
+
+#include "ppp_mppe.h"
+
+MODULE_AUTHOR("Frank Cusack <frank@google.com>");
+MODULE_DESCRIPTION("Point-to-Point Protocol Microsoft Point-to-Point Encry=
ption support");
+MODULE_LICENSE("Dual BSD/GPL");
+MODULE_ALIAS("ppp-compress-" __stringify(CI_MPPE));
+MODULE_VERSION("1.0.0");
+
+static void
+setup_sg(struct scatterlist *sg, const void *address, unsigned int length)
+{
+	sg[0].page =3D virt_to_page(address);
+	sg[0].offset =3D offset_in_page(address);
+
+	if (sg[0].offset + length <=3D PAGE_SIZE) {
+		sg[0].length =3D length;
+		sg[1].page =3D 0;
+		sg[1].offset =3D 0;
+		sg[1].length =3D 0;
+	} else {
+		sg[0].length =3D PAGE_SIZE - sg[0].offset;
+		sg[1].length =3D length - sg[0].length;
+		sg[1].page =3D virt_to_page(address + sg[0].length);
+		sg[1].offset =3D offset_in_page(address + sg[0].length);	/* 0 */
+	}
+}
+
+/*
+ * State for an MPPE (de)compressor.
+ */
+struct ppp_mppe_state {
+	struct crypto_tfm *arc4;
+	struct crypto_tfm *sha1;
+	unsigned char *sha1_digest;
+	unsigned char master_key[MPPE_MAX_KEY_LEN];
+	unsigned char session_key[MPPE_MAX_KEY_LEN];
+	unsigned keylen;	/* key length in bytes             */
+	/* NB: 128-bit =3D 16, 40-bit =3D 8! */
+	/* If we want to support 56-bit,   */
+	/* the unit has to change to bits  */
+	unsigned char bits;	/* MPPE control bits */
+	unsigned ccount;	/* 12-bit coherency count (seqno)  */
+	unsigned stateful;	/* stateful mode flag */
+	int discard;		/* stateful mode packet loss flag */
+	int sanity_errors;	/* take down LCP if too many */
+	int unit;
+	int debug;
+	struct compstat stats;
+};
+
+/* struct ppp_mppe_state.bits definitions */
+#define MPPE_BIT_A	0x80	/* Encryption table were (re)inititalized */
+#define MPPE_BIT_B	0x40	/* MPPC only (not implemented) */
+#define MPPE_BIT_C	0x20	/* MPPC only (not implemented) */
+#define MPPE_BIT_D	0x10	/* This is an encrypted frame */
+
+#define MPPE_BIT_FLUSHED	MPPE_BIT_A
+#define MPPE_BIT_ENCRYPTED	MPPE_BIT_D
+
+#define MPPE_BITS(p) ((p)[4] & 0xf0)
+#define MPPE_CCOUNT(p) ((((p)[4] & 0x0f) << 8) + (p)[5])
+#define MPPE_CCOUNT_SPACE 0x1000	/* The size of the ccount space */
+
+#define MPPE_OVHD	2	/* MPPE overhead/packet */
+#define SANITY_MAX	1600	/* Max bogon factor we will tolerate */
+
+#define SHA1_PAD_SIZE 40
+/*
+ * Key Derivation, from RFC 3078, RFC 3079.
+ * Equivalent to Get_Key() for MS-CHAP as described in RFC 3079.
+ */
+static void get_new_key_from_sha(struct ppp_mppe_state * state, unsigned c=
har *InterimKey)
+{
+	static const unsigned char SHApad1[SHA1_PAD_SIZE] +	    { 0x00, 0x00, 0x0=
0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
+	};
+	static const unsigned char SHApad2[SHA1_PAD_SIZE] +	    { 0xf2, 0xf2, 0xf=
2, 0xf2, 0xf2, 0xf2, 0xf2, 0xf2, 0xf2, 0xf2,
+		0xf2, 0xf2, 0xf2, 0xf2, 0xf2, 0xf2, 0xf2, 0xf2, 0xf2, 0xf2,
+		0xf2, 0xf2, 0xf2, 0xf2, 0xf2, 0xf2, 0xf2, 0xf2, 0xf2, 0xf2,
+		0xf2, 0xf2, 0xf2, 0xf2, 0xf2, 0xf2, 0xf2, 0xf2, 0xf2, 0xf2
+	};
+	struct scatterlist sg[2];
+
+	crypto_digest_init(state->sha1);
+	setup_sg(sg, state->master_key, state->keylen);
+	crypto_digest_update(state->sha1, sg, state->keylen);
+	setup_sg(sg, SHApad1, sizeof(SHApad1));
+	crypto_digest_update(state->sha1, sg, sizeof(SHApad1));
+	setup_sg(sg, state->session_key, state->keylen);
+	crypto_digest_update(state->sha1, sg, state->keylen);
+	setup_sg(sg, SHApad2, sizeof(SHApad2));
+	crypto_digest_update(state->sha1, sg, sizeof(SHApad2));
+	crypto_digest_final(state->sha1, state->sha1_digest);
+	memcpy(InterimKey, state->sha1_digest, state->keylen);
+}
+
+/*
+ * Perform the MPPE rekey algorithm, from RFC 3078, sec. 7.3.
+ * Well, not what's written there, but rather what they meant.
+ */
+static void mppe_rekey(struct ppp_mppe_state * state, int initial_key)
+{
+	unsigned char InterimKey[MPPE_MAX_KEY_LEN];
+	struct scatterlist sg_in[2], sg_out[2];
+
+	get_new_key_from_sha(state, InterimKey);
+	if (!initial_key) {
+		crypto_cipher_setkey(state->arc4, InterimKey, state->keylen);
+		setup_sg(sg_in, InterimKey, state->keylen);
+		setup_sg(sg_out, state->session_key, state->keylen);
+		crypto_cipher_encrypt(state->arc4, sg_out, sg_in,
+				      state->keylen);
+	} else {
+		memcpy(state->session_key, InterimKey, state->keylen);
+	}
+	if (state->keylen =3D 8) {
+		/* See RFC 3078 */
+		state->session_key[0] =3D 0xd1;
+		state->session_key[1] =3D 0x26;
+		state->session_key[2] =3D 0x9e;
+	}
+	crypto_cipher_setkey(state->arc4, state->session_key, state->keylen);
+}
+
+/*
+ * Allocate space for a (de)compressor.
+ */
+static void *mppe_alloc(unsigned char *options, int optlen)
+{
+	struct ppp_mppe_state *state;
+	unsigned int digestsize;
+
+	if (optlen !=3D CILEN_MPPE + sizeof(state->master_key)
+	    || options[0] !=3D CI_MPPE || options[1] !=3D CILEN_MPPE)
+		goto out;
+
+	state =3D (struct ppp_mppe_state *) kmalloc(sizeof(*state), GFP_KERNEL);
+	if (state =3D NULL)
+		goto out;
+
+	memset(state, 0, sizeof(*state));
+
+	state->arc4 =3D crypto_alloc_tfm("arc4", 0);
+	if (!state->arc4)
+		goto out_free;
+	state->sha1 =3D crypto_alloc_tfm("sha1", 0);
+	if (!state->sha1)
+		goto out_arc4;
+	digestsize =3D crypto_tfm_alg_digestsize(state->sha1);
+	if (digestsize < MPPE_MAX_KEY_LEN)
+		goto out_sha1;
+	state->sha1_digest =3D kmalloc(digestsize, GFP_KERNEL);
+	if (!state->sha1_digest)
+		goto out_sha1;
+
+	/* Save keys. */
+	memcpy(state->master_key, &options[CILEN_MPPE],
+	       sizeof(state->master_key));
+	memcpy(state->session_key, state->master_key,
+	       sizeof(state->master_key));
+	/*
+	 * We defer initial key generation until mppe_init(), as mppe_alloc()
+	 * is called frequently during negotiation.
+	 */
+
+	return (void *)state;
+
+      out_sha1:
+	crypto_free_tfm(state->sha1);
+      out_arc4:
+	crypto_free_tfm(state->arc4);
+      out_free:
+	kfree(state);
+      out:
+	return NULL;
+}
+
+/*
+ * Deallocate space for a (de)compressor.
+ */
+static void mppe_free(void *arg)
+{
+	struct ppp_mppe_state *state =3D (struct ppp_mppe_state *) arg;
+
+	if (state) {
+		if (state->arc4)
+			crypto_free_tfm(state->arc4);
+		if (state->sha1)
+			crypto_free_tfm(state->sha1);
+		if (state->sha1_digest)
+			kfree(state->sha1_digest);
+		kfree(state);
+	}
+}
+
+/*=20
+ * Initialize (de)compressor state.
+ */
+static int
+mppe_init(void *arg, unsigned char *options, int optlen, int unit, int deb=
ug,
+	  const char *debugstr)
+{
+	struct ppp_mppe_state *state =3D (struct ppp_mppe_state *) arg;
+	unsigned char mppe_opts;
+
+	if (optlen !=3D CILEN_MPPE
+	    || options[0] !=3D CI_MPPE || options[1] !=3D CILEN_MPPE)
+		return 0;
+
+	MPPE_CI_TO_OPTS(&options[2], mppe_opts);
+	if (mppe_opts & MPPE_OPT_128)
+		state->keylen =3D 16;
+	else if (mppe_opts & MPPE_OPT_40)
+		state->keylen =3D 8;
+	else {
+		printk(KERN_WARNING "%s[%d]: unknown key length\n", debugstr,
+		       unit);
+		return 0;
+	}
+	if (mppe_opts & MPPE_OPT_STATEFUL)
+		state->stateful =3D 1;
+
+	/* Generate the initial session key. */
+	mppe_rekey(state, 1);
+
+	if (debug) {
+		int i;
+		char mkey[sizeof(state->master_key) * 2 + 1];
+		char skey[sizeof(state->session_key) * 2 + 1];
+
+		printk(KERN_DEBUG "%s[%d]: initialized with %d-bit %s mode\n",
+		       debugstr, unit, (state->keylen =3D 16) ? 128 : 40,
+		       (state->stateful) ? "stateful" : "stateless");
+
+		for (i =3D 0; i < sizeof(state->master_key); i++)
+			sprintf(mkey + i * 2, "%.2x", state->master_key[i]);
+		for (i =3D 0; i < sizeof(state->session_key); i++)
+			sprintf(skey + i * 2, "%.2x", state->session_key[i]);
+		printk(KERN_DEBUG
+		       "%s[%d]: keys: master: %s initial session: %s\n",
+		       debugstr, unit, mkey, skey);
+	}
+
+	/*
+	 * Initialize the coherency count.  The initial value is not specified
+	 * in RFC 3078, but we can make a reasonable assumption that it will
+	 * start at 0.  Setting it to the max here makes the comp/decomp code
+	 * do the right thing (determined through experiment).
+	 */
+	state->ccount =3D MPPE_CCOUNT_SPACE - 1;
+
+	/*
+	 * Note that even though we have initialized the key table, we don't
+	 * set the FLUSHED bit.  This is contrary to RFC 3078, sec. 3.1.
+	 */
+	state->bits =3D MPPE_BIT_ENCRYPTED;
+
+	state->unit =3D unit;
+	state->debug =3D debug;
+
+	return 1;
+}
+
+static int
+mppe_comp_init(void *arg, unsigned char *options, int optlen, int unit,
+	       int hdrlen, int debug)
+{
+	/* ARGSUSED */
+	return mppe_init(arg, options, optlen, unit, debug, "mppe_comp_init");
+}
+
+/*
+ * We received a CCP Reset-Request (actually, we are sending a Reset-Ack),
+ * tell the compressor to rekey.  Note that we MUST NOT rekey for
+ * every CCP Reset-Request; we only rekey on the next xmit packet.
+ * We might get multiple CCP Reset-Requests if our CCP Reset-Ack is lost.
+ * So, rekeying for every CCP Reset-Request is broken as the peer will not
+ * know how many times we've rekeyed.  (If we rekey and THEN get another
+ * CCP Reset-Request, we must rekey again.)
+ */
+static void mppe_comp_reset(void *arg)
+{
+	struct ppp_mppe_state *state =3D (struct ppp_mppe_state *) arg;
+
+	state->bits |=3D MPPE_BIT_FLUSHED;
+}
+
+/*
+ * Compress (encrypt) a packet.
+ * It's strange to call this a compressor, since the output is always
+ * MPPE_OVHD + 2 bytes larger than the input.
+ */
+static int
+mppe_compress(void *arg, unsigned char *ibuf, unsigned char *obuf,
+	      int isize, int osize)
+{
+	struct ppp_mppe_state *state =3D (struct ppp_mppe_state *) arg;
+	int proto;
+	struct scatterlist sg_in[2], sg_out[2];
+
+	/*
+	 * Check that the protocol is in the range we handle.
+	 */
+	proto =3D PPP_PROTOCOL(ibuf);
+	if (proto < 0x0021 || proto > 0x00fa)
+		return 0;
+
+	/* Make sure we have enough room to generate an encrypted packet. */
+	if (osize < isize + MPPE_OVHD + 2) {
+		/* Drop the packet if we should encrypt it, but can't. */
+		printk(KERN_DEBUG "mppe_compress[%d]: osize too small! "
+		       "(have: %d need: %d)\n", state->unit,
+		       osize, osize + MPPE_OVHD + 2);
+		return -1;
+	}
+
+	osize =3D isize + MPPE_OVHD + 2;
+
+	/*
+	 * Copy over the PPP header and set control bits.
+	 */
+	obuf[0] =3D PPP_ADDRESS(ibuf);
+	obuf[1] =3D PPP_CONTROL(ibuf);
+	obuf[2] =3D PPP_COMP >> 8;	/* isize + MPPE_OVHD + 1 */
+	obuf[3] =3D PPP_COMP;	/* isize + MPPE_OVHD + 2 */
+	obuf +=3D PPP_HDRLEN;
+
+	state->ccount =3D (state->ccount + 1) % MPPE_CCOUNT_SPACE;
+	if (state->debug >=3D 7)
+		printk(KERN_DEBUG "mppe_compress[%d]: ccount %d\n", state->unit,
+		       state->ccount);
+	obuf[0] =3D state->ccount >> 8;
+	obuf[1] =3D state->ccount & 0xff;
+
+	if (!state->stateful ||	/* stateless mode     */
+	    ((state->ccount & 0xff) =3D 0xff) ||	/* "flag" packet      */
+	    (state->bits & MPPE_BIT_FLUSHED)) {	/* CCP Reset-Request  */
+		/* We must rekey */
+		if (state->debug && state->stateful)
+			printk(KERN_DEBUG "mppe_compress[%d]: rekeying\n",
+			       state->unit);
+		mppe_rekey(state, 0);
+		state->bits |=3D MPPE_BIT_FLUSHED;
+	}
+	obuf[0] |=3D state->bits;
+	state->bits &=3D ~MPPE_BIT_FLUSHED;	/* reset for next xmit */
+
+	obuf +=3D MPPE_OVHD;
+	ibuf +=3D 2;		/* skip to proto field */
+	isize -=3D 2;
+
+	/* Encrypt packet */
+	setup_sg(sg_in, ibuf, isize);
+	setup_sg(sg_out, obuf, osize);
+	crypto_cipher_encrypt(state->arc4, sg_out, sg_in, isize);
+
+	state->stats.unc_bytes +=3D isize;
+	state->stats.unc_packets++;
+	state->stats.comp_bytes +=3D osize;
+	state->stats.comp_packets++;
+
+	return osize;
+}
+
+/*
+ * Since every frame grows by MPPE_OVHD + 2 bytes, this is always going
+ * to look bad ... and the longer the link is up the worse it will get.
+ */
+static void mppe_comp_stats(void *arg, struct compstat *stats)
+{
+	struct ppp_mppe_state *state =3D (struct ppp_mppe_state *) arg;
+
+	*stats =3D state->stats;
+}
+
+static int
+mppe_decomp_init(void *arg, unsigned char *options, int optlen, int unit,
+		 int hdrlen, int mru, int debug)
+{
+	/* ARGSUSED */
+	return mppe_init(arg, options, optlen, unit, debug, "mppe_decomp_init");
+}
+
+/*
+ * We received a CCP Reset-Ack.  Just ignore it.
+ */
+static void mppe_decomp_reset(void *arg)
+{
+	/* ARGSUSED */
+	return;
+}
+
+/*
+ * Decompress (decrypt) an MPPE packet.
+ */
+static int
+mppe_decompress(void *arg, unsigned char *ibuf, int isize, unsigned char *=
obuf,
+		int osize)
+{
+	struct ppp_mppe_state *state =3D (struct ppp_mppe_state *) arg;
+	unsigned ccount;
+	int flushed =3D MPPE_BITS(ibuf) & MPPE_BIT_FLUSHED;
+	int sanity =3D 0;
+	struct scatterlist sg_in[2], sg_out[2];
+
+	if (isize <=3D PPP_HDRLEN + MPPE_OVHD) {
+		if (state->debug)
+			printk(KERN_DEBUG
+			       "mppe_decompress[%d]: short pkt (%d)\n",
+			       state->unit, isize);
+		return DECOMP_ERROR;
+	}
+
+	/*
+	 * Make sure we have enough room to decrypt the packet.
+	 * Note that for our test we only subtract 1 byte whereas in
+	 * mppe_compress() we added 2 bytes (+MPPE_OVHD);
+	 * this is to account for possible PFC.
+	 */
+	if (osize < isize - MPPE_OVHD - 1) {
+		printk(KERN_DEBUG "mppe_decompress[%d]: osize too small! "
+		       "(have: %d need: %d)\n", state->unit,
+		       osize, isize - MPPE_OVHD - 1);
+		return DECOMP_ERROR;
+	}
+	osize =3D isize - MPPE_OVHD - 2;	/* assume no PFC */
+
+	ccount =3D MPPE_CCOUNT(ibuf);
+	if (state->debug >=3D 7)
+		printk(KERN_DEBUG "mppe_decompress[%d]: ccount %d\n",
+		       state->unit, ccount);
+
+	/* sanity checks -- terminate with extreme prejudice */
+	if (!(MPPE_BITS(ibuf) & MPPE_BIT_ENCRYPTED)) {
+		printk(KERN_DEBUG
+		       "mppe_decompress[%d]: ENCRYPTED bit not set!\n",
+		       state->unit);
+		state->sanity_errors +=3D 100;
+		sanity =3D 1;
+	}
+	if (!state->stateful && !flushed) {
+		printk(KERN_DEBUG "mppe_decompress[%d]: FLUSHED bit not set in "
+		       "stateless mode!\n", state->unit);
+		state->sanity_errors +=3D 100;
+		sanity =3D 1;
+	}
+	if (state->stateful && ((ccount & 0xff) =3D 0xff) && !flushed) {
+		printk(KERN_DEBUG "mppe_decompress[%d]: FLUSHED bit not set on "
+		       "flag packet!\n", state->unit);
+		state->sanity_errors +=3D 100;
+		sanity =3D 1;
+	}
+
+	if (sanity) {
+		if (state->sanity_errors < SANITY_MAX)
+			return DECOMP_ERROR;
+		else
+			/*
+			 * Take LCP down if the peer is sending too many bogons.
+			 * We don't want to do this for a single or just a few
+			 * instances since it could just be due to packet corruption.
+			 */
+			return DECOMP_FATALERROR;
+	}
+
+	/*
+	 * Check the coherency count.
+	 */
+
+	if (!state->stateful) {
+		/* RFC 3078, sec 8.1.  Rekey for every packet. */
+		while (state->ccount !=3D ccount) {
+			mppe_rekey(state, 0);
+			state->ccount =3D (state->ccount + 1) % MPPE_CCOUNT_SPACE;
+		}
+	} else {
+		/* RFC 3078, sec 8.2. */
+		if (!state->discard) {
+			/* normal state */
+			state->ccount =3D (state->ccount + 1) % MPPE_CCOUNT_SPACE;
+			if (ccount !=3D state->ccount) {
+				/*
+				 * (ccount > state->ccount)
+				 * Packet loss detected, enter the discard state.
+				 * Signal the peer to rekey (by sending a CCP Reset-Request).
+				 */
+				state->discard =3D 1;
+				return DECOMP_ERROR;
+			}
+		} else {
+			/* discard state */
+			if (!flushed) {
+				/* ccp.c will be silent (no additional CCP Reset-Requests). */
+				return DECOMP_ERROR;
+			} else {
+				/* Rekey for every missed "flag" packet. */
+				while ((ccount & ~0xff) !+				       (state->ccount & ~0xff)) {
+					mppe_rekey(state, 0);
+					state->ccount +					    (state->ccount +
+					     256) % MPPE_CCOUNT_SPACE;
+				}
+
+				/* reset */
+				state->discard =3D 0;
+				state->ccount =3D ccount;
+				/*
+				 * Another problem with RFC 3078 here.  It implies that the
+				 * peer need not send a Reset-Ack packet.  But RFC 1962
+				 * requires it.  Hopefully, M$ does send a Reset-Ack; even
+				 * though it isn't required for MPPE synchronization, it is
+				 * required to reset CCP state.
+				 */
+			}
+		}
+		if (flushed)
+			mppe_rekey(state, 0);
+	}
+
+	/*
+	 * Fill in the first part of the PPP header.  The protocol field
+	 * comes from the decrypted data.
+	 */
+	obuf[0] =3D PPP_ADDRESS(ibuf);	/* +1 */
+	obuf[1] =3D PPP_CONTROL(ibuf);	/* +1 */
+	obuf +=3D 2;
+	ibuf +=3D PPP_HDRLEN + MPPE_OVHD;
+	isize -=3D PPP_HDRLEN + MPPE_OVHD;	/* -6 */
+	/* net osize: isize-4 */
+
+	/*
+	 * Decrypt the first byte in order to check if it is
+	 * a compressed or uncompressed protocol field.
+	 */
+	setup_sg(sg_in, ibuf, 1);
+	setup_sg(sg_out, obuf, 1);
+	crypto_cipher_decrypt(state->arc4, sg_out, sg_in, 1);
+
+	/*
+	 * Do PFC decompression.
+	 * This would be nicer if we were given the actual sk_buff
+	 * instead of a char *.
+	 */
+	if ((obuf[0] & 0x01) !=3D 0) {
+		obuf[1] =3D obuf[0];
+		obuf[0] =3D 0;
+		obuf++;
+		osize++;
+	}
+
+	/* And finally, decrypt the rest of the packet. */
+	setup_sg(sg_in, ibuf + 1, isize - 1);
+	setup_sg(sg_out, obuf + 1, osize - 1);
+	crypto_cipher_decrypt(state->arc4, sg_out, sg_in, isize - 1);
+
+	state->stats.unc_bytes +=3D osize;
+	state->stats.unc_packets++;
+	state->stats.comp_bytes +=3D isize;
+	state->stats.comp_packets++;
+
+	/* good packet credit */
+	state->sanity_errors >>=3D 1;
+
+	return osize;
+}
+
+/*
+ * Incompressible data has arrived (this should never happen!).
+ * We should probably drop the link if the protocol is in the range
+ * of what should be encrypted.  At the least, we should drop this
+ * packet.  (How to do this?)
+ */
+static void mppe_incomp(void *arg, unsigned char *ibuf, int icnt)
+{
+	struct ppp_mppe_state *state =3D (struct ppp_mppe_state *) arg;
+
+	if (state->debug &&
+	    (PPP_PROTOCOL(ibuf) >=3D 0x0021 && PPP_PROTOCOL(ibuf) <=3D 0x00fa))
+		printk(KERN_DEBUG
+		       "mppe_incomp[%d]: incompressible (unencrypted) data! "
+		       "(proto %04x)\n", state->unit, PPP_PROTOCOL(ibuf));
+
+	state->stats.inc_bytes +=3D icnt;
+	state->stats.inc_packets++;
+	state->stats.unc_bytes +=3D icnt;
+	state->stats.unc_packets++;
+}
+
+/*************************************************************
+ * Module interface table
+ *************************************************************/
+
+/*
+ * Procedures exported to if_ppp.c.
+ */
+static struct compressor ppp_mppe =3D {
+	.compress_proto =3D CI_MPPE,
+	.comp_alloc     =3D mppe_alloc,
+	.comp_free      =3D mppe_free,
+	.comp_init      =3D mppe_comp_init,
+	.comp_reset     =3D mppe_comp_reset,
+	.compress       =3D mppe_compress,
+	.comp_stat      =3D mppe_comp_stats,
+	.decomp_alloc   =3D mppe_alloc,
+	.decomp_free    =3D mppe_free,
+	.decomp_init    =3D mppe_decomp_init,
+	.decomp_reset   =3D mppe_decomp_reset,
+	.decompress     =3D mppe_decompress,
+	.incomp         =3D mppe_incomp,
+	.decomp_stat    =3D mppe_comp_stats,
+	.owner          =3D THIS_MODULE,
+	.comp_skb_extra_space =3D MPPE_COMPRESS_PAD,
+	.decomp_skb_extra_space =3D MPPE_DECOMPRESS_PAD,
+	.must_compress  =3D 1,
+};
+
+/*
+ * ppp_mppe_init()
+ *
+ * Prior to allowing load, try to load the arc4 and sha1 crypto
+ * libraries.  The actual use will be allocated later, but
+ * this way the module will fail to insmod if they aren't available.
+ */
+
+static int __init ppp_mppe_init(void)
+{
+	if (!(crypto_alg_available("arc4", 0) &&
+	      crypto_alg_available("sha1", 0)))
+		return -ENODEV;
+
+	int answer =3D ppp_register_compressor(&ppp_mppe);
+
+	if (answer =3D 0)
+		printk(KERN_INFO "PPP MPPE Compression module registered\n");
+	return answer;
+}
+
+static void __exit ppp_mppe_cleanup(void)
+{
+	ppp_unregister_compressor(&ppp_mppe);
+}
+
+module_init(ppp_mppe_init);
+module_exit(ppp_mppe_cleanup);
diff -Nru a/drivers/net/ppp_mppe.h b/drivers/net/ppp_mppe.h
--- /dev/null	Wed Dec 31 16:00:00 196900
+++ b/drivers/net/ppp_mppe.h	2004-07-20 16:37:04 -04:00
@@ -0,0 +1,87 @@
+#define MPPE_COMPRESS_PAD       8       /* MPPE growth per frame */
+#define MPPE_DECOMPRESS_PAD   128
+#define MPPE_MAX_KEY_LEN       16      /* largest key length (128-bit) */
+
+/* option bits for ccp_options.mppe */
+#define MPPE_OPT_40            0x01    /* 40 bit */
+#define MPPE_OPT_128           0x02    /* 128 bit */
+#define MPPE_OPT_STATEFUL      0x04    /* stateful mode */
+/* unsupported opts */
+#define MPPE_OPT_56            0x08    /* 56 bit */
+#define MPPE_OPT_MPPC          0x10    /* MPPC compression */
+#define MPPE_OPT_D             0x20    /* Unknown */
+#define MPPE_OPT_UNSUPPORTED (MPPE_OPT_56|MPPE_OPT_MPPC|MPPE_OPT_D)
+#define MPPE_OPT_UNKNOWN       0x40    /* Bits !defined in RFC 3078 were s=
et */
+
+/*
+ * This is not nice ... the alternative is a bitfield struct though.
+ * And unfortunately, we cannot share the same bits for the option
+ * names above since C and H are the same bit.  We could do a u_int32
+ * but then we have to do a htonl() all the time and/or we still need
+ * to know which octet is which.
+ */
+#define MPPE_C_BIT             0x01    /* MPPC */
+#define MPPE_D_BIT             0x10    /* Obsolete, usage unknown */
+#define MPPE_L_BIT             0x20    /* 40-bit */
+#define MPPE_S_BIT             0x40    /* 128-bit */
+#define MPPE_M_BIT             0x80    /* 56-bit, not supported */
+#define MPPE_H_BIT             0x01    /* Stateless (in a different byte) =
*/
+
+/* Does not include H bit; used for least significant octet only. */
+#define MPPE_ALL_BITS (MPPE_D_BIT|MPPE_L_BIT|MPPE_S_BIT|MPPE_M_BIT|MPPE_H_=
BIT)
+
+/* Build a CI from mppe opts (see RFC 3078) */
+#define MPPE_OPTS_TO_CI(opts, ci)              \
+    do {                                       \
+       u_char *ptr =3D ci; /* u_char[4] */       \
+                                               \
+       /* H bit */                             \
+       if (opts & MPPE_OPT_STATEFUL)           \
+           *ptr++ =3D 0x0;                       \
+       else                                    \
+           *ptr++ =3D MPPE_H_BIT;                \
+       *ptr++ =3D 0;                             \
+       *ptr++ =3D 0;                             \
+                                               \
+       /* S,L bits */                          \
+       *ptr =3D 0;                               \
+       if (opts & MPPE_OPT_128)                \
+           *ptr |=3D MPPE_S_BIT;                 \
+       if (opts & MPPE_OPT_40)                 \
+           *ptr |=3D MPPE_L_BIT;                 \
+       /* M,D,C bits not supported */          \
+    } while (/* CONSTCOND */ 0)
+
+/* The reverse of the above */
+#define MPPE_CI_TO_OPTS(ci, opts)              \
+    do {                                       \
+       u_char *ptr =3D ci; /* u_char[4] */       \
+                                               \
+       opts =3D 0;                               \
+                                               \
+       /* H bit */                             \
+       if (!(ptr[0] & MPPE_H_BIT))             \
+           opts |=3D MPPE_OPT_STATEFUL;          \
+                                               \
+       /* S,L bits */                          \
+       if (ptr[3] & MPPE_S_BIT)                \
+           opts |=3D MPPE_OPT_128;               \
+       if (ptr[3] & MPPE_L_BIT)                \
+           opts |=3D MPPE_OPT_40;                \
+                                               \
+       /* M,D,C bits */                        \
+       if (ptr[3] & MPPE_M_BIT)                \
+           opts |=3D MPPE_OPT_56;                \
+       if (ptr[3] & MPPE_D_BIT)                \
+           opts |=3D MPPE_OPT_D;                 \
+       if (ptr[3] & MPPE_C_BIT)                \
+           opts |=3D MPPE_OPT_MPPC;              \
+                                               \
+       /* Other bits */                        \
+       if (ptr[0] & ~MPPE_H_BIT)               \
+           opts |=3D MPPE_OPT_UNKNOWN;           \
+       if (ptr[1] || ptr[2])                   \
+           opts |=3D MPPE_OPT_UNKNOWN;           \
+       if (ptr[3] & ~MPPE_ALL_BITS)            \
+           opts |=3D MPPE_OPT_UNKNOWN;           \
+    } while (/* CONSTCOND */ 0)

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D

This BitKeeper patch contains the following changesets:
1.1850
## Wrapped with gzip_uu ##


M'XL( '""_4   ]1;;7?:2++^#+^BXSG)0,R+)/!+[#AW",8)&P=3DS ,]L;N+#
MD:4&=3D"TD1A)QO.OL;[]5U2VIA8039S(?UI-)0.JNKJ[7I[K+O[#+D =3D'I?=3DF
M%$U/_65H+<J_L+=3D^&!V5;.ZZ#<M?PH.1[\.#YM*F$4;S^J:Y7*UXTW6\]9>Z
MT=3D@KPZ"A&5D+]ID'X5%);[22)]'=BA^51KTWE^>=3D4;E\<L*Z"].;\S&/V,E)
M.?*#SZ9KA[^9T<+UO484F%ZXY)&):]\G0^\-33/@OSW]H*7M[=3D_K^UK[X-[2
M;5TWVSJW-:-]N-\N*QOY+=3DY EDA;.T ZQH&FW6M[K8-6^93I#?UP3V-:NZDM- V-Z?M'QHNC=
O59=3D:Q]I&BLBRG;;K*Z57[.?RW^W;+'A<'C$.K;-[,!!<38]
M'C57J]449=3DZP:L#/#9\Y+F>F9[-WEN_-G#GC7A0X/(3Y\.>]8P5^Z,\B-O0M+ZI'?IT^L,G:=
\V 'CC=3DGP\"/?,MW6;A>K?P@@FGKR'&=3D?_&0X6IS[O' L6B1
M&Q[ -&8%=3DZO(9X$/ ST>-LKOF/'B0#\L#U.=3DENN/_"F7-5,KORJ4\GVQ"%0]
MOFCMW6NMO8/#^T.[S?7]_5;;T*P7MGWPXQ3W[XU]> !,/:Q=E5:L%$71;0UL
M3-?VC,-[WFYSS3S0]=3DD+S7YQ</AMWE1Z*6?M^];^07O_4>):;&ZN91A[QGVK
MI>]=3DVR_V#RVK;5JZ]>,4#^[;[?8>BNM?#KQV?Q-Q8;E_>-/P@_G'6(A7&6K2
M<$E>NM8"@BVCU;K7#P\.C/L#?KAW;>QS;EC[QMX6']Q&3A57NPVV05&G6/$8
M@@;\EJ&HC[:,*<\89^WR[_!_<8#Y*U9*X2<7>UI[#\8>[>^(/19[[43O.%_Q
M@,3!'@CXS2V2>L=3DPDQ /MKP?L=3DS^_\FT+X>&_@-QXV]2AOY(91QH^W]/*CAC
M.D98"D47K![<TA_8^5;Q/EZ&?8T!_^7F\S)[SF)*4^!W%? P!/^H,\@;/)B9
M%F?OA\,>[))%"XY9BEF^S1LX<;)P0DK]CN\Q^#CS [8..;MUH@4[1Z.)4XC1
M,!KZB]T:?&A#UMVE]&(T]AO&+E)"8J_OV!E([H9UUZ%IW;"7,_SVV]SWYRY'
M4;ZB-;O^ZBYPYHN(5:PJ0YG6X*\6_M5F;VAPC?4]BP9W7)?1X)#!OGCPF=3DOQ
M<N>.Q;V0'^'G(0^63DB[@&W"#FJPQ]5=C2U]VYG!O\BM[820:J_7$0=3D!P&8Q
MS]Z:@4C'3A0B(=3DNWUDM(R68D);+@ ;^^8W/82L3M&EL%_F?'YC:0,",2J'GM
M?^:T'#&*5#P_ N:8"2HQ@Q 4P4S8!PR!1-]@0NK)ZO Y(8IRAR0-'-TA'7B/
MZP+__ OIE8%^G.7*=3D5(Q=3D,XGO=3D&@,^G_WCO_D.</J$MN'!1A9 ( L)&CV=3DIU
M:V( S+'7%G&^-._8-5=3D$9;.U9T-@P9V".2V!A1E]>3.X9&\0:I@N&ZZO74 <
M4B.L\F9X7JTA.5CG=3DN$ F+3,D-,TX@\5E1(:GJ.DW#O6'XPGO<XINSB#%SY,
MF(.S>$+ \7:E]( ,J&1)-AMPGDCSF-WY:UC-@[TJ^G90I'83I"<,0E""IX_?
MG F+XY-P ;*YEI1PSAGR,8ZU>N8#:;*B8\9!J[!*[&=3D&O(HD60.M"C(54!GP
M'S!_A3.K: ?,-:-T\G8QJ"H#L2/]A;_BP@Y@I[<.F""H%IP#5%\31& X^Z,_
M>7MQ.6&=3DP0?V1V<TZ@PF'XX32^2H 20FS2ZQ2=3DB$H/&^-^J^A4F=3DU_WS_N0#
MFNA9?S+HC<?L[&+$.FS8&4WZ7:PBV/!R-+P8]\ 'QISL09!X0-PSTAD(U$;;
M=3D<-4 !] T2'PZ-IL88('!MSB8"\V,\D9OZU*0<:$B#\7 2]21'K,G!EZ3HWM!@Y&##^O9$$@=
U;0(6S6V]X)-.(@+@JT+X;?&QFLDT6II-?8::C0<^;[#&. G
M7:_K+>V L<MQ1^R,0B2E'->?'XDEX$?;;^J'38B0=3D<IF3&0S]K(HM;U*9BD_
M4#!N1O1]9@96F\)?N##UI#Y@@4D&"Z;C%9$2,09K$;+56[)*\<IHZGN"R\GX
MB)DV1J)?',]RUS9G+V,C7KRB12,>1D@%=3D?R.F"I:#7YBS[GF,S2%=8BSMHQ]
M?W$Z/>UUIR#0-[UI]^)R,&GBL_X@\TS&I42+N1^;0\2U3.E.("P8URQ_*J>[
M(5#5%/ 5MI1[ Z%F#8FOX(W00-&;5$*Y5X[G1$7/L4X/BUZ$KGE=3D^!SBA%?(
ML:@3"_>R+'J*N,/FL\+5X5T=3DX4CVG1DNFR%(%4(:A%#:CR+2G;12V8'GH+;+
M\]ZT<PD!:E39^0:XV*D>QS-.>^/NJ#^<]"\&E9V-2CHIG[?6VCV/Y( &)TML
MA?1YO]L;C'N5G=3D,U!)37X],FY"_E?>>\WQE7=3DN+=3D8]*N[[#I5 @M^EVY\B
M'JNF<W[OC<;$*A04#0V)?2J'"$$L]MEW['+(H_5J&LXK0 3R-%,$R)Z'<\0Z
M'GS$L>PY^!PN6H/4%CISD>PCYG)O'BVJY7^72^'\HW;56)ESSD[89R>(II$_
MQ:\5.176EX/\V2S$TQXF/DP=3D;W/@IW()XF0E,WQ7KL9>GD#L!X<;]_^W5V6P
MM"0K7Y_(<<?BA9XPI:5/$@Z49\ET?/:5<1<B6P'Q9&D(1BI_!83DAWC<%K:*
M9 6;5>=3D4"S@OEEUN8JGYG&D88DI?RU]!K@+9C\$,1!($2$,POF+S:FQ9?M"@
MJ"3M(BD#0IJ%NA8OA%]/H]D2[ -"_G'A&\P!\":Q&VMA!N+IU';F$*MS+Y=3DF
M"'8XO>%W'Y&WZ?O./Z?O>A^FY[W!56YPR F@?WLT# "AD$#@8ZP<",+7=3DY Q
M,D$:Q07#!J^/F&X<UJ\=3D/)J$ZJ_&VEK\[?!)/*P_8[=3D0VP!ZP70N?9OM[>/(
M6DH-\_P:@BW BA '6I2-\1.,"\6P[-;P.?%+&@)OC ((,#0Z.]@"K!#12-T@
M_BP?"PS/NF/T"CR)_^GYU8U%2)^ VFAF_ 6A+)B&:\YI,'HY8$#+#.SC4G[<
M"H(FF*/K@^EEYH0F;/5NRH/ #\0F(O,&X!:D=3D7;>'2(,BGP?5 U0-)Z#TCF6
M2_+K]5RQ)[!,7)A6#X_+7X_)E%FAA39(0I! ,+5120 +_$+?1<TZ?=3DV?3#LE
M[<NAAHPI@3DRKP%>W8+L6"7@52(0F7@(:A<2>0U$VII449?Y'I0;%8!W!&LY
M5GS<KA;.[,),XX=3DFGL),G6825H<_X,-<[ '8A 2VY!)3;$X].[\<O^V=EE(A
MY,?T!MW1A^%$'75:0&M<6559!?[ZV+YBSYCV9:95LX.Z!(C$,'6@-JNRER_9
M815B%3[>NRJ<.!T/.]T>P[UJ<K=0CX$F8@0NK)Z%*SR*R._WXO>WIR4C\1ZH
M]8(%-^VFM%A%LN/.  H,C!LE?5^L]=3D[\PJ[].5C$S+0B")/HX%CI1+X+D#_:
M6'#\MJ-/AYU3D1?:FHRR[R#,G/+ ^2QA_"SPEVQTUF4 S0]K\:<7!'-[?ZYA
M' 0E"B)O(++#[$J58O3[<1U*H2'6B#8/+2C'!'I4"335U,[F,-_CMQ@4I[CJ
M%,)MI3B<2X]6$KL(T'T\YG&6P(5([X*Z@ 39H;#[E6GK'S-2N&(GY1+&TG^C
MRJ%"^:&_(>W]=3D\Z&=3D'O\'4(S'A#:S*C]V-_$^'_C[%AH.30*D,:X(E0H@84=20
M#E.,SQ4RW_HK!!0$,1-4"PA6ODL!1?)(H &<D"6Y7D'1S56B,&5>,"VSCG2!
M&@4H?U:1WZN/H)^?6+03!>W\K5LQ-C@R?G0K11,A9IKNQKSTBQR%TY9\::WN
M*FDH*AJ8WU"*<X<\@ "ZI'Q!:2#@B/U,=3D^X'3K18YF)RR*T&.VBT*";_P?$L
M$Y/R[<*,?@WIS"82!U<!1$P\YI)G&K?RV/:.+3D P7Q$IHA+JW\K#B/\(>!A
MNJAFBK[9V)'*HQ#Q%CH0^ KX$"IHZJ^CV)VVY GB0TD QZ(<>Z*R1;61U*OE
MK$ (4[ CL3]2!U8$*I4"PU,M#QA\S&C8Q'<ZQ0:3$BEEN4P($ALPIU02E4".
MFE(82NLL8N+!?7R5Q:WZG"H*(5. 'WB*&=3DLDH>-2?A$H\K!6_6+KQ\7O=3D?'>
MV-_RWA#O7W#!TK=3D5^3W23EVOX[H^GG-)@$:UYI8J,_62Y^00)DZM;. 1<78M"O^ +[A>.:U%=
-[V)_E'+/U'(8,# ^)0<,0A*[,D)Z_;!?^@,!8MH$<-R^:,J
M\O/]O3Q+#U$--%G,5%[H5UFJ,+4T]P'<@:71\H+3$[8M(%39S5*(0G(C-E6M
ML3=3DG0W#XT:!W'KNFI'7"!I?GY[F5P%)!H;%C:TF(E@2K*3M"U\"4- =3D:'^OX
MR@Z^V('92310)J@K3O'FY#BA1T? 1?3P11$]2N0J/7FTD"HO)0>$@.1\FK[;
MA -(69GYDFU&S,Q2\JPBGV1@R5@9*;4B13S)SRU8X1.=3D"(SQ?@&,*FR0DV?C
MB8I9GL4VE5K35:TL0]1V6U52Z .^JRST?23!OTN4';'&AMPGLP*=3DJE"7D+CE
MA.+,<47>(YP&=3D@L%C.+@52(#]:L%WZERY7^NH0""2MA>X[$F\SC(S2%R#1R,
M-5<I@"P0>*PB D95.OJGLN \EO%1$M'0',GBLI:1#D?[VCZ<S%L=3DC@-@^ W^
M*P:IKX\2!M$3U8!XRLT?"8DD,%I+'L0&\V_&O0>#"A!(#UB)?4H[2DJ*/?H;
M(LG,B;WV&U+/S5%\1!5I#@INR#LYS:3[FKZP0'3PK#B%C6>$"GF@G!IE(M-<
M_5N0;\1G/*42G^B0BIQ&5'AB(CT%Z?\$+6V>B^((8"5\,'O]M0PEC5>C)<1Q
M3'\ZN9A>#"?C2A*'$$DFW,2A+WG GLDCF.%DJAN'U11_Q&"'Z8A*"$EMG=3DG6
MBB8>QO/09E<0):*;"D;@Z1^=3DT: _>,-VGH8?G]I71Z"G&P]/&]/#WD\>Y)M8
M/8CR9+1#C9*-I9N/05HA9^-)9]([NSQ7^$M.16%K<7@7U\.1:%"(@Z2,P,B5
MC/IJ84#Y64\O0(A9Z9]8%A"<)5- !+<U2H-+& !B]*MD?)@?K^0"=3D<*G#;F>
M]EY?*E)U$E<3;27LJ4TGSD]#.A!&$:>"360MG2:/>?7]*OL?/&1G1ZRM*5,K
M&X+%83OQEQT8+;ZXL EQLU4J83RM.'2!PQS(]%O% Z]W=3DRGBA+33607%"?MW
M4 XUV&S#^+)3D" _.E=3DD)P^OI HVOU3XT%(J/I=3DKY721RBA1"F*((WEM<H2J
MV+ V?/:P9I8"$=3DR(8N^KL&#*STILI5/7[,T"M1VEUOW9=3D-?4$H1%<[CBEC-S
MN"WRO*>4V5@YWW)JJ%GBM8 )A;D9^AX=3DOYMAN%[*\WBERX2H@)R"B,%#C9H]
M(KKH=3DZ*XCV)I?J'6*J(:2H:7JZ;-\1]J4",RMA@N^L6B!1(!7\->'>ICBA:!
MOYXOL#T*RSC )%6)/V)_EX?/)P4GUO4D M!2 S^2W3*RYX4HP^:INT1U)^0(
MC8,N(6HXQ/:]7R.Q;RZZPN0)/EX"Q1U?"*#P:L@,[E ,&V<9K8:^P3K=3DCIP4
M'/BK50!=3D5)W$-S+R(1D-/)67,RD6TP7.V<RP*/._EF830(I/%G:0O!6!$3,L
M!-K.Z,WX<@Q2P5U*EM(43ZLFR\1+"+,7&9SM9-G=3DR12R?V1Z@+K=3D(1MQ4$=3D]
MA&@5LG[%M*(U0+L[4ADV:87<HS864X[L6#>B;PWBE9L8I40HV$#/*1LHI@*$
MWE^.)VQP,9%'5C/1S 4V!&K.,7&,,^@.28SV17.5Q[]$[,L25"EN/>2I%EN2
MW<_!II9K-W*PI2A',L3,C(TXZ1O8!UJ;ZX>"TMBOB?7B;ILMW.&DZ\"_P:8[
MX90KCF=3DF>*$"@0))8:IF"_B?+@0C\+D0MO0K]5_! MP&\53$1:L\PO-L-GG;
M&] N3* ";D\]3IN+DU:6:^!"3IR;CM>H%N-L,@'L"(U^-MI6G>_^)'<EIQI<
M5QH'J\BS*J"B*K"/1Y$A=3DA.+ZV,LGT23F:D8%A;YGB6"-M0EJS6IP71OS3MJ
M24TNR2 9&?(.W 5N98.6!"TPK1@]QPL]X-K.]7J6]W=3D\&+LU81I129/[X\>?
M 9N1V H;<AYW&BHC=3DG?!P=3D"31MQ5W-GCA'$'I! ]Q7#/=3DGD<8&DDMH@,A]/A
MZ&)RT;TXKZ 48H0L!KRD&R)#1R@NGKRB)S,S!\#I*A+R8[@.>)(SN$<I)/#]
M):I_'L/,S#6PM!=3DQMXZ5@CS^('&#RC/J3PX>3P-_)38M;DD=3D\CC9#BF),PR<
MF, A>_\J5RA"C!DS$3A%,('W_B$>ICQA.PJ8J>#F *G8$+:XC1^J!-B5C*0=20
M&%^8C5^X'07+U_48S_CRZ*A0 AG]4YOG9]G BXWM>'', ]'1R*-,)T:L>[1K
M<22+VN^<GHYZXW&B?'JKQV^[%X/)2#$->FND;]\/V:M74.F@1HJXU=3D,56^JL
MK1.,9 +;%</?GHZ@ZE,C4X)H*MD'L%R5/<WCG./,*;: !J].V$'UNZU!+O#4
M?D#-&5X269&<LVR2P%1!9U]3A\(LJ:N>;%07X(I);PN6%**Y)6X%HGJD4D2P
MBC6,^" H[& 3S$[L/ED*:@IXELL 57!"I)#/GL+#FB)SIXF,GN94\.P9V]@;
M51_?IY$XF<M:84,)29F<+UFUJG+)L#W'854=3D*_ ^41&U.64SY+,3]I_<=3D!0!
MY6;"&BFV$<>"L74G=3DH\&*I\9LG7IQEEAQ!1!%RH3UQ;QD5RF?I*$@;@EB*7-
M(KFK*I'=3D:.K&':JX2J)$)U/:\>;URG=3D<0B6D4Q?%?\+&VK.F(EWORF!V7#!"
M<![N[FZ^)(B3S/>+YM,0A4 *].5PI9&0,(; ?:+S:![XMP#W[HH AOS%D 2'
ML+D/UD;(V =3D8Z=3D^P:]-FC49#]'%#],4N>AF(7<<C^+D6&>K6#T*>_ ;"G&^[
M<Z7-T+Y4J++95T;0(OPY4$_02D,0?2VND$1=3D^E=3DKI%*N/%H&Z[^O3E*8_KY*
M">H&@.__P- %V\)6>V>;MB3M(@A>O('L";N50&<@)*&S;'!- 70>S-K\N^&L
M EF+D6WIIR+9S1Y/@6UG[II^3^A$:<<C,%&05X[5?DS9W?P(3(P)1L3'ERIR
M4 %&[OY &EU1VE&RRLZ&Z$4* JP9@#ANH*Z6 + X$2FA-S;ETQZ"H&EO-+H8
M;1QB?1-$2W-1L&]CX_0&<PZ6P_C;)4FU':ZOH0X#4>H4X-@M'CZ96"?0[&RE
M5*7S ?K=3DE;C@JNRF4CRF*7& !)Y,"35PY94?A@X>C@W/NC'DS,/ZNA)TZXC;
M-@_)U=3D2_*?F?#\Z+F7I(8QL@/3O5( 1 IX.<>3Z*0N;^HM.X3.'U*)2Z*9@,
M3LU!4V&,"4 5^$%ZFX659,CJ=3D2:.%M&UZ=3D <L$O EUA;\O];VXYH8!7(M/*=20
M2R=3D'=3D4MJBU_P[L2 EB[B$-:'CW9NB\5U64:NA$ZZ)KXY8DXL.CIK4D.7@,J
M?2*#UN.,4CGOC-G%(EPUS2QH?[)IEC^ZAX(M5"K;P/]/W9^?W1^UU8N8]#,V
M%]_\TM-<Z,X2>:GT1E,\+_9;NI##UQAM2QC%)AAOL<V?^OVgKHA[^B+(]'
MD_Y_ZK3&2OK_J[NVYK:-*_QL_@HHDW;(6J9$BJ+ILG(BBW&EJ2QY3+MYRG!=20
M$!1ATP"'(",[5?/;>ZZ+Q947Q9T)'Q(+V+/7LV?/?N>")^I7@+BWB:@@L%ZB
MR%U$M>Y #L*_/Z)"X3I3_UXH@Q!& ?IH+- 7!4(@<D$E,?YX38"9:/5>M%RN
M%^)<\(1E:G:(K\_?GU\7G2@*$N4M(L91H6@G&*0E!=3D,[O68+-*1WBO2*0FUC
M.$_N9YB#(7,+/3A3R4/UEM[,'G')Q_U@.;T5=3D+W=3D3.ZB.EX)&9%N'6'L^O(S
M&J18O3EZ9)^HK60.TB@!MRG,B&NE)5]F"NK[MU80"UJ!/ K)QQ ,OGG(8-29
M0*B&H)BY\X2S%<AWZG#Y24P N?M\0VN@27B2GC#9IN5;#9?#7@^<VU3_I%Y:
MC)1(HJ*>MVAZ)F@[#BC@H Z'*>@E%"P#(\J; AI-[6UIKZP>$8]D6!G3*(#>
MDX)'3*7"VHET_9VEZL&9Y8F990\MI8,KY_T<I_'#@CJ?)F^<]FFWG/U8%/!0
M&9(H6\WC?JV@!XDZGV+4<[9C($ !NMYGUA6,(RB*&9 25RL)FH\-1JWTQ(>H
MH,E9$DYL&Y29=3DN?5>D75MEYTVTJ+SE<!C,4AR^)EM$!QA4:M-]^#!/;C7'5]
M,F@JN=3D@U [P=3DH?"6ZB8<P((7L/AKZ,V641C\)N$P5#;3_(2W$<XHLF%JQQT9
M]A=3DAH^Q=3D(?ELD?T:N5X0_&FPC!'>@;N&A!,E.*_8M WN3T 1U0!GMQ^SRSC)
M!5_1]HF[<K=3D!@I%?GEKP;0DDG"G&$%8"9Q5?P_H6D%52 NM]UM6 Q-"7B^K?
M6=3DU^UI&#2^9K8-V)>+[HC@,S&"TG+/!(P<7S7=82J!(;%,P+YGT)K;_3<VH,
MTX706C::PX;56GE(31:C$E)K-6R<?\!7B$0E4S=3D#MJO?D^H 4C($_7PIIA *
M#>3\(92DA4R_3OQI!-V:UE0) 39"MG(%&; O;'5E#PJ%:Z&0 TXE&99PA)3I
MZT-V]=3D8_"=3D/CFQ+]4W@<I ?L-@RMP%UK7VB7>&45-K=3D%;]&\X[&;W-S*UX#+
M17:YW=3D?#;J82YBR$*7> .0MAT@*8$V;Q+HHF1D/$;"\KVWDBK1^_?*GN7F7X
MZ)7A?KJ]HYR@^%]WN228K,XI@]C %N)9":]!E(4'#376RTL\$]PQ^L:JC8X!
MT6FED1+K@)6G\!2I:.PG9D(0=3D>?,(W/?%5NY%)-F C(6FY.C?AG=3D6SKY#R5V
M]("&O1V8YJ$F]H<ZM":V$+&\Y VR" *(%1;N;@7O_W&F-ME"J"![T>8!JXM<
M:LWKZ]#,=3DX,X( .ML#GB+\>=3D+WE,I:!K!7LE2)D$O'"59?6@:JNL-U%G-AIS
M]V-^Y'] :4RL;&+D]@1O'O,[2B*_EI'G3]:HT/A?,""?58M@.@(&:GHI'-@R
M!HA3CC(9\!UP9E/?C-3"+\ZTA_*.'=3DII.<\L#W?SFG))V:_Q@7F+0'KJK7EJ
MBK!&E"U"3P^M_CFY:BAGA]9"EHY<+;3&6$:P=3DQU+=B3R6L>2&8EE%+#>6D^M
M0CJ:LSSFGY0RXTF5TO'P'G.<](CYJbCKAPO-%]".+6JN/]Y=3D5PQ,E3DCG[
M-!XA6N>.V&E?,4:X_J!>AZ&[=3DGO%I?FZ9)=3D'.^XH&28<(X>:U""5>8\C)R1_
MT]MEP YCN";W>+V<1R[<5%?L^8=3D_L%:22K_$QS+2SX/QTEUJLCBCO7!F/KX1
M:HC"A/.#D:-'36'I>_<K>UGRUB6:J1O,:6.%,3R6X^@KNL'A+<#]%5[COFY*
MFJ/$\N*,F%G20\43@TX#QD)-U-#=3DR%1E12(9">\XQ25-C%'#<JUY]M/-[>"G
M?_.9$:+W6 QJ':P!=F7IWP7D[IM(@_I?M8^)8[;2H/*6.1^N;E[?.M_A=3D8*N
M/>K-A>ZL,G':AH^(,FI.TC&N-&4II!-T!#QESY0'AW6X7B23A6_6X::N8[7<
M Y[KU,S#>WF';=3D6S;<'KTJ2ILRV2IL[V2YJZ9:[:DJ2IW3]CTM09)DW%49:E
M]9S5WCFY"?B_9$W=937R65.K5Z/W_%LF3>6$Q-LD39WMES2U]SR3P\22]W*^
M].3_FI$$'256,X<X17.VI.I(GQI V6KWTB6L,$:IO-4UC9 S)US\K&1'=3D<EF
MU'!$4Q)[/^<40J3&\Q8C\0%HD@*4[11'YCC6#Z^QTB2\& >K0AH,\4C1M(4&
M7Y01::"-(>H(D;'*D)\6D,(SN&%PZB7$'1:K?-8?K/&TF^EZ3VJ$%V6]H 0]
M%DWK.%G&"Z,UXC0640^<=3D(MMI?X@\4E%1!]NAA_>OKU]AY:ZNM7YAU2GDK\&
MC:(Z_G5S^_.-:;BC#;_"Q3[@XG8>F1ZC&X)FJBJB,0:(*"(20NXYI&7,X:P)
MX93ZE2(^7)P_]JD2?9HA0<ZW&V+"5V"PU1J-H.(K[[DAX90S=3D)K'*F/<!H87
MR7.9>)&2W[J(O7%67#;O7)".<^EDJ4&[^=D7RP_<4UUG#2?<ZJ2-M:#?*I0-
MC1\ WV7A4KZ*PGF]X;CBH8\NZ)K<%2_%*W)6]_V)>"N1PSHG>XR\E4_.U?0G
M:SII88#&VPP;F#U#3)3;^@44ANUNQW$T]REE3XPIY-8EC'1=3D4(GA/DEDEJ49
M%M 8QM%<:%FB-P5$/272/&BTTF:#9JNXK)JBH;'PUC'GL3,)IE,TN3$@F0BS
M <+4E$-+$C]>(COT4<%E')I #@>!B& :>&A>Y+5#7XYFKD_GUS2#0]F!M"8/
MR<P^)!/VD$S#0S*<!O?JU3J8DS_4%2/')%9)0-5C*\]#/MD7AEQBZ.7%%<9Y
MQH>.%S124^1PT#/P[W^<[7X:)0U;@G&8Q0H57R_HXSSS0\S3];>C+,&V/T,=20
M]5V*2-V.0.)9BR,MBPCPAP-X^I0261SW-[5 )JI=3DQI!J(5G87$.&(.E.66<>
M2[#MSUZ'X>&U9@W<LDN;.[1AX3#LMW(,U(HZ"0\+9[6ZA<YQKH&*%JXWM(""
M^'!P>,'SE)5568+_.F*R1'_MVYOA>_@/.B7B99#V_'M"W5&[-.GJ^.3*'0U)
M<+47D-=3DE_"?:X[0FN[#*SBWL)44.ZC!DMK%8TKA13( _&H>RBBUW^B4$NXYA
MMQU(H4(P@A,S MH@U1LJ-P;8@MEUJ6CA>H\6.OF%?]0L63NP?)XJQO!FCS&<
M=3DLO'D&]AL$<+@PV"+=3DW"Q1XMH K9KR#8YF>OPRTY(>RZ#K3??K<VW$YCD-M*
MOXA 6VC]0B%S\*_V+WGA_T>T<)*,0;6_5$-[ME!U7F1A-?,UKXT?0]O_<U.U
MCW?N\K?@TX^+:!Q]V?2MJ>/6\4GGM-UY.#GIO3@E=3D*?7R<$[G4IXI_6MOHZ&
M'T8SX$V$-S/M/>)H]'&L"MC'E-T#]&D=3DMYU6+1I_?/9]'=3D;S]=3D4_1VBLHT0J
M:$E+>I5;8_U(&RSQ-_M$5LW]M/C\8Q1/YMO5" O=3D:K6Z)Z<=3D6.AVZP5__*CW
M?,>%_D;?/N*%SDPSKK:,@# ^_+17Q6)KT3W6NMWIMIUN399-VU=3DAL%H&;(Q.
M4'\;%=3D(P;OSTRG=3D*,_$7?CB)T=D7B/0IM#;SYPMLU(B0H2045TB$ZK=3DR5JOI
>OPFJI_G*(GN>KS^?33MM=3D_S"\VK_ _94>&G<<0 =20
=20
