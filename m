From: Vasily Averin <vvs@virtuozzo.com>
Date: Sun, 12 Nov 2017 08:50:25 +0000
Subject: [PATCH v4 17/18] ppp: exit_net cleanup checks added
Message-Id: <4efcdcc7-3442-0329-741b-7f66af42791d@virtuozzo.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <9dfa013e-9098-e155-9c47-a73753338288@virtuozzo.com>
In-Reply-To: <9dfa013e-9098-e155-9c47-a73753338288@virtuozzo.com>
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

