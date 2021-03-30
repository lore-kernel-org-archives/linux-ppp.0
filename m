From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Date: Tue, 30 Mar 2021 09:51:30 +0000
Subject: [PATCH] ppp: deflate: Remove useless call "zlib_inflateEnd"
Message-Id: <1617097890-27020-1-git-send-email-jiapeng.chong@linux.alibaba.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: paulus@samba.org
Cc: davem@davemloft.net, kuba@kernel.org, linux-ppp@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Fix the following whitescan warning:

Calling "zlib_inflateEnd(&state->strm)" is only useful for its return
value, which is ignored.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/net/ppp/ppp_deflate.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ppp/ppp_deflate.c b/drivers/net/ppp/ppp_deflate.c
index c457f84..e6d48e5 100644
--- a/drivers/net/ppp/ppp_deflate.c
+++ b/drivers/net/ppp/ppp_deflate.c
@@ -279,7 +279,6 @@ static void z_decomp_free(void *arg)
 	struct ppp_deflate_state *state = (struct ppp_deflate_state *) arg;
 
 	if (state) {
-		zlib_inflateEnd(&state->strm);
 		vfree(state->strm.workspace);
 		kfree(state);
 	}
-- 
1.8.3.1
