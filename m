From: Paul Mackerras <paulus@samba.org>
Date: Sat, 24 Jan 2004 23:07:34 +0000
Subject: Re: pppd 2.4.2, Control-C bug?
Message-Id: <16402.64182.971593.412675@cargo.ozlabs.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <Pine.LNX.4.21.0401231150020.2019-100000@corncob.localhost.tld>
In-Reply-To: <Pine.LNX.4.21.0401231150020.2019-100000@corncob.localhost.tld>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Clifford Kite writes:

> Problem:  After pppd 2.4.2 - with the updetach option - is run by root
> from a terminal window, a control-C from the keyboard before the PPP
> link completes doesn't terminate pppd.
> 
> The line below was derived from my usual connection script and used for
> testing.
> 
> /usr/sbin/pppd connect '/usr/sbin/chat -v "" ATZ\&F OK ATM0W1\&D1%E1s95G \
> OK ATDTxxx-xxxx TIMEOUT 45 V90 \\c TIMEOUT 15 CONNECT \\d\\c' /dev/ttyS1 \
> 115200 crtscts modem updetach lock defaultroute debug
> 
> Control-C at the keyboard before the connection completes results in
> 
> Terminating on signal 2.
> 
> repeated, seemingly without end.  "kill -TERM $(pidof pppd)" doesn't
> terminate pppd or the messages.  "kill -KILL $(pidof pppd)" does both.

Yes.  We got a "bug" report from a user (who didn't understand what
the code was actually doing) and one of the ppp team checked in his
proposed fix.  I didn't catch it because it looked plausible and I
didn't think hard enough about what was going on, and because I hadn't
originally put in a big fat comment about the subtle stuff that was
going on.  The end result is this bug. :(

Just for interest, this is the patch that went in, altering pppd/main.c:

 static void
 kill_my_pg(sig)
     int sig;
 {
     struct sigaction act, oldact;

     act.sa_handler = SIG_IGN;
     act.sa_flags = 0;
-    kill(0, sig);
     sigaction(sig, &act, &oldact);
+    kill(0, sig);
     sigaction(sig, &oldact, NULL);
 }

Now, at this point we have SIGINT and SIGTERM blocked, and the kill()
call is sending the SIGINT or SIGTERM (whichever we received) to our
process group, including the current process.  If you do the kill
after setting the action for the signal to "ignore", then the signal
is blocked and ignored at the point where we generate it.  According
to POSIX, it is unspecified whether the signal is immediately
discarded in this situation or is left pending.  Linux leaves it
pending.  We then set the action back to the normal action (which is
to call a signal handler) and then return from the handler, which
unblocks the signal.  It then gets delivered.  Hence the infinite
loop.

POSIX also says that setting the action for a pending, blocked signal
to "ignore" causes the signal to be discarded.  Thus, doing the kill
before the two sigaction calls ensures that the signal we just sent
doesn't subsequently get delivered to the current process, and only
gets delivered to the other processes in the process group.  Which is
the effect we are trying to achieve.

Paul.
