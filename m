From: James Carlson <carlsonj@workingcode.com>
Date: Wed, 12 Jan 2011 13:21:04 +0000
Subject: Re: ifconfig ppp0 errors
Message-Id: <4D2DAAC0.6030403@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <Pine.GSO.4.64.1101111527150.23601@sunfire13.eecs.tufts.edu>
In-Reply-To: <Pine.GSO.4.64.1101111527150.23601@sunfire13.eecs.tufts.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 01/11/11 16:57, Slawomir Skret wrote:
> On Tue, 11 Jan 2011, James Carlson wrote:
>> What options are you using?  Have you tried disabling data compression
>> with "noccp"?
> 
> The server side:
> pppd passive local 192.168.1.201:192.168.1.202 /dev/ttyCPM3 maxfail 0
> 
> and the client:
> pppd local /dev/ttyCPM1

OK; sounds straightforward.

Since data loss under stress is suspected here, and data compression
adds stress, I'd recommend "noccp novj".  Turn off the "complicated"
compression mechanisms.  (Leave on ACFC and PFC; they're simple.)

>> How fast does your "serial bus" run?  Is it likely to drop data when
>> there are bursts -- as you might see with packet-oriented networking
>> protocols, such as PPP?
> 
> The serial bus has 8MHz clock.

That doesn't sound terribly fast for a modern machine, but I do think
that running a link that lacks either a flow control mechanism (as with
most async links) or a native framing mechanism (as with most
synchronous links) is bad karma.  You're just out looking for a problem.

If the serial interface has an HDLC mode, I'd use it, and tell PPP that
it has a "sync" device.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
