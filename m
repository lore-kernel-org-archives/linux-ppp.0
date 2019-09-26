From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Date: Thu, 26 Sep 2019 07:21:06 +0000
Subject: [PATCH 9/9] pppd: refactor setjmp/longjmp with pipe pair in event wait loop
Message-Id: <1569482466-9551-10-git-send-email-dev.kurt@vandijck-laurijssen.be>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

setjmp/longjmp isn't supported by all compilers.
Having a pipe pair to wake an event wait loop from within a signal handler
is rather portable and common enough.

Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
---
 pppd/main.c | 41 +++++++++++++++++++++++++----------------
 pppd/tty.c  |  1 -
 2 files changed, 25 insertions(+), 17 deletions(-)

diff --git a/pppd/main.c b/pppd/main.c
index b0d772b..41be532 100644
--- a/pppd/main.c
+++ b/pppd/main.c
@@ -80,7 +80,6 @@
 #include <netdb.h>
 #include <utmp.h>
 #include <pwd.h>
-#include <setjmp.h>
 #include <sys/param.h>
 #include <sys/types.h>
 #include <sys/wait.h>
@@ -180,7 +179,7 @@ int got_sighup;
 
 static sigset_t signals_handled;
 static int waiting;
-static sigjmp_buf sigjmp;
+static int sigpipe[2];
 
 char **script_env;		/* Env. variable values for scripts */
 int s_env_nalloc;		/* # words avail at script_env */
@@ -598,19 +597,21 @@ static void
 handle_events()
 {
     struct timeval timo;
+    unsigned char buf[16];
 
     kill_link = open_ccp_flag = 0;
-    if (sigsetjmp(sigjmp, 1) = 0) {
-	sigprocmask(SIG_BLOCK, &signals_handled, NULL);
-	if (got_sighup || got_sigterm || got_sigusr2 || got_sigchld) {
-	    sigprocmask(SIG_UNBLOCK, &signals_handled, NULL);
-	} else {
-	    waiting = 1;
-	    sigprocmask(SIG_UNBLOCK, &signals_handled, NULL);
-	    wait_input(timeleft(&timo));
-	}
-    }
+
+    /* alert via signal pipe */
+    waiting = 1;
+    /* flush signal pipe */
+    for (; read(sigpipe[0], buf, sizeof(buf)) > 0; );
+    add_fd(sigpipe[0]);
+    /* wait if necessary */
+    if (!(got_sighup || got_sigterm || got_sigusr2 || got_sigchld))
+	wait_input(timeleft(&timo));
     waiting = 0;
+    remove_fd(sigpipe[0]);
+
     calltimeout();
     if (got_sighup) {
 	info("Hangup (SIGHUP)");
@@ -645,6 +646,14 @@ setup_signals()
 {
     struct sigaction sa;
 
+    /* create pipe to wake up event handler from signal handler */
+    if (pipe(sigpipe) < 0)
+	fatal("Couldn't create signal pipe: %m");
+    fcntl(sigpipe[0], F_SETFD, fcntl(sigpipe[0], F_GETFD) | FD_CLOEXEC);
+    fcntl(sigpipe[1], F_SETFD, fcntl(sigpipe[1], F_GETFD) | FD_CLOEXEC);
+    fcntl(sigpipe[0], F_SETFL, fcntl(sigpipe[0], F_GETFL) | O_NONBLOCK);
+    fcntl(sigpipe[1], F_SETFL, fcntl(sigpipe[1], F_GETFL) | O_NONBLOCK);
+
     /*
      * Compute mask of all interesting signals and install signal handlers
      * for each.  Only one signal handler may be active at a time.  Therefore,
@@ -1431,7 +1440,7 @@ hup(sig)
 	kill_my_pg(sig);
     notify(sigreceived, sig);
     if (waiting)
-	siglongjmp(sigjmp, 1);
+	write(sigpipe[1], &sig, sizeof(sig));
 }
 
 
@@ -1452,7 +1461,7 @@ term(sig)
 	kill_my_pg(sig);
     notify(sigreceived, sig);
     if (waiting)
-	siglongjmp(sigjmp, 1);
+	write(sigpipe[1], &sig, sizeof(sig));
 }
 
 
@@ -1466,7 +1475,7 @@ chld(sig)
 {
     got_sigchld = 1;
     if (waiting)
-	siglongjmp(sigjmp, 1);
+	write(sigpipe[1], &sig, sizeof(sig));
 }
 
 
@@ -1501,7 +1510,7 @@ open_ccp(sig)
 {
     got_sigusr2 = 1;
     if (waiting)
-	siglongjmp(sigjmp, 1);
+	write(sigpipe[1], &sig, sizeof(sig));
 }
 
 
diff --git a/pppd/tty.c b/pppd/tty.c
index c9a0b33..7ece675 100644
--- a/pppd/tty.c
+++ b/pppd/tty.c
@@ -83,7 +83,6 @@
 #include <netdb.h>
 #include <utmp.h>
 #include <pwd.h>
-#include <setjmp.h>
 #include <sys/param.h>
 #include <sys/types.h>
 #include <sys/wait.h>
-- 
1.8.5.rc3
