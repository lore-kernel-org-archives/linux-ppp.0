From: Milind Arun Choudhary <milindchoudhary@gmail.com>
Date: Wed, 04 Apr 2007 17:46:51 +0000
Subject: [KJ][PATCH]ROUND_UP macro cleanup in drivers/net/ppp_generic.c
Message-Id: <20070404174944.GC9830@arun.site>
List-Id: <linux-ppp.vger.kernel.org>
References: <20070403024345.GB9479@arun.site>
In-Reply-To: <20070403024345.GB9479@arun.site>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@lists.osdl.org
Cc: linux-kernel@vger.kernel.org, akpm@linux-foundation.org, linux-ppp@vger.kernel.org, paulus@samba.org

ROUND_UP macro cleanup use DIV_ROUND_UP

Signed-off-by: Milind Arun Choudhary <milindchoudhary@gmail.com>

---
 ppp_generic.c |    4 +---
 1 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/ppp_generic.c b/drivers/net/ppp_generic.c
index ef58e41..4b302f3 100644
--- a/drivers/net/ppp_generic.c
+++ b/drivers/net/ppp_generic.c
@@ -88,8 +88,6 @@ struct ppp_file {
 #define PF_TO_PPP(pf)		PF_TO_X(pf, struct ppp)
 #define PF_TO_CHANNEL(pf)	PF_TO_X(pf, struct channel)
 
-#define ROUNDUP(n, x)		(((n) + (x) - 1) / (x))
-
 /*
  * Data structure describing one ppp unit.
  * A ppp unit corresponds to a ppp network interface device
@@ -1297,7 +1295,7 @@ static int ppp_mp_explode(struct ppp *ppp, struct sk_buff *skb)
 	 */
 	fragsize = len;
 	if (nfree > 1)
-		fragsize = ROUNDUP(fragsize, nfree);
+		fragsize = DIV_ROUND_UP(fragsize, nfree);
 	/* nbigger channels get fragsize bytes, the rest get fragsize-1,
 	   except if nbigger=0, then they all get fragsize. */
 	nbigger = len % nfree;
---
Milind Arun Choudhary
