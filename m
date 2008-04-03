From: Paul Mackerras <paulus@samba.org>
Date: Thu, 03 Apr 2008 04:13:43 +0000
Subject: Re: LCP Renegotiates After IP Connection
Message-Id: <18420.22903.256017.696995@cargo.ozlabs.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <1207083431.8474.15.camel@pago>
In-Reply-To: <1207083431.8474.15.camel@pago>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Bill Unruh writes:

> > If you read section 5.1 ("Configure-Request") of RFC 1661, it
> > discusses how the Identifier is chosen, and explains that
> > implementations are permitted to leave the ID field unchanged.
> > Retransmit can be exactly that: retransmit, don't generate a new one
> > from scratch.  That's how pppd does it.
> 
> Can be. But why make it so.

The main reason I made it like this is that this way, it has some
chance of working on a link where the round-trip latency is more than
the retransmit interval.

> Then I would follow that. Agreed. But it could have been "We just purchased
> 5000 of those things at a really cheap non-returnable deal. You better make
> them work."

Then you hack pppd for that particular situation (you have the source,
after all), but you don't pretend that your hack is necessarily a good
thing for everyone to use.

Paul.
