From: Pedro Zorzenon Neto <pzn@terra.com.br>
Date: Wed, 21 Jul 2004 14:31:50 +0000
Subject: race condition id pppd when using pty option
Message-Id: <20040721143149.GA15308@mantis.autsens.localnet>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="BXVAT5kNtrzKuDFl"
List-Id: <linux-ppp.vger.kernel.org>
To: linux-ppp@vger.kernel.org


--BXVAT5kNtrzKuDFl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 19, 2004 at 09:41:14AM -0300, Pedro Zorzenon Neto wrote:
> Hi,
> 
>   Please read my message at:
>     http://bugs.debian.org/227899
> 
>   Can you apply the following patch to ppp to fix it?
>     http://bugs.debian.org/cgi-bin/bugreport.cgi/ppp.diff?bug=227899&msg=3&att=1
> 
>   Thanks,
>     Pedro

Hi folks,

  Sorry for not telling anything in my previous message about the bug.
I'll explain it now.

  When you use "pppd" with "pty" option, pppd creates childs and there
is a race condicion when lcp-echo fails that pppd waits forever child to
terminate. The attached patch solves the problem, sending signals to
child if it does not finish after some seconds. The patch was generated
from 2.4.1.uus-4 debian package of ppp.

  If you want to know an example of use of pppd that reaches this race
condition, see below.

  Thanks in advance,
    Pedro

--- description of a real world race condition ---

  When you use "pppd" with "pty" option, to create a ppp tunnel between
a host and a serial port connected in other host, this way (nc is netcat):

  My computer runs (I simplified to shell, but it is really a C program):
    while true; do 
      pppd pty 'nc put.link.computer.ip.here 5522' 192.168.3.1:192.168.3.2 noauth debug nodetach lcp-echo-interval 20 lcp-echo-failure 6
    done

  The other computer runs (link computer):
    while true; do
      nc -l -p 5522 < /dev/ttyS0 > /dev/ttyS0
    done

  So I create a tunnel like this:

                               serial                     tcp
serial-ppp-capable-hardware ------------ link computer --------- my computer

  The link establishes ok, but when I have communication problems:

  If TCP connection fails, but serial connection is OK:
     after a timeout, "nc" finishes. "pppd" detects that "nc" finished
and exits -> this is OK.

  If serial connection fails, but tcp conection is OK:
     after 6 lcp-echo-failures, "pppd" finishes the ppp connection and
waits for "nc" to finish. Since the tcp connection is ok, "nc" never
finishes. -> "pppd" hangs... it waits forever

  In real world, with my hardware, it occours about twice a week.
Without the patch, I have to log in my-computer and kill "nc" manually.

--BXVAT5kNtrzKuDFl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="ppp.diff"

diff -ur ppp.orig/pppd/main.c ppp/pppd/main.c
--- ppp.orig/pppd/main.c	Tue Sep 23 12:15:22 2003
+++ ppp/pppd/main.c	Thu Jan 15 12:04:28 2004
@@ -624,7 +624,7 @@
     }
 
     /* Wait for scripts to finish */
-    /* XXX should have a timeout here */
+    /* timeout is handled by "reap_kids(1)" */
     while (n_children > 0) {
 	if (debug) {
 	    struct subprocess *chp;
@@ -1710,40 +1710,95 @@
 reap_kids(waitfor)
     int waitfor;
 {
-    int pid, status;
+    int pid, status, signal_cnt, signal_num;
     struct subprocess *chp, **prevp;
 
+    signal_cnt = 0;
+
     if (n_children == 0)
-	return 0;
-    while ((pid = waitpid(-1, &status, (waitfor? 0: WNOHANG))) != -1
-	   && pid != 0) {
-	for (prevp = &children; (chp = *prevp) != NULL; prevp = &chp->next) {
+      return 0; /* there is no kid active */
+
+    while (1) {
+
+      pid = waitpid(-1, &status, WNOHANG);
+      if (pid == -1) {
+	/* waitpid error */
+	if (errno == ECHILD)
+	  return -1;
+	if (errno != EINTR)
+	  error("Error waiting for child process: %m");
+	break; /* exit while loop */
+
+      } else {
+	/* waitpid success */
+
+	if (pid == 0) {
+	  /* kids are running */
+	  if (waitpid == 0)
+	    /* we do not want to wait for kids... */
+	    break; /* exit while loop */
+
+	  /* send kids a signal */
+	  signal_num = 0;
+	  signal_cnt++;
+	  switch (signal_cnt) {
+	  case 1:
+	    signal_num = SIGTERM;
+	    break;
+	  case 2:
+	    signal_num = SIGQUIT;
+	    break;
+	  default:
+	    signal_num = SIGKILL;
+	    signal_cnt--;
+	    break;
+	  }
+	  for (prevp = &children; (chp = *prevp) != NULL; prevp = &chp->next) {
+	    if (debug) {
+	      dbglog("  Sending signal %d to pid %d", signal_num, chp->pid);
+	    }
+	    kill(chp->pid,signal_num);
+	  }
+	  if (signal_num != SIGKILL) {
+	    if (debug)
+	      dbglog("  Waiting 2 seconds for children to finish");
+	    sleep(2);
+	  }
+
+	} else {
+	  
+	  /* a kid has finished */
+
+	  /* update number of active kids */
+	  for (prevp = &children; (chp = *prevp) != NULL; prevp = &chp->next) {
 	    if (chp->pid == pid) {
-		--n_children;
-		*prevp = chp->next;
-		break;
+	      --n_children;
+	      *prevp = chp->next;
+	      break;
 	    }
-	}
-	if (WIFSIGNALED(status)) {
+	  }
+	  
+	  if (WIFSIGNALED(status)) {
 	    warn("Child process %s (pid %d) terminated with signal %d",
 		 (chp? chp->prog: "??"), pid, WTERMSIG(status));
-	} else if (debug)
+	  } else if (debug)
 	    dbglog("Script %s finished (pid %d), status = 0x%x",
 		   (chp? chp->prog: "??"), pid,
 		   WIFEXITED(status) ? WEXITSTATUS(status) : status);
-	if (chp && chp->done)
+	  if (chp && chp->done)
 	    (*chp->done)(chp->arg);
-	if (chp)
+	  if (chp)
 	    free(chp);
+
+	  break; /* exit while loop */
+	}
+	
+      }
     }
-    if (pid == -1) {
-	if (errno == ECHILD)
-	    return -1;
-	if (errno != EINTR)
-	    error("Error waiting for child process: %m");
-    }
+
     return 0;
 }
+    
 
 /*
  * add_notifier - add a new function to be called when something happens.

--BXVAT5kNtrzKuDFl--
