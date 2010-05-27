From: Alexey Mahotkin <squadette@gmail.com>
Date: Thu, 27 May 2010 18:21:37 +0000
Subject: [PATCH 4/6] Subject: Bug#308136: Debian bug 308136 (SEGV in pppd)
Message-Id: <1274984499-9633-4-git-send-email-squadette@gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

From: Martin Lottermoser <Martin.Lottermoser@t-online.de>

The function update_db_entry() may only be called if pppdb is not NULL;
unfortunately in this situation it is. Other calls to update_db_entry()
are protected against this, see, e.g., the end of script_setenv().
---
 pppd/main.c |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/pppd/main.c b/pppd/main.c
index 014d614..3cc2624 100644
--- a/pppd/main.c
+++ b/pppd/main.c
@@ -1957,9 +1957,11 @@ script_setenv(var, value, iskey)
 		free(p-1);
 		script_env[i] = newstring;
 #ifdef USE_TDB
-		if (iskey && pppdb != NULL)
-		    add_db_key(newstring);
-		update_db_entry();
+		if (pppdb != NULL) {
+		    if (iskey)
+			add_db_key(newstring);
+		    update_db_entry();
+		}
 #endif
 		return;
 	    }
-- 
1.6.2.5

