From: "Marco d'Itri" <md@linux.it>
Date: Sun, 19 Aug 2007 01:37:53 +0000
Subject: [patch 13/14] make _PATH_CONNERRS world readable
Message-Id: <20070819014010.047923792@bongo.bofh.it>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

There is nothing security-sensitive there.

--- a/pppd/main.c
+++ b/pppd/main.c
@@ -1620,7 +1620,7 @@ device_script(program, in, out, dont_wai
     if (log_to_fd >= 0)
 	errfd = log_to_fd;
     else
-	errfd = open(_PATH_CONNERRS, O_WRONLY | O_APPEND | O_CREAT, 0600);
+	errfd = open(_PATH_CONNERRS, O_WRONLY | O_APPEND | O_CREAT, 0644);
 
     ++conn_running;
     pid = safe_fork(in, out, errfd);

-- 
ciao,
Marco

