From: Guillaume Nault <g.nault@alphalink.fr>
Date: Tue, 15 Dec 2015 16:06:39 +0000
Subject: [PATCH net-next] pppoe: optional deactivation of PADT packet handling
Message-Id: <712ac4d53ca9fb8621164a1b72c74eae8c8529aa.1450194732.git.g.nault@alphalink.fr>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: linux-ppp@vger.kernel.org, David Miller <davem@davemloft.net>

Kernel space shouldn't handle PADT packets since PADT belongs to
PPPoE's control plane.
With "handle_padt" module option, user space can now decide to avoid
kernel interpretation of PADT packets and be responsible for session
disconnection.

Signed-off-by: Guillaume Nault <g.nault@alphalink.fr>
---
The two open-source PPPoE programs I know of are accel-ppp and pppd
(with the rp-pppoe plugin). Accel-ppp already handles PADT, while
pppd + rp-pppoe doesn't (seems like it doesn't even listen to its
PPPoE Discovery socket once session is established).


 drivers/net/ppp/pppoe.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ppp/pppoe.c b/drivers/net/ppp/pppoe.c
index b8da2ea..1846c3a 100644
--- a/drivers/net/ppp/pppoe.c
+++ b/drivers/net/ppp/pppoe.c
@@ -109,6 +109,18 @@ struct pppoe_net {
 	rwlock_t hash_lock;
 };
 
+/* PADT packets belong to PPPoE's discovery stage (i.e. control plane)
+ * and should be handled by user space. Unfortunately, some programs
+ * don't listen out for PADT packets and rely on pppoe module for
+ * closing session after reception of PADT.
+ *
+ * This option can be deactivated when PPPoE discovery is handled by
+ * a PADT aware program.
+ */
+static bool handle_padt __read_mostly = true;
+module_param(handle_padt, bool, 0444);
+MODULE_PARM_DESC(handle_padt, "Let kernel interpret incoming PADT");
+
 /*
  * PPPoE could be in the following stages:
  * 1) Discovery stage (to obtain remote MAC and Session ID)
@@ -1173,7 +1185,8 @@ static int __init pppoe_init(void)
 		goto out_unregister_pppoe_proto;
 
 	dev_add_pack(&pppoes_ptype);
-	dev_add_pack(&pppoed_ptype);
+	if (handle_padt)
+		dev_add_pack(&pppoed_ptype);
 	register_netdevice_notifier(&pppoe_notifier);
 
 	return 0;
@@ -1189,7 +1202,8 @@ out:
 static void __exit pppoe_exit(void)
 {
 	unregister_netdevice_notifier(&pppoe_notifier);
-	dev_remove_pack(&pppoed_ptype);
+	if (handle_padt)
+		dev_remove_pack(&pppoed_ptype);
 	dev_remove_pack(&pppoes_ptype);
 	unregister_pppox_proto(PX_PROTO_OE);
 	proto_unregister(&pppoe_sk_proto);
-- 
2.6.4

