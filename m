From: Maninder Singh <maninder1.s@samsung.com>
Date: Wed, 24 Jun 2015 11:31:52 +0000
Subject: [RFC][PATCH v2] ppp: remove NULL check before kfree
Message-Id: <1435144792-30367-1-git-send-email-maninder1.s@samsung.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: paulus@samba.org, linux-ppp@vger.kernel.org, netdev@vger.kernel.org
Cc: pankaj.m@samsung.com, Maninder Singh <maninder1.s@samsung.com>

Removes NULL check before kfree
and using tabs in place of space.

and removing checkpatch warning:
labels should not be indented.

Signed-off-by: Maninder Singh <maninder1.s@samsung.com>
Reviewed-by: Vaneet narang <v.narang@samsung.com>
---
 drivers/net/ppp/ppp_mppe.c |   24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ppp/ppp_mppe.c b/drivers/net/ppp/ppp_mppe.c
index 05005c6..339b50e 100644
--- a/drivers/net/ppp/ppp_mppe.c
+++ b/drivers/net/ppp/ppp_mppe.c
@@ -237,15 +237,14 @@ static void *mppe_alloc(unsigned char *options, int optlen)
 
 	return (void *)state;
 
-	out_free:
-	    if (state->sha1_digest)
-		kfree(state->sha1_digest);
-	    if (state->sha1)
+out_free:
+	kfree(state->sha1_digest);
+	if (state->sha1)
 		crypto_free_hash(state->sha1);
-	    if (state->arc4)
+	if (state->arc4)
 		crypto_free_blkcipher(state->arc4);
-	    kfree(state);
-	out:
+	kfree(state);
+out:
 	return NULL;
 }
 
@@ -256,13 +255,12 @@ static void mppe_free(void *arg)
 {
 	struct ppp_mppe_state *state = (struct ppp_mppe_state *) arg;
 	if (state) {
-	    if (state->sha1_digest)
 		kfree(state->sha1_digest);
-	    if (state->sha1)
-		crypto_free_hash(state->sha1);
-	    if (state->arc4)
-		crypto_free_blkcipher(state->arc4);
-	    kfree(state);
+		if (state->sha1)
+			crypto_free_hash(state->sha1);
+		if (state->arc4)
+			crypto_free_blkcipher(state->arc4);
+		kfree(state);
 	}
 }
 
-- 
1.7.9.5

