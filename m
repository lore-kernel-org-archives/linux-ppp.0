From: Paul Mackerras <paulus@samba.org>
Date: Fri, 28 Dec 2007 23:51:16 +0000
Subject: Re: Using an NTS instead of the local serial device ?
Message-Id: <18293.35828.169526.109130@cargo.ozlabs.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <14532384.post@talk.nabble.com>
In-Reply-To: <14532384.post@talk.nabble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

wotuzu17 writes:

> I wonder whether it is posible to use a serial port of an NTS for
> communiction instead of the local serial device /dev/ttyS0 ? I own a
> Lantronix ETS8P, which is a 8-port Network Terminal Server.
> 
> 
> I tried
> 
> me@machine1 $ pppd -detach persist lock proxyarp 192.168.10.1:192.168.10.2
> ip.of.nts:tcpport 38400 &

It *might* be possible to get pppd to talk to the terminal server
using the -socket option, but it would depend on what protocol the
terminal server talks across the network.  Can you give us any details
on that protocol?

Paul.
