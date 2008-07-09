From: "Nicholas Hickman" <nhickman@dtechlabs.com>
Date: Wed, 09 Jul 2008 18:25:02 +0000
Subject: RE: net_mask 255.255.255.255
Message-Id: <8140AAF341CC904BA92C3D6A5A190978440A64@ditech-1.ditechllc.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <8140AAF341CC904BA92C3D6A5A190978440A4D@ditech-1.ditechllc.com>
In-Reply-To: <8140AAF341CC904BA92C3D6A5A190978440A4D@ditech-1.ditechllc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Yes I am using Quagga as the routing engine.  You can't actually
configure the links ip address and netmask in ospfd it is done in zebra.

When not using the netmask option with pppd and trying to rely on zebra
to set it up it still gets set to 255.255.255.255.  This results in the
error "interface ppp1:192.168.4.2: ospf_read network address is not same
[192.168.4.1]"

When I comment out the lines in sys-linux.c is does in-fact work just
like I would expect it to.  I can set the netmask option in my peer
config and it is appropriately set on the interface in the kernel.  OSPF
can now come up and ppp0 acts as if it were on a /30 network.

My thought was that I am not expecting the ppp link to do the routing
for me, but I should still tell it how large of a network it is
connecting to.  This should be the behavior of any ip link whether it be
ethernet or ppp.


-Nick

-----Original Message-----
From: James Carlson [mailto:carlsonj@workingcode.com] 
Sent: Wednesday, July 09, 2008 1:59 PM
To: Nicholas Hickman
Cc: linux-ppp@vger.kernel.org
Subject: RE: net_mask 255.255.255.255

Nicholas Hickman writes:
> Thanks for the response.  I completely understand.  
> 
> I guess my real gripe is witch Cisco and their OSPF hello packets on 
> PPP links.  You cannot configure a dialer interface for a /32 subnet.

> The result is that their OSPF hello packets contain a subnet greater 
> than
> /32 which doesn't match my ppp interface so OSPF doesn't come up 
> unless I change the subnet on the ppp0 interface to match what I am 
> connected to.

What are you running on your side of the link?  If it's Quagga, I think
you should be able to specify a netmask through the configuration file
that matches what Cisco is expecting.

(I agree that their behavior here seems weird.)

> Commenting out those lines and allowing a different subnet just makes 
> it easier to operate in the Cisco world.

One of the underlying questions is whether it works right when you do
that.  I think at one point it did not ... and that the kernel was
supposed to ignore oddities like that.

Your other option would be to write an /etc/ppp/ip-up script that uses
ifconfig to tweak the interface as desired.  That's a little hackish,
but requires no code changes.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
