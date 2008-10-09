From: Paul Mackerras <paulus@samba.org>
Date: Thu, 09 Oct 2008 11:50:16 +0000
Subject: Re: pppd creates route without "gateway" flag
Message-Id: <18669.61432.589922.730821@cargo.ozlabs.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <b09e96770809171223j34dd04d7k52f29677c9c7a540@mail.gmail.com>
In-Reply-To: <b09e96770809171223j34dd04d7k52f29677c9c7a540@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

James Carlson writes:

> Bill Unruh writes:
> > On Wed, 17 Sep 2008, Joakim Wennergren wrote:
> > 
> > > I just looked at my routing table, and the route pppd created does not
> > > have the "G" flag like I'm used to, is there a reason for this?
> > 
> > PPP is Peer to Peer Protocol. Ie, it is from one peer to another. It has
> > nothing whatsoever to do with gateways, etc. 
> 
> I think the original poster is talking about the default route
> inserted by the "defaultroute" option.  As he rightly notes, it's
> missing the "G" flag:
> 
> > > 0.0.0.0         0.0.0.0         0.0.0.0         U     0      0        0 ppp0
> 
> And that is in fact a gateway route.  The issue is whether that flag
> actually matters on Linux.

Why do you say it's a gateway route?  It doesn't have a gateway
address.  It's a route to the 0.0.0.0/0 network via the ppp0 device.

Paul.
