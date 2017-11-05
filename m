From: Vasily Averin <vvs@virtuozzo.com>
Date: Sun, 05 Nov 2017 09:59:14 +0000
Subject: [PATCH 02/21] ppp: exit_net cleanup checks added
Message-Id: <eec31e0a-3b8b-6197-56bf-b436a6bace2e@virtuozzo.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: linux-ppp@vger.kernel.org, Paul Mackerras <paulus@samba.org>

Be sure that lists initialized in net_init hook were return to initial state

Signed-off-by: Vasily Averin <vvs@virtuozzo.com>
---
 drivers/net/ppp/ppp_generic.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index e365866..c9791bc 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -960,6 +960,10 @@ static __net_exit void ppp_exit_net(struct net *net)
 	rtnl_unlock();
 
 	idr_destroy(&pn->units_idr);
+	WARN(!list_empty(&pn->all_channels),
+	     "net %p exit: ppp all_channels list is not empty\n", net);
+	WARN(!list_empty(&pn->new_channels),
+	     "net %p exit: ppp new_channels list is not empty\n", net);
 }
 
 static struct pernet_operations ppp_net_ops = {
-- 
2.7.4

