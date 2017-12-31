From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 31 Dec 2017 21:30:18 +0000
Subject: [PATCH] ppp: Delete an error message for a failed memory allocation in three functions
Message-Id: <303ae3e8-f86e-1ed5-6d63-a966aa8b0552@users.sourceforge.net>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, linux-ppp@vger.kernel.org, Paul Mackerras <paulus@samba.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 31 Dec 2017 22:27:23 +0100

Omit an extra message for a memory allocation failure in these functions.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/net/ppp/ppp_generic.c | 12 ++++--------
 drivers/net/ppp/ppp_synctty.c |  5 ++---
 2 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index d8e5747ff4e3..d9119dcaa04e 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -2098,11 +2098,9 @@ ppp_receive_nonmp_frame(struct ppp *ppp, struct sk_buff *skb)
 		if (skb_tailroom(skb) < 124 || skb_cloned(skb)) {
 			/* copy to a new sk_buff with more tailroom */
 			ns = dev_alloc_skb(skb->len + 128);
-			if (!ns) {
-				netdev_err(ppp->dev, "PPP: no memory "
-					   "(VJ decomp)\n");
+			if (!ns)
 				goto err;
-			}
+
 			skb_reserve(ns, 2);
 			skb_copy_bits(skb, 0, skb_put(ns, skb->len), skb->len);
 			consume_skb(skb);
@@ -2237,11 +2235,9 @@ ppp_decompress_frame(struct ppp *ppp, struct sk_buff *skb)
 		}
 
 		ns = dev_alloc_skb(obuff_size);
-		if (!ns) {
-			netdev_err(ppp->dev, "ppp_decompress_frame: "
-				   "no memory\n");
+		if (!ns)
 			goto err;
-		}
+
 		/* the decompressor still expects the A/C bytes in the hdr */
 		len = ppp->rcomp->decompress(ppp->rc_state, skb->data - 2,
 				skb->len + 2, ns->data, obuff_size);
diff --git a/drivers/net/ppp/ppp_synctty.c b/drivers/net/ppp/ppp_synctty.c
index 7196f00f0991..f801e5218170 100644
--- a/drivers/net/ppp/ppp_synctty.c
+++ b/drivers/net/ppp/ppp_synctty.c
@@ -682,10 +682,9 @@ ppp_sync_input(struct syncppp *ap, const unsigned char *buf,
 
 	/* stuff the chars in the skb */
 	skb = dev_alloc_skb(ap->mru + PPP_HDRLEN + 2);
-	if (!skb) {
-		printk(KERN_ERR "PPPsync: no memory (input pkt)\n");
+	if (!skb)
 		goto err;
-	}
+
 	/* Try to get the payload 4-byte aligned */
 	if (buf[0] != PPP_ALLSTATIONS)
 		skb_reserve(skb, 2 + (buf[0] & 1));
-- 
2.15.1

