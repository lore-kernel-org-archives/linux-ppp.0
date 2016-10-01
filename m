From: Manish Kambdur <manish.kambdur@gmail.com>
Date: Sat, 01 Oct 2016 15:50:39 +0000
Subject: Problem: How to force(?) pcomp and accomp
Message-Id: <CAAAUBLR3EqnpES7FrcABVZWB1j-NeOyH7_MoTH-iVYFJD14_XQ@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hello,

While trying to run pppd (version 2.4.7) with a serial modem, I have
the following strange situation:

1. On OpenWRT (v15.05.1) on ramips, the chat script completes
successfully, but LCP negotiation fails
===================
Fri Sep 30 18:27:41 2016 local2.info chat[1799]: CONNECT
Fri Sep 30 18:27:41 2016 local2.info chat[1799]:  -- got it
Fri Sep 30 18:27:41 2016 local2.info chat[1799]: send ( ^M)
Fri Sep 30 18:27:41 2016 local2.info chat[1799]: timeout set to 10 seconds
Fri Sep 30 18:27:41 2016 daemon.debug pppd[1796]: Script
/usr/sbin/chat -v -V -t10 -f /etc/ppp/peers/chat-a7 finished (pid
1798), status = 0x0
Fri Sep 30 18:27:41 2016 daemon.info pppd[1796]: Serial connection established.
Fri Sep 30 18:27:41 2016 daemon.debug pppd[1796]: using channel 3
Fri Sep 30 18:27:41 2016 daemon.info pppd[1796]: Using interface ppp0
Fri Sep 30 18:27:41 2016 daemon.notice pppd[1796]: Connect: ppp0 <--> /dev/ttyS0
Fri Sep 30 18:27:42 2016 daemon.debug pppd[1796]: sent [LCP ConfReq
id=0x1 <asyncmap 0x0> <magic 0xfcb097d0>]
Fri Sep 30 18:27:42 2016 daemon.debug pppd[1796]: rcvd [LCP ConfNak
id=0x1 <asyncmap 0x0> <magic 0xfcb097d0> <pcomp> <accomp>]
Fri Sep 30 18:27:42 2016 daemon.debug pppd[1796]: sent [LCP ConfReq
id=0x2 <asyncmap 0x0> <magic 0xdb4b9fb8>]
Fri Sep 30 18:27:42 2016 daemon.debug pppd[1796]: rcvd [LCP ConfReq
id=0x65 <asyncmap 0x0> <magic 0xfdb097d0> <pcomp> <accomp>]
Fri Sep 30 18:27:42 2016 daemon.debug pppd[1796]: sent [LCP ConfRej
id=0x65 <pcomp> <accomp>]
Fri Sep 30 18:27:42 2016 daemon.debug pppd[1796]: rcvd [LCP ConfNak
id=0x2 <asyncmap 0x0> <magic 0xdb4b9fb8> <pcomp> <accomp>]
Fri Sep 30 18:27:42 2016 daemon.debug pppd[1796]: sent [LCP ConfReq
id=0x3 <asyncmap 0x0> <magic 0x15b2a989>]
Fri Sep 30 18:27:42 2016 daemon.debug pppd[1796]: rcvd [LCP ConfReq
id=0x66 <asyncmap 0x0> <magic 0xdc4b9fb8> <pcomp> <accomp>]
Fri Sep 30 18:27:42 2016 daemon.debug pppd[1796]: sent [LCP ConfRej
id=0x66 <pcomp> <accomp>]
Fri Sep 30 18:27:42 2016 daemon.debug pppd[1796]: rcvd [LCP TermReq id=0xc9]
Fri Sep 30 18:27:42 2016 daemon.debug pppd[1796]: sent [LCP TermAck id=0xc9]
Fri Sep 30 18:27:42 2016 daemon.debug pppd[1796]: rcvd [LCP ConfNak
id=0x3 <asyncmap 0x0> <magic 0x15b2a989> <pcomp> <accomp>]
Fri Sep 30 18:27:42 2016 daemon.debug pppd[1796]: sent [LCP ConfReq
id=0x4 <asyncmap 0x0> <magic 0x1e92b17c>]
Fri Sep 30 18:27:42 2016 daemon.debug pppd[1796]: rcvd [LCP ConfReq
id=0x67 <asyncmap 0x0> <magic 0x16b2a989> <pcomp> <accomp>]
Fri Sep 30 18:27:42 2016 daemon.debug pppd[1796]: sent [LCP ConfRej
id=0x67 <pcomp> <accomp>]
Fri Sep 30 18:27:45 2016 daemon.debug pppd[1796]: sent [LCP ConfReq
id=0x4 <asyncmap 0x0> <magic 0x1e92b17c>]
Fri Sep 30 18:27:48 2016 daemon.debug pppd[1796]: sent [LCP ConfReq
id=0x4 <asyncmap 0x0> <magic 0x1e92b17c>]
Fri Sep 30 18:27:51 2016 daemon.debug pppd[1796]: sent [LCP ConfReq
id=0x4 <asyncmap 0x0> <magic 0x1e92b17c>]
Fri Sep 30 18:27:54 2016 daemon.debug pppd[1796]: sent [LCP ConfReq
id=0x4 <asyncmap 0x0> <magic 0x1e92b17c>]
Fri Sep 30 18:27:57 2016 daemon.debug pppd[1796]: sent [LCP ConfReq
id=0x4 <asyncmap 0x0> <magic 0x1e92b17c>]
Fri Sep 30 18:28:00 2016 daemon.debug pppd[1796]: sent [LCP ConfReq
id=0x4 <asyncmap 0x0> <magic 0x1e92b17c>]
Fri Sep 30 18:28:03 2016 daemon.debug pppd[1796]: sent [LCP ConfReq
id=0x4 <asyncmap 0x0> <magic 0x1e92b17c>]
Fri Sep 30 18:28:06 2016 daemon.debug pppd[1796]: sent [LCP ConfReq
id=0x4 <asyncmap 0x0> <magic 0x1e92b17c>]
Fri Sep 30 18:28:09 2016 daemon.debug pppd[1796]: sent [LCP ConfReq
id=0x4 <asyncmap 0x0> <magic 0x1e92b17c>]
Fri Sep 30 18:28:12 2016 daemon.warn pppd[1796]: LCP: timeout sending
Config-Requests
Fri Sep 30 18:28:12 2016 daemon.notice pppd[1796]: Connection terminated.
Fri Sep 30 18:28:12 2016 local2.info chat[1812]: abort on (BUSY)
Fri Sep 30 18:28:12 2016 local2.info chat[1812]: abort on (ERROR)
Fri Sep 30 18:28:12 2016 local2.info chat[1812]: abort on (NO DIALTONE)
Fri Sep 30 18:28:12 2016 local2.info chat[1812]: send (\K^M)
Fri Sep 30 18:28:13 2016 local2.info chat[1812]: send (\K^M)
Fri Sep 30 18:28:13 2016 local2.info chat[1812]: send (\K^M)
Fri Sep 30 18:28:13 2016 local2.info chat[1812]: send (+++ATH^M)
Fri Sep 30 18:28:13 2016 local2.info chat[1812]: send (+++ATH^M)
Fri Sep 30 18:28:13 2016 local2.info chat[1812]: send (+++ATH^M)
Fri Sep 30 18:28:13 2016 daemon.debug pppd[1796]: Script
/usr/sbin/chat -v -V -t3 -f /etc/ppp/peers/chat-disconnect finished
(pid 1811), status = 0x0
Fri Sep 30 18:28:13 2016 daemon.info pppd[1796]: Serial link disconnected.
Fri Sep 30 18:28:14 2016 daemon.notice pppd[1796]: Modem hangup
===================

