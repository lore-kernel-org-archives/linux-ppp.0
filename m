From: Stephen Hemminger <shemminger@vyatta.com>
Date: Mon, 29 Oct 2012 18:34:02 +0000
Subject: [PATCH net-next] ppp: make  ppp_get_stats64 static
Message-Id: <20121029113402.10736805@nehalam.linuxnetplumber.net>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paul Mackerras <paulus@samba.org>
Cc: linux-ppp@vger.kernel.org, netdev@vger.kernel.org

This was picked up by sparse.

Signed-off-by: Stephen Hemminger <shemminger@vyatta.com>

--- a/drivers/net/ppp/ppp_generic.c	2012-10-25 09:11:13.963289236 -0700
+++ b/drivers/net/ppp/ppp_generic.c	2012-10-29 11:26:06.167077708 -0700
@@ -1034,7 +1034,7 @@ ppp_net_ioctl(struct net_device *dev, st
 	return err;
 }
 
-struct rtnl_link_stats64*
+static struct rtnl_link_stats64*
 ppp_get_stats64(struct net_device *dev, struct rtnl_link_stats64 *stats64)
 {
 	struct ppp *ppp = netdev_priv(dev);
