From: Dmitry Koval <koval@donapex.net>
Date: Fri, 09 Apr 2004 08:01:44 +0000
Subject: pppd 2.4.2 doesn't quits.
Message-Id: <1081497703.3268.17.camel@skyscraper>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


I've faced the problem with pppd 2.4.2 on my VPN server.
The problem is that pppd just after having session done doesn't quits
and hangs in memory. And what is also interesting is that sometimes it's
quits fine but sometimes not.
I'm using radius for client authorization and pppd saves all info before
exit as it should do.

I've tried everything I can and I have no any clue on the subject.
Any pointers would be highly appreciated.

The software I'm using:

Fedora Core1 with latest updates
pppd version 2.4.2
2.4.22-1.2174.nptl

My options file:
## CHANGE TO SUIT YOUR SYSTEM
lock
 
lcp-echo-interval 10
lcp-echo-failure 6
 
## turn pppd syslog debugging on
debug
 
## change 'pptpd' to whatever you specify as your server name in
chap-secrets
name pptpd
 
proxyarp
bsdcomp 0
 
# This option applies if you use ppp with chapms-strip-domain patch
#chapms-strip-domain
 
# These options apply if you use ppp with mppe patch
# NB! You should also apply the ChapMS-V2 patch
-chap
-mschap
+mschap-v2
#mppe-128
#mppe-stateless
 
# These options will tell ppp to pass on these to your clients
# To use ms-wins or ms-dns in options.pptpd it must exist in
/etc/resolv.conf
#ms-wins your.server.here
ms-dns x.x.x.x
 
plugin radius.so

Here's the ps output:
root     28379  0.0  0.0  3676 1028 ?        S    10:18   0:00
/usr/sbin/pppd local file /etc/ppp/options.pptpd 115200
172.16.1.1:10.0.100.1