I believe the main problem here starts after the following line, after
which it seems like the peer refuses to proceed without accomp and
pcomp
[LCP ConfRej id=0x65 <pcomp> <accomp>]

2. The exact same option file, works on Ubuntu 16.04 amd64
===================
Sep 30 18:24:01 pipe chat[6022]: CONNECT
Sep 30 18:24:01 pipe chat[6022]:  -- got it
Sep 30 18:24:01 pipe chat[6022]: send ( ^M)
Sep 30 18:24:01 pipe pppd[6019]: Script /usr/sbin/chat -v -V -t10 -f
/media/erti/devel/smart/workspace/atracker/res/chat-a7 finished (pid
6021), status = 0x0
Sep 30 18:24:01 pipe pppd[6019]: Serial connection established.
Sep 30 18:24:01 pipe pppd[6019]: using channel 6
Sep 30 18:24:01 pipe pppd[6019]: Using interface ppp0
Sep 30 18:24:01 pipe NetworkManager[964]: nm_device_get_device_type:
assertion 'NM_IS_DEVICE (self)' failed
Sep 30 18:24:01 pipe pppd[6019]: Connect: ppp0 <--> /dev/ttyUSB0
Sep 30 18:24:01 pipe NetworkManager[964]: <info>  [1475240041.5321]
manager: (ppp0): new Generic device
(/org/freedesktop/NetworkManager/Devices/9)
Sep 30 18:24:01 pipe NetworkManager[964]: <info>  [1475240041.5425]
devices added (path: /sys/devices/virtual/net/ppp0, iface: ppp0)
Sep 30 18:24:01 pipe NetworkManager[964]: <info>  [1475240041.5426]
device added (path: /sys/devices/virtual/net/ppp0, iface: ppp0): no
ifupdown configuration found.
Sep 30 18:24:02 pipe pppd[6019]: sent [LCP ConfReq id=0x1 <asyncmap
0x0> <magic 0x18f5f1a7> <pcomp> <accomp>]
Sep 30 18:24:02 pipe pppd[6019]: rcvd [LCP ConfAck id=0x1 <asyncmap
0x0> <magic 0x18f5f1a7> <pcomp> <accomp>]
Sep 30 18:24:02 pipe pppd[6019]: rcvd [LCP ConfReq id=0x65 <asyncmap
0x0> <magic 0x19f5f1a7> <pcomp> <accomp>]
Sep 30 18:24:02 pipe pppd[6019]: sent [LCP ConfAck id=0x65 <asyncmap
0x0> <magic 0x19f5f1a7> <pcomp> <accomp>]
Sep 30 18:24:02 pipe pppd[6019]: sent [LCP EchoReq id=0x0 magic=0x18f5f1a7]
Sep 30 18:24:02 pipe pppd[6019]: sent [CCP ConfReq id=0x1 <deflate 15>
<deflate(old#) 15> <bsd v1 15>]
Sep 30 18:24:02 pipe pppd[6019]: sent [IPCP ConfReq id=0x1 <compress
VJ 0f 01> <addr 0.0.0.0> <ms-dns1 0.0.0.0> <ms-dns2 0.0.0.0>]
Sep 30 18:24:02 pipe pppd[6019]: rcvd [LCP ProtRej id=0x0 80 fd 01 01
00 0f 1a 04 78 00 18 04 78 00 15 03 2f]
Sep 30 18:24:02 pipe pppd[6019]: Protocol-Reject for 'Compression
Control Protocol' (0x80fd) received
Sep 30 18:24:02 pipe pppd[6019]: rcvd [IPCP ConfRej id=0x1 <compress
VJ 0f 01> <ms-dns2 0.0.0.0>]
Sep 30 18:24:02 pipe pppd[6019]: sent [IPCP ConfReq id=0x2 <addr
0.0.0.0> <ms-dns1 0.0.0.0>]
Sep 30 18:24:02 pipe pppd[6019]: rcvd [IPCP ConfReq id=0x66 <addr 192.200.1.21>]
Sep 30 18:24:02 pipe pppd[6019]: sent [IPCP ConfAck id=0x66 <addr 192.200.1.21>]
Sep 30 18:24:02 pipe pppd[6019]: rcvd [IPCP ConfNak id=0x2 <addr
100.88.177.186> <ms-dns1 125.29.47.102>]
Sep 30 18:24:02 pipe pppd[6019]: sent [IPCP ConfReq id=0x3 <addr
100.88.177.186> <ms-dns1 125.29.47.102>]
Sep 30 18:24:02 pipe pppd[6019]: rcvd [IPCP ConfAck id=0x3 <addr
100.88.177.186> <ms-dns1 125.29.47.102>]
Sep 30 18:24:02 pipe pppd[6019]: not replacing default route to wlan0
[192.168.0.1]
Sep 30 18:24:02 pipe pppd[6019]: local  IP address 100.88.177.186
Sep 30 18:24:02 pipe pppd[6019]: remote IP address 192.200.1.21
Sep 30 18:24:02 pipe pppd[6019]: primary   DNS address 125.29.47.102
Sep 30 18:24:02 pipe pppd[6019]: Script /etc/ppp/ip-up started (pid 6043)
Sep 30 18:24:03 pipe pppd[6019]: Script /etc/ppp/ip-up finished (pid
6043), status = 0x0
Sep 30 18:24:04 pipe ntpd[7675]: Listen normally on 15 ppp0 100.88.177.186:123
Sep 30 18:24:04 pipe ntpd[7675]: new interface(s) found: waking up resolver
===================

3. The options file I am using is
===================
debug
/dev/ttyS0
115200
logfile /root/pppd.log
noauth
user 987654321
password 987654321
defaultroute
noipdefault
usepeerdns
nocrtscts
lock
persist

ipcp-max-configure 20
maxfail 3

connect '/usr/sbin/chat -v -V -t10 -f /etc/ppp/peers/chat-gprs'
disconnect '/usr/sbin/chat -v -V -t3 -f /etc/ppp/peers/chat-disconnect'
===================

I also tried the same SIM with another modem (a different brand and
model), and pppd succeeds on both OpenWRT and Ubuntu. If I add
'noaccomp' and 'nopcomp' to the options file use in Ubuntu, I end up
in a similar situation as on OpenWRT

I didn't see any compile time options to disable address and  and
pcomp support from pppd, but to me it seems like that's what has
happened in OpenWRT version of pppd.

I tried reading up about ppp and pppd, but I couldn't resolve this
problem. Any help will be appreciated.

Regards,
Manish
