From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Sun, 14 Aug 2016 20:37:07 +0000
Subject: [PATCH 4.6 03/56] ppp: defer netns reference release for ppp channel
Message-Id: <20160814202505.050573053@linuxfoundation.org>
List-Id: <linux-ppp.vger.kernel.org>
References: <20160814202504.908694181@linuxfoundation.org>
In-Reply-To: <20160814202504.908694181@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, Matt Bennett <Matt.Bennett@alliedtelesis.co.nz>, Paul Mackerras <paulus@samba.org>, linux-ppp@vger.kernel.org, Guillaume Nault <g.nault@alphalink.fr>, Cyrill Gorcunov <gorcunov@openvz.org>, Cong Wang <xiyou.wangcong@gmail.com>, "David S. Miller" <davem@davemloft.net>

4.6-stable review patch.  If anyone has any objections, please let me know.

------------------

From: WANG Cong <xiyou.wangcong@gmail.com>

[ Upstream commit 205e1e255c479f3fd77446415706463b282f94e4 ]

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
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/net/ppp/ppp_generic.c |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -2404,8 +2404,6 @@ ppp_unregister_channel(struct ppp_channe
 	spin_lock_bh(&pn->all_channels_lock);
 	list_del(&pch->list);
 	spin_unlock_bh(&pn->all_channels_lock);
-	put_net(pch->chan_net);
-	pch->chan_net = NULL;
 
 	pch->file.dead = 1;
 	wake_up_interruptible(&pch->file.rwait);
@@ -2999,6 +2997,9 @@ ppp_disconnect_channel(struct channel *p
  */
 static void ppp_destroy_channel(struct channel *pch)
 {
+	put_net(pch->chan_net);
+	pch->chan_net = NULL;
+
 	atomic_dec(&channel_count);
 
 	if (!pch->file.dead) {


