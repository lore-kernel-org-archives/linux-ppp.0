From: Slawomir Skret <sskret@eecs.tufts.edu>
Date: Fri, 14 Jan 2011 16:58:41 +0000
Subject: Re: ifconfig ppp0 errors
Message-Id: <Pine.GSO.4.64.1101141146200.25803@sunfire12.eecs.tufts.edu>
List-Id: <linux-ppp.vger.kernel.org>
References: <Pine.GSO.4.64.1101111527150.23601@sunfire13.eecs.tufts.edu>
In-Reply-To: <Pine.GSO.4.64.1101111527150.23601@sunfire13.eecs.tufts.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi James,

I run the both ends of the pppd with the record flag. It shows that the 
sending and receiving files differ and the receiving file includes frames 
discarted due to either the BAD FCS residue error or the frame larger 
than the MRU, both of which do point into the problems under the 
ppp layer.

I appreciate very much your comments and prompt responses.

One comment that I have is that it would be useful to be able to retrieve 
the actual cause of the errors with the pppstats or some other way from 
the ppp driver. When they show up in the ifconfig it is not clear what's 
causing them and it requires some work to get to the actual cause.

Thanks again,
Swavek


On Wed, 12 Jan 2011, James Carlson wrote:

> On 01/12/11 13:40, Slawomir Skret wrote:
>> I added an instrumental printk statement in the ppp_receive_frame to
>> print a message before the ppp_receive_error(), rebuilt the kernel, and
>> got these prints for every error count reported. What does that mean? Is
>> there anything I can do/turn on/instrument/etc to tell what's wrong with
>> these frames?
>
> It means that your hardware is destroying the data in flight.  There's
> not much that PPP can do about that except detect the errors (using the
> Frame Check Sequence -- a CRC-16 scheme) and discard the packets that
> are affected.
>
> You could use the "record filename" option to capture the actual raw
> data.  That interposes a pty pair, so it's not completely transparent.
> To do transparent analysis, you'll need an external serial analyzer.
> Several vendors (such as HP) make such machines.  They're by no means
> cheap, but if you're doing real hardware development, there's no
> substitute for having good test gear.
>
> Reasonable operation of PPP assumes a lower layer that has only a modest
> -- and hopefully not traffic-sensitive -- error rate.  It doesn't have
> to be completely error free, but even a small error rate will have a
> relatively large effect on usability and performance of the link.  (And
> systematic errors, such as [say] always discarding the 256th byte of
> packets with 256 or more bytes, will make the link effectively useless
> for ordinary networking purposes.)
>
> (This isn't really a characteristic of PPP itself, but rather of any
> interface intended for datagram networking purposes.  Error rates other
> than "a little" are bad news.)
>
>> Also, I built the pppstats and run it:
>>
>> /var # ./pppstats
>>       IN   PACK VJCOMP  VJUNC  VJERR  |      OUT   PACK VJCOMP  VJUNC
>> NON-VJ
>>  2351664   1587      0      0      0  |    78364   1465      0      0 1465
>>
>> but it does not report these errors.
>
> That indicates that there's no significant errors above the framing
> level.  That's good, as it likely means there are no difficult software
> problems to solve.
>
> It's merely a matter of inadequate hardware.
>
> -- 
> James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
>
