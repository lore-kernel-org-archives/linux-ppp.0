From: James Carlson <carlsonj@workingcode.com>
Date: Wed, 09 Jul 2008 18:45:27 +0000
Subject: RE: net_mask 255.255.255.255
Message-Id: <18549.1863.741274.851754@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <8140AAF341CC904BA92C3D6A5A190978440A4D@ditech-1.ditechllc.com>
In-Reply-To: <8140AAF341CC904BA92C3D6A5A190978440A4D@ditech-1.ditechllc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Nicholas Hickman writes:
> Yes I am using Quagga as the routing engine.  You can't actually
> configure the links ip address and netmask in ospfd it is done in zebra.

Interesting; that's probably something I should talk about with Paul
Jakma.

There's no way to convince the peer that this ought to be an actual
OSPF point-to-point interface, is there?

> My thought was that I am not expecting the ppp link to do the routing
> for me, but I should still tell it how large of a network it is
> connecting to.

It's a network of exactly one.  You can reach exactly one node
*directly* over that link.

>  This should be the behavior of any ip link whether it be
> ethernet or ppp.

Sure.  Let's look at how you configure Ethernet: you set up the subnet
mask to show what peers you can reach *directly* via L2 over that
network.

Suppose you had two Ethernet networks with subnets 192.168.2.0/24 and
192.168.3.0/24, and you had a router (somewhere) that connected the
two together.

You wouldn't configure your interface to the 192.168.2.0 network with
a prefix length of 23 because 192.168.3.0 is also reachable through
it, would you?  Of course not.  It wouldn't work.  You wouldn't be
able to ARP those other nodes.

The same is essentially true with PPP.  The "size" of the network
directly reachable with a PPP link is exactly one -- you can get to a
single remote node by way of the L2 link, and that's it.  Anything
else that's reachable is a function of IP forwarding and routing, just
as it is in the Ethernet case, and *not* a matter of interface
configuration or properties.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
