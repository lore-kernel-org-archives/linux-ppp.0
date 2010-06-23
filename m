From: James Carlson <carlsonj@workingcode.com>
Date: Wed, 23 Jun 2010 18:17:11 +0000
Subject: Re: PPP comression and extension info required...
Message-Id: <4C224FA7.7050908@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <4C2246C1.2000206@workingcode.com>
In-Reply-To: <4C2246C1.2000206@workingcode.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

arun b wrote:
> Hi James.,
> 
> Thank you as usual to respond me quick..!
> Well  I wanted to validate rfc-1662.
> I see in ppp source  deflate, bsd, compression  are these covers
> rfc-1662 if so please provide me further info on this

I'm afraid I still don't really understand.

RFC 1662 describes AHDLC, which is the low-level framing on async lines,
as well as the other mappings of PPP to octet-synchronous HDLC (read:
SONET/SDH) and bit-stuffed HDLC (read: ISDN and other telecom).  It
doesn't really describe much about "compression" except a few header
compression bits.

Are you really asking about PPP header compression?  If so, why?  What
could you be testing that would require a specific test for this?

If you need such a low-level PPP-specific test, I strongly recommend
getting a protocol validation device or employing a service.  IXIA's
ixANVL tester can verify low-level details of protocol operation.
Another place to turn would be UNH's IOL.

If you actually have your own independent implementation (and wanting to
test this low-level detail on your own suggests that you do), then I
really recommend getting the right tools for the job.

If you don't want to do either of those, then you're probably on your
own.  You could perhaps make do by using the existing options described
in pppd(1M) along with either an external analyzer or (perhaps) using
either the pppdump(1M) tool or even kdebug 3.

But, again, this is just header compression, not data compression.  It's
really pretty boring stuff.

Did you mean RFC 1962 instead?  If so, then that's just what
_negotiates_ compression.  The actual compression takes place using the
compression algorithms, and these are controlled by the documented
pppd(1M) options and the kernel modules, as I mentioned in my first reply.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
