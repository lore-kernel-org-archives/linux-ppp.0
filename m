From: James Carlson <carlsonj@workingcode.com>
Date: Thu, 24 Jun 2010 11:10:43 +0000
Subject: Re: PPP comression and extension info required...
Message-Id: <4C233D33.508@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <4C2246C1.2000206@workingcode.com>
In-Reply-To: <4C2246C1.2000206@workingcode.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

arun b wrote:
> HI,
> Ok thanks, To agree it is a peer-issue (server ).
> few things to know..
> 1) In the logs it shows deflate , bsd   is that mean is PPPD tries for
> multiple types of encryption and fails?

Those are some of the supported data compression algorithms that can be
negotiated by pppd using CCP.  On a good day, it'll try to negotiate all
of them and use whatever is in common between the peers.  You can see it
offering all that it supports at once here:

sent [CCP ConfReq id=0x1 <deflate 15> <deflate(old#) 15> <bsd v1 15>]

RFC 1962 specifies that if you ask for multiple types, and if the peer
agrees to the list, then what you actually use is the first one on the
list ("deflate 15" above).  Thus, asking for them all at once is the
most reasonable thing to do.

However, if the peer refuses CCP, then it doesn't matter what types of
algorithms pppd implements.  Refusing CCP is the peer's way of saying "I
don't want to talk about data compression at all."  It likely means that
the peer doesn't implement any sort of data compression, because if it
implemented other methods, it would more likely offer some with a
Configure-Nak rather than a flat-out rejection.  You can see the peer
refusing to negotiate data compression here:

rcvd [LCP ProtRej id=0xa 80 fd 01 01 00 0f 1a 04 78 00
18 04 78 00 15 03 2f] 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ...

Protocol-Reject for 'Compression Control Protocol' (0x80fd) received

In PPP, you can refuse to negotiate any protocol or mechanism you want.
 If it's refused, there's really nothing pppd can do about it, but
either decide to plow ahead without the requested feature (as is done
for CCP) or terminate the link (as might be done for something like CHAP).

Nit: those aren't encryption mechanisms.  They're data compression only.

> 2)can we run this test for PPPoE?

Sure.  PPPoE is merely a low-level transport and tunneling mechanism.
It has nothing much to do with the PPP options and protocols.

> 3) what is shlc ?

I see nothing called "shlc" in any of your logs, nor do I know of
anything by that name.  If you have a question about a particular log
message or feature, I recommend quoting the actual message or
documentation you're reading in order to be clear.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
