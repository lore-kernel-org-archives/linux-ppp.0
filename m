From: James Cameron <james.cameron@hp.com>
Date: Thu, 01 Jan 2004 22:53:59 +0000
Subject: CVS 20040201, "Terminating on signal 2" loop
Message-Id: <20040101225359.GA31516@hp.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

I was just giving PPP in CVS a test run, started a connection through a
pty, which established normally, and then pressed Control/C.  pppd then
reported "Terminating on signal 2." 10376 times and segfaulted.

Quite reproducible.  So I did an strace and looked at the source.  On
receipt of a SIGINT from Control/C, term() calls kill_my_pg() to signal the
process group.

It appears that despite kill_my_pg() calling sigaction() to ignore the
signal being resent to the process group, the kernel sends pppd a SIGINT
again.

667   --- SIGINT (Interrupt) @ 0 (0) ---
667   time([1072996209])                = 1072996209
667   getpid()                          = 667
667   rt_sigaction(SIGPIPE, {0x4013ebe0, [], SA_RESTORER, 0x40094498},
{SIG_IGN}
, 8) = 0
667   send(3, "<30>Jan  2 09:30:09 pppd[667]: T"..., 55, 0) = 55
667   rt_sigaction(SIGPIPE, {SIG_IGN}, NULL, 8) = 0
667   write(2, "Terminating on signal 2.", 24) = 24
667   write(2, "\n", 1)                 = 1
667   rt_sigaction(SIGINT, {SIG_IGN}, {0x8050290, [HUP INT USR2 TERM
CHLD], SA_R
ESTORER, 0x40094498}, 8) = 0
667   kill(0, SIGINT)                   = 0
667   rt_sigaction(SIGINT, {0x8050290, [HUP INT USR2 TERM CHLD],
SA_RESTORER, 0x
40094498}, NULL, 8) = 0
667   rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0
667   --- SIGINT (Interrupt) @ 0 (0) ---
[...]
667   --- SIGINT (Interrupt) @ 0 (0) ---
667   --- SIGSEGV (Segmentation fault) @ 0 (0) ---
667   --- SIGSEGV (Segmentation fault) @ 0 (0) ---
667   +++ killed by SIGSEGV +++

Kernel is 2.4.23 from Debian sources, with MPPE patch applied from PPP
CVS.  The connection was using MPPE, but I doubt that relates.  Pentium
266MHz test machine.

If I try running under gdb, Control/C stops the program so gdb can take
over, and "continue" results in normal disconnection and exit.

Anyone know the cause?  It seems pppd is doing the right thing, but I
don't recall whether sigaction() has immediate effect or not.

-- 
James Cameron                         http://quozl.netrek.org/
HP Open Source, Volunteer             http://opensource.hp.com/
PPTP Client Project, Release Engineer http://pptpclient.sourceforge.net/
