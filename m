From: Michal Ostrowski <mostrows@watson.ibm.com>
Date: Mon, 18 Oct 2004 14:46:34 +0000
Subject: Re: Kernel-mode PPPoE server.
Message-Id: <1098110794.25095.157.camel@brick.watson.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <200410181453.16399.cpwp@w3z.co.uk>
In-Reply-To: <200410181453.16399.cpwp@w3z.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Mon, 2004-10-18 at 14:53 +0100, Charles Price wrote:
> Hi All,
> 
> I'm having trouble configuring a kernel-mode PPPoE server using:
> Gentoo Linux (Kernel 2.6.8-gentoo-r10)
> PPP from CVS
> rp-pppoe-3.5
> 
> Whenever a client initiates a connection to my server, the following is 
> appended to syslog:
> <SNIP> 
> Sep 30 09:51:13 pppoe2 pppoe-server[5686]: Session 2 created for client 
> 00:03:47:92:cf:e1 (10.67.15.2) on eth0 using Service-Name ''
> Sep 30 09:51:13 pppoe2 pppd[5686]: Plugin /etc/ppp/plugins/rp-pppoe.so loaded.
> Sep 30 09:51:13 pppoe2 pppd[5686]: RP-PPPoE plugin version 3.5 compiled 
> against pppd 2.4.2
> Sep 30 09:51:13 pppoe2 pppd[5686]: pppd 2.4.2 started by root, uid 0
> Sep 30 09:51:13 pppoe2 pppd[5686]: using channel 2
> Sep 30 09:51:13 pppoe2 pppd[5686]: Using interface ppp1
> Sep 30 09:51:13 pppoe2 pppd[5686]: Connect: ppp1 <--> eth0
> Sep 30 09:51:13 pppoe2 pppd[5686]: Couldn't increase MTU to 1500
> Sep 30 09:51:13 pppoe2 pppd[5686]: Couldn't increase MRU to 1500
> Sep 30 09:51:14 pppoe2 pppd[5686]: rcvd [LCP ConfReq id=0x1 <mru 1492> <magic 
> 0x34254d72>]
> <trimmed>
> Sep 30 09:51:41 pppoe2 pppd[5686]: rcvd [LCP ConfReq id=0x1 <mru 1492> <magic 
> 0x34254d72>]
> Sep 30 09:51:44 pppoe2 pppoe-server[5474]: PADT: Generic-Error: RP-PPPoE: 
> System call error: Input/output error


Try running an "strace" on the pppoe-server to see what system call
fails.

Also, a tcpdump log of the packets going back and forth would be useful.


-- 
Michal Ostrowski <mostrows@watson.ibm.com>

