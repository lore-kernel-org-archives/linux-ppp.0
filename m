From: James Cameron <quozl@laptop.org>
Date: Tue, 11 Jan 2011 23:30:05 +0000
Subject: Re: ifconfig ppp0 errors
Message-Id: <20110111233005.GG5186@us.netrek.org>
List-Id: <linux-ppp.vger.kernel.org>
References: <Pine.GSO.4.64.1101111527150.23601@sunfire13.eecs.tufts.edu>
In-Reply-To: <Pine.GSO.4.64.1101111527150.23601@sunfire13.eecs.tufts.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Tue, Jan 11, 2011 at 05:50:23PM -0500, Slawomir Skret wrote:
> The data is transfered from the server to the client, and the client
> shows 322 errors, which is the delta between the server TX and
> client RX packet count.

Kernel source drivers/net/ppp_generic, looking at increments of
ppp->dev->stats.rx_errors ... only happens in ppp_receive_error, which
is called in several situations, some of which include a kernel message
being emitted:

- zero length skb,

- compression used by peer without compression enabled at host,

- compression not used by peer with compression enabled at host,

- no memory on VJ decompression, (KERN_ERR level message),

- VJ decompression error, (KERN_DEBUG level message),

- non linearity just prior to SLHC decompression,

- no memory during filtering.

So I don't think it will be easy to isolate unless you find a kernel
message or can prove inconsistent use of compression, or lack of the
right kind of memory.

As well as James, I'd be interested in the pppstats output.

You might also try "debug dump" on both pppd and cross check the
negotiations.

-- 
James Cameron
http://quozl.linux.org.au/
