From: Slawomir Skret <sskret@eecs.tufts.edu>
Date: Wed, 12 Jan 2011 18:40:29 +0000
Subject: Re: ifconfig ppp0 errors
Message-Id: <Pine.GSO.4.64.1101121327410.12556@sunfire12.eecs.tufts.edu>
List-Id: <linux-ppp.vger.kernel.org>
References: <Pine.GSO.4.64.1101111527150.23601@sunfire13.eecs.tufts.edu>
In-Reply-To: <Pine.GSO.4.64.1101111527150.23601@sunfire13.eecs.tufts.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi James,

I added an instrumental printk statement in the ppp_receive_frame to print 
a message before the ppp_receive_error(), rebuilt the kernel, and got 
these prints for every error count reported. What does that mean? Is there 
anything I can do/turn on/instrument/etc to tell what's wrong with these 
frames?

Also, I built the pppstats and run it:

/var # ./pppstats
       IN   PACK VJCOMP  VJUNC  VJERR  |      OUT   PACK VJCOMP  VJUNC 
NON-VJ
  2351664   1587      0      0      0  |    78364   1465      0      0 
1465

but it does not report these errors.

Thanks,
Swavek

On Wed, 12 Jan 2011, James Cameron wrote:

> On Tue, Jan 11, 2011 at 05:50:23PM -0500, Slawomir Skret wrote:
>> The data is transfered from the server to the client, and the client
>> shows 322 errors, which is the delta between the server TX and
>> client RX packet count.
>
> Kernel source drivers/net/ppp_generic, looking at increments of
> ppp->dev->stats.rx_errors ... only happens in ppp_receive_error, which
> is called in several situations, some of which include a kernel message
> being emitted:
>
> - zero length skb,
>
> - compression used by peer without compression enabled at host,
>
> - compression not used by peer with compression enabled at host,
>
> - no memory on VJ decompression, (KERN_ERR level message),
>
> - VJ decompression error, (KERN_DEBUG level message),
>
> - non linearity just prior to SLHC decompression,
>
> - no memory during filtering.
>
> So I don't think it will be easy to isolate unless you find a kernel
> message or can prove inconsistent use of compression, or lack of the
> right kind of memory.
>
> As well as James, I'd be interested in the pppstats output.
>
> You might also try "debug dump" on both pppd and cross check the
> negotiations.
>
> -- 
> James Cameron
> http://quozl.linux.org.au/
>
