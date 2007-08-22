From: "Dennis Aberilla" <daberill@gmail.com>
Date: Wed, 22 Aug 2007 04:04:17 +0000
Subject: PPP loses compression sync when TCP transaction starts.
Message-Id: <57e69ca80708212104t1fbd99f7jc3beaa4b34997ffc@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Greetings!

My problem is that as soon as I start using my ppp link, ppp instantly
spits an error "Lost compression sync: disabling compression" and then
my connection slows down significantly. However, this only happens
when I run my setup with kernel 2.6.20; but with kernel 2.4.18
everything works just fine.

My setup is ARM Linux with 2.6.20 kernel on a custom board based on
Samsung's SMDK2410 board. I have two of these boards connected via a
custom serial connection (distance is 4 inches; I'm just using a
ribbon cable). I am setting up a ppp link over this serial connection
so I can do network transactions across the two boards.

My setup with 2.4.18 kernel was compiled using gcc 2.95.3 and my
2.6.20 setup uses gcc 3.4.6 (I've also tried gcc 4.1.1 but it didn't
help.) I've tried different versions of pppd; 2.4.1, 2.4.3, 2.4.4 and
2.4.4b1 -- same problem.

What could have caused this? I've debugged the serial connection and
I've verified that there are no data corruption happening. If I turn
off compression, the link has no problems whatsoever; (no errors
according to /proc/net/dev) and I can ftp, iperf, ssh, etc with no
problems -- it's just that it's a bit slow. But with kernel 2.4.18
where I can have compression, I can achieve up to 2Mbps over the link.

Take note though, that this error doesn't happen if I just do pings;
even flood pings across the link. But when I do "tracepath" or "iperf"
or "remote desktop connection" across the link, this problem shows up.
I've played a bit with the ppp options cause it might be some VJ
compression issue; but even with "novj" and "novjccomp" options, still
the problem occurs.

