From: Vasily Averin <vvs@virtuozzo.com>
Date: Mon, 06 Nov 2017 13:23:51 +0000
Subject: [PATCH v3 04/21] ppp: exit_net cleanup checks added
Message-Id: <5e005fe5-e8b2-eee8-b185-a9e5fc1d7996@virtuozzo.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <4fdc4264-e338-6ee8-a662-7d98b45733a1@virtuozzo.com>
In-Reply-To: <4fdc4264-e338-6ee8-a662-7d98b45733a1@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Kernel Network Developers <netdev@vger.kernel.org>
Cc: linux-ppp@vger.kernel.org, Paul Mackerras <paulus@samba.org>

Be sure that lists initialized in net_init hook were return
to initial state.

Signed-off-by: Vasily Averin <vvs@virtuozzo.com>
---
 drivers/net/ppp/ppp_generic.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index e365866..c0861d1 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -960,6 +960,12 @@ static __net_exit void ppp_exit_net(struct net *net)
 	rtnl_unlock();
 
 	idr_destroy(&pn->units_idr);
+	WARN_ONCE(!list_empty(&pn->all_channels),
+		  "net %x %s: all_channels list is not empty\n",
+		  net->ns.inum, __func__);
+	WARN_ONCE(!list_empty(&pn->new_channels),
+		  "net %x %s: new_channels list is not empty\n",
+		  net->ns.inum, __func__);
 }
 
 static struct pernet_operations ppp_net_ops = {
-- 
2.7.4

