From: James Carlson <carlsonj@workingcode.com>
Date: Wed, 02 Jan 2008 17:44:35 +0000
Subject: Re: Using an NTS instead of the local serial device ?
Message-Id: <18299.52611.809735.4662@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <14532384.post@talk.nabble.com>
In-Reply-To: <14532384.post@talk.nabble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Paul Mackerras writes:
> wotuzu17 writes:
> 
> > If there was a -socket option, I'd like to try. But I can't find a -socket
> > option neither in the man pages nor in other documentation about pppd. 
> > 
> > # pppd: unrecognized option '-socket'
> 
> Sorry, it's "socket" (no dash) and it takes an argument which is
> host:port.  However, if the Lantronix really does the telnet protocol
> then it won't work properly since telnet interprets the 0xff character
> and CR (0x0d) characters specially.

Lantronix devices support both.  You connect to 2000+n to get TELNET
protocol (with the 0xff escapes), and 3000+n for a raw TCP connection.

So, for port 1, use this in pppd:

	socket ip-address:3001

(Most other terminal servers have similar features.  For example, the
equivalent ranges on Annexes are 5000+n for TELNET and 7000+n for raw
TCP.)

I would advise the original poster to avoid reverse telnet.  It may
work with some applications, but it's a frightening bit of hackery
that (at least in my experience) often fails in strange ways.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
