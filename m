From: James Carlson <carlsonj@workingcode.com>
Date: Wed, 06 Jun 2007 10:53:11 +0000
Subject: Re: Help with PPPoE
Message-Id: <18022.37399.364755.791866@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <4593E72B.30603@freemail.gr>
In-Reply-To: <4593E72B.30603@freemail.gr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Jerald Fitzjerald writes:
> I'm trying to setup a PPPoE in a Linux-From-Scratch system based on an old SuSE.
> Things seem to work, but although i use the options `usepeerdns`
> and `defaultroute`, pppd does not update the routing table nor
> the resolv.conf.

Note that pppd writes to /etc/ppp/resolv.conf, not directly to /etc.
If you want to use pppd's DNS information, either create a symlink,
like this:

	ln -s /etc/ppp/resolv.conf /etc/resolv.conf

... or write an /etc/ppp/ip-up script to transfer data as required.

> 	default         10.0.0.138      0.0.0.0         UG    0      0        0 eth0

That existing default route will prevent pppd from installing its own
default route.  Pppd tries not to disrupt the existing routing table.

Either remove that route via eth0 before starting pppd, or find some
other way (such as an active routing protocol) to compute the routes
you need.

> So I kill pppd and say:
> 
> 	route del default
> 
> and re-run pppd:
> This time I have the routing table:

Right; as above, that's intentional.

> But unfortunately, the network is unreachable.  I try to connect
> to hosts by IP address, but I'm not getting any packets.

This sounds like a separate problem to debug.

> 	rcvd [LCP ConfNak id=0x2 <mru 1500>]

What?  That doesn't make sense with PPPoE.

> 	not replacing existing default route via 10.0.0.138

That explains the first default route problem.  This doesn't look like
a log from the second failing case (after deleting the eth0 route),
though.

> How can I debug this further?
> Any help will be vastly appreciated.

More details are needed on the second failing case.  Perhaps a tcpdump
or ethereal trace on the Ethernet interface running PPPoE (eth0?)
would help narrow things down.

Is it possible that you just have name service problems due to the
resolv.conf confusion?  Try "ping -n".

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
