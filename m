From: James Carlson <carlsonj@workingcode.com>
Date: Fri, 20 Apr 2007 00:04:43 +0000
Subject: Re: IPCP Negotiation Failure - Peer refuse to accept IP Address
Message-Id: <17960.923.644236.297619@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <10066975.post@talk.nabble.com>
In-Reply-To: <10066975.post@talk.nabble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

amyng writes:
> I'm running 2.4.4 pppd on Solaris (I know it's not Linux, but there's no
> sun-ppp forum) trying to connect to a device (which I can get to by window
> rasppp btw).

Actually, there are more appropriate lists for this.  The main PPP
list (for pppd) is ppp-bugs@samba.org.  If you're using something
other than Solaris Nevada, then you should contact Solaris support --
but do make sure you've reproduced the problem using Solaris PPP
(/usr/bin/pppd), and not the open source version.

If you're using Solaris Nevada, you could try one of the OpenSolaris
groups, like networking-discuss@opensolaris.org.

> kdebug 31               # (from /etc/ppp/options)

Unless you're designing and debugging kernel modules, I don't think
you want this.

> /dev/ttya               # (from command line)

If you're dialing out, you should use /dev/cua/a.  /dev/ttya is
equivalent to /dev/term/a, which is a dial-in port.

> local           # (from /etc/ppp/options)

That doesn't look right.  It disables modem signaling -- DTR/DCD --
and is probably here because the wrong serial port (ttya rather than
cua/a) is being used.

> ipcp-accept-local               # (from /etc/ppp/options)
> ipcp-accept-remote              # (from /etc/ppp/options)

Those shouldn't be needed with `noipdefault'.

> ipcp-no-addresses               # (from /etc/ppp/options)

Also not necessary.

> sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0x2f497226> <pcomp> <accomp>]
> rcvd [LCP ConfReq id=0x11]

Oh, yuck.  Your peer insists on negotiating without an ACCM and
without the Magic Number option.  Beware -- your peer is probably a
pile of junk.

> sent [IPCP ConfReq id=0x1 <compress VJ 0f 01> <addr 0.0.0.0>]

You ask your peer for an IP address.

> rcvd [IPCP ConfRej id=0x1 <compress VJ 0f 01> <addr 0.0.0.0>]

Your peer refuses to supply you with an address.  This is the problem
-- the peer doesn't have an address to give you.  Either the peer is
misconfigured, or you need to supply your own IP address in order to
talk to it.

> Could not determine local IP address

This is the problem as described above.  You ask the peer for an
address, but it doesn't have one (or just refuses to supply one).

> 192.168.129.2:          # (from /etc/ppp/options)

That part looks good.

> sent [IPCP ConfReq id=0x1 <compress VJ 0f 01> <addr 192.168.129.2>]

You tell the peer your address.

> rcvd [IPCP ConfRej id=0x1 <compress VJ 0f 01> <addr 192.168.129.2>]

The peer tells you to go away.

> I noticed that the failure case, the last IPCP ConfReq is sent without the
> specified local IP Address:
> sent [IPCP ConfReq id=0x2]
> whereas the successful case, it does:
> sent [IPCP ConfReq id=0x2 <addr 192.168.129.2>]

Right.  That's because in the failure case, the peer *refuses* that
option.  We're compelled to omit it from the next Configure-Request we
send.

> Any help would be greatly appreciated!!

Get a better peer.  The one you're talking to is misconfigured or just
plain broken.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
