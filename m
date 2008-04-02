From: James Carlson <carlsonj@workingcode.com>
Date: Wed, 02 Apr 2008 16:09:46 +0000
Subject: Re: LCP Renegotiates After IP Connection
Message-Id: <18419.45002.753216.22669@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <1207083431.8474.15.camel@pago>
In-Reply-To: <1207083431.8474.15.camel@pago>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Bill Unruh writes:
> > I can certainly use other words if those two offend you in some way.
> 
> Nope, clarification is sufficient. So when you make statements as to what
> happens in the negotiation attempts, we are to take them as having some
> basis in fact and personal experience.

Or perhaps with reference to the original poster's message ... ?

> > If you read section 5.1 ("Configure-Request") of RFC 1661, it
> > discusses how the Identifier is chosen, and explains that
> > implementations are permitted to leave the ID field unchanged.
> > Retransmit can be exactly that: retransmit, don't generate a new one
> > from scratch.  That's how pppd does it.
> 
> Can be. But why make it so.

Because that's how pppd works.  See fsm_timeout(), and the
REQSENT/ACKRCVD/ACKSENT states.  These call fsm_sconfreq(f, 1), which
then tells fsm_sconfreq() to avoid generating a new ID.

The FSM also invokes the `retransmit' callback when it processes the
TO+ event, so it's possible for xCP implementations to alter the
packet before resending.  In lcp_callbacks, though, this function
pointer is NULL, meaning that LCP does nothing to alter the packet on
retransmit.

I checked the CVS repository, and this logic dates back to at least
1993 when the code was first imported to CVS.  I suspect it dates back
much further, probably to the mid-80's original Carnegie-Mellon
implementation.

> Probably true. What is that "other side"? Maybe someone here has experience
> with it, rather than everyone having to guess at what is going on.

The original poster claims this:

  I have a situation where I'm trying to maintain a PPP connection from my
  Linux PC to an embedded Linux device.

I have my doubts about the peer being a "Linux" device.  If it is, it
looks like it's been extensively hacked by the vendor (it sure doesn't
behave like normal pppd), and he should probably contact them for
help.

> > "No problem.  Here's a purchase order for a different device that
> > actually implements PPP rather than just claiming to ..."
> 
> Then I would follow that. Agreed. But it could have been "We just purchased
> 5000 of those things at a really cheap non-returnable deal. You better make
> them work."

"It's a darned shame our acceptance testing and product evaluation
process is so shoddy, isn't it?  Oh well.  It's like all other
reviews; you can pay me now or pay me later, but it'll cost much more
later."

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
