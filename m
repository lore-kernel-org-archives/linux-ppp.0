From: Paul Mackerras <paulus@samba.org>
Date: Sat, 29 Dec 2007 07:12:34 +0000
Subject: Re: Using an NTS instead of the local serial device ?
Message-Id: <18293.62306.751630.48447@cargo.ozlabs.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <14532384.post@talk.nabble.com>
In-Reply-To: <14532384.post@talk.nabble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

wotuzu17 writes:

> If there was a -socket option, I'd like to try. But I can't find a -socket
> option neither in the man pages nor in other documentation about pppd. 
> 
> # pppd: unrecognized option '-socket'

Sorry, it's "socket" (no dash) and it takes an argument which is
host:port.  However, if the Lantronix really does the telnet protocol
then it won't work properly since telnet interprets the 0xff character
and CR (0x0d) characters specially.

If you can put the terminal server into a mode where everything
received on the socket is sent to the serial port, without
interpretation, and everything from the serial port is sent on the
socket, without modification, then you could use it with the pppd
"socket" option.

Paul.
