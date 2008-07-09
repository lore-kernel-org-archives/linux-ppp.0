From: "Nicholas Hickman" <nhickman@dtechlabs.com>
Date: Wed, 09 Jul 2008 16:50:07 +0000
Subject: RE: net_mask 255.255.255.255
Message-Id: <8140AAF341CC904BA92C3D6A5A190978440A5D@ditech-1.ditechllc.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <8140AAF341CC904BA92C3D6A5A190978440A4D@ditech-1.ditechllc.com>
In-Reply-To: <8140AAF341CC904BA92C3D6A5A190978440A4D@ditech-1.ditechllc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Thanks for the response.  I completely understand.  

I guess my real gripe is witch Cisco and their OSPF hello packets on PPP
links.  You cannot configure a dialer interface for a /32 subnet.  The
result is that their OSPF hello packets contain a subnet greater than
/32 which doesn't match my ppp interface so OSPF doesn't come up unless
I change the subnet on the ppp0 interface to match what I am connected
to.

Commenting out those lines and allowing a different subnet just makes it
easier to operate in the Cisco world.

Thanks again.

-Nick

-----Original Message-----
From: linux-ppp-owner@vger.kernel.org
[mailto:linux-ppp-owner@vger.kernel.org] On Behalf Of James Carlson
Sent: Wednesday, July 09, 2008 11:23 AM
To: Nicholas Hickman
Cc: linux-ppp@vger.kernel.org
Subject: Re: net_mask 255.255.255.255

Nicholas Hickman writes:
> What is the reason for the lines 2362 & 2363 in sys-linux.c?  Why not 
> just accept the netmask option from the peer config?

Netmask doesn't really mean anything for a point-to-point link.  A
point-to-point link (unlike broadcast or NBMA) has just two peers -- the
local system and the one at the other end.  There's no "subnet"
involved, nor any "broadcast" address, nor any L2-related way to talk
about any other nodes on the "local network."

For users who insist on setting up PtP links as though they were
Ethernet interfaces, pppd accepts (and ignores) the netmask option.
:-/

In most cases where you 'want' to set up a netmask, what you actually
need is a static route pointing to a remote network reachable through
the peer node or (better yet) a dynamic routing protocol.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
--
To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
the body of a message to majordomo@vger.kernel.org More majordomo info
at  http://vger.kernel.org/majordomo-info.html
