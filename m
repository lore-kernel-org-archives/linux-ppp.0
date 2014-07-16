From: Tom Gundersen <teg@jklm.no>
Date: Wed, 16 Jul 2014 22:43:14 +0000
Subject: [PATCH v8] net: ppp - set name assign type
Message-Id: <1405550594-11786-7-git-send-email-teg@jklm.no>
List-Id: <linux-ppp.vger.kernel.org>
References: <1405550594-11786-1-git-send-email-teg@jklm.no>
In-Reply-To: <1405550594-11786-1-git-send-email-teg@jklm.no>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: David Miller <davem@davemloft.net>, linux-kernel@vger.kernel.org, Tom Gundersen <teg@jklm.no>, Paul Mackerras <paulus@samba.org>, linux-ppp@vger.kernel.org

The ifname is of the form pppX where X is the unit number. This is either set
by userspace, or userspace requests the kernel to chose one, which is then
returned to userspace. Either way the creating user knows the name, so we
treat both cases as if the user had explicitly chosen the name and label
it NET_NAME_USER.

Signed-off-by: Tom Gundersen <teg@jklm.no>
Cc: Paul Mackerras <paulus@samba.org>
Cc: linux-ppp@vger.kernel.org
---

This patch goes on top of net-next.

 drivers/net/ppp/ppp_generic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index c38ee90..6526057 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -2728,6 +2728,7 @@ ppp_create_interface(struct net *net, int unit, int *retp)
 	/* Initialize the new ppp unit */
 	ppp->file.index = unit;
 	sprintf(dev->name, "ppp%d", unit);
+	dev->name_assign_type = NET_NAME_USER;
 
 	ret = register_netdev(dev);
 	if (ret != 0) {
-- 
1.9.3

