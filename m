From: James Carlson <carlsonj@workingcode.com>
Date: Thu, 30 Jun 2005 13:27:25 +0000
Subject: Re: PPP Encapsulated in GRE with IP Precedence headers
Message-Id: <17091.62269.155962.219103@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <20050630051424.GA13477@digitalpath.net>
In-Reply-To: <20050630051424.GA13477@digitalpath.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Ray Van Dolson writes:
> However, when Poptop encapsulates the PPP frames into GRE, it does not
> put any sort of DSCP flags in the corresponding GRE IP packets.  We are
> hoping to have Poptop/pptpclient modified to unpack the PPP frame it
> receives, examine the IP packet within and copy any DSCP flags into the
> GRE IP packet.  Thus if the IP packet in question was RTP, the
> resulting GRE packet would have the High Precedence DSCP flag set.

That's a bit icky, but I can see why you'd want to do it.

The "right" architectural answer would be to have PPP itself get the
IP DSCP information and use it to prioritize the traffic, and express
the priority in some implementation-dependent way down to the layer
that does the GRE/IP encapsulation.

> The question is, does PPP go haywire if packets start arriving out of
> order as a result of this?  Would we end up being worse-off than if we
> didn't do this at all?  I can see how a GRE-only tunnel would handle
> this just fine, but the added layer of PPP makes me think any sort of
> re-ordering of the GRE packets would break the PPP connection.

If it's just plain IP over PPP, and you're not negotiating any of MP,
ECP, CCP, VJ Header Compression, or Robust Header Compression, then
you should be able to get away with this.  The above protocols,
though, generally assume strict ordering (it is point-to-point,
right?) and will fall apart if that's compromised.

Since you're violating layering anyway, though, you could also just
intercept the initial negotiation messages and force any "unusual"
features off.

-- 
James Carlson                                 <carlsonj@workingcode.com>
