From: James Carlson <carlsonj@workingcode.com>
Date: Wed, 04 Jan 2006 15:55:57 +0000
Subject: Re: ARP on PPP Interface
Message-Id: <17339.61453.768186.334245@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Murugaiyan N writes:
> What happens through ioctl if the NOARP flag is cleared (i.e. arp is turned
> on) for a ppp interface.

Nothing.  ARP isn't used on PPP because it's point-to-point, not
broadcast or NBMA.

> I would like the ppp interfaces(server side) to respond for my arp queries
> from the local net with the MAC address of the ethernet iface on which the
> ppp  is actually created, how do it do that?

That's different -- that's not ARP on the PPP link (which is
impossible), but rather something called "proxy ARP."

Use the "proxyarp" option in your pppd configuration.  This will cause
the system to respond to ARP queries for the remote address on the PPP
link _if_ that address is within a subnet defined on one of your local
broadcast-type interfaces.

So, for example, if you have a PPP link with local address 10.0.0.1
and remote address 10.0.0.2, and you have an Ethernet interface
configured with 10.0.0.1/24, then the system will respond to ARP
queries for 10.0.0.2.

Don't forget to turn forwarding on.  And (for some Linux versions)
enable proxy ARP in the kernel.  The pppd "ktune" option may do this
for you.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
