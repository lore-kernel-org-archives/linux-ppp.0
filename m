From: Joakim Tjernlund <joakim.tjernlund@infinera.com>
Date: Fri, 15 Nov 2019 16:40:31 +0000
Subject: [PATCH 2/2] Change IPv6 interface prefix to 128
Message-Id: <20191115164031.18940-2-joakim.tjernlund@infinera.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

/10 covers the whole Link Local range which is too big.

Signed-off-by: Joakim Tjernlund <joakim.tjernlund@infinera.com>
---
 pppd/sys-linux.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/pppd/sys-linux.c b/pppd/sys-linux.c
index 42c9db4..8e65250 100644
--- a/pppd/sys-linux.c
+++ b/pppd/sys-linux.c
@@ -2757,7 +2757,7 @@ int sif6addr (int unit, eui64_t our_eui64, eui64_t his_eui64)
     memset(&ifr6, 0, sizeof(ifr6));
     IN6_LLADDR_FROM_EUI64(ifr6.ifr6_addr, our_eui64);
     ifr6.ifr6_ifindex = ifr.ifr_ifindex;
-    ifr6.ifr6_prefixlen = 10;
+    ifr6.ifr6_prefixlen = 128;
 
     if (ioctl(sock6_fd, SIOCSIFADDR, &ifr6) < 0) {
 	error("sif6addr: ioctl(SIOCSIFADDR): %m (line %d)", __LINE__);
@@ -2805,7 +2805,7 @@ int cif6addr (int unit, eui64_t our_eui64, eui64_t his_eui64)
     memset(&ifr6, 0, sizeof(ifr6));
     IN6_LLADDR_FROM_EUI64(ifr6.ifr6_addr, our_eui64);
     ifr6.ifr6_ifindex = ifr.ifr_ifindex;
-    ifr6.ifr6_prefixlen = 10;
+    ifr6.ifr6_prefixlen = 128;
 
     if (ioctl(sock6_fd, SIOCDIFADDR, &ifr6) < 0) {
 	if (errno != EADDRNOTAVAIL) {
-- 
2.23.0
