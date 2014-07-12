From: Christoph Schulz <develop@kristov.de>
Date: Sat, 12 Jul 2014 22:53:12 +0000
Subject: [PATCH 0/1]   net: pppoe: use correct channel MTU when using Multilink PPP
Message-Id: <53C1BC58.3030803@kristov.de>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: linux-ppp@vger.kernel.org, mostrows@gmail.com

Hello,

when computing the PPPoE channel MTU, we have to subtract two bytes, as
ppp_mp_explode() expects the channel MTU to exclude the size of the PPP
protocol field, which is correct according to RFC 1661.

See patch 1 for details.

Best regards,

Christoph

Christoph Schulz (1):
  net: pppoe: use correct channel MTU when using Multilink PPP

 drivers/net/ppp/pppoe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
