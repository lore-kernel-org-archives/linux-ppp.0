From: Sebastien Hugues <sebastien.hugues@swissinfo.org>
Date: Tue, 06 Jan 2004 10:53:41 +0000
Subject: LCP terminated by peer
Message-Id: <3FFB1210.2080606@swissinfo.org>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi,

I want a GPRS connection throught bluetooth and my Nokia 3650 but it 
doesn't
work. Ppp logs are:

pppd 2.4.1 started by root, uid 0
Serial connection established.
using channel 13
Using interface ppp0
Connect: ppp0 <--> /dev/pts/3
rcvd [LCP ConfReq id=0x0 <auth pap> <mru 1500> <asyncmap 0xa0000>]
sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0x6208c48e> <pcomp> <accomp>]
sent [LCP ConfRej id=0x0 <auth pap>]
rcvd [LCP ConfRej id=0x1 <magic 0x6208c48e> <pcomp> <accomp>]
sent [LCP ConfReq id=0x2 <asyncmap 0x0>]
rcvd [LCP ConfReq id=0x1 <mru 1500> <asyncmap 0xa0000>]
sent [LCP ConfAck id=0x1 <mru 1500> <asyncmap 0xa0000>]
rcvd [LCP ConfAck id=0x2 <asyncmap 0x0>]
sent [IPCP ConfReq id=0x1 <addr 0.0.0.0> <compress VJ 0f 01>]
sent [CCP ConfReq id=0x1 <deflate 15> <deflate(old#) 15> <bsd v1 15>]
rcvd [IPCP ConfReq id=0x0 <addr 10.6.6.6>]
sent [IPCP ConfAck id=0x0 <addr 10.6.6.6>]
rcvd [LCP ProtRej id=0x0 80 fd 01 01 00 0f 1a 04 78 00 18 04 78 00 15 03 2f]
rcvd [LCP TermReq id=0x2]
LCP terminated by peer
sent [LCP TermAck id=0x2]
Connection terminated.
Couldn't release PPP unit: Invalid argument
Serial link disconnected.

my ppp options:
noauth
local
notty
defaultroute
nodetach
nocrtscts
noipdefault
debug

Any ideas ? Thanks a lot..

Regards
Seb

