From: Paul Mackerras <paulus@samba.org>
Date: Tue, 03 Feb 2004 04:43:48 +0000
Subject: Re: pppd not setting netmask
Message-Id: <16415.9988.998758.531199@cargo.ozlabs.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20040130190514.GB16326@willow.seitz.com>
In-Reply-To: <20040130190514.GB16326@willow.seitz.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Ross Vandegrift writes:

> The way things are done now, is that the connected route for ppp0 is set
> to the *other* end of the tunnel.  If RTR1 and RTR2 above are instead
> configured using pppd, RTR1 won't know how to route to its own ppp0 interface
> until it receives an OSPF route from the other end.  Then, on RTR1, you end
> up with this really weird routing table:
> 
> C>* 2.2.2.2/32 is directly connected, ppp0
> O>* 2.2.2.1/32 [110/20] via 10.100.100.2, ppp0, 6d20h09m
> 
> So now RTR1 thinks it needs to route through RTR to get to it's own PPP
> interface.

That looks like a bug in the OSPF daemon - it should realize that no
routing is needed to get the local address of any interface.  But it
shouldn't matter anyway since no-one will be using that address as the
endpoint of any connections, I would expect.

In fact, from the kernel's point of view, there is really no need to
have addresses on either end of the ppp link, because routes can
specify a device instead of a gateway address.  This is different from
the BSD IP implementation, where the routing table was used to
translate a destination address into a gateway address, and then there
was a step to find an interface which could handle the gateway
address.  On Linux, a route can specify an interface directly.
Thus, apart from the fact that pppd gets upset if it can't work out IP
addresses for both ends of the link, you could in principle just add
a route like this on RTR1:

route add -net 3.3.3.1 netmask 255.255.255.0 dev ppp0

and like this on RTR2:

route add -net 1.1.1.1 netmask 255.255.255.0 dev ppp0

and it should work.

However, as I said, pppd still really wants to work out IP addresses
for both ends of the link.

Paul.
