From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Fri, 15 Oct 2004 16:28:32 +0000
Subject: absolutely baffled as to why PPP link doesn't allow pings
Message-Id: <Pine.LNX.4.60.0410151211340.11955@localhost.localdomain>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


  ok, a little more detail on a problem that's driving us totally nuts
here.  we have a small embedded system that dials out via an onboard
modem.

  when we connect the onboard modem to the actual telephone system and
dial into a modem pool in another building here, everything works just
fine.  the remote host runs (i *believe*) some variation of windows,
but no one here seems quite sure.  however, the important thing is
that the dialing takes place, the PPP interface comes up, and "ping"
to the remote host actually works -- that's what we're after.

  after that's established, we disconnect the embedded system from the
phone system and plug it into a teltone box, which is further
connected to another modem, then into a test host running fedora core
2.  then we simplify the call to "pppd" to remove *all* authentication
(details to follow).  start PPP on the embedded system, and everything
seems to go swimmingly.  ring, ring, ring, hiss, PPP is established,
interface comes up on both sides, both sides recognize the other side
with the correct IP address and ... nothing.  ping hangs totally when
run on either host.

  the layout:

      host (10.1.1.96) <-> modem <-> teltone <-> embedded (10.1.1.97)

  on the embedded side, after PPP comes up, the routing table has a
single entry:

  10.1.1.97  0.0.0.0  255.255.255.255  UH 0 0 0 ppp0

exactly what i would expect.  no defaultroute, we don't need one.

  on the host side, the results of running various commands:

ifconfig:
---------

eth0      Link encap:Ethernet  HWaddr 00:03:47:0A:BB:8E
          inet addr:10.1.1.91  Bcast:10.1.1.255  Mask:255.255.255.0
          inet6 addr: fe80::203:47ff:fe0a:bb8e/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:2107928 errors:0 dropped:0 overruns:0 frame:0
          TX packets:11670 errors:1 dropped:0 overruns:0 carrier:1
          collisions:484 txqueuelen:1000
          RX bytes:291672739 (278.1 Mb)  TX bytes:1330567 (1.2 Mb)

lo        Link encap:Local Loopback
          inet addr:127.0.0.1  Mask:255.0.0.0
          inet6 addr: ::1/128 Scope:Host
          UP LOOPBACK RUNNING  MTU:16436  Metric:1
          RX packets:4957 errors:0 dropped:0 overruns:0 frame:0
          TX packets:4957 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:3350770 (3.1 Mb)  TX bytes:3350770 (3.1 Mb)

ppp0      Link encap:Point-to-Point Protocol
          inet addr:10.1.1.96  P-t-P:10.1.1.97  Mask:255.255.255.255
          UP POINTOPOINT RUNNING NOARP MULTICAST  MTU:552  Metric:1
          RX packets:9 errors:1 dropped:0 overruns:0 frame:0
          TX packets:22 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:3
          RX bytes:411 (411.0 b)  TX bytes:1497 (1.4 Kb)

route -n:
---------

Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
10.1.1.97       0.0.0.0         255.255.255.255 UH    0      0        0 ppp0
10.1.1.0        0.0.0.0         255.255.255.0   U     0      0        0 eth0
169.254.0.0     0.0.0.0         255.255.0.0     U     0      0        0 eth0
127.0.0.0       0.0.0.0         255.0.0.0       U     0      0        0 lo
0.0.0.0         10.1.1.1        0.0.0.0         UG    0      0        0 eth0

here's the excerpt from /var/log/messages:
------------------------------------------

Oct 15 11:53:22 lgl mgetty[20364]: data dev=ttyS0, pid 364, caller='none', conn='33600/ARQ/V34/LAPM/V42BIS', name='', cmd='/usr/sbin/pppd', user='/AutoPPP/'
Oct 15 11:53:22 lgl pppd[20364]: pppd 2.4.1 started by a_ppp, uid 0
Oct 15 11:53:22 lgl pppd[20364]: Using interface ppp0
Oct 15 11:53:22 lgl pppd[20364]: Connect: ppp0 <--> /dev/ttyS0
Oct 15 11:53:25 lgl pppd[20364]: Deflate (15) compression enabled
Oct 15 11:53:25 lgl pppd[20364]: local  IP address 10.1.1.96
Oct 15 11:53:25 lgl pppd[20364]: remote IP address 10.1.1.97

here's the syslog output for just pppd:
---------------------------------------

