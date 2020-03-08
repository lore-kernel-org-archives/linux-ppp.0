From: Nigel Kukard <nkukard@lbsd.net>
Date: Sun, 08 Mar 2020 08:29:58 +0000
Subject: [PATCH] pppd: Fixed spelling 'unkown' => 'unknown'
Message-Id: <20200308082958.191555-1-nkukard@lbsd.net>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Fixed spelling in pppd/plugins/radius/config.c from 'unkown' to 'unknown'.

Signed-off-by: Nigel Kukard <nkukard@lbsd.net>
---
 pppd/plugins/radius/config.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/pppd/plugins/radius/config.c b/pppd/plugins/radius/config.c
index c5a4eeb..871cea0 100644
--- a/pppd/plugins/radius/config.c
+++ b/pppd/plugins/radius/config.c
@@ -273,7 +273,7 @@ char *rc_conf_str(char *optname)
 	option = find_option(optname, OT_STR);
 
 	if (option = NULL)
-		fatal("rc_conf_str: unkown config option requested: %s", optname);
+		fatal("rc_conf_str: unknown config option requested: %s", optname);
 	return (char *)option->val;
 }
 
@@ -284,7 +284,7 @@ int rc_conf_int(char *optname)
 	option = find_option(optname, OT_INT|OT_AUO);
 
 	if (option = NULL)
-		fatal("rc_conf_int: unkown config option requested: %s", optname);
+		fatal("rc_conf_int: unknown config option requested: %s", optname);
 	return *((int *)option->val);
 }
 
@@ -295,7 +295,7 @@ SERVER *rc_conf_srv(char *optname)
 	option = find_option(optname, OT_SRV);
 
 	if (option = NULL)
-		fatal("rc_conf_srv: unkown config option requested: %s", optname);
+		fatal("rc_conf_srv: unknown config option requested: %s", optname);
 	return (SERVER *)option->val;
 }
 
-- 
2.25.1
