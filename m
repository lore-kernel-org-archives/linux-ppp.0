From: Maninder Singh <maninder1.s@samsung.com>
Date: Wed, 24 Jun 2015 09:51:42 +0000
Subject: [PATCH 1/1] ppp: remove NULL check before kfree
Message-Id: <1435138782-48477-1-git-send-email-maninder1.s@samsung.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: paulus@samba.org, linux-ppp@vger.kernel.org, netdev@vger.kernel.org
Cc: pankaj.m@samsung.com, Maninder Singh <maninder1.s@samsung.com>

No need of explicit NULL check before kfree,
removing the same and little coding style changes.

Signed-off-by: Maninder Singh <maninder1.s@samsung.com>
Reviewed-by: Vaneet narang <v.narang@samsung.com>
---
 drivers/net/ppp/ppp_mppe.c |   10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ppp/ppp_mppe.c b/drivers/net/ppp/ppp_mppe.c
index 05005c6..06f60b1 100644
--- a/drivers/net/ppp/ppp_mppe.c
+++ b/drivers/net/ppp/ppp_mppe.c
@@ -238,12 +238,11 @@ static void *mppe_alloc(unsigned char *options, int optlen)
 	return (void *)state;
 
 	out_free:
-	    if (state->sha1_digest)
 		kfree(state->sha1_digest);
 	    if (state->sha1)
-		crypto_free_hash(state->sha1);
+			crypto_free_hash(state->sha1);
 	    if (state->arc4)
-		crypto_free_blkcipher(state->arc4);
+			crypto_free_blkcipher(state->arc4);
 	    kfree(state);
 	out:
 	return NULL;
@@ -256,12 +255,11 @@ static void mppe_free(void *arg)
 {
 	struct ppp_mppe_state *state = (struct ppp_mppe_state *) arg;
 	if (state) {
-	    if (state->sha1_digest)
 		kfree(state->sha1_digest);
 	    if (state->sha1)
-		crypto_free_hash(state->sha1);
+			crypto_free_hash(state->sha1);
 	    if (state->arc4)
-		crypto_free_blkcipher(state->arc4);
+			crypto_free_blkcipher(state->arc4);
 	    kfree(state);
 	}
 }
-- 
1.7.9.5