Below is the debug log from pppd (listener):
...
Using interface ppp0
Connect: ppp0 <--> /dev/pts/0
sent [LCP ConfReq id=0x1 <asyncmap 0xa0000> <magic 0x5457ce63> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0x701f731c> <pcomp> <accomp>]
sent [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0x701f731c> <pcomp> <accomp>]
rcvd [LCP ConfAck id=0x1 <asyncmap 0xa0000> <magic 0x5457ce63> <pcomp> <accomp>]
sent [LCP EchoReq id=0x0 magic=0x5457ce63]
sent [CCP ConfReq id=0x1 <deflate 15> <deflate(old#) 15> <bsd v1 15>]
sent [IPCP ConfReq id=0x1 <compress VJ 0f 01> <addr 192.168.1.88>]
rcvd [LCP EchoRep id=0x0 magic=0x701f731c]
rcvd [CCP ConfReq id=0x1 <deflate 15> <deflate(old#) 15> <bsd v1 15>]
sent [CCP ConfAck id=0x1 <deflate 15> <deflate(old#) 15> <bsd v1 15>]
rcvd [IPCP ConfReq id=0x1 <compress VJ 0f 01> <addr 0.0.0.0>]
sent [IPCP ConfNak id=0x1 <addr 192.168.1.89>]
rcvd [CCP ConfAck id=0x1 <deflate 15> <deflate(old#) 15> <bsd v1 15>]
Deflate (15) compression enabled
rcvd [IPCP ConfAck id=0x1 <compress VJ 0f 01> <addr 192.168.1.88>]
rcvd [IPCP ConfReq id=0x2 <compress VJ 0f 01> <addr 192.168.1.89>]
sent [IPCP ConfAck id=0x2 <compress VJ 0f 01> <addr 192.168.1.89>]
Cannot determine ethernet address for proxy ARP
local  IP address 192.168.1.88
remote IP address 192.168.1.89
Script /etc/ppp/ip-up started (pid 117)
Script /etc/ppp/ip-up finished (pid 117), status = 0x0
Aug 22 03:26:34 (none) daemon.notice pppd[116]: pppd 2.4.4 started by
root, uid 0
Aug 22 03:26:34 (none) daemon.debug pppd[116]: using channel 1
Aug 22 03:26:34 (none) daemon.info pppd[116]: Using interface ppp0
Aug 22 03:26:34 (none) daemon.notice pppd[116]: Connect: ppp0 <--> /dev/pts/0
Aug 22 03:26:34 (none) daemon.debug pppd[116]: sent [LCP ConfReq
id=0x1 <asyncmap 0xa0000> <magic 0x5457ce63> <pcomp> <accomp>]
Aug 22 03:26:34 (none) daemon.debug pppd[116]: rcvd [LCP ConfReq
id=0x1 <asyncmap 0x0> <magic 0x701f731c> <pcomp> <accomp>]
Aug 22 03:26:34 (none) daemon.debug pppd[116]: sent [LCP ConfAck
id=0x1 <asyncmap 0x0> <magic 0x701f731c> <pcomp> <accomp>]
Aug 22 03:26:34 (none) daemon.debug pppd[116]: rcvd [LCP ConfAck
id=0x1 <asyncmap 0xa0000> <magic 0x5457ce63> <pcomp> <accomp>]
Aug 22 03:26:34 (none) daemon.debug pppd[116]: sent [LCP EchoReq
id=0x0 magic=0x5457ce63]
Aug 22 03:26:34 (none) daemon.debug pppd[116]: sent [CCP ConfReq
id=0x1 <deflate 15> <deflate(old#) 15> <bsd v1 15>]
Aug 22 03:26:34 (none) daemon.debug pppd[116]: sent [IPCP ConfReq
id=0x1 <compress VJ 0f 01> <addr 192.168.1.88>]
Aug 22 03:26:34 (none) daemon.debug pppd[116]: rcvd [LCP EchoRep
id=0x0 magic=0x701f731c]
Aug 22 03:26:34 (none) daemon.debug pppd[116]: rcvd [CCP ConfReq
id=0x1 <deflate 15> <deflate(old#) 15> <bsd v1 15>]
Aug 22 03:26:34 (none) daemon.debug pppd[116]: sent [CCP ConfAck
id=0x1 <deflate 15> <deflate(old#) 15> <bsd v1 15>]
Aug 22 03:26:34 (none) daemon.debug pppd[116]: rcvd [IPCP ConfReq
id=0x1 <compress VJ 0f 01> <addr 0.0.0.0>]
Aug 22 03:26:34 (none) daemon.debug pppd[116]: sent [IPCP ConfNak
id=0x1 <addr 192.168.1.89>]
Aug 22 03:26:34 (none) daemon.debug pppd[116]: rcvd [CCP ConfAck
id=0x1 <deflate 15> <deflate(old#) 15> <bsd v1 15>]
Aug 22 03:26:34 (none) daemon.notice pppd[116]: Deflate (15) compression enabled
Aug 22 03:26:34 (none) daemon.debug pppd[116]: rcvd [IPCP ConfAck
id=0x1 <compress VJ 0f 01> <addr 192.168.1.88>]
Aug 22 03:26:34 (none) daemon.debug pppd[116]: rcvd [IPCP ConfReq
id=0x2 <compress VJ 0f 01> <addr 192.168.1.89>]
Aug 22 03:26:34 (none) daemon.debug pppd[116]: sent [IPCP ConfAck
id=0x2 <compress VJ 0f 01> <addr 192.168.1.89>]
Aug 22 03:26:34 (none) daemon.err pppd[116]: Cannot determine ethernet
address for proxy ARP
Aug 22 03:26:34 (none) daemon.notice pppd[116]: local  IP address 192.168.1.88
Aug 22 03:26:34 (none) daemon.notice pppd[116]: remote IP address 192.168.1.89
Aug 22 03:26:34 (none) daemon.debug pppd[116]: Script /etc/ppp/ip-up
started (pid 117)
Aug 22 03:26:34 (none) daemon.debug pppd[116]: Script /etc/ppp/ip-up
finished (pid 117), status = 0x0
...

The moment I start "tracepath", "ftp" or others, I see the following:

...
/ # rcvd [Compressed data] 00 00 52 74 65 60 bd c3 ...
Lost compression sync: disabling compression
sent [CCP TermReq id=0x2"Lost compression sync"]
rcvd [CCP TermAck id=0x2]
Aug 22 03:28:12 (none) daemon.debug pppd[116]: rcvd [Compressed data]
00 00 52 74 65 60 bd c3 ...
Aug 22 03:28:12 (none) daemon.err pppd[116]: Lost compression sync:
disabling compression
Aug 22 03:28:12 (none) daemon.debug pppd[116]: sent [CCP TermReq
id=0x2"Lost compression sync"]
Aug 22 03:28:13 (none) daemon.debug pppd[116]: rcvd [CCP TermAck id=0x2]
...

Below are my pppdrc file contents:

pppdrc file (listener):

local
xonxoff
nodetach
asyncmap 0
192.168.1.88:192.168.1.89
persist
debug
proxyarp
ktune
ms-dns 172.25.1.1
lcp-echo-interval 30
lcp-echo-failure 5

pppdrc file (initiator):

local
nodetach
defaultroute
noauth
debug
asyncmap 0
persist

Any ideas on this matter is much appreciated.
Many thanks.
