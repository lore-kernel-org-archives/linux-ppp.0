From: James Carlson <carlsonj@workingcode.com>
Date: Wed, 12 Jan 2011 19:47:09 +0000
Subject: Re: ifconfig ppp0 errors
Message-Id: <4D2E053D.2050300@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <Pine.GSO.4.64.1101111527150.23601@sunfire13.eecs.tufts.edu>
In-Reply-To: <Pine.GSO.4.64.1101111527150.23601@sunfire13.eecs.tufts.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 01/12/11 13:40, Slawomir Skret wrote:
> I added an instrumental printk statement in the ppp_receive_frame to
> print a message before the ppp_receive_error(), rebuilt the kernel, and
> got these prints for every error count reported. What does that mean? Is
> there anything I can do/turn on/instrument/etc to tell what's wrong with
> these frames?

It means that your hardware is destroying the data in flight.  There's
not much that PPP can do about that except detect the errors (using the
Frame Check Sequence -- a CRC-16 scheme) and discard the packets that
are affected.

You could use the "record filename" option to capture the actual raw
data.  That interposes a pty pair, so it's not completely transparent.
To do transparent analysis, you'll need an external serial analyzer.
Several vendors (such as HP) make such machines.  They're by no means
cheap, but if you're doing real hardware development, there's no
substitute for having good test gear.

Reasonable operation of PPP assumes a lower layer that has only a modest
-- and hopefully not traffic-sensitive -- error rate.  It doesn't have
to be completely error free, but even a small error rate will have a
relatively large effect on usability and performance of the link.  (And
systematic errors, such as [say] always discarding the 256th byte of
packets with 256 or more bytes, will make the link effectively useless
for ordinary networking purposes.)

(This isn't really a characteristic of PPP itself, but rather of any
interface intended for datagram networking purposes.  Error rates other
than "a little" are bad news.)

> Also, I built the pppstats and run it:
> 
> /var # ./pppstats
>       IN   PACK VJCOMP  VJUNC  VJERR  |      OUT   PACK VJCOMP  VJUNC
> NON-VJ
>  2351664   1587      0      0      0  |    78364   1465      0      0 1465
> 
> but it does not report these errors.

That indicates that there's no significant errors above the framing
level.  That's good, as it likely means there are no difficult software
problems to solve.

It's merely a matter of inadequate hardware.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
