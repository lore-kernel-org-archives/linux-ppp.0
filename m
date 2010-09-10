From: Dan Carpenter <error27@gmail.com>
Date: Fri, 10 Sep 2010 11:58:10 +0000
Subject: [patch] ppp: potential NULL dereference in ppp_mp_explode()
Message-Id: <20100910115809.GF5959@bicker>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paul Mackerras <paulus@samba.org>
Cc: "David S. Miller" <davem@davemloft.net>, Simon Arlott <simon@fire.lp0.eu>, Ben McKeegan <ben@netservers.co.uk>, Stephen Hemminger <shemminger@vyatta.com>, Len Sorensen <lsorense@csclub.uwaterloo.ca>, linux-ppp@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Smatch complains because we check whether "pch->chan" is NULL and then
dereference it unconditionally on the next line.  Partly the reason this
bug was introduced is because code was too complicated.  I've simplified
it a little.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
Compile tested only.  Perhaps it would be better to set pch->speed to
zero?  The comments say that zero implies the speed hasn't been set.

diff --git a/drivers/net/ppp_generic.c b/drivers/net/ppp_generic.c
index 6695a51..736b917 100644
--- a/drivers/net/ppp_generic.c
+++ b/drivers/net/ppp_generic.c
@@ -1314,8 +1314,13 @@ static int ppp_mp_explode(struct ppp *ppp, struct sk_buff *skb)
 	hdrlen = (ppp->flags & SC_MP_XSHORTSEQ)? MPHDRLEN_SSN: MPHDRLEN;
 	i = 0;
 	list_for_each_entry(pch, &ppp->channels, clist) {
-		navail += pch->avail = (pch->chan != NULL);
-		pch->speed = pch->chan->speed;
+		if (pch->chan) {
+			pch->avail = 1;
+			navail++;
+			pch->speed = pch->chan->speed;
+		} else {
+			pch->avail = 0;
+		}
 		if (pch->avail) {
 			if (skb_queue_empty(&pch->file.xq) ||
 				!pch->had_frag) {
