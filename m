From: Jiri Slaby <jslaby@suse.cz>
Date: Thu, 06 Oct 2016 06:22:58 +0000
Subject: [patch added to 3.12-stable] ppp: defer netns reference release for ppp channel
Message-Id: <20161006062305.26935-27-jslaby@suse.cz>
List-Id: <linux-ppp.vger.kernel.org>
References: <20161006062305.26935-1-jslaby@suse.cz>
In-Reply-To: <20161006062305.26935-1-jslaby@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: stable@vger.kernel.org
Cc: WANG Cong <xiyou.wangcong@gmail.com>, Paul Mackerras <paulus@samba.org>, linux-ppp@vger.kernel.org, Guillaume Nault <g.nault@alphalink.fr>, Cyrill Gorcunov <gorcunov@openvz.org>, "David S . Miller" <davem@davemloft.net>, Jiri Slaby <jslaby@suse.cz>

From: WANG Cong <xiyou.wangcong@gmail.com>

This patch has been added to the 3.12 stable tree. If you have any
objections, please let us know.

=======
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
Signed-off-by: Jiri Slaby <jslaby@suse.cz>
---
 drivers/net/ppp/ppp_generic.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index 14a8d2958698..ab79c0f13d0a 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -2317,8 +2317,6 @@ ppp_unregister_channel(struct ppp_channel *chan)
 	spin_lock_bh(&pn->all_channels_lock);
 	list_del(&pch->list);
 	spin_unlock_bh(&pn->all_channels_lock);
-	put_net(pch->chan_net);
-	pch->chan_net = NULL;
 
 	pch->file.dead = 1;
 	wake_up_interruptible(&pch->file.rwait);
@@ -2925,6 +2923,9 @@ ppp_disconnect_channel(struct channel *pch)
  */
 static void ppp_destroy_channel(struct channel *pch)
 {
+	put_net(pch->chan_net);
+	pch->chan_net = NULL;
+
 	atomic_dec(&channel_count);
 
 	if (!pch->file.dead) {
-- 
2.10.1

