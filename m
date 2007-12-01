From: James Carlson <carlsonj@workingcode.com>
Date: Sat, 01 Dec 2007 18:18:19 +0000
Subject: Re: No packets get through after a while
Message-Id: <18257.42347.159949.914679@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Robert Voigt writes:
> I have a ppp connection from an embedded board with Fedora 7 (ppp 2.4.4,
> stock kernel-2.6.21) over null modem cable to a FC6 PC (ppp 2.4.4,
> kernel 2.6.18). I'm pinging from the board to the PC. After a while, it
> can be a few minutes or several hours, no packets from ping or anything
> else get through. It works again when I restart pppd on the board.

That sounds a lot like a flow control bug.  Have you tried running
without flow control enabled?

Do you have access to a serial line analyzer?

> The only thing I notice is when I start pppd on the commandline, when it
> hangs and I Ctrl-C it, it does not return. On the second Ctrl-C it says:
> tcsetattr: Interrupted system call (line 1001)
> It returns on the third Ctrl-C.

Ioctls that hang in the driver are, in my experience, typically the
result of flow control problems.

> I have tried a debug version of ppp 2.4.4. When it hangs the backtrace
> shows the last line in ppp code is sys-linux.c:1051
> void wait_input(struct timeval *timo)
> {
> ...
>     n = select(max_in_fd + 1, &ready, NULL, &exc, timo);
> ...
> }

That's the normal idle loop for pppd.  It _should_ be there while it's
waiting for something to do.

> But that seems to be always the place where it waits after
> initialization. Is it in the kernel part of ppp then?

I think it's either a serial driver problem or even possibly a
hardware problem.  A badly-wired null modem cable, for example, could
cause a system to wedge itself.

It should be symmetrical if you're using hardware flow control.  RTS
on one side should connect to CTS on the other.  If RTS were looped
back to the local CTS, then when you get into a state where you had to
tell the peer to stop sending (RTS deasserted), you'd end up telling
yourself to stop transmitting instead (CTS deasserted), and you'd get
stuck.  Just a guess, though.  There are probably quite a few
different problems that could end up causing similar symptoms, which
is why I'd recommend looking at it with a serial line analyzer first
(or at _least_ a breakout box).

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
