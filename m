From: cfowler@outpostsentinel.com
Date: Sat, 29 Dec 2007 00:49:53 +0000
Subject: Re: Using an NTS instead of the local serial device ?
Message-Id: <20071229004953.GJ11624@support.opsdc.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <14532384.post@talk.nabble.com>
In-Reply-To: <14532384.post@talk.nabble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Fri, Dec 28, 2007 at 04:41:04PM -0800, wotuzu17 wrote:
> 
> If there was a -socket option, I'd like to try. But I can't find a -socket
> option neither in the man pages nor in other documentation about pppd. 
> 
> # pppd: unrecognized option '-socket'
> 
> Here at home I have a Suse 10.1 linux with pppd version 2.4.3 installed. 
> 
> The serial ports on the Lantronix are easily accessable- e.g.
> # telnet 192.168.0.1 2003
> 

I do not think my version of pppd supports that either.  What you need is the
software that will create link a pseudo tty in each system to the terminal
server and then you can run pppd on each side.

http://demo.opsdc.com/atlpm/ttyd2.pl

I wrote that for a friend to map some pseudos on a SUN box to another
terminal server.  It may need some tweaks but should map a pseudo 
on Linux to a port on the TS.


