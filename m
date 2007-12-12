From: James Carlson <carlsonj@workingcode.com>
Date: Wed, 12 Dec 2007 21:36:51 +0000
Subject: Re: IPCP-Nak doesn't do anything
Message-Id: <18272.21619.701474.332445@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <14303969.post@talk.nabble.com>
In-Reply-To: <14303969.post@talk.nabble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

ipcpblues writes:
> I think I've almost got them working because they pass the LCP request - ack
> stage and enter the IPCP stage.  In the IPCP stage, my IPCP-Req is Ack'd, so
> I'm halfway there.  Their IPCP-Req is received by me with IP-addr=0.0.0.0
> and I respond with IPCP-Nak IP-addr2.168.20.50.  All this seems correct
> to me, but then the device doesn't accept my Nak and either re-sends its
> original IPCP-Req or goes back to the LCP-Req stage.  

The peer is free to ignore your suggested IP address for any reason it
wants.  You cannot make it accept an address that it doesn't want.

Assuming you can't get debug logs out of the peer (in order to find
out why it doesn't like that address), I think the only thing you
could do would be to refuse to negotiate the addresses by adding
"ipcp-no-address ipcp-no-addresses".

> sent [LCP ConfReq id=0x1 <magic 0xec2490cf> <pcomp> <accomp>]
> rcvd [LCP ConfAck id=0x1 <magic 0xec2490cf> <pcomp> <accomp>]
> sent [LCP ConfReq id=0x1 <magic 0xec2490cf> <pcomp> <accomp>]
> rcvd [LCP ConfAck id=0x1 <magic 0xec2490cf> <pcomp> <accomp>]

This part is pretty suspicious and likely points to communications
errors on the path ...

> sent [IPCP ConfReq id=0x1 <compress VJ 0f 01> <addr 192.168.30.1>]
> rcvd [IPCP ConfAck id=0x1 <compress VJ 0f 01> <addr 192.168.30.1>]
> sent [IPCP ConfReq id=0x1 <compress VJ 0f 01> <addr 192.168.30.1>]
> rcvd [IPCP ConfAck id=0x1 <compress VJ 0f 01> <addr 192.168.30.1>]

... as does this.  Are you sure that the underlying link works and is
relatively error-free?  Excessive frame loss could _easily_ be the
cause of the kind of problem you're seeing.  It can lead to
non-convergence.

> rcvd [IPCP ConfAck id=0x1 <compress VJ 0f 01> <addr 192.168.30.1>]
> rcvd [LCP ConfReq id=0x2c <asyncmap 0x0> <magic 0xa5a44a5a>]
> sent [LCP ConfReq id=0x2 <magic 0xae75be4b> <pcomp> <accomp>]

Right here the peer gives up and starts over.  That likely indicates
that it thinks IPCP isn't converging properly, which seems fairly
likely given the very odd traffic on this link.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
