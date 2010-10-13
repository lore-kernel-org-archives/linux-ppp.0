From: Leonid Lisovskiy <lly.dev@gmail.com>
Date: Wed, 13 Oct 2010 12:33:54 +0000
Subject: [PATCH] pppoe: Missed check for destination addr in PADT frame processing
Message-Id: <AANLkTim5m4f-7U4kMghBR0yEQka3-iOaJ9aHwf4sGsxj@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

 One of our customer encountered sporadic disconnects problem with
his ISP when using kernel PPPoE driver. After some investigation, we
discovered that it happens due to PADT frames being received with
destination MAC not matching the client MAC even though they have
proper source MAC and session_id. It seems that these ISP use very
cheap equipment that doesn't provide generation of unique
session_id's. User-space rp-pppoe 3.10 works correctly in this case
since it has an additional check for destination MAC in PADT frame
processing.

This patch adds check for destination MAC address in pppoe_disc_rcv().

Signed-off-by: Leonid Lisovskiy <lly.dev@gmail.com>
---

Tested on one buggy ISP (R-telekom, Kirov, Russia).

 drivers/net/pppoe.c |    4 ++++
 1 file changed, 4 insertions(+)

--- a/drivers/net/pppoe.c
+++ b/drivers/net/pppoe.c
@@ -485,6 +485,10 @@ static int pppoe_disc_rcv(struct sk_buff
 	if (ph->code != PADT_CODE)
 		goto abort;

+	/* Ignore PADT packets whose destination address isn't ours */
+	if (memcmp(eth_hdr(skb)->h_dest, dev->dev_addr, ETH_ALEN))
+		goto abort;
+
 	pn = pppoe_pernet(dev_net(dev));
 	po = get_item(pn, ph->sid, eth_hdr(skb)->h_source, dev->ifindex);
 	if (po) {
--
