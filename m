From: James Cameron <james.cameron@hp.com>
Date: Tue, 30 Oct 2007 22:55:34 +0000
Subject: Re: IPCP with mobile ISP sometimes gives bogus DNS address
Message-Id: <20071030225534.GB3609@hp.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <fg82hb$nrp$1@ger.gmane.org>
In-Reply-To: <fg82hb$nrp$1@ger.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

G'day Marcus,

I've been the Linux focal point for a 3G deployment in Australia,
testing the devices with Linux and as a result I was given one, which I
now pay for the use of.

I see this problem you report daily.  I don't recall ever *not* seeing
the problem.  The DNS server IPs listed do not respond when queried.

The solution I use is to run a BIND server locally that uses the root
servers.  This works, but is probably not as useful as an ISP provided
DNS server.

I've been told that the 10.11.12.13 values are an invention by the
firmware in the modem, which provides the PPP interface.  Others have
seen these values despite having no radio coverage, e.g. by operating
the unit inside a metal box, or a very long way from a tower.

Therefore the best way to diagnose this may be to (a) examine the data
flow on another operating system, determining how it differs, and (b)
add features to pppd if possible to handle the unusual behaviour.  These
features might be as out-of-tree patches, plugins, or finally merged if
the project endorses them.  I'm interested in testing such changes.

References:

http://quozl.linux.org.au/bp3-usb/

Debug log: [not wrapped]

Oct 31 08:33:13 dors pppd[2770]: rcvd [CHAP Success id=0x1 ""]
Oct 31 08:33:13 dors pppd[2770]: sent [IPCP ConfReq id=0x1 <compress VJ 0f 01> <addr 0.0.0.0>]
Oct 31 08:33:14 dors pppd[2770]: rcvd [IPCP ConfNak id=0x1 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins 10.11.12.13> <ms-wins 10.11.12.14>]
Oct 31 08:33:14 dors pppd[2770]: sent [IPCP ConfReq id=0x2 <compress VJ 0f 01> <addr 0.0.0.0>]
Oct 31 08:33:15 dors pppd[2770]: rcvd [IPCP ConfNak id=0x2 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins 10.11.12.13> <ms-wins 10.11.12.14>]
Oct 31 08:33:15 dors pppd[2770]: sent [IPCP ConfReq id=0x3 <compress VJ 0f 01> <addr 0.0.0.0>]
Oct 31 08:33:16 dors pppd[2770]: rcvd [IPCP ConfNak id=0x3 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14> <ms-wins 10.11.12.13> <ms-wins 10.11.12.14>]
Oct 31 08:33:16 dors pppd[2770]: sent [IPCP ConfReq id=0x4 <compress VJ 0f 01> <addr 0.0.0.0>]
Oct 31 08:33:16 dors pppd[2770]: rcvd [IPCP ConfReq id=0x0 <addr 144.135.12.50>]
Oct 31 08:33:16 dors pppd[2770]: sent [IPCP ConfAck id=0x0 <addr 144.135.12.50>]
Oct 31 08:33:16 dors pppd[2770]: rcvd [IPCP ConfRej id=0x4 <compress VJ 0f 01>]
Oct 31 08:33:16 dors pppd[2770]: sent [IPCP ConfReq id=0x5 <addr 0.0.0.0>]
Oct 31 08:33:16 dors pppd[2770]: rcvd [IPCP ConfNak id=0x5 <addr 58.164.11.1>]
Oct 31 08:33:16 dors pppd[2770]: sent [IPCP ConfReq id=0x6 <addr 58.164.11.1>]
Oct 31 08:33:16 dors pppd[2770]: rcvd [IPCP ConfAck id=0x6 <addr 58.164.11.1>]

-- 
James Cameron
http://ftp.hp.com.au/sigs/jc/
