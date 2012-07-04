From: Benjamin LaHaise <bcrl@kvack.org>
Date: Wed, 04 Jul 2012 01:32:58 +0000
Subject: [PATCH next-next] ppp: change default for incoming protocol filter to NPMODE_DROP
Message-Id: <20120704013258.GA26225@kvack.org>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Miller <davem@davemloft.net>
Cc: netdev@vger.kernel.org, linux-ppp@vger.kernel.org

By default, the ppp_generic code initializes the npmode array that filters
incoming packet to accept packets for all protocols.  This behaviour is
incorrect, as it results in packets for protocols that an older version
of a PPP implementation may not be aware of to be incorrectly accepted.
This behaviour is visible, for example, when sending IPv6 packets across a
ppp link where pppd has only been configured to use IPv4.

This change should be safe since pppd will correctly set the protocols it
negotiates to NPMODE_PASS as the appropriate protocols transition to an Up
state.

Signed-off-by: Benjamin LaHaise <bcrl@kvack.org>
---
 drivers/net/ppp/ppp_generic.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index 5c05572..404ac50 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -2619,7 +2619,7 @@ ppp_create_interface(struct net *net, int unit, int *retp)
 	init_ppp_file(&ppp->file, INTERFACE);
 	ppp->file.hdrlen = PPP_HDRLEN - 2;	/* don't count proto bytes */
 	for (i = 0; i < NUM_NP; ++i)
-		ppp->npmode[i] = NPMODE_PASS;
+		ppp->npmode[i] = NPMODE_DROP;
 	INIT_LIST_HEAD(&ppp->channels);
 	spin_lock_init(&ppp->rlock);
 	spin_lock_init(&ppp->wlock);
-- 
1.7.4.1


-- 
"Thought is the essence of where you are now."
