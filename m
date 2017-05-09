From: Amit Pundir <amit.pundir@linaro.org>
Date: Tue, 09 May 2017 14:54:38 +0000
Subject: [PATCH for-3.18 14/24] ppp: defer netns reference release for ppp channel
Message-Id: <1494340968-17152-15-git-send-email-amit.pundir@linaro.org>
List-Id: <linux-ppp.vger.kernel.org>
References: <1494340968-17152-1-git-send-email-amit.pundir@linaro.org>
In-Reply-To: <1494340968-17152-1-git-send-email-amit.pundir@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg KH <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, WANG Cong <xiyou.wangcong@gmail.com>, Paul Mackerras <paulus@samba.org>, linux-ppp@vger.kernel.org, Guillaume Nault <g.nault@alphalink.fr>, Cyrill Gorcunov <gorcunov@openvz.org>, "David S . Miller" <davem@davemloft.net>

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
Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
---
 drivers/net/ppp/ppp_generic.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index e3fbbbbd84e7..3dd1c19756ec 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -2342,8 +2342,6 @@ ppp_unregister_channel(struct ppp_channel *chan)
 	spin_lock_bh(&pn->all_channels_lock);
 	list_del(&pch->list);
 	spin_unlock_bh(&pn->all_channels_lock);
-	put_net(pch->chan_net);
-	pch->chan_net = NULL;
 
 	pch->file.dead = 1;
 	wake_up_interruptible(&pch->file.rwait);
@@ -2960,6 +2958,9 @@ ppp_disconnect_channel(struct channel *pch)
  */
 static void ppp_destroy_channel(struct channel *pch)
 {
+	put_net(pch->chan_net);
+	pch->chan_net = NULL;
+
 	atomic_dec(&channel_count);
 
 	if (!pch->file.dead) {
-- 
2.7.4

