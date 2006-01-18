From: James Carlson <carlsonj@workingcode.com>
Date: Wed, 18 Jan 2006 17:35:36 +0000
Subject: Re: advice needed
Message-Id: <17358.31848.806895.303983@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <43CE76A1.1020409@asist-traffic.com>
In-Reply-To: <43CE76A1.1020409@asist-traffic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Babarovic Ivica writes:
> Since I need to keep vxworks setup and programs untouched  (it needs to
> work as
> plug in linux box, plug out linux box) I've come with a following idea.
> 
> I made a program that connects serial ports on linux board so vxworks
> box can
> freely access modem across linux box and initialize it. I'm catching the
> "CONNECT" string here  and after that, I break the serial port
> connection/exit
> program. I start ppp link on serial side towards vxworks and that makes
> it happy.

PPP itself (irrespective of the hardware or OS in use) generally can't
work that way because it's a network protocol that involves shared
state between the peers.  The local problems of having this somehow
"work" on Linux pale in comparison to the high-level problems.

I can think of two ways to make the overall model work, and perhaps a
few variations on them.  The first (and certainly easiest) method
would be to have two _separate_ PPP links, like this:

	VxWorks <---PPP1---> Linux <---PPP2---> GPRS

In this scenario, the Linux box would see two network interfaces --
probably named "ppp0" and "ppp1."  To get packets from VxWorks out to
the GPRS system, any of the following variations would work:

  - Run NAT on the Linux box so that both VxWorks and the Linux
    applications are behind the same IP address, as far as the GPRS
    device can tell.  If you have inbound connections over GPRS, this
    may be harder to use.

  - Route (forward) between these interfaces.  The VxWorks system and
    the Linux system will need separate IP addresses, and the GPRS
    system will need to know to treat your Linux box as the next hop
    router for the VxWorks system.  If you have cooperation of the
    GPRS provider (unlikely, I'd imagine), this solution would be
    simple.

  - Run application layer proxies on the Linux box.  The VxWorks
    system would connect to SOCKS proxies or other (perhaps custom)
    applications that in turn open connections over the second PPP
    link to the rest of the world.

The other solution, which is much closer to what I think you're
suggesting, but is also much closer to being science fiction, would be
to have the Linux box behave as a custom L2 bridge for PPP traffic.
You'd have to modify the kernel so that it knows how to forward
particular IP packets to the intended receiver, and the pppd daemon so
that it knows how to forward PPP negotiation parameters (IPCP
addresses and the like) between two separate links.  The result would
be something like:

	VxWorks <---PPP1a---> Linux <---PPP1b---> GPRS

Doable, perhaps, but quite an involved project, and something that
would likely require the help of people who know both the Linux kernel
and pppd code _very_ well.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
