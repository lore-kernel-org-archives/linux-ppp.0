From: James Carlson <carlsonj@workingcode.com>
Date: Fri, 21 Mar 2008 16:48:59 +0000
Subject: Re: pppd + static routes
Message-Id: <18403.59131.394390.816826@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <47E3408F.1000609@stekloprom.ru>
In-Reply-To: <47E3408F.1000609@stekloprom.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Bill Unruh writes:
> On Fri, 21 Mar 2008, Charlie Brady wrote:
> 
> >
> > On Fri, 21 Mar 2008, Vladi Lemurov wrote:
> >
> >>  lame. Is it possible to push the routes via ppp.
> >
> > No. PPP's IPCP doesn't allow for that, although there was once a proposed 
> > extension:
> 
> That sounds like a bad idea.

Indeed.  Here's one such (dead) proposal:

  https://datatracker.ietf.org/drafts/draft-kehn-info-ppp-ipcp-ext/

PPPoE itself (outside of PPP) has a mechanism for carrying routes and
even URLs (!).  It's also a pretty bad idea -- not that this seems to
stop folks who think that since PPP can negotiate, it should just
negotiate everything.

> PPP is Point to Point protocol. It is a means
> of connecting two computers together. Once they are connected then you can
> do whatever you want with the connection, including routing things over
> that connection. Overloading that negotiation with all kinds of stuff which
> have nothing to do with that connection seems like a bad idea.

Or you can just say "wrong layer."  PPP is effectively an L2
transport.  It negotiates L2-relevant things (such as MTU), and other
bits are done at other layers.

> About all
> you can do is to make it the default routing, which for example the Linux
> pppd can already do, but has nothing to with the ppp negotiation. Surely
> each machine knows what it wants to do over that connection, and should not
> be told by the other end what to do.

Actually, you can do much more than that.  Almost all IP routing
protocols work fine with PPP connections -- you can use RIP, OSPF, or
even BGP to transfer routes, depending on what your network
architecture looks like.

IS-IS would work as well to compute IP routes, except that pppd
doesn't currently have support for ISO negotiation that it needs.

The right question to ask yourself in questions of PPP negotiation is:
"what would I do if the interface were Ethernet instead?"  If the
answer is, "I wouldn't have this problem, because it's a different
link layer" or "I'd use IEEE specification 802.{xxx}," then you might
be looking at a new PPP option.  If the answer is, "I'd use {DHCP,
GateD/Zebra/Quagga, DNS}," then it sounds like a better answer is
already available and requires no PPP changes.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
