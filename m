From: James Carlson <carlsonj@workingcode.com>
Date: Mon, 18 Sep 2006 19:48:22 +0000
Subject: Re: pppd security
Message-Id: <17678.63494.325517.506667@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <450EBBCE.5030204@freemail.gr>
In-Reply-To: <450EBBCE.5030204@freemail.gr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

jfj writes:
> 
> James Carlson wrote:
> 
> > No more or less so than it's possible to do the same via an Ethernet
> > adapter.
> 
> 
>  > /dev/ppp provides a datalink layer interface to the system. The
>  > security on such interfaces (in general) ought to be the same.
> 
> So it is possible to dump UDP packets to /dev/ppp (and /dev/eth (and PPP
> packets to /dev/tty)). More or less...
> 
> If I understand correctly, the only program that is supposed to use
> /dev/ppp is pppd, to establish the connection.

Yes.

> After that the packets
> go there through the internal TCP/IP stack. And noone else should
> be messing with /dev/ppp normally.

That's right.

> If so, does it sound like a feasible idea to hack the kernel to forbid
> opening the /dev/ppp device to other processes, once pppd is working?

It sounds plausible, but since I don't understand the trust model
you're working with, I'm afraid I can't address the broader questions.

(In particular, pppd needs a substantial amount of privilege in order
to run the /etc/ppp/ip-{up,down} scripts properly.  Given that level
of privilege, and the trust that it necessarily implies, I think that
if you have problems in pppd, you're already sunk, no matter how you
try to limit the scope.)

> Another idea is to rename /dev/ppp to /dev/secretppp and hack pppd
> to use that instead?

I don't see any point to that at all.  That'd just be security-by-
obscurity.

> Other ideas to lock access to /dev/ppp?

I'd worry first about the trust model.  Trusted applications shouldn't
be jumping through hoops to get the job done, because if they're
compromised, then all bets are already off.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
