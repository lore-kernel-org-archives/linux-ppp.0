From: Ben McKeegan <ben@netservers.co.uk>
Date: Wed, 02 Jun 2010 15:04:54 +0000
Subject: [PATCH] ppp_generic: fix multilink fragment sizes
Message-Id: <1275491094-9526-1-git-send-email-ben@netservers.co.uk>
List-Id: <linux-ppp.vger.kernel.org>
References: <4C0670E2.1090708@netservers.co.uk>
In-Reply-To: <4C0670E2.1090708@netservers.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davem@davemloft.net
Cc: ben@netservers.co.uk, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, gabriele.paoloni@intel.com, alan@lxorguk.ukuu.org.uk, linux-ppp@vger.kernel.org, paulus@samba.org

Fix bug in multilink fragment size calculation introduced by
commit 9c705260feea6ae329bc6b6d5f6d2ef0227eda0a
"ppp: ppp_mp_explode() redesign"

Signed-off-by: Ben McKeegan <ben@netservers.co.uk>
---
 drivers/net/ppp_generic.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/net/ppp_generic.c b/drivers/net/ppp_generic.c
index 0db3894..8b36bfe 100644
--- a/drivers/net/ppp_generic.c
+++ b/drivers/net/ppp_generic.c
@@ -1416,7 +1416,8 @@ static int ppp_mp_explode(struct ppp *ppp, struct sk_buff *skb)
 		flen = len;
 		if (nfree > 0) {
 			if (pch->speed = 0) {
-				flen = totlen/nfree;
+				if (nfree > 1)
+					flen = DIV_ROUND_UP(len, nfree);
 				if (nbigger > 0) {
 					flen++;
 					nbigger--;
-- 
1.5.6.5

