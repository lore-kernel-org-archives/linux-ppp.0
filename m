From: James Carlson <carlsonj@workingcode.com>
Date: Fri, 21 Mar 2008 19:18:41 +0000
Subject: Re: Connection between Draytek 2500We and Eee fails with "No auth is
Message-Id: <18404.2577.292217.442980@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <47E3EEA6.2010103@arcor.de>
In-Reply-To: <47E3EEA6.2010103@arcor.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Martin Ereth writes:
> crtscts		# (from /etc/ppp/options)
> 		# (from /etc/ppp/options)
> asyncmap 0		# (from /etc/ppp/options)

Those are a bit odd here.  Probably not harmful, though.

> hide-password		# (from /etc/ppp/options)

That's the default.  You shouldn't have to specify it.

> proxyarp		# (from /etc/ppp/options)

That's likely wrong.  It's typically used when pppd is set up to
behave as a dial-in server.

> nobsdcomp		# (from /etc/ppp/options.pptp)
> nodeflate		# (from /etc/ppp/options.pptp)

That shouldn't be necessary.

> noipx		# (from /etc/ppp/options)

That's also the default.

> rcvd [LCP ConfReq id=0x0 <auth chap MS-v2> <magic 0x1>]

He demands that you use Microsoft's proprietary MS-CHAPv2.

> No auth is possible
> sent [LCP ConfRej id=0x0 <auth chap MS-v2>]

You don't have it configured, so you refuse.  That's the problem.  You
haven't set up your local credentials properly.

You'll need to put correct entries into /etc/ppp/chap-secrets to make
this work.

Note that you'll also want to use the pppd "user" option *instead* of
the "name" option.  The latter is designed for servers.  It may work
here, but it's not quite what you want.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
