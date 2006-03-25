From: md@Linux.IT (Marco d'Itri)
Date: Sat, 25 Mar 2006 10:13:20 +0000
Subject: Re: killing a pptp tunnel with a single ping
Message-Id: <20060325101320.GA3987@wonderland.linux.it>
List-Id: <linux-ppp.vger.kernel.org>
References: <20060324232128.GA23810@wonderland.linux.it>
In-Reply-To: <20060324232128.GA23810@wonderland.linux.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Mar 25, James Cameron <james.cameron@hp.com> wrote:

> I've tried but failed to reproduce this.  Could you obtain and post the
> pppd debug dump log showing the negotiation of the tunnel?  That will
> help to narrow the scope.


pppd 2.4.4b1 started by root, uid 0
using channel 15
Using interface ppp1
Connect: ppp1 <--> /dev/pts/14
sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xab0eb1ff> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x1 <auth chap MS-v2> <magic 0xbcb7d017>]
sent [LCP ConfAck id=0x1 <auth chap MS-v2> <magic 0xbcb7d017>]
rcvd [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0xab0eb1ff> <pcomp> <accomp>]
sent [LCP EchoReq id=0x0 magic=0xab0eb1ff]
rcvd [CHAP Challenge id=0x1 
sent [CHAP Response id=0x1 
rcvd [LCP EchoRep id=0x0 magic=0xbcb7d017]
rcvd [CHAP Success id=0x1 
CHAP authentication succeeded
kernel does not support PPP filtering
sent [CCP ConfReq id=0x1 <mppe +H -M +S -L -D -C>]
rcvd [IPCP ConfReq id=0x1 <addr 213.254.>]
sent [IPCP TermAck id=0x1]
rcvd [CCP ConfReq id=0x1 <mppe +H -M +S -L -D -C>]
sent [CCP ConfAck id=0x1 <mppe +H -M +S -L -D -C>]
rcvd [IPV6CP ConfReq id=0x1 <addr fe80::0210:7bff:fecf:37c0>]
sent [IPV6CP TermAck id=0x1]
rcvd [CCP ConfAck id=0x1 <mppe +H -M +S -L -D -C>]
MPPE 128-bit stateless compression enabled
sent [IPCP ConfReq id=0x1 <compress VJ 0f 01> <addr 213.254.>]
sent [IPV6CP ConfReq id=0x1 <addr fe80::fdd2:3496:581b:1b03>]
rcvd [IPCP ConfRej id=0x1 <compress VJ 0f 01>]
sent [IPCP ConfReq id=0x2 <addr 213.254.>]
rcvd [IPV6CP ConfAck id=0x1 <addr fe80::fdd2:3496:581b:1b03>]
rcvd [IPCP ConfAck id=0x2 <addr 213.254.>]
rcvd [LCP EchoReq id=0x1 magic=0xbcb7d017 ab 0e b1 ff]
sent [LCP EchoRep id=0x1 magic=0xab0eb1ff ab 0e b1 ff]
rcvd [IPCP ConfReq id=0x2 <addr 213.254.>]
sent [IPCP ConfAck id=0x2 <addr 213.254.>]
local  IP address 213.254.
remote IP address 213.254.
Script /etc/ppp/ip-up started (pid 23477)
Script /etc/ppp/ip-up finished (pid 23477), status = 0x0
rcvd [IPV6CP ConfReq id=0x2 <addr fe80::0210:7bff:fecf:37c0>]
sent [IPV6CP ConfAck id=0x2 <addr fe80::0210:7bff:fecf:37c0>]
local  LL address fe80::fdd2:3496:581b:1b03
remote LL address fe80::0210:7bff:fecf:37c0
Script /etc/ppp/ipv6-up started (pid 23478)
Script /etc/ppp/ipv6-up finished (pid 23478), status = 0x0
read /dev/ppp: Value too large for defined data type
rcvd [Compressed data] 90 4b a1 a3 07 58 cc 64 ...
sent [CCP ResetReq id=0x2]

I verified that if MPPE is enabled I can send pings up to 1499 bytes,
but a 1500 bytes ping (ping -M dont -s 1472) will reliably kill the
tunnel.

> Then again, what's the -M dont?  My ping (Debian) doesn't have that.
It requests not setting the DF flag. Actually my goal was to *set* it
(ping -M do) because I wanted to measure the tunnel MTU, but I used the
wrong flag.
If you do not use it then you may not be able to send large packets.
I recommend you replace the old netkit-ping with iputils-ping.

But my strategy does not work: after creating a new tunnel without MPPE
the packets are fragmented by PPP anyway because the link MTU is 1500 on
both sides.

This is the reason for me not initially setting the tunnel MTU, I
did not want to compute the overhead myself. I think that a section
in your PPTP FAQ explaining how to do this would be very useful.

-- 
ciao,
Marco
