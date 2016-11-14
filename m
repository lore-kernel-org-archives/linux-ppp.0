From: Ben Hutchings <ben@decadent.org.uk>
Date: Mon, 14 Nov 2016 00:14:20 +0000
Subject: [PATCH 3.16 051/346] ppp: defer netns reference release for ppp channel
Message-Id: <lsq.1479082460.428667860@decadent.org.uk>
List-Id: <linux-ppp.vger.kernel.org>
In-Reply-To: <lsq.1479082458.755945576@decadent.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: akpm@linux-foundation.org, Matt Bennett <Matt.Bennett@alliedtelesis.co.nz>, Cyrill Gorcunov <gorcunov@openvz.org>, Paul Mackerras <paulus@samba.org>, "David S. Miller" <davem@davemloft.net>, Guillaume Nault <g.nault@alphalink.fr>, linux-ppp@vger.kernel.org, WANG Cong <xiyou.wangcong@gmail.com>

3.16.39-rc1 review patch.  If anyone has any objections, please let me know.

------------------

From: WANG Cong <xiyou.wangcong@gmail.com>

commit 205e1e255c479f3fd77446415706463b282f94e4 upstream.

Matt reported that we have a NULL pointer dereference
in ppp_pernet() from ppp_connect_channel(),
i.e. pch->chan_net is NULL.

This is due to that a parallel ppp_unregister_channel()
could happen while we are in ppp_connect_channel(), during
which pch->chan_net set to NULL. Since we need a reference
to net per channel, it makes sense to sync the refcnt
with the life time of the channel, therefore we should
release this reference when we destroy it.

Fixes: 1f461dcdd296 ("ppp: take reference on channels netns")
Reported-by: Matt Bennett <Matt.Bennett@alliedtelesis.co.nz>
Cc: Paul Mackerras <paulus@samba.org>
Cc: linux-ppp@vger.kernel.org
Cc: Guillaume Nault <g.nault@alphalink.fr>
Cc: Cyrill Gorcunov <gorcunov@openvz.org>
Signed-off-by: Cong Wang <xiyou.wangcong@gmail.com>
Reviewed-by: Cyrill Gorcunov <gorcunov@openvz.org>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
 drivers/net/ppp/ppp_generic.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -2338,8 +2338,6 @@ ppp_unregister_channel(struct ppp_channe
 	spin_lock_bh(&pn->all_channels_lock);
 	list_del(&pch->list);
 	spin_unlock_bh(&pn->all_channels_lock);
-	put_net(pch->chan_net);
-	pch->chan_net = NULL;
 
 	pch->file.dead = 1;
 	wake_up_interruptible(&pch->file.rwait);
@@ -2955,6 +2953,9 @@ ppp_disconnect_channel(struct channel *p
  */
 static void ppp_destroy_channel(struct channel *pch)
 {
+	put_net(pch->chan_net);
+	pch->chan_net = NULL;
+
 	atomic_dec(&channel_count);
 
 	if (!pch->file.dead) {