And here's the log of the session:
Apr  9 10:18:14 sputnik pppd[28379]: Plugin radius.so loaded.
Apr  9 10:18:14 sputnik pppd[28379]: RADIUS plugin initialized.
Apr  9 10:18:14 sputnik pppd[28379]: pppd 2.4.2 started by root, uid 0
Apr  9 10:18:14 sputnik pppd[28379]: using channel 450
Apr  9 10:18:14 sputnik pppd[28379]: Using interface ppp4
Apr  9 10:18:14 sputnik pppd[28379]: Connect: ppp4 <--> /dev/pts/7
Apr  9 10:18:14 sputnik pppd[28379]: sent [LCP ConfReq id=0x1 <asyncmap
0x0> <auth chap MS-v2> <magic 0x2ba38ec5> <pcomp> <accomp>]
Apr  9 10:18:16 sputnik pppd[28379]: rcvd [LCP ConfReq id=0x1 <mru 1400>
<magic 0x53bc3070> <pcomp> <accomp> <callback CBCP>]
Apr  9 10:18:16 sputnik pppd[28379]: sent [LCP ConfRej id=0x1 <callback
CBCP>]
Apr  9 10:18:16 sputnik pppd[28379]: rcvd [LCP ConfReq id=0x2 <mru 1400>
<magic 0x53bc3070> <pcomp> <accomp>]
Apr  9 10:18:16 sputnik pppd[28379]: sent [LCP ConfAck id=0x2 <mru 1400>
<magic 0x53bc3070> <pcomp> <accomp>]
Apr  9 10:18:17 sputnik pppd[28379]: sent [LCP ConfReq id=0x1 <asyncmap
0x0> <auth chap MS-v2> <magic 0x2ba38ec5> <pcomp> <accomp>]
Apr  9 10:18:17 sputnik pppd[28379]: rcvd [LCP ConfAck id=0x1 <asyncmap
0x0> <auth chap MS-v2> <magic 0x2ba38ec5> <pcomp> <accomp>]
Apr  9 10:18:17 sputnik pppd[28379]: sent [LCP EchoReq id=0x0
magic=0x2ba38ec5]
Apr  9 10:18:17 sputnik pppd[28379]: sent [CHAP Challenge id=0x43
<b4dccf2a3cbcbfe166e8d163b48b987d>, name = "pptpd"]
Apr  9 10:18:17 sputnik pppd[28379]: rcvd [LCP code=0xc id=0x3 53 bc 30
70 4d 53 52 41 53 56 35 2e 31 30]
Apr  9 10:18:17 sputnik pppd[28379]: sent [LCP CodeRej id=0x2 0c 03 00
12 53 bc 30 70 4d 53 52 41 53 56 35 2e 31 30]
Apr  9 10:18:17 sputnik pppd[28379]: rcvd [LCP code=0xc id=0x4 53 bc 30
70 4d 53 52 41 53 2d 31 2d 53 44 41 2d 4f 48 31 44 37 34 37 4c 58 4d 53]
Apr  9 10:18:17 sputnik pppd[28379]: sent [LCP CodeRej id=0x3 0c 04 00
1f 53 bc 30 70 4d 53 52 41 53 2d 31 2d 53 44 41 2d 4f 48 31 44 37 34 37
4c 58 4d 53]
Apr  9 10:18:17 sputnik pppd[28379]: rcvd [CHAP Response id=0x43
<bb3ed793918f55e27b07cb9a05b1a49500000000000000007d26c8c876befc39126b77d9552a8c616b34f1d43ca2207e00>, name = "sdah"]
Apr  9 10:18:18 sputnik pppd[28379]: sent [CHAP Success id=0x43
"S&F9169CFC55EAF392B97D76BFE6FFC2FBB93E9B"]
Apr  9 10:18:18 sputnik pppd[28379]: sent [CCP ConfReq id=0x1 <deflate
15> <deflate(old#) 15>]
Apr  9 10:18:18 sputnik pppd[28379]: sent [IPCP ConfReq id=0x1 <compress
VJ 0f 01> <addr 172.16.1.1>]
Apr  9 10:18:18 sputnik pppd[28379]: rcvd [CCP ConfReq id=0x5 <mppe +H
-M -S -L -D +C>]
Apr  9 10:18:18 sputnik pppd[28379]: sent [CCP ConfRej id=0x5 <mppe +H
-M -S -L -D +C>]
Apr  9 10:18:18 sputnik pppd[28379]: rcvd [CCP ConfRej id=0x1 <deflate
15> <deflate(old#) 15>]
Apr  9 10:18:18 sputnik pppd[28379]: sent [CCP ConfReq id=0x2]
Apr  9 10:18:18 sputnik pppd[28379]: rcvd [IPCP ConfRej id=0x1 <compress
VJ 0f 01>]
Apr  9 10:18:18 sputnik pppd[28379]: sent [IPCP ConfReq id=0x2 <addr
172.16.1.1>]
Apr  9 10:18:18 sputnik pppd[28379]: rcvd [CCP TermReq
id=0x7"S\377777776740p\000<\37777777715t\000\000\002\37777777734"]
Apr  9 10:18:18 sputnik pppd[28379]: sent [CCP TermAck id=0x7]
Apr  9 10:18:18 sputnik pppd[28379]: rcvd [IPCP ConfAck id=0x2 <addr
172.16.1.1>]
Apr  9 10:18:20 sputnik pppd[28379]: rcvd [IPCP ConfReq id=0x8 <addr
0.0.0.0> <ms-dns1 0.0.0.0> <ms-wins 0.0.0.0> <ms-dns3 0.0.0.0> <ms-wins
0.0.0.0>]
Apr  9 10:18:20 sputnik pppd[28379]: sent [IPCP ConfRej id=0x8 <ms-wins
0.0.0.0> <ms-wins 0.0.0.0>]
Apr  9 10:18:20 sputnik pppd[28379]: rcvd [IPCP ConfReq id=0x9 <addr
0.0.0.0> <ms-dns1 0.0.0.0> <ms-dns3 0.0.0.0>]
Apr  9 10:18:20 sputnik pppd[28379]: sent [IPCP ConfNak id=0x9 <addr
192.168.250.40> <ms-dns1 194.44.21.57> <ms-dns3 194.44.21.57>]
Apr  9 10:18:20 sputnik pppd[28379]: rcvd [IPCP ConfReq id=0xa <addr
192.168.250.40> <ms-dns1 194.44.21.57> <ms-dns3 194.44.21.57>]
Apr  9 10:18:20 sputnik pppd[28379]: sent [IPCP ConfAck id=0xa <addr
192.168.250.40> <ms-dns1 194.44.21.57> <ms-dns3 194.44.21.57>]
Apr  9 10:18:20 sputnik pppd[28379]: Cannot determine ethernet address
for proxy ARP
Apr  9 10:18:20 sputnik pppd[28379]: local  IP address 172.16.1.1
Apr  9 10:18:20 sputnik pppd[28379]: remote IP address 192.168.250.40
Apr  9 10:18:20 sputnik pppd[28379]: Script /etc/ppp/ip-up started (pid
28392)
Apr  9 10:18:20 sputnik pppd[28379]: Script /etc/ppp/ip-up finished (pid
28392), status = 0x0
Apr  9 10:18:21 sputnik pppd[28379]: sent [CCP ConfReq id=0x2]
Apr  9 10:18:21 sputnik pppd[28379]: rcvd [CCP TermAck id=0x2]
Apr  9 10:18:21 sputnik pppd[28379]: sent [CCP TermReq id=0x3"No
compression negotiated"]
Apr  9 10:18:21 sputnik pppd[28379]: rcvd [CCP TermAck id=0x3"No
compression negotiated"]
Apr  9 10:20:51 sputnik pppd[28379]: rcvd [LCP TermReq id=0xb
"S\377777776740p\000<\37777777715t\000\000\000\000"]
Apr  9 10:20:51 sputnik pppd[28379]: LCP terminated by peer
(SM-<0p^@<M-Mt^@^@^@^@)
Apr  9 10:20:51 sputnik pppd[28379]: Script /etc/ppp/ip-down started
(pid 28410)
Apr  9 10:20:51 sputnik pppd[28379]: sent [LCP TermAck id=0xb]
Apr  9 10:20:51 sputnik pppd[28379]: Modem hangup
Apr  9 10:20:51 sputnik pppd[28379]: Connection terminated.
Apr  9 10:20:51 sputnik pppd[28379]: Connect time 2.7 minutes.
Apr  9 10:20:51 sputnik pppd[28379]: Sent 358714 bytes, received 15504
bytes.
Apr  9 10:20:51 sputnik pppd[28379]: Waiting for 1 child processes...
Apr  9 10:20:51 sputnik pppd[28379]:   script /etc/ppp/ip-down, pid
28410
Apr  9 10:20:51 sputnik pppd[28379]: Script /etc/ppp/ip-down finished
(pid 28410), status = 0x0


And at this moment in this state it just stays eternal.
What should I look at?

-- 

