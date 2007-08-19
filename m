From: "Marco d'Itri" <md@linux.it>
Date: Sun, 19 Aug 2007 01:37:47 +0000
Subject: [patch 07/14] fix segfault in update_db_entry()
Message-Id: <20070819014009.424487957@bongo.bofh.it>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

From: Martin.Lottermoser@t-online.de
Subject: [patch 07/14] Bug#308136: Debian bug 308136 (SEGV in pppd)

The function update_db_entry() may only be called if pppdb is not NULL;
unfortunately in this situation it is. Other calls to update_db_entry()
are protected against this, see, e.g., the end of script_setenv().

--- a/pppd/main.c
+++ b/pppd/main.c
@@ -1942,9 +1942,11 @@ script_setenv(var, value, iskey)
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
ciao,
Marco

