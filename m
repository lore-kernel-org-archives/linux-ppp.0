From: carlsonj@workingcode.com
Date: Wed, 20 Oct 2004 10:48:06 +0000
Subject: Re: PPP fails due to IPCP NAK
Message-Id: <16758.16998.970361.151394@carlson.workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <41760C35.2010804@ncoretech.com>
In-Reply-To: <41760C35.2010804@ncoretech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Kanagesh writes:
> Oct 20 21:48:06  daemon.debug pppd[183]: sent [LCP ConfReq id=0x1 
> <asyncmap 0x0> <magic 0x4af3c007> <pcomp> <accomp>]
[...]
> Oct 20 21:48:09  daemon.debug pppd[183]: rcvd [LCP ConfReq id=0x2 
> <asyncmap 0xa0000> <magic 0x8bc924f>]

This is the first sign of danger.  You ask the peer to turn off all
control character escaping (asyncmap 0), but the peer asks to have
XON/XOFF escaped (asyncmap 0xa0000).  While this is perfectly legal --
PPP supports asymmetric negotiation of parameters -- it's also the
case that many implementations that ask for 0xa0000 happen to have
bugs that prevent them from working correctly in asymmetric
environments.

I recommend that you add "asyncmap 0xa0000" to your pppd
configuration.

> Oct 20 21:48:09   daemon.debug pppd[183]: sent [IPCP ConfReq id=0x1 
> <addr 192.168.2.10> <compress VJ 0f 01> <ms-dns1 0.0.0.0> <ms-dns3
>  0.0.0.0>]

You ask for a particular IP address.  That's not illegal, but is
certainly uncommon among dial-up users.

> Oct 20 21:48:09   daemon.debug pppd[183]: rcvd [IPCP ConfReq id=0x1 
> <addr 203.200.15.171>]

The peer tells you his address.

> Oct 20 21:48:09   daemon.debug pppd[183]: sent [IPCP ConfNak id=0x1 
> <addr 192.168.2.11>]

You tell the peer to use a different address.  If you're dialing into
your ISP here, this is wrong.

> Oct 20 21:48:12   daemon.debug pppd[183]: rcvd [IPCP ConfNak id=0x2 
> <addr 219.65.151.169> <ms-dns1 202.54.12.163> <ms-dns3 202.54.12.3
>  >]

You finally get an address from your peer ...

> Oct 20 21:48:12   daemon.debug pppd[183]: sent [IPCP ConfReq id=0x3 
> <addr 192.168.2.10> <ms-dns1 202.54.12.163> <ms-dns3 202.54.12.3>]

... and you ignore it.

You likely need to have "noipdefault" in your pppd configuration.

-- 
James Carlson                                 <carlsonj@workingcode.com>
