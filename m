From: =?UTF-8?B?RnJhbsOnb2lzIENhY2hlcmV1bA==?= <f.cachereul@alphalink.fr>
Date: Thu, 24 Oct 2013 10:30:37 +0000
Subject: [RFC PATCH net-next] ppp: Allow ppp device connected to an l2tp session to change of namespace
Message-Id: <5268F6CD.9070600@alphalink.fr>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Paul Mackerras <paulus@samba.org>, James Chapman <jchapman@katalix.com>
Cc: netdev@vger.kernel.org, linux-ppp@vger.kernel.org

Remove NETIF_F_NETNS_LOCAL flag from ppp device in ppp_connect_channel()
if the device is connected to a l2tp session socket.
Restore the flag in ppp_disconnect_channel().

Signed-off-by: François CACHEREUL <f.cachereul@alphalink.fr>
---
I'm trying to get rid of this flag for ppp device connected to l2tp
session, it's seem to be safe to do it for as l2tp_ppp module hasn't any
reference to the ppp device except to the device name. We can probably
do it for others modules but pppoe and pptp will require more work.

I remove the flag for l2tp in ppp_generic.c because I couldn't find a
place like a callback to do it in l2tp_ppp.c. The best will be to 
remove the flag for all ppp devices.

François

 drivers/net/ppp/ppp_generic.c |   11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index 72ff14b..7ccf2ae 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -54,6 +54,8 @@
 #include <net/net_namespace.h>
 #include <net/netns/generic.h>
 
+#include <linux/if_pppox.h>
+
 #define PPP_VERSION	"2.4.2"
 
 /*
@@ -2861,6 +2863,7 @@ ppp_connect_channel(struct channel *pch, int unit)
 	struct ppp_net *pn;
 	int ret = -ENXIO;
 	int hdrlen;
+	struct sock *sk;
 
 	pn = ppp_pernet(pch->chan_net);
 
@@ -2883,6 +2886,13 @@ ppp_connect_channel(struct channel *pch, int unit)
 	++ppp->n_channels;
 	pch->ppp = ppp;
 	atomic_inc(&ppp->file.refcnt);
+
+	/* allow ppp net device to be moved in another network namespace
+	 * if it's connected to an l2tp session */
+	sk = (struct sock *)pch->chan->private;
+	if (sk && sk->sk_protocol = PX_PROTO_OL2TP)
+		ppp->dev->features &= ~NETIF_F_NETNS_LOCAL;
+
 	ppp_unlock(ppp);
 	ret = 0;
 
@@ -2912,6 +2922,7 @@ ppp_disconnect_channel(struct channel *pch)
 		list_del(&pch->clist);
 		if (--ppp->n_channels = 0)
 			wake_up_interruptible(&ppp->file.rwait);
+		ppp->dev->features |= NETIF_F_NETNS_LOCAL;
 		ppp_unlock(ppp);
 		if (atomic_dec_and_test(&ppp->file.refcnt))
 			ppp_destroy_interface(ppp);
-- 
1.7.10.4

