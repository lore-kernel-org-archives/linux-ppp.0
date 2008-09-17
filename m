From: James Carlson <carlsonj@workingcode.com>
Date: Wed, 17 Sep 2008 21:31:28 +0000
Subject: Re: pppd creates route without "gateway" flag
Message-Id: <18641.30512.331773.157910@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <b09e96770809171223j34dd04d7k52f29677c9c7a540@mail.gmail.com>
In-Reply-To: <b09e96770809171223j34dd04d7k52f29677c9c7a540@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Bill Unruh writes:
> On Wed, 17 Sep 2008, Joakim Wennergren wrote:
> 
> > I just looked at my routing table, and the route pppd created does not
> > have the "G" flag like I'm used to, is there a reason for this?
> 
> PPP is Peer to Peer Protocol. Ie, it is from one peer to another. It has
> nothing whatsoever to do with gateways, etc. 

I think the original poster is talking about the default route
inserted by the "defaultroute" option.  As he rightly notes, it's
missing the "G" flag:

> > 0.0.0.0         0.0.0.0         0.0.0.0         U     0      0        0 ppp0

And that is in fact a gateway route.  The issue is whether that flag
actually matters on Linux.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
