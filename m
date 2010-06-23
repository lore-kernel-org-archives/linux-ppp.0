From: James Carlson <carlsonj@workingcode.com>
Date: Wed, 23 Jun 2010 17:39:13 +0000
Subject: Re: PPP comression and extension info required...
Message-Id: <4C2246C1.2000206@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

arun b wrote:
> HI,
> I wanted to know PPP -extension  support , compression ...
> does it available in the ppp-2.4.4. ?  if so how do we test it.?
> Any  info you know  to share would be appreciated..

Yes, it supports data compression, and it's enabled by default.  See the
pppd(1M) man page for details.  Note that compression schemes need to be
built into your kernel, so what's _actually_ supported depends on what
kernel modules you have.

The debug log messages will be helpful here as well, as they indicate
which compression algorithms are being negotiated.

I'm not sure what sort of testing you want to do with it, though, so
you'll need to be more specific.  For what it's worth, I find that
passing large amounts of highly-compressible data (such as the letter
"A" repeated a few million times in a file) is one good stress test, and
passing incompressible data (such as a large bzip2'd file) is another.
Each explores a different end in the usual string-based data compression
algorithm.  The Canterbury Corpus is another fairly well-known test, and
is probably a good middle-of-the-road test for passing compressible data.

But there are other forms of "testing" that are possible here, including
performance and interoperability, and those may require other sorts of
testing schemes and other considerations, so I'm not really sure what it
is you're after.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
