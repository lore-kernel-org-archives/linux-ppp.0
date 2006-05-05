From: "=?gb2312?B?us7G1b2t?=" <pjhe@mail.ustc.edu.cn>
Date: Fri, 05 May 2006 03:20:50 +0000
Subject: LCP terminated by peer?
Message-Id: <346799250.11283@ustc.edu.cn>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

I use pppd and find sometimes the connection is closed by server, how can i fix
it? following is the print info, thanks!


pppd options in effect:
debug           # (from command line)
kdebug 0                # (from command line)
-detach         # (from command line)
dump            # (from command line)
lock            # (from command line)
connect /usr/ppp-on-dialer              # (from command line)
disconnect /usr/ppp-off-command         # (from command line)
escape ff               # (from command line)
asyncmap 20a0000                # (from command line)
noipdefault             # (from command line)
defaultroute            # (from command line)
netmask 255.255.255.0           # (from command line)
:               # (from command line)
Serial connection established.
using channel 7
Using interface ppp0
Connect: ppp0 <--> /dev/ttyS1
mtu = 1500, accm = 4294967295, pcomp = 0, accomp = 0
tty_recv_config: mru = 1500, asyncmap = 4294967295, pcomp = 1, accomp = 1
sent [LCP ConfReq id=0x1 <asyncmap 0x20a0000> <magic 0x5d93a4c4> <pcomp>
<accomp>]
rcvd 24
rcvd [LCP ConfAck id=0x1 <asyncmap 0x20a0000> <magic 0x5d93a4c4> <pcomp>
<accomp>]
rcvd 29
rcvd [LCP ConfReq id=0x3 <asyncmap 0xa0000> <pcomp> <accomp> <magic 0x93cecf54>
<auth chap MD5>]
sent [LCP ConfRej id=0x3 <auth chap MD5>]
rcvd 28
rcvd [LCP ConfReq id=0x5 <asyncmap 0xa0000> <pcomp> <accomp> <magic 0x93cecf54>
<auth pap>]
sent [LCP ConfRej id=0x5 <auth pap>]
rcvd 24
rcvd [LCP ConfReq id=0x7 <asyncmap 0xa0000> <pcomp> <accomp> <magic 0x93cecf54>]
sent [LCP ConfAck id=0x7 <asyncmap 0xa0000> <pcomp> <accomp> <magic 0x93cecf54>]
mtu = 1500, accm = 655360, pcomp = 1, accomp = 1
tty_recv_config: mru = 1500, asyncmap = 34209792, pcomp = 1, accomp = 1
sent [IPCP ConfReq id=0x1 <addr 0.0.0.0> <compress VJ 0f 01>]
sent [CCP ConfReq id=0x1 <deflate 15> <deflate(old#) 15> <bsd v1 15>]
rcvd 14
rcvd [IPCP ConfRej id=0x1 <compress VJ 0f 01>]
sent [IPCP ConfReq id=0x2 <addr 0.0.0.0>]
rcvd 25
rcvd [LCP ProtRej id=0x8 80 fd 01 01 00 0f 1a 04 78 00 18 04 78 00 15 03 2f]
rcvd 14
rcvd [IPCP ConfReq id=0x1 <addr 192.168.254.254>]
sent [IPCP CodfAck id=0x1 <adrr 192.168.254.254>]
sent [IPCP ConfReq id=0x2 <addr 0.0.0.0>]
rcvd 14
rcvd [IPCP ConfNak id=0x2 <addr 10.49.18.78>]
sent [IPCP ConfReq id=0x3 <addr 10.49.18.78>]
rcvd 14
rcvd [IPCP ConfAck id=0x3 <addr 10.49.18.78>]
local  IP address 10.49.18.78
remote IP address 192.168.254.254
rcvd 8
rcvd [LCP TermReq id=0x9]
LCP terminated by peer
mtu = 1500, accm = 4294967295, pcomp = 0, accomp = 0
tty_recv_config: mru = 1500, asyncmap = 34209792, pcomp = 1, accomp = 1
sent [LCP TermAck id=0x9]
Connection terminated.


