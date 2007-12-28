From: cfowler@outpostsentinel.com
Date: Fri, 28 Dec 2007 22:40:32 +0000
Subject: Re: Using an NTS instead of the local serial device ?
Message-Id: <20071228224032.GH11624@support.opsdc.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <14532384.post@talk.nabble.com>
In-Reply-To: <14532384.post@talk.nabble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

I do not think PPPD can connect to a terminal via the method you tried.
What you need to do is load the Lantronix virtual serial port software on
both servers and setup a pseudo serial port.  Tell pppd to use that instead.
It should work but why not just use the network and create PPPD over an ssh 
ssh tunnel instead of using a terminal server to begin with.  Why
are you using a termianl server anyway?  Can't the machines communicate over
the network?

Also look at OpenVPN and Vtun.  You can create pppd links using
pseudos that way too.

On Fri, Dec 28, 2007 at 02:32:35PM -0800, wotuzu17 wrote:
> 
> Hi folks,
> 
> 
> I just successfully set up a basic ppp link between 2 Ubuntu 7.10 machines.
> 
> 
> 
> The commands look like this:
> 
> 
> me@machine1 $ pppd -detach persist lock proxyarp 192.168.10.1:192.168.10.2
> /dev/ttyS0 38400 &
> 
> 
> me@machine2 $ pppd -detach persist lock defaultroute
> 192.168.10.2:192.168.10.1 /dev/ttyS0 38400 &
> 
> 
> I wonder whether it is posible to use a serial port of an NTS for
> communiction instead of the local serial device /dev/ttyS0 ? I own a
> Lantronix ETS8P, which is a 8-port Network Terminal Server.
> 
> 
> I tried
> 
> me@machine1 $ pppd -detach persist lock proxyarp 192.168.10.1:192.168.10.2
> ip.of.nts:tcpport 38400 &
> 
> 
> without success. 
> 
> As I am new to Linux in general, maybe somebody can give me a hint.
> 
> 
> Thanks
> -- 
> View this message in context: http://www.nabble.com/Using-an-NTS-instead-of-the-local-serial-device---tp14532384p14532384.html
> Sent from the linux-ppp mailing list archive at Nabble.com.
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
