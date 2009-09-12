From: Jaswinder Singh Rajput <jaswinder@kernel.org>
Date: Sat, 12 Sep 2009 16:53:31 +0000
Subject: [PATCH] ppp: ppp_generic.c initialize flen before it get used
Message-Id: <1252773691.3687.5.camel@ht.satnam>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: David Miller <davem@davemloft.net>, Gabriele Paoloni <gabriele.paoloni@intel.com>, Paul Mackerras <paulus@samba.org>, linux-ppp@vger.kernel.org, netdev <netdev@vger.kernel.org>


When while loop runs first time flen is used uninitialized for nfree <= 0

This also fixed compilation warning :
  CC [M]  drivers/net/ppp_generic.o
drivers/net/ppp_generic.c: In function ‘ppp_mp_explode’:
drivers/net/ppp_generic.c:1314: warning: ‘flen’ may be used uninitialized in this function

Signed-off-by: Jaswinder Singh Rajput <jaswinderrajput@gmail.com>
---
 drivers/net/ppp_generic.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/net/ppp_generic.c b/drivers/net/ppp_generic.c
index cd37d73..b1a1a06 100644
--- a/drivers/net/ppp_generic.c
+++ b/drivers/net/ppp_generic.c
@@ -1311,7 +1311,7 @@ static int ppp_mp_explode(struct ppp *ppp, struct sk_buff *skb)
 {
 	int	len, totlen;
 	int	i, bits, hdrlen, mtu;
-	int	flen;
+	int	flen = 0;
 	int	navail,	nfree, nzero;
 	int	nbigger;
 	int	totspeed;
-- 
1.6.4.2


