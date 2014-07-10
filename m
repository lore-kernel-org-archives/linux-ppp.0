From: Tom Gundersen <teg@jklm.no>
Date: Thu, 10 Jul 2014 08:17:35 +0000
Subject: [PATCH v7 30/33] net: ppp - set name assign type
Message-Id: <1404980258-30853-31-git-send-email-teg@jklm.no>
List-Id: <linux-ppp.vger.kernel.org>
References: <1404980258-30853-1-git-send-email-teg@jklm.no>
In-Reply-To: <1404980258-30853-1-git-send-email-teg@jklm.no>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, David Miller <davem@davemloft.net>, David Herrmann <dh.herrmann@gmail.com>, Kay Sievers <kay@vrfy.org>, Tom Gundersen <teg@jklm.no>, Paul Mackerras <paulus@samba.org>, linux-ppp@vger.kernel.org

The ifname is of the form pppX where X is the unit number. This is even set
by userspace, or userspace requests the kernel to chose one, which is then
returned to userspace. Either way the creating user knows the name, so we
treat both cases as if the user had explicitly chosen the name and label
it NET_NAME_USER.

Signed-off-by: Tom Gundersen <teg@jklm.no>
Cc: Paul Mackerras <paulus@samba.org>
Cc: linux-ppp@vger.kernel.org
---
 drivers/net/ppp/ppp_generic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index 5c002b1..9757b52 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -2726,6 +2726,7 @@ ppp_create_interface(struct net *net, int unit, int *retp)
 	/* Initialize the new ppp unit */
 	ppp->file.index = unit;
 	sprintf(dev->name, "ppp%d", unit);
+	dev->name_assign_type = NET_NAME_USER;
 
 	ret = register_netdev(dev);
 	if (ret != 0) {
-- 
1.9.3

