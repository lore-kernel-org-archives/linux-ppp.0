From: Martin Ereth <martin.ereth@arcor.de>
Date: Fri, 21 Mar 2008 17:21:42 +0000
Subject: Connection between Draytek 2500We and Eee fails with "No auth is
Message-Id: <47E3EEA6.2010103@arcor.de>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hello!

I wanted to connect my Asus Eee (original installation) over Wireless-LAN to my Router
Draytek Vigor 2500We. This Router is capable of those connections, my dad is able to
connect his windows-notebook (pptp/mppe).
The routers IP is 192.168.0.1. The Eee's IP is dhcp-managed (also by this router).

When I try to use ppp, it fails with the following:
pppd options in effect:
debug debug		# (from command line)
nodetach		# (from command line)
logfd 2		# (from command line)
linkname vpn-home		# (from /etc/ppp/peers/vpn-home)
dump		# (from command line)
noauth		# (from /etc/ppp/options.pptp)
refuse-eap		# (from /etc/ppp/peers/vpn-home)
name asus-1535775183		# (from /etc/ppp/peers/vpn-home)
usehostname		# (from /etc/ppp/options)
remotename vpn-home		# (from /etc/ppp/peers/vpn-home)
		# (from /etc/ppp/options.pptp)
pty pptp 192.168.0.1 --nolaunchpppd 		# (from /etc/ppp/peers/vpn-home)
crtscts		# (from /etc/ppp/options)
		# (from /etc/ppp/options)
asyncmap 0		# (from /etc/ppp/options)
lcp-echo-failure 4		# (from /etc/ppp/options)
lcp-echo-interval 30		# (from /etc/ppp/options)
hide-password		# (from /etc/ppp/options)
ipparam vpn-home		# (from /etc/ppp/peers/vpn-home)
proxyarp		# (from /etc/ppp/options)
usepeerdns		# (from /etc/ppp/peers/vpn-home)
nobsdcomp		# (from /etc/ppp/options.pptp)
nodeflate		# (from /etc/ppp/options.pptp)
require-mppe		# (from /etc/ppp/peers/vpn-home)
noipx		# (from /etc/ppp/options)
using channel 4
Using interface ppp0
Connect: ppp0 <--> /dev/pts/1
sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0x26a95f6d> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x0 <auth chap MS-v2> <magic 0x1>]
No auth is possible
sent [LCP ConfRej id=0x0 <auth chap MS-v2>]
rcvd [LCP ConfRej id=0x1 <asyncmap 0x0> <pcomp> <accomp>]
sent [LCP ConfReq id=0x2 <magic 0x26a95f6d>]
rcvd [LCP ConfReq id=0x1 <auth chap MD5> <magic 0x1>]
No auth is possible
sent [LCP ConfRej id=0x1 <auth chap MD5>]
rcvd [LCP ConfAck id=0x2 <magic 0x26a95f6d>]
rcvd [LCP ConfReq id=0x2 <auth pap> <magic 0x1>]
No auth is possible
sent [LCP ConfRej id=0x2 <auth pap>]
sent [LCP ConfReq id=0x2 <magic 0x26a95f6d>]
sent [LCP ConfReq id=0x2 <magic 0x26a95f6d>]
sent [LCP ConfReq id=0x2 <magic 0x26a95f6d>]
sent [LCP ConfReq id=0x2 <magic 0x26a95f6d>]
sent [LCP ConfReq id=0x2 <magic 0x26a95f6d>]
sent [LCP ConfReq id=0x2 <magic 0x26a95f6d>]
sent [LCP ConfReq id=0x2 <magic 0x26a95f6d>]
sent [LCP ConfReq id=0x2 <magic 0x26a95f6d>]
sent [LCP ConfReq id=0x2 <magic 0x26a95f6d>]
sent [LCP ConfReq id=0x2 <magic 0x26a95f6d>]
LCP: timeout sending Config-Requests
Connection terminated.
Modem hangup
Waiting for 1 child processes...
~  script pptp 192.168.0.1 --nolaunchpppd , pid 4168
Script pptp 192.168.0.1 --nolaunchpppd  finished (pid 4168), status = 0x0

/etc/ppp/chap-secrets:
123 vpn-home 123 *

So I don't know, why this fails.

Maybe you are able to help me?

Thanks a lot!
Martin Ereth
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.7 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFH4+6lE5UqXaCvB8IRAhlIAKCTiLxSaOHJYE7ZTZBEDy+5EUFGewCfeZ2Z
Jv6zTPHsYiJi9E8DSghjCbQ=+4u5
-----END PGP SIGNATURE-----
