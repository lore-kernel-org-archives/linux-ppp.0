From: Joakim Tjernlund <joakim.tjernlund@infinera.com>
Date: Fri, 15 Nov 2019 16:40:30 +0000
Subject: [PATCH 1/2] Change IPv6 route prefix to 128
Message-Id: <20191115164031.18940-1-joakim.tjernlund@infinera.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Adding a /10 route isn't useful. Covert to /128 host route so
one can actually ping the remote side.

Signed-off-by: Joakim Tjernlund <joakim.tjernlund@infinera.com>
---
 pppd/sys-linux.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/pppd/sys-linux.c b/pppd/sys-linux.c
index 89263ed..42c9db4 100644
--- a/pppd/sys-linux.c
+++ b/pppd/sys-linux.c
@@ -2767,8 +2767,8 @@ int sif6addr (int unit, eui64_t our_eui64, eui64_t his_eui64)
     /* Route to remote host */
     memset(&rt6, 0, sizeof(rt6));
     IN6_LLADDR_FROM_EUI64(rt6.rtmsg_dst, his_eui64);
-    rt6.rtmsg_flags = RTF_UP;
-    rt6.rtmsg_dst_len = 10;
+    rt6.rtmsg_flags = RTF_UP | RTF_HOST;
+    rt6.rtmsg_dst_len = 128;
     rt6.rtmsg_ifindex = ifr.ifr_ifindex;
     rt6.rtmsg_metric = 1;
 
-- 
2.23.0
