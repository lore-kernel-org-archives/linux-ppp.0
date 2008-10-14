From: James Cameron <james.cameron@hp.com>
Date: Tue, 14 Oct 2008 22:33:22 +0000
Subject: Re: Split dialup how to detect package loss and whats 10.64.64.64
Message-Id: <20081014223322.GC15180@hp.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <5153e02f0810140526u78d1345ct9ac28c8ada6e9656@mail.gmail.com>
In-Reply-To: <5153e02f0810140526u78d1345ct9ac28c8ada6e9656@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Detecting packet loss over one connection so that you can switch over to
the other one ... yes, you will find that difficult.  In your situation,
the PPP peer is the modem, and you won't get LCP Echo loss because these
travel only between pppd and the modem firmware.  LCP will continue
despite loss of radio traffic ... and it will take some time for the
modem to give up and hang up.  The only way to detect loss is to use IP
packets.

In my experience most packet loss on GPRS modems is going to affect both
modems in the same vicinity, since the loss is mostly caused by the
cell, or the providers GPRS Core Network.

Now, on your other question ...

10.64.64.64 is a common remote IP address seen with these GPRS modems.
It comes from this line of the pppd source:

ipcp.c: ho->hisaddr = htonl(0x0a404040 + ifunit);

It is the address to use when the peer does not provide one.  The peer
in your case is the modem itself.  Not the provider's network.

You don't need a remote IP address for the link.  Don't worry about it.

The remainder of my post below is a rant, repeated from my earlier
investigation into this odd IP address.  ;-)

There is a common but false belief that a remote IP address for the link
needs to be known.

This stems from an assumption that the link operates with MAC
addressing.

This can be disproved with tcpdump or wireshark, the remote IP address
is never seen on the data stream once IPCP completes.  Packets
transmitted over the link have the target IP address.

If it was operated as Ethernet, it would be quite different ... with
shared media links the Ethernet encapsulation has to have a destination
MAC address that corresponds to the router through which the packets are
to be forwarded.  So a packet is Ethernet-addressed to a router, but
IP-addressed to the target.  The router receives the packet, readdresses
it in the Ethernet headers, and forwards it on otherwise unchanged,
unless it has to do NAT.

I've heard and seen that Windows systems show point to point links as if
they are Ethernet adaptors ... and I shake my head in confusion.  Linux
point to point links are different: the remote IP address has no use,
and I find everything works fine without it.

-- 
James Cameron
http://ftp.hp.com.au/sigs/jc/
