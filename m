From: Ross Vandegrift <ross@willow.seitz.com>
Date: Mon, 02 Feb 2004 22:29:36 +0000
Subject: Re: pppd not setting netmask
Message-Id: <20040202222936.GA6794@willow.seitz.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20040130190514.GB16326@willow.seitz.com>
In-Reply-To: <20040130190514.GB16326@willow.seitz.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Mon, Feb 02, 2004 at 01:55:37PM -0800, Bill Unruh wrote:
> Why in the world would you want to insert routing code into ppp-- liable
> to be buggy, inconsistant, etc-- when your ordinary routing code in the
> system is perfectly capable of handling it.

Well, it's not that I want anything inserted into ppp - I'm just trying
to understand why things are different on Linux.  I'm confused because this
is how it's often done on Cisco and I can't see why it's wrong:

           1.1.1.1/24   2.2.2.1/30   2.2.2.2/30    3.3.3.1/24
{NETA} <--ethernet--> RTR1 <---via PTP T1---> RTR2 <--ethernet--> {NETB}

The interfaces on RTR1 and RTR2 that are directly connected are
configured to be the only IPs on a /30 network.

The situation on GNU/Linux with pppd is aparantly different.  I'm not
trying to say we should change it if it's right - it's very possible
that I need to be thinking about networks differently.

> > If it's a technical issue, are there things I can do to help?  My
> > employer probably wouldn't mind me spending some time on this to have
> > our tunnels work the way we assumed they would.
> 
> Just set up explicit routing of the other stuff you want to go through
> the link.

I'm trying to avoid setting up explicit routes in a dynamic network.
Fail-over routing is much easier if all routes are dynamically handled
via ospf.  Perhaps if I give a quick explanation of the problem I'll
make more sense:

The way things are done now, is that the connected route for ppp0 is set
to the *other* end of the tunnel.  If RTR1 and RTR2 above are instead
configured using pppd, RTR1 won't know how to route to its own ppp0 interface
until it receives an OSPF route from the other end.  Then, on RTR1, you end
up with this really weird routing table:

C>* 2.2.2.2/32 is directly connected, ppp0
O>* 2.2.2.1/32 [110/20] via 10.100.100.2, ppp0, 6d20h09m

So now RTR1 thinks it needs to route through RTR to get to it's own PPP
interface.

The reason I thought this was a problem in pppd is because the manpage
documents a "netmask" statement that sounds like it does exactly what I
want!

(In reality, something, somewhere steps in and overrides the routing
table with some sanity - packets to 2.2.2.1 don't actually traverse the
ppp connection.  I have no idea how this happens without a route.)

Thanks,

Ross Vandegrift
