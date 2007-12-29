From: wotuzu17 <andiv@gmx.li>
Date: Sat, 29 Dec 2007 00:41:04 +0000
Subject: Re: Using an NTS instead of the local serial device ?
Message-Id: <14533478.post@talk.nabble.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <14532384.post@talk.nabble.com>
In-Reply-To: <14532384.post@talk.nabble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


If there was a -socket option, I'd like to try. But I can't find a -socket
option neither in the man pages nor in other documentation about pppd. 

# pppd: unrecognized option '-socket'

Here at home I have a Suse 10.1 linux with pppd version 2.4.3 installed. 

The serial ports on the Lantronix are easily accessable- e.g.
# telnet 192.168.0.1 2003

will write everything that's being typed to physical port 3, and everything
that is being receveid on that port 2 is displayed in the telnet window



Paul Mackerras wrote:
> 
> wotuzu17 writes:
> 
>> I wonder whether it is posible to use a serial port of an NTS for
>> communiction instead of the local serial device /dev/ttyS0 ? I own a
>> Lantronix ETS8P, which is a 8-port Network Terminal Server.
>> 
>> 
>> I tried
>> 
>> me@machine1 $ pppd -detach persist lock proxyarp
>> 192.168.10.1:192.168.10.2
>> ip.of.nts:tcpport 38400 &
> 
> It *might* be possible to get pppd to talk to the terminal server
> using the -socket option, but it would depend on what protocol the
> terminal server talks across the network.  Can you give us any details
> on that protocol?
> 
> Paul.
> -
> To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 

-- 
View this message in context: http://www.nabble.com/Using-an-NTS-instead-of-the-local-serial-device---tp14532384p14533478.html
Sent from the linux-ppp mailing list archive at Nabble.com.