Oct 15 12:03:56 lgl pppd[20364]: Terminating on signal 15.
Oct 15 12:03:56 lgl pppd[20364]: Script /etc/ppp/ip-down started (pid 20527)
Oct 15 12:03:56 lgl pppd[20364]: sent [LCP TermReq id=0x2 "User request"]
Oct 15 12:03:56 lgl pppd[20364]: Script /etc/ppp/ip-down finished (pid 20527), status = 0x0
Oct 15 12:03:59 lgl pppd[20364]: sent [LCP TermReq id=0x3 "User request"]
Oct 15 12:04:02 lgl pppd[20364]: Connection terminated.
Oct 15 12:04:02 lgl pppd[20364]: Connect time 10.6 minutes.
Oct 15 12:04:02 lgl pppd[20364]: Sent 1497 bytes, received 411 bytes.
Oct 15 12:04:03 lgl pppd[20364]: Exit.
Oct 15 12:04:48 lgl pppd[20556]: pppd 2.4.1 started by a_ppp, uid 0
Oct 15 12:04:48 lgl pppd[20556]: using channel 55
Oct 15 12:04:48 lgl pppd[20556]: Using interface ppp0
Oct 15 12:04:48 lgl pppd[20556]: Connect: ppp0 <--> /dev/ttyS0
Oct 15 12:04:48 lgl pppd[20556]: sent [LCP ConfReq id=0x1 <mru 552> <asyncmap 0x0> <magic 0xe9238fde> <pcomp> <accomp>]
Oct 15 12:04:48 lgl pppd[20556]: rcvd [LCP ConfAck id=0x1 <mru 552> <asyncmap 0x0> <magic 0xe9238fde> <pcomp> <accomp>]
Oct 15 12:04:51 lgl pppd[20556]: rcvd [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xf687cd39> <pcomp> <accomp>]
Oct 15 12:04:51 lgl pppd[20556]: sent [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0xf687cd39> <pcomp> <accomp>]
Oct 15 12:04:51 lgl pppd[20556]: sent [IPCP ConfReq id=0x1 <addr 10.1.1.96> <compress VJ 0f 01>]
Oct 15 12:04:51 lgl pppd[20556]: sent [CCP ConfReq id=0x1 <deflate 15> <deflate(old#) 15>]
Oct 15 12:04:51 lgl pppd[20556]: rcvd [IPCP ConfReq id=0x1 <addr 0.0.0.0> <compress VJ 0f 01>]
Oct 15 12:04:51 lgl pppd[20556]: sent [IPCP ConfNak id=0x1 <addr 10.1.1.97>]
Oct 15 12:04:51 lgl pppd[20556]: rcvd [CCP ConfReq id=0x1 <deflate 15> <deflate(old#) 15> <bsd v1 15>]
Oct 15 12:04:51 lgl pppd[20556]: sent [CCP ConfAck id=0x1 <deflate 15> <deflate(old#) 15> <bsd v1 15>]
Oct 15 12:04:51 lgl pppd[20556]: rcvd [IPCP ConfAck id=0x1 <addr 10.1.1.96> <compress VJ 0f 01>]
Oct 15 12:04:51 lgl pppd[20556]: rcvd [CCP ConfAck id=0x1 <deflate 15> <deflate(old#) 15>]
Oct 15 12:04:51 lgl pppd[20556]: Deflate (15) compression enabled
Oct 15 12:04:51 lgl pppd[20556]: rcvd [IPCP ConfReq id=0x2 <addr 10.1.1.97> <compress VJ 0f 01>]
Oct 15 12:04:51 lgl pppd[20556]: sent [IPCP ConfAck id=0x2 <addr 10.1.1.97> <compress VJ 0f 01>]
Oct 15 12:04:51 lgl pppd[20556]: local  IP address 10.1.1.96
Oct 15 12:04:51 lgl pppd[20556]: remote IP address 10.1.1.97
Oct 15 12:04:51 lgl pppd[20556]: Script /etc/ppp/ip-up started (pid 20585)
Oct 15 12:04:51 lgl pppd[20556]: Script /etc/ppp/ip-up finished (pid 20585), status = 0x0


  anything here look suspicious?  we're baffled by the fact that the
actual PPP activation seems fine, but once the link is up, we get
nothing.  i can provide more info, of course, if it's necessary, but
to start, does any of the host-side configuration look out of sorts?
we've had three different people looking at this, and no one can see
anything odd.

  help?

rday
