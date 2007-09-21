From: Michal Schmidt <mschmidt@redhat.com>
Date: Fri, 21 Sep 2007 14:08:09 +0000
Subject: [PATCH] ppp_mppe: Don't put InterimKey on the stack
Message-Id: <46F3D049.4080006@redhat.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Kernel list <linux-kernel@vger.kernel.org>
Cc: Frank Cusack <fcusack@fcusack.com>, Matt Domsch <Matt_Domsch@dell.com>, linux-ppp@vger.kernel.org

Hello,

The interrupt stack can be in the __START_KERNEL_map region in which
virt_to_page will not work. This caused ppp_mppe to crash on CentOS 5 on x86_64
(http://bugs.centos.org/view.php?id 76).

The fix is to avoid copying the interim key. We can simply use it in its
original place, which is kmalloc'd.

Michal
---
 drivers/net/ppp_mppe.c |   14 ++++++--------
 1 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ppp_mppe.c b/drivers/net/ppp_mppe.c
index f79cf87..c0b6d19 100644
--- a/drivers/net/ppp_mppe.c
+++ b/drivers/net/ppp_mppe.c
@@ -136,7 +136,7 @@ struct ppp_mppe_state {
  * Key Derivation, from RFC 3078, RFC 3079.
  * Equivalent to Get_Key() for MS-CHAP as described in RFC 3079.
  */
-static void get_new_key_from_sha(struct ppp_mppe_state * state, unsigned char *InterimKey)
+static void get_new_key_from_sha(struct ppp_mppe_state * state)
 {
 	struct hash_desc desc;
 	struct scatterlist sg[4];
@@ -153,8 +153,6 @@ static void get_new_key_from_sha(struct ppp_mppe_state * state, unsigned char *I
 	desc.flags = 0;
 
 	crypto_hash_digest(&desc, sg, nbytes, state->sha1_digest);
-
-	memcpy(InterimKey, state->sha1_digest, state->keylen);
 }
 
 /*
@@ -163,21 +161,21 @@ static void get_new_key_from_sha(struct ppp_mppe_state * state, unsigned char *I
  */
 static void mppe_rekey(struct ppp_mppe_state * state, int initial_key)
 {
-	unsigned char InterimKey[MPPE_MAX_KEY_LEN];
 	struct scatterlist sg_in[1], sg_out[1];
 	struct blkcipher_desc desc = { .tfm = state->arc4 };
 
-	get_new_key_from_sha(state, InterimKey);
+	get_new_key_from_sha(state);
 	if (!initial_key) {
-		crypto_blkcipher_setkey(state->arc4, InterimKey, state->keylen);
-		setup_sg(sg_in, InterimKey, state->keylen);
+		crypto_blkcipher_setkey(state->arc4, state->sha1_digest,
+					state->keylen);
+		setup_sg(sg_in, state->sha1_digest, state->keylen);
 		setup_sg(sg_out, state->session_key, state->keylen);
 		if (crypto_blkcipher_encrypt(&desc, sg_out, sg_in,
 					     state->keylen) != 0) {
     		    printk(KERN_WARNING "mppe_rekey: cipher_encrypt failed\n");
 		}
 	} else {
-		memcpy(state->session_key, InterimKey, state->keylen);
+		memcpy(state->session_key, state->sha1_digest, state->keylen);
 	}
 	if (state->keylen = 8) {
 		/* See RFC 3078 */

