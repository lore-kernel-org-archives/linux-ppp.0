From: Guillaume Nault <g.nault@alphalink.fr>
Date: Fri, 11 Dec 2015 18:54:49 +0000
Subject: [PATCH net-next 1/2] ppp: define "ppp" device type
Message-Id: <a88a45cd8b3a37873eef4d09f5adb1ff02a6649a.1449859708.git.g.nault@alphalink.fr>
List-Id: <linux-ppp.vger.kernel.org>
References: <cover.1449859708.git.g.nault@alphalink.fr>
In-Reply-To: <cover.1449859708.git.g.nault@alphalink.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: Paul Mackerras <paulus@samba.org>, linux-ppp@vger.kernel.org, "David S. Miller" <davem@davemloft.net>

Let PPP devices be identified as such in /sys/class/net/<iface>/uevent.

Signed-off-by: Guillaume Nault <g.nault@alphalink.fr>
---
 drivers/net/ppp/ppp_generic.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index 9a863c6..1cd7651 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -1138,9 +1138,15 @@ static const struct net_device_ops ppp_netdev_ops = {
 	.ndo_get_stats64 = ppp_get_stats64,
 };
 
+static struct device_type ppp_type = {
+	.name = "ppp",
+};
+
 static void ppp_setup(struct net_device *dev)
 {
 	dev->netdev_ops = &ppp_netdev_ops;
+	SET_NETDEV_DEVTYPE(dev, &ppp_type);
+
 	dev->hard_header_len = PPP_HDRLEN;
 	dev->mtu = PPP_MRU;
 	dev->addr_len = 0;
-- 
2.6.4

