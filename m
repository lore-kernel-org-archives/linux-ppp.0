From: Matteo Croce <mcroce@redhat.com>
Date: Mon, 09 Oct 2017 12:59:41 +0000
Subject: [RFC net-next] ppp: allow usage in namespaces
Message-Id: <20171009125941.15452-1-mcroce@redhat.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paul Mackerras <paulus@samba.org>, linux-ppp@vger.kernel.org, netdev@vger.kernel.org
Cc: David Miller <davem@davemloft.net>

Check for CAP_NET_ADMIN with ns_capable() instead of capable()
to allow usage of ppp in user namespace other than the init one.

Signed-off-by: Matteo Croce <mcroce@redhat.com>
---
 drivers/net/ppp/ppp_generic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index a404552555d4..be5634b4835b 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -389,7 +389,7 @@ static int ppp_open(struct inode *inode, struct file *file)
 	/*
 	 * This could (should?) be enforced by the permissions on /dev/ppp.
 	 */
-	if (!capable(CAP_NET_ADMIN))
+	if (!ns_capable(file->f_cred->user_ns, CAP_NET_ADMIN))
 		return -EPERM;
 	return 0;
 }
-- 
2.13.6

