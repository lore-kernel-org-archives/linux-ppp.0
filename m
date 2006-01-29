From: James Carlson <carlsonj@workingcode.com>
Date: Sun, 29 Jan 2006 20:20:49 +0000
Subject: Re: IPCP problem
Message-Id: <17373.9121.5669.851809@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <op.s35d59crblqxiz@jono>
In-Reply-To: <op.s35d59crblqxiz@jono>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Ionut Turturica writes:
> It looks like the pptpd server requests first time mppe-stateful, then it  
> changes its mind and wants mppe-stateless. Is there any way to fix this?
> (I don't have access to pptpd's config)

That's not how I read this log.

> sent [CCP ConfReq id=0x1 <mppe +H -M +S -L -D -C>]

The local system tells its peer that it would like to do 128 bit MPPE
(+S) with stateless mode (+H).

> rcvd [CCP ConfReq id=0x1]

The peer says that it doesn't want to use MPPE or CCP at all.  Are you
sure that you should be using MPPE with this peer?

> sent [CCP ConfAck id=0x1]

The local system agrees to avoid MPPE for the peer!  That looks like a
bug to me.  It's theoretically possible, to encrypt in just one
direction, but it doesn't sound like a good thing.  This should have
been a CCP Configure-Nak instead.

> rcvd [CCP ConfNak id=0x1 <mppe -H -M +S -L -D -C>]

The peer says that it agrees to 128 bit MPPE, but only if stateful
(-H) mode is used.

> sent [CCP ConfReq id=0x2 <mppe -H -M +S -L -D -C>]

We re-request using the peer's options.

> rcvd [CCP ConfAck id=0x2 <mppe -H -M +S -L -D -C>]
> MPPE 128-bit stateful receive compression enabled

MPPE is now up in one direction (data sent from the peer to this
system -- the receive side -- should be encrypted, the other side is
not).

> rcvd [CCP ConfReq id=0x1]
> MPPE disabled

The peer is pretty confused.  It just restarted CCP negotiation for no
apparent reason.  As a result, we've torn down MPPE, as required by
the protocol.

> sent [LCP TermReq id=0x2 "MPPE disabled"]
> sent [CCP ConfReq id=0x3 <mppe +H -M +S -L -D -C>]
> sent [CCP ConfAck id=0x1]

We're apparently trying to restart CCP.

> rcvd [LCP TermAck id=0x2]

The peer loses its mind and shuts down the link.

I'm not sure that the peer agrees that this link should be using MPPE
at all.  Though there's one anomalous thing coming out of pppd, it
seems to me that the real problems here are on the peer's side.

Other than disabling MPPE entirely, I'm not sure what you can do to
fix this.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
