From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Date: Thu, 26 Sep 2019 07:21:00 +0000
Subject: [PATCH 3/9] radius: make rc_own_bind_ipaddress available through radiusclient.h
Message-Id: <1569482466-9551-4-git-send-email-dev.kurt@vandijck-laurijssen.be>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
---
 pppd/plugins/radius/radiusclient.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/pppd/plugins/radius/radiusclient.h b/pppd/plugins/radius/radiusclient.h
index 51b959a..cff0c26 100644
--- a/pppd/plugins/radius/radiusclient.h
+++ b/pppd/plugins/radius/radiusclient.h
@@ -440,6 +440,7 @@ UINT4 rc_get_ipaddr __P((char *));
 int rc_good_ipaddr __P((char *));
 const char *rc_ip_hostname __P((UINT4));
 UINT4 rc_own_ipaddress __P((void));
+UINT4 rc_own_bind_ipaddress __P((void));
 
 
 /*	sendserver.c		*/
-- 
1.8.5.rc3
