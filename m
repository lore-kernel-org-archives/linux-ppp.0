From: James Carlson <carlson@workingcode.com>
Date: Wed, 02 Jun 2004 16:47:47 +0000
Subject: Re: pppd 2.4.2 IPX problems
Message-Id: <16574.1203.14786.593967@h006008986325.ne.client2.attbi.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <005201c448be$3cfbd660$6401a8c0@Zazzmachine>
In-Reply-To: <005201c448be$3cfbd660$6401a8c0@Zazzmachine>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Richard Plourde writes:
> When I come to connect with ppp from my Windows workstation, I get this
> error in the pppd logfile:
> 
> Jun  2 11:48:31 <custserver> pppd[27805]: rcvd [IPXCP ConfReq id=0x5
> <network 0> <node 02ee0016331b>]
> Jun  2 11:48:31 <custserver> pppd[27805]: Unsupported protocol 'Novell IPX
> Control Protocol' (0x802b) received
> 
> Since I'm pretty sure the kernel is properly compiled, I'm begining to
> suspect the pppd distribution.

Did you turn on the "ipx" option in your pppd configuration?  IPX
isn't enabled by default.

-- 
James Carlson                                  <carlson@workingcode.com>
