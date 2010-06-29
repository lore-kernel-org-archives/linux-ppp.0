From: "Milan P. Stanic" <mps@arvanta.net>
Date: Tue, 29 Jun 2010 09:26:01 +0000
Subject: PPPoE with ADSL dies when there is high net load
Message-Id: <20100629092601.GA14670@ares.arwanta.net>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hello,

After upgrade of the Linux kernel to 2.6.31 (and newer) pppd dies when
there is high number of simultaneous connection to the Internet.
I'm using pppd version 2.4.5 with rp-pppoe plugin and ADSL link is setup
with (ADSL USB modem):
br2684ctl -c 0 -b -a 8.35

Config file is:
user xxxxx
remotename xxxx
plugin rp-pppoe.so
nas0
noipdefault
defaultroute
replacedefaultroute
persist
noauth
pap-restart 6
pap-max-authreq 5
mtu 1412
debug

and pppd is started with command:
/usr/sbin/pppd nodetach call dsl

Log file shows that:
Jun 29 10:52:53 fx pppd[9184]: rcvd [LCP EchoReq id=0x4c magic=0xbb76f5af 70 89 b9 15]
Jun 29 10:52:53 fx pppd[9184]: sent [LCP EchoRep id=0x4c magic=0x7089b915 70 89 b9 15]
Jun 29 10:53:04 fx pppd[9184]: sent [LCP EchoReq id=0x76 magic=0x7089b915]
Jun 29 10:53:05 fx pppd[9184]: rcvd [LCP EchoReq id=0x4d magic=0xbb76f5af 70 89 b9 15]
Jun 29 10:53:05 fx pppd[9184]: sent [LCP EchoRep id=0x4d magic=0x7089b915 70 89 b9 15]
Jun 29 10:53:14 fx pppd[9184]: rcvd [LCP EchoReq id=0x4e magic=0xbb76f5af 70 89 b9 15]
Jun 29 10:53:14 fx pppd[9184]: sent [LCP EchoRep id=0x4e magic=0x7089b915 70 89 b9 15]
Jun 29 10:53:22 fx pppd[9184]: rcvd [LCP TermReq id=0x2]
Jun 29 10:53:22 fx pppd[9184]: LCP terminated by peer

When there are few downloads active (without any bandwidth limiting)
all is fine but when there are a lot (ten to twenty) HTTP sessions
started at the same time link dies.

With Linux kernel version 2.6.30.3 (and older) it was very stable (even
months), but with all new versions problem occurs.

I think that that is the kernel driver problem and not pppd problem
but I'm not sure, and I hope that some of the kernel ppp
developer/maintainer are subscribed here and can help to solve that
problem.

TIA

-- 
Kind regards,  Milan
