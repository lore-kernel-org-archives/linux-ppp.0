From: Szymon Stefanek <s.stefanek@libero.it>
Date: Wed, 08 Aug 2007 23:59:08 +0000
Subject: pppd and rp-pppoe LCP timeout issues
Message-Id: <200708090159.08800.s.stefanek@libero.it>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi All!

Couldn't reach the pppd mantainer in a couple of days and I've seen this
problem posted on the list without an answer. I was really happy to find one 
after spending a sunday evening on it so I post it here to save someone 
else's sunday :)

There is an issue related to pppd-2.4.4 (maybe other versions too)
and the rp-pppoe daemon (have tried version 3.8 but other might be also 
affected).

The problem usually manifests itself with a pppd debug output similar
to the following:

pppd[28986]: Connect: ppp0 <--> /dev/pts/13
pppd[28986]: rcvd [LCP ConfReq id=0x0 <mru 1480> <magic 0x287a30b1>]
pppd[28986]: sent [LCP ConfReq id=0x1 <auth pap> <magic 0x2f2d3639>]
pppd[28986]: sent [LCP ConfAck id=0x0 <mru 1480> <magic 0x287a30b1>]
pppd[28986]: rcvd [LCP ConfReq id=0x1 <mru 1480> <magic 0x287a30b1>]
pppd[28986]: sent [LCP ConfAck id=0x1 <mru 1480> <magic 0x287a30b1>]
pppd[28986]: sent [LCP ConfReq id=0x1 <auth pap> <magic 0x2f2d3639>]
pppd[29986]: rcvd [LCP ConfReq id=0x2 <mru 1480> <magic 0x287a30b1>]
pppd[29986]: sent [LCP ConfAck id=0x2 <mru 1480> <magic 0x287a30b1>]
pppd[28986]: sent [LCP ConfReq id=0x1 <auth pap> <magic 0x2f2d3639>]
pppd[28986]: sent [LCP ConfReq id=0x1 <auth pap> <magic 0x2f2d3639>]
pppd[28986]: rcvd [LCP ConfReq id=0x3 <mru 1480> <magic 0x287a30b1>]
pppd[28986]: sent [LCP ConfAck id=0x3 <mru 1480> <magic 0x287a30b1>]
pppd[28986]: sent [LCP ConfReq id=0x1 <auth pap> <magic 0x2f2d3639>]
pppd[28986]: rcvd [LCP ConfReq id=0x4 <mru 1480> <magic 0x287a30b1>]
[....]
pppd[28986]: rcvd [LCP ConfReq id=0x8 <mru 1480> <magic 0x287a30b1>]
pppd[28986]: sent [LCP ConfAck id=0x8 <mru 1480> <magic 0x287a30b1>]
pppd[28986]: LCP: timeout sending Config-Requests
pppd[28986]: Connection terminated.
pppd[28986]: Modem hangup

That is packets seem to arrive correctly from the pppoe daemon to pppd but
on the other way they seem to disappear in hyperspace.

In fact a careful debugging session will show that they are going
out of pppd but never reach the pppoe daemon. 

It turns out that the problem is the safe_fork() function inside
pppd and specifically the code:

        /* dup the in, out, err fds to 0, 1, 2 */
        if (infd != 0)
                dup2(infd, 0);
        if (outfd != 1)
                dup2(outfd, 1);
        if (errfd != 2)
                dup2(errfd, 2);


        closelog();

This is around line 1560 of sys-linux.c 

It looks like closelog(), in certain conditions, closes
the stdin file of the newly forked child process.

In fact each IO call returns EBADF for a while on the pppoe
daemon side (the error isn't checked) and then, after a
later syslog() call, the descriptor
is restored, but obviously in something else: later calls to select()
on it never return succesfully (with data to read available).

It looks like syslog() reopens stdin or, more probably, dups it from
something else. This makes the children process hang and not fail
with an error.

Anyway, either commenting out the "closelog()" call or
moving it ABOVE the dup2(infd,0) solves the problem.

The root cause is probably somewhere else in the code.
I suppose that the syslog routines manage to get 0 as
their file descriptor in some way (maybe because stdin
is first closed and then a dup() is issued which finds
0 to be the lowest numbered available fd).
In the fork, dup2() closes the syslog's fd and attacches
it again as the child stdin but just some instructions later
closelog() still thinks that 0 refers to the syslog stream
and closes it once more.

-- 

Szymon Stefanek

------------------------------------------------------------------------------
-
- "We will either find a way or make one." - Hannibal
-
------------------------------------------------------------------------------
