From: Vasily Averin <vvs@virtuozzo.com>
Date: Sun, 05 Nov 2017 16:49:26 +0000
Subject: [PATCH v2 02/21] ppp: exit_net cleanup checks added
Message-Id: <a86797d1-781b-9bd0-fd38-fa22e1a6d66e@virtuozzo.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <bafb347d-e36e-8b2b-7646-afc458a7a32a@virtuozzo.com>
In-Reply-To: <bafb347d-e36e-8b2b-7646-afc458a7a32a@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: linux-ppp@vger.kernel.org, Paul Mackerras <paulus@samba.org>

Be sure that lists initialized in net_init hook were return
to initial state.

Signed-off-by: Vasily Averin <vvs@virtuozzo.com>
---
 drivers/net/ppp/ppp_generic.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index e365866..10cee62 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -960,6 +960,10 @@ static __net_exit void ppp_exit_net(struct net *net)
 	rtnl_unlock();
 
 	idr_destroy(&pn->units_idr);
+	WARN(!list_empty(&pn->all_channels),
+	     "%s: all_channels list is not empty\n", __func__);
+	WARN(!list_empty(&pn->new_channels),
+	     "%s: new_channels list is not empty\n", __func__);
 }
 
 static struct pernet_operations ppp_net_ops = {
-- 
2.7.4

