From: James Carlson <carlsonj@workingcode.com>
Date: Wed, 18 Nov 2015 19:42:41 +0000
Subject: Re: Problems with pppd option: record file
Message-Id: <564CD4B1.7090901@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <564CBFC6.4090409@web.de>
In-Reply-To: <564CBFC6.4090409@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 11/18/15 13:13, Thomas Bergholz wrote:
> kdebug 4

kdebug almost never does what you want, unless you're hacking the kernel
modules themselves.  Are you sure you need this?

> record /tmp/pppd_capture.pcap

This looks to me like a bad idea.  First of all, the "record" option,
besides being quite brutal (it uses a pty pair and passes all data back
and forth in and out of the kernel multiple times), does not create pcap
format files.  It creates async data files in a special format that only
pppdump normally reads.  It's very hard to use, and is definitely NOT an
accurate recording if you're using anything other than PPP on an
asynchronous line.  Even then, it's appropriate only if you're debugging
a problem in AHDLC encoding or flow control or something like that.
It's close to worthless for higher level (PPP negotiation or IP data)
debugging.

And this isn't configured as PPP on an asynchronous line.  So, even if
you could make it work, it wouldn't give you accurate results for
debugging, because it passes the data through an asynchronous
pseudo-terminal, and Ethernet is anything but that.

I suggest just running wireshark on eth0 instead.  Since this is a PPPoE
connection, that will capture everything, and wireshark is great at
decoding PPPoE (and PPP) negotiation.

> unit 0

Not sure why this appears here.

> I recongnized that the raspi prints "unrecognized option 'record'", even
> though the "record file" option is mentioned in the pppd manpage.
> Ubuntu does not print this message.

Is this a copy of pppd that you compiled from source or one that you got
from someone else?

If it's one that you compiled from source, I'd suggest looking at
pppd/tty.c to see why that option is missing.

If it's one that you got from someone else, then you need to ask them
what's been done to it.  Some distributors make changes, and it's
possible they just removed this (mostly useless) option.

I suggest starting over at the top: what problem are you trying to solve?

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
