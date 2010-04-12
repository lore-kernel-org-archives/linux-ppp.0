From: Mondayfox <qi.lesley@gmail.com>
Date: Mon, 12 Apr 2010 09:06:27 +0000
Subject: why cbcp option is not in the pppoe request packet
Message-Id: <28215364.post@talk.nabble.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


I tried to connet to win2003 RAS with linux redhat5,but failed.
After capturing packets , I found there was no cbcp option in the packet .
Then I made the cbcp=y in the pppd makefile ,and compiled again ,but still
failed. why?
do I need to compile pppoe again ? which files does pppoe need?

Apr  9 23:11:01 root pppd[6201]: pppd 2.4.3 started by root, uid 0
Apr  9 23:11:01 root pppd[6201]: Using interface ppp0
Apr  9 23:11:01 root pppd[6201]: Connect: ppp0 <--> /dev/ttyp1
Apr  9 23:11:01 root pppoe[6202]: PADS: Service-Name: ''
Apr  9 23:11:01 root pppoe[6202]: PPP session is 5 (0x5)
Apr  9 23:11:02 root pppd[6201]: Warning - secret file /etc/ppp/pap-secrets
has world and/or group access
Apr  9 23:11:05 root pppd[6201]: LCP terminated by peer
(PM-^WSP^@<M-Mt^@^@^BM-3)
Apr  9 23:11:05 root pppoe[6202]: Session 5 terminated -- received PADT from
peer
Apr  9 23:11:05 root pppoe[6202]: Sent PADT
Apr  9 23:11:05 root pppd[6201]: Modem hangup
Apr  9 23:11:05 root pppd[6201]: Connection terminated.
Apr  9 23:11:05 root pppd[6201]: Exit.
Apr  9 23:11:05 root pppoe-connect: PPPoE connection lost; attempting
re-connection.


Apr  9 23:12:15 root pppd[6609]: sent [LCP ConfReq id=0x1 <mru 1492> <magic
0x4c3c0c8d>]
Apr  9 23:12:15 root pppd[6609]: rcvd [LCP ConfReq id=0x0 <mru 1492> <auth
eap> <magic 0x7961386c> <callback CBCP> <mrru 1614> <endpoint
[local:85.e8.8b.f8.8d.e1.4c.ee.94.d8.88.b9.be.c8.b7.a5.00.00.00.00]> < 17 04
00 06>]
Apr  9 23:12:15 root pppd[6609]: sent [LCP ConfRej id=0x0 <callback CBCP>
<mrru 1614> < 17 04 00 06>]
Apr  9 23:12:15 root pppd[6609]: rcvd [LCP ConfAck id=0x1 <mru 1492> <magic
0x4c3c0c8d>]
Apr  9 23:12:15 root pppd[6609]: rcvd [LCP ConfReq id=0x1 <mru 1492> <auth
eap> <magic 0x7961386c> <endpoint
[local:85.e8.8b.f8.8d.e1.4c.ee.94.d8.88.b9.be.c8.b7.a5.00.00.00.00]>]
Apr  9 23:12:15 root pppd[6609]: sent [LCP ConfAck id=0x1 <mru 1492> <auth
eap> <magic 0x7961386c> <endpoint
[local:85.e8.8b.f8.8d.e1.4c.ee.94.d8.88.b9.be.c8.b7.a5.00.00.00.00]>]
Apr  9 23:12:15 root pppd[6609]: sent [LCP EchoReq id=0x0 magic=0x4c3c0c8d]
Apr  9 23:12:15 root pppd[6609]: rcvd [EAP Request id=0x5 Identity <No
message>]
Apr  9 23:12:15 root pppd[6609]: sent [EAP Response id=0x5 Identity <Name
"222222">]
Apr  9 23:12:15 root pppd[6609]: rcvd [LCP EchoRep id=0x0 magic=0x7961386c]
Apr  9 23:12:15 root pppd[6609]: rcvd [LCP TermReq id=0x3
"ya8l\000<\37777777715t\000\000\002\37777777663"]
Apr  9 23:12:15 root pppd[6609]: LCP terminated by peer
(ya8l^@<M-Mt^@^@^BM-3)
Apr  9 23:12:15 root pppd[6609]: sent [LCP TermAck id=0x3]
Apr  9 23:12:15 root pppoe[6610]: Session 15 terminated -- received PADT
from peer
Apr  9 23:12:15 root pppoe[6610]: Sent PADT
Apr  9 23:12:15 root pppd[6609]: Modem hangup
Apr  9 23:12:15 root pppd[6609]: Connection terminated.
Apr  9 23:12:15 root pppd[6609]: Script /usr/sbin/pppoe -p
/var/run/pppoe0.conf-pppoe.pid.pppoe -I fe2 -T 80 -U  -m 1412    -D
/tmp/pppoe-debug-6550/pppoe-debug.txt-0 finished (pid 6610), status = 0x0
Apr  9 23:12:15 root pppd[6609]: Exit.
-- 
View this message in context: http://old.nabble.com/why-cbcp-option-is-not-in-the-pppoe-request-packet-tp28215364p28215364.html
Sent from the linux-ppp mailing list archive at Nabble.com.

