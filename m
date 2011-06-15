From: Changli Gao <xiaosuo@gmail.com>
Date: Wed, 15 Jun 2011 07:58:13 +0000
Subject: [PATCH] ppp: use PPP_TRANS instead of the magic number 0x20
Message-Id: <1308124693-6600-1-git-send-email-xiaosuo@gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>
Cc: Paul Mackerras <paulus@samba.org>, linux-ppp@vger.kernel.org, netdev@vger.kernel.org, Changli Gao <xiaosuo@gmail.com>

Signed-off-by: Changli Gao <xiaosuo@gmail.com>
---
 drivers/net/ppp_async.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
diff --git a/drivers/net/ppp_async.c b/drivers/net/ppp_async.c
index 6436ba9..c6ba643 100644
--- a/drivers/net/ppp_async.c
+++ b/drivers/net/ppp_async.c
@@ -524,7 +524,7 @@ static void ppp_async_process(unsigned long arg)
 #define PUT_BYTE(ap, buf, c, islcp)	do {		\
 	if ((islcp && c < 0x20) || (ap->xaccm[c >> 5] & (1 << (c & 0x1f)))) {\
 		*buf++ = PPP_ESCAPE;			\
-		*buf++ = c ^ 0x20;			\
+		*buf++ = c ^ PPP_TRANS;			\
 	} else						\
 		*buf++ = c;				\
 } while (0)
@@ -897,7 +897,7 @@ ppp_async_input(struct asyncppp *ap, const unsigned char *buf,
 				sp = skb_put(skb, n);
 				memcpy(sp, buf, n);
 				if (ap->state & SC_ESCAPE) {
-					sp[0] ^= 0x20;
+					sp[0] ^= PPP_TRANS;
 					ap->state &= ~SC_ESCAPE;
 				}
 			}
