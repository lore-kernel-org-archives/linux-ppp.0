From: Charles Price <cpwp@w3z.co.uk>
Date: Mon, 18 Oct 2004 21:29:51 +0000
Subject: Re: Kernel-mode PPPoE server.
Message-Id: <200410182229.56840.cpwp@w3z.co.uk>
List-Id: <linux-ppp.vger.kernel.org>
References: <200410181453.16399.cpwp@w3z.co.uk>
In-Reply-To: <200410181453.16399.cpwp@w3z.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

> Try running with the "debug"  option given to pppd.

'debug' is already set. We are able to see the LCP ConfReq packets being sent
from the client.

> Also, you mentioned you had this working on another system, can you get
> syslogs, tcpdump and configuration for the working system?

Syslog configuration is listed below. The configuration is the same (apart
from not using RADIUS - which makes no difference, I checked) but running on
SuSE Linux 8.1 (Kernel 2.4.20-SuSE, lipcap 0.6.2) Tcpdump output is more
difficult to obtain as I have about 280 concurrent PPPoE users on there!

Here is the syslog output from my working PPPoE concentrator:

Oct 18 22:21:11 pppoe1 pppoe-server[19844]: Session 339 created for client
00:09:5b:6f:a0:a5 (10.67.16.83) on eth1 using Service-Name 'W3Z'
Oct 18 22:21:11 pppoe1 pppd[19844]: Plugin /etc/ppp/plugins/rp-pppoe.so
loaded.
Oct 18 22:21:11 pppoe1 pppd[19844]: RP-PPPoE plugin version 3.3 compiled
against pppd 2.4.2b3
Oct 18 22:21:11 pppoe1 pppd[19844]: pppd 2.4.2b3 started by root, uid 0
Oct 18 22:21:11 pppoe1 pppd[19844]: using channel 146212
Oct 18 22:21:11 pppoe1 pppd[19844]: Using interface ppp37
Oct 18 22:21:11 pppoe1 pppd[19844]: Connect: ppp37 <--> eth1
Oct 18 22:21:11 pppoe1 pppd[19844]: Couldn't increase MTU to 1500
Oct 18 22:21:11 pppoe1 pppd[19844]: Couldn't increase MRU to 1500
Oct 18 22:21:11 pppoe1 pppd[19844]: sent [LCP ConfReq id=0x1 <mru 1492> <auth
chap MD5> <magic 0x8bb7a693>]
Oct 18 22:21:11 pppoe1 pppd[19844]: rcvd [LCP ConfAck id=0x1 <mru 1492> <auth
chap MD5> <magic 0x8bb7a693>] 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
ce05 a9 59
Oct 18 22:21:13 pppoe1 pppd[19844]: sent [LCP ConfReq id=0x1 <mru 1492> <auth
chap MD5> <magic 0x8bb7a693>]
Oct 18 22:21:13 pppoe1 pppd[19844]: rcvd [LCP ConfAck id=0x1 <mru 1492> <auth
chap MD5> <magic 0x8bb7a693>] 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
ce05 a9 59
Oct 18 22:21:14 pppoe1 pppd[19844]: rcvd [LCP ConfReq id=0x15 <mru 1492>
<magic 0x7871e6ef>] 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 408b 1f dc
Oct 18 22:21:14 pppoe1 pppd[19844]: sent [LCP ConfAck id=0x15 <mru 1492>
<magic 0x7871e6ef>]
Oct 18 22:21:14 pppoe1 pppd[19844]: sent [LCP EchoReq id=0x0
 magic=0x8bb7a693] Oct 18 22:21:14 pppoe1 pppd[19844]: sent [CHAP Challenge
 id=0x1
<aa307e10d629fec35e56cc6b6b5d2ebb8b1058c2623e>, name = "pppoe1"]
Oct 18 22:21:14 pppoe1 pppd[19844]: rcvd [LCP EchoRep id=0x0 magic=0x7871e6ef
00 00 00 00] 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 db 83 1d
cf
Oct 18 22:21:14 pppoe1 pppd[19844]: rcvd [CHAP Response id=0x1
<c5f3e39360b514535529cb525a469c01>, name = "username@w3z.co.uk"]
Oct 18 22:21:14 pppoe1 pppd[19844]: sent [CHAP Success id=0x1 "Welcome to
pppoe1."]
Oct 18 22:21:14 pppoe1 pppd[19844]: peer from calling number
 00:09:5B:6F:A0:A5 authorized
Oct 18 22:21:14 pppoe1 pppd[19844]: Script /etc/ppp/auth-up started (pid
19880)
Oct 18 22:21:14 pppoe1 pppd[19844]: sent [IPCP ConfReq id=0x1 <addr
10.0.0.20>]
Oct 18 22:21:14 pppoe1 pppd[19844]: CHAP peer authentication succeeded for
sue.napier@w3z.co.uk
Oct 18 22:21:14 pppoe1 pppd[19844]: rcvd [IPCP ConfReq id=0x16 <addr 0.0.0.0>
<ms-dns1 0.0.0.0> <ms-dns3 0.0.0.0>] 00 00 00 00 00 00 00 00 00 00 00 00 be
43 d9 a5
Oct 18 22:21:14 pppoe1 pppd[19844]: sent [IPCP ConfNak id=0x16 <addr
10.4.0.203> <ms-dns1 xx.xx.xx.xx> <ms-dns3 xx.xx.xx.xx>]
Oct 18 22:21:14 pppoe1 pppd[19844]: Script /etc/ppp/auth-up finished (pid
19880), status = 0x0
Oct 18 22:21:14 pppoe1 pppd[19844]: rcvd [IPCP ConfAck id=0x1 <addr
10.0.0.20>] 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 ca 32 19 50
Oct 18 22:21:14 pppoe1 pppd[19844]: rcvd [IPCP ConfReq id=0x17 <addr
10.4.0.203> <ms-dns1 xx.xx.xx.xx> <ms-dns3 xx.xx.xx.xx>] 00 00 00 00 00 00 00
00 00 00 00 00 14 5b 48 f5
Oct 18 22:21:14 pppoe1 pppd[19844]: sent [IPCP ConfAck id=0x17 <addr
10.4.0.203> <ms-dns1 xx.xx.xx.xx> <ms-dns3 xx.xx.xx.xx>]
Oct 18 22:21:14 pppoe1 pppd[19844]: found interface eth2 for proxy arp
Oct 18 22:21:14 pppoe1 pppd[19844]: local  IP address 10.0.0.20
Oct 18 22:21:14 pppoe1 pppd[19844]: remote IP address 10.4.0.203
Oct 18 22:21:14 pppoe1 pppd[19844]: Script /etc/ppp/ip-up started (pid 19883)
Oct 18 22:21:14 pppoe1 pppd[19844]: Script /etc/ppp/ip-up finished (pid
19883), status = 0x0

While I remember, to make pppd (from CVS) compile correctly I had to alter a
couple of include lines in the code. It was looking for bpf.h so I changed it
to pcap-bpf.h to make it compile cleanly. Will this affect my situation?

Regards,

Charlie Price
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQFBdDXU3k8SswDN/tkRAidAAKClretKIArQz4XG/2mJn18TyW9vTwCgiBKr
NLobBj4JEARDBBP8q60tAds=RGBN
-----END PGP SIGNATURE-----
