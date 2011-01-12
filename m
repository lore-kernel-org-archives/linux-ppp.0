From: James Carlson <carlsonj@workingcode.com>
Date: Wed, 12 Jan 2011 21:23:29 +0000
Subject: Re: ifconfig ppp0 errors
Message-Id: <4D2E1BD1.7070808@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <Pine.GSO.4.64.1101111527150.23601@sunfire13.eecs.tufts.edu>
In-Reply-To: <Pine.GSO.4.64.1101111527150.23601@sunfire13.eecs.tufts.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 01/12/11 16:05, James Cameron wrote:
> I agree with James, it smells like hardware.
> 
> You might compare clock cycle, bit or byte counters at either end.
> 
> You might check for sensitivity to specific data patterns;

Pattern sensitivity is certainly an interesting area.  I think the ones
you've mentioned would tend to trip up poorly-designed hardware -- i.e.,
hardware that has trouble with DC restoration or noise coupled into
ground, or similar sorts of issues.  They're certainly interesting tests
to try.

I think the most prosaic cause of this sort of problem -- given the
evidence so far, which (if I recall correctly) started with OK behavior
until large data transfers were attempted -- is simple overflow.  Either
the system is just unable to keep up with the interrupt load, or
something's blocking the interrupts that do happen, or the latency into
the service routine is greater than the depth of the hardware input buffer.

An overrun would cause lost bytes in the middle of the frame, and cause
frames to be discarded as corrupt when the FCS isn't validated, and it'd
be aggravated by larger packet sizes, by a shorter interval between
packets, and by a system busy doing other things (such as talking to
disk).  All of those seem to line up well with the original problem report.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
