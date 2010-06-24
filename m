From: James Carlson <carlsonj@workingcode.com>
Date: Thu, 24 Jun 2010 14:19:43 +0000
Subject: Re: PPP comression and extension info required...
Message-Id: <4C23697F.3070405@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <4C2246C1.2000206@workingcode.com>
In-Reply-To: <4C2246C1.2000206@workingcode.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

arun b wrote:
> Ok,
> as you said i can verify all compression types on PPPoE test...
> So i have pppoe-server available at my pc,  if you have come across
> related server configuration for this .... pls do know me.
> and running PPPoA - test running is not just easy to me as
> unavailability of the device.

I don't know what you're asking about, but pppd generally enables all
available compression modes by default (regardless of the underlying
communication mechanism), and will disable a compression mode either if
the peer disagrees with the request or if you specify one of the
documented options to turn off that mode (or to turn off compression
completely).

In other words, if your "server" is actually pppd, then there's nothing
that you need to do to enable compression.  If it's something other than
pppd, then this might not be the right mailing list.  You should consult
your server's documentation to find out what features it offers.

As for selectively turning off available compression types in pppd, I
still urge you to read the pppd man page.  It's pretty important.  For
data compression options, you'll find the following:

  noccp, bsdcomp, nobsdcomp, deflate, nodeflate, predictor1,
  nopredictor1

For header compression (again, _not_ data compression), you'll find:

  noaccomp, novj, novjccomp, vj-max-slots

There are also two that are sort of special -- mpshortseq and
nompshortseq -- that have to do with header compression when using MP.
You haven't mentioned MP yet, so I'll assume you're not using it.

The really short answer is this: PPP negotiates for everything.  If both
sides support something, then, great, it'll be enabled.  If either or
both sides don't support something, then it won't be enabled.  That's
pretty much the whole story.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
