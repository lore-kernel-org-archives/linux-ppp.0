From: James Carlson <carlsonj@workingcode.com>
Date: Wed, 12 Jan 2011 22:17:58 +0000
Subject: Re: ifconfig ppp0 errors
Message-Id: <4D2E2896.8030709@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <Pine.GSO.4.64.1101111527150.23601@sunfire13.eecs.tufts.edu>
In-Reply-To: <Pine.GSO.4.64.1101111527150.23601@sunfire13.eecs.tufts.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 01/12/11 16:51, James Cameron wrote:
> On Wed, Jan 12, 2011 at 04:23:29PM -0500, James Carlson wrote:
>> I think the most prosaic cause of this sort of problem -- given the
>> evidence so far, which (if I recall correctly) started with OK behavior
>> until large data transfers were attempted -- is simple overflow.
> 
> Yes, that seems most likely.  Overflow can be tested for as well though,
> by sending large amounts of data over the link, in the absence of PPP.
> Careful counting will show what is lost.
> 
> Although, if the link itself has no flow control, then some loss will
> always be a possibility.  10% of packets affected by loss seems a bit
> high, but I've no idea what the original poster's design threshold is.

A possibly-helpful debug idea: while chasing a problem that ended up
being a bug inside a special optimization case in one vendor's TCP (!),
I wrote a little state machine in the kernel to detect the start of some
recognizable data (the standard "ABCD..." from chargen), and then
continue checking successive messages until a miscompare.  I panicked
the system on miscompare, and was able to chase down the bug using a
post-mortem debugger.

Such debug tools are possibly less available in the original poster's
environment, but the technique (modify the driver to detect test data
and assert its goodness) might still be useful in catching the event.

Breakpointing when something doesn't happen (i.e., some bytes not
received) is sometimes hard.  ;-}

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
