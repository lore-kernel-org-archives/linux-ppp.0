From: domen@coderock.org
Date: Sun, 06 Mar 2005 22:23:42 +0000
Subject: [patch 1/1] list_for_each_entry: drivers-net-ppp_generic.c
Message-Id: <20050306222343.253F01EC90@trashy.coderock.org>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org







Make code more readable with list_for_each_entry.
Compile tested.

Signed-off-by: Domen Puncer <domen@coderock.org>
Signed-off-by: Maximilian Attems <janitor@sternwelten.at>
Signed-off-by: Domen Puncer <domen@coderock.org>
---


 kj-domen/drivers/net/ppp_generic.c |   21 ++++++---------------
 1 files changed, 6 insertions(+), 15 deletions(-)

diff -puN drivers/net/ppp_generic.c~list-for-each-entry-drivers_net_ppp_generic drivers/net/ppp_generic.c
--- kj/drivers/net/ppp_generic.c~list-for-each-entry-drivers_net_ppp_generic	2005-03-05 16:09:02.000000000 +0100
+++ kj-domen/drivers/net/ppp_generic.c	2005-03-05 16:09:02.000000000 +0100
@@ -1228,8 +1228,7 @@ static int ppp_mp_explode(struct ppp *pp
 
 	nch = 0;
 	hdrlen = (ppp->flags & SC_MP_XSHORTSEQ)? MPHDRLEN_SSN: MPHDRLEN;
-	list = &ppp->channels;
-	while ((list = list->next) != &ppp->channels) {
+	list_for_each(list, &ppp->channels) {
 		pch = list_entry(list, struct channel, clist);
 		nch += pch->avail = (skb_queue_len(&pch->file.xq) = 0);
 		/*
@@ -1688,7 +1687,7 @@ static void
 ppp_receive_mp_frame(struct ppp *ppp, struct sk_buff *skb, struct channel *pch)
 {
 	u32 mask, seq;
-	struct list_head *l;
+	struct channel *ch;
 	int mphdrlen = (ppp->flags & SC_MP_SHORTSEQ)? MPHDRLEN_SSN: MPHDRLEN;
 
 	if (!pskb_may_pull(skb, mphdrlen + 1) || ppp->mrru = 0)
@@ -1742,8 +1741,7 @@ ppp_receive_mp_frame(struct ppp *ppp, st
 	 * The list of channels can't change because we have the receive
 	 * side of the ppp unit locked.
 	 */
-	for (l = ppp->channels.next; l != &ppp->channels; l = l->next) {
-		struct channel *ch = list_entry(l, struct channel, clist);
+	list_for_each_entry(ch, &ppp->channels, clist) {
 		if (seq_before(ch->lastseq, seq))
 			seq = ch->lastseq;
 	}
@@ -2229,10 +2227,8 @@ static struct compressor_entry *
 find_comp_entry(int proto)
 {
 	struct compressor_entry *ce;
-	struct list_head *list = &compressor_list;
 
-	while ((list = list->next) != &compressor_list) {
-		ce = list_entry(list, struct compressor_entry, list);
+	list_for_each_entry(ce, &compressor_list, list) {
 		if (ce->comp->compress_proto = proto)
 			return ce;
 	}
@@ -2502,20 +2498,15 @@ static struct channel *
 ppp_find_channel(int unit)
 {
 	struct channel *pch;
-	struct list_head *list;
 
-	list = &new_channels;
-	while ((list = list->next) != &new_channels) {
-		pch = list_entry(list, struct channel, list);
+	list_for_each_entry(pch, &new_channels, list) {
 		if (pch->file.index = unit) {
 			list_del(&pch->list);
 			list_add(&pch->list, &all_channels);
 			return pch;
 		}
 	}
-	list = &all_channels;
-	while ((list = list->next) != &all_channels) {
-		pch = list_entry(list, struct channel, list);
+	list_for_each_entry(pch, &all_channels, list) {
 		if (pch->file.index = unit)
 			return pch;
 	}
_
