From: James Chapman <jchapman@katalix.com>
Date: Wed, 20 Oct 2004 19:34:48 +0000
Subject: pppd mtu negotiation problems
Message-Id: <4176BDD8.30803@katalix.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

I'm seeing some unexpected behavior when negotiating MTU using
ppp-2.4.2. The peer is a Cisco box, running IOS 12.1.

My PPP session is inside an L2TP tunnel. The local pppd client is
started as shown, requesting MTU of 1460 which allows space for
UDP/L2TP headers.

pppd 10.2.1.3:10.2.1.4 debug kdebug 7 mtu 1460 mru 1460 noipdefault \
      user cisco password cisco local \
      noaccomp nopcomp nobsdcomp nodeflate nopredictor1 novj novjccomp

When the pppN interface comes up, it has MTU of 1464. Yet on the cisco
box, its interface shows an MTU of 1460. This mismatch leads to
problems.

The local syslog contains the following.

pppd[3442]: pppd 2.4.2 started by root, uid 0
pppd[3442]: using channel 12
pppd[3442]: Using interface ppp0
pppd[3442]: Connect: ppp0 <-->
pppd[3442]: sent [LCP ConfReq id=0x1 <mru 1460> <magic 0x1175456f>]
pppd[3442]: rcvd [LCP ConfReq id=0x1 <mru 1464> <auth pap> <magic
0x7bdddc5>]
pppd[3442]: sent [LCP ConfAck id=0x1 <mru 1464> <auth pap> <magic
0x7bdddc5>]
                                      ^^^^^^^^^^
pppd[3442]: rcvd [LCP ConfReq id=0x2 <mru 1464> <auth pap> <magic
0x7bdddc5>]
pppd[3442]: sent [LCP ConfAck id=0x2 <mru 1464> <auth pap> <magic
0x7bdddc5>]
pppd[3442]: sent [LCP ConfReq id=0x1 <mru 1460> <magic 0x1175456f>]
pppd[3442]: rcvd [LCP ConfNak id=0x1 <mru 1464>]
pppd[3442]: sent [LCP ConfReq id=0x2 <mru 1464> <magic 0x1175456f>]
pppd[3442]: rcvd [LCP ConfAck id=0x2 <mru 1464> <magic 0x1175456f>]
pppd[3442]: sent [PAP AuthReq id=0x1 user="cisco" password=<hidden>]
pppd[3442]: rcvd [PAP AuthAck id=0x1 ""]
pppd[3442]: PAP authentication succeeded
pppd[3442]: sent [IPCP ConfReq id=0x1 <addr 10.2.1.3>]
pppd[3442]: rcvd [IPCP ConfReq id=0x1 <addr 0.0.0.0>]
pppd[3442]: sent [IPCP ConfNak id=0x1 <addr 10.2.1.4>]
pppd[3442]: rcvd [IPCP ConfAck id=0x1 <addr 10.2.1.3>]
pppd[3442]: rcvd [IPCP ConfReq id=0x2 <addr 10.2.1.4>]
pppd[3442]: sent [IPCP ConfAck id=0x2 <addr 10.2.1.4>]
pppd[3442]: local  IP address 10.2.1.3
pppd[3442]: remote IP address 10.2.1.4
pppd[3442]: Script /etc/ppp/ip-up started (pid 3444)
pppd[3442]: Script /etc/ppp/ip-up finished (pid 3444), status = 0x0

It looks like both pppd and cisco send ConfReq requesting different
MTU. Pppd acks the cisco 1464 MTU value but then sends another ConfReq
asking for 1460. Cisco naks the 1460 and the peers then agree to use
1464.

Questions:-

- Is cisco right to request MTU of 1464 and then set its interface to
   have MTU of 1460? Perhaps the MTU value sent during LCP negotiations
   is supposed to include the ethernet checksum? If so, pppd should
   always reduce the negotiated value of MTU by 4 when doing
   netif_set_mtu() for ethernet links.

- Is the above LCP negotiation correct? Should pppd ack the 1464 value
   when an MTU of 1460 is requested? (See the '^^^^' annotation in the
   log above).

Comments?

-- 
James Chapman
PGP key : http://www.katalix.com/~jchapman/pgpkey.txt


