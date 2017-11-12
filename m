From: Vasily Averin <vvs@virtuozzo.com>
Date: Sun, 12 Nov 2017 19:33:22 +0000
Subject: [PATCH v5 12/13] ppp: exit_net cleanup checks added
Message-Id: <f15b4e69-d255-d65f-6778-1af3f89c26cd@virtuozzo.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <cb06dace-88a8-fecf-92ad-02920920a0d3@virtuozzo.com>
In-Reply-To: <cb06dace-88a8-fecf-92ad-02920920a0d3@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: linux-ppp@vger.kernel.org, Paul Mackerras <paulus@samba.org>

Be sure that lists initialized in net_init hook were return
to initial state.

Signed-off-by: Vasily Averin <vvs@virtuozzo.com>
---
 drivers/net/ppp/ppp_generic.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index e365866..30744ce 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -960,6 +960,8 @@ static __net_exit void ppp_exit_net(struct net *net)
 	rtnl_unlock();
 
 	idr_destroy(&pn->units_idr);
+	WARN_ON_ONCE(!list_empty(&pn->all_channels));
+	WARN_ON_ONCE(!list_empty(&pn->new_channels));
 }
 
 static struct pernet_operations ppp_net_ops = {
-- 
2.7.4

