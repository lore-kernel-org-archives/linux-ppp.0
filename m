From: James Carlson <carlsonj@workingcode.com>
Date: Wed, 09 Jul 2008 17:59:03 +0000
Subject: RE: net_mask 255.255.255.255
Message-Id: <18548.64615.170835.749416@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <8140AAF341CC904BA92C3D6A5A190978440A4D@ditech-1.ditechllc.com>
In-Reply-To: <8140AAF341CC904BA92C3D6A5A190978440A4D@ditech-1.ditechllc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Nicholas Hickman writes:
> Thanks for the response.  I completely understand.  
> 
> I guess my real gripe is witch Cisco and their OSPF hello packets on PPP
> links.  You cannot configure a dialer interface for a /32 subnet.  The
> result is that their OSPF hello packets contain a subnet greater than
> /32 which doesn't match my ppp interface so OSPF doesn't come up unless
> I change the subnet on the ppp0 interface to match what I am connected
> to.

What are you running on your side of the link?  If it's Quagga, I
think you should be able to specify a netmask through the
configuration file that matches what Cisco is expecting.

(I agree that their behavior here seems weird.)

> Commenting out those lines and allowing a different subnet just makes it
> easier to operate in the Cisco world.

One of the underlying questions is whether it works right when you do
that.  I think at one point it did not ... and that the kernel was
supposed to ignore oddities like that.

Your other option would be to write an /etc/ppp/ip-up script that uses
ifconfig to tweak the interface as desired.  That's a little hackish,
but requires no code changes.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
