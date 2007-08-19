From: "Marco d'Itri" <md@linux.it>
Date: Sun, 19 Aug 2007 01:37:42 +0000
Subject: [patch 02/14] always create a new process group
Message-Id: <20070819014008.913828746@bongo.bofh.it>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

pppd sends signals to the whole process group, so it must always create
a new one or it may kill the parent process and its siblings.
Currently setsid() is not called when the updetach option is used.
We want to make the detached and non-detached code paths as similar as
possible.

http://ppp.samba.org/cgi-bin/ppp-bugs/incoming?id11
http://ppp.samba.org/cgi-bin/ppp-bugs/incoming?id89

--- a/pppd/main.c
+++ b/pppd/main.c
@@ -433,6 +433,13 @@ main(argc, argv)
     }
 
     /*
+     * pppd sends signals to the whole process group, so it must always
+     * create a new one or it may kill the parent process and its siblings.
+     */
+    setsid();
+    chdir("/");
+
+    /*
      * Initialize system-dependent stuff.
      */
     sys_init();
@@ -775,8 +782,6 @@ detach()
 	create_linkpidfile(pid);
 	exit(0);		/* parent dies */
     }
-    setsid();
-    chdir("/");
     dup2(fd_devnull, 0);
     dup2(fd_devnull, 1);
     dup2(fd_devnull, 2);

-- 
ciao,
Marco

