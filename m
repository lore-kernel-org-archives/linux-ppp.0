From: carlsonj@workingcode.com
Date: Wed, 15 Sep 2004 14:33:08 +0000
Subject: Re: pppd don't create ppp-network-device
Message-Id: <16712.21156.383528.76301@carlson.workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <OFA2465F60.5C52B06E-ONC1256F0B.0042177C@bln.d-trust.de>
In-Reply-To: <OFA2465F60.5C52B06E-ONC1256F0B.0042177C@bln.d-trust.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

p.boehm@d-trust.net writes:
> I ask me why ppp does not create a new ppp-device, although it starts correctly (automatically
> loaded into
> kernel after start of pppd):

Use the 'debug' option and make sure that either /etc/syslog.conf has
daemon.debug directed to a file, or that you use the 'updetach' option
to send the debug information to your tty.

strace doesn't really record the needed information to debug the
problem.

> 1207  read(0, "\x54\x5a\x69\x66\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"..., 4096) = 837

It seems like the peer said "TZif".  Not sure why, as you've not
included debug information.

> In kernel-config CONFIG_PPP Switches are set (as modules) and will supported by my kernel (out of
> CONFIG_PPP_MULTILINK)
> Any ideas where the problem could be? Or how I can find it?
> 
> Currently I study the ppp_generic sources to understand how it works, and that's my study-results so
> far ...

You shouldn't need to stare at the code to configure a PPP link.  Just
what exactly are you trying to do?

Are you trying to modify pppd's source code or are you trying to set
up a PPP link?

-- 
James Carlson                                 <carlsonj@workingcode.com>
