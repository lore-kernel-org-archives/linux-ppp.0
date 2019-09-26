From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Date: Thu, 26 Sep 2019 07:20:59 +0000
Subject: [PATCH 2/9] radius: fix compiler warning
Message-Id: <1569482466-9551-3-git-send-email-dev.kurt@vandijck-laurijssen.be>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
---
 pppd/plugins/radius/clientid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/pppd/plugins/radius/clientid.c b/pppd/plugins/radius/clientid.c
index d49579c..09ec3d0 100644
--- a/pppd/plugins/radius/clientid.c
+++ b/pppd/plugins/radius/clientid.c
@@ -110,7 +110,7 @@ UINT4 rc_map2id(char *name)
 	if (*name != '/')
 		strcpy(ttyname, "/dev/");
 
-	strncat(ttyname, name, sizeof(ttyname));
+	strncat(ttyname, name, sizeof(ttyname) - strlen(ttyname) -1);
 
 	for(p = map2id_list; p; p = p->next)
 		if (!strcmp(ttyname, p->name)) return p->id;
-- 
1.8.5.rc3
