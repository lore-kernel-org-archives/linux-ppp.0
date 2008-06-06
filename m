From: "Pierre-Yves Paulus" <pauluspy@gmail.com>
Date: Fri, 06 Jun 2008 08:45:19 +0000
Subject: PPP difficulties regarding connection establishment and bogus DNS received
Message-Id: <66abdca00806060145ua700d3cydeb3e37df39b94f8@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hello,

I've a Debian etch system connected to the web through a GPRS/UMTS
PCMCIA card. I'm using pppd to connect it to the ISP. However, I see
quite a lot of connection failures (connection establishment has to be
tried quite a few times before it succeeds), and even worse, the
connection often succeeds, but with bogus DNS servers IP's supplied
(10.11.12.13 and 10.11.12.14), rendering it useless.

I've looked through the archives
(http://www.opensubscriber.com/message/linux-ppp@vger.kernel.org/7889888.html),
and found that the bogus DNS problem has already been seen when the
peer insists on wins servers, but this is not the case here.

So I suppose that there are some differences between the various peers
available by the ISP, and that only some of them accept the way "my"
pppd deals with them, but I've no idea about how and what to change to
increase the success rate and most importantly avoid this bogus DNS
problem.

I've attached below 3 typical pppd log:
-first is a successful connection.
-second one is a successful connection, but I get the bogus DNS servers
-third one is a failed connection

Any hint would be very welcome.

1. SUCCESSFUL CONNECTION:

 pppd 2.4.4 started by root, uid 0
 Serial connection established.
 using channel 5
 Using interface ppp0
 ppp0 <--> /dev/ttyUSB0
 sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0x78a84af8> <accomp>]
 rcvd [LCP ConfReq id=0x5 <asyncmap 0x0> <auth chap MD5> <magic
0x802dace> <pcomp> <accomp>]
 sent [LCP ConfRej id=0x5 <pcomp>]
 rcvd [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0x78a84af8> <accomp>]
 rcvd [LCP ConfReq id=0x6 <asyncmap 0x0> <auth chap MD5> <magic
0x802dace> <accomp>]
 sent [LCP ConfNak id=0x6 <auth pap>]
 rcvd [LCP ConfReq id=0x7 <asyncmap 0x0> <auth pap> <magic 0x802dace> <accomp>]
 sent [LCP ConfAck id=0x7 <asyncmap 0x0> <auth pap> <magic 0x802dace> <accomp>]
 sent [LCP EchoReq id=0x0 magic=0x78a84af8]
 sent [PAP AuthReq id=0x1 user="sit0382" password=<hidden>]
 rcvd [LCP DiscReq id=0x8 magic=0x802dace]
 rcvd [LCP EchoRep id=0x0 magic=0x802dace 78 a8 4a f8]
 rcvd [PAP AuthAck id=0x1 ""]
 PAP authentication succeeded
 sent [CCP ConfReq id=0x1 <deflate 15> <deflate(old#) 15> <bsd v1 15>]
 sent [IPCP ConfReq id=0x1 <compress VJ 0f 01> <addr 0.0.0.0> <ms-dns1
0.0.0.0> <ms-dns3 0.0.0.0>]
 rcvd [LCP ProtRej id=0x9 80 fd 01 01 00 0f 1a 04 78 00 18 04 78 00 15 03 2f]
 Protocol-Reject for 'Compression Control Protocol' (0x80fd) received
 rcvd [IPCP ConfNak id=0x1 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
 sent [IPCP ConfReq id=0x2 <compress VJ 0f 01> <addr 0.0.0.0> <ms-dns1
10.11.12.13> <ms-dns3 10.11.12.14>]
 rcvd [IPCP ConfNak id=0x2 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
 sent [IPCP ConfReq id=0x3 <compress VJ 0f 01> <addr 0.0.0.0> <ms-dns1
10.11.12.13> <ms-dns3 10.11.12.14>]
 rcvd [IPCP ConfNak id=0x3 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
 sent [IPCP ConfReq id=0x4 <compress VJ 0f 01> <addr 0.0.0.0> <ms-dns1
10.11.12.13> <ms-dns3 10.11.12.14>]
 rcvd [IPCP ConfReq id=0x0]
 sent [IPCP ConfNak id=0x0 <addr 0.0.0.0>]
 rcvd [IPCP ConfRej id=0x4 <compress VJ 0f 01>]
 sent [IPCP ConfReq id=0x5 <addr 0.0.0.0> <ms-dns1 10.11.12.13>
<ms-dns3 10.11.12.14>]
 rcvd [IPCP ConfNak id=0x5 <addr 80.214.80.156> <ms-dns1
62.201.129.99> <ms-dns3 62.201.159.99>]
 sent [IPCP ConfReq id=0x6 <addr 80.214.80.156> <ms-dns1
62.201.129.99> <ms-dns3 62.201.159.99>]
 rcvd [IPCP ConfAck id=0x6 <addr 80.214.80.156> <ms-dns1
62.201.129.99> <ms-dns3 62.201.159.99>]
 rcvd [IPCP ConfReq id=0x1]
 sent [IPCP ConfAck id=0x1]
 defaulting to 10.64.64.64
 replacing old default route to eth1 [192.168.1.1]
 Cannot determine ethernet address for proxy ARP
 local  IP address 80.214.80.156
 remote IP address 10.64.64.64
 primary   DNS address 62.201.129.99
 secondary DNS address 62.201.159.99
 Script /etc/ppp/ip-up started (pid 3463)
 Script /etc/ppp/ip-up finished (pid 3463), status = 0x0


2. SUCCESSFULL CONNECTION WITH BOGUS DNS SERVERS RECEIVED:

 pppd 2.4.4 started by root, uid 0
 Serial connection established.
 using channel 6
 Using interface ppp0
 ppp0 <--> /dev/ttyUSB0
 sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xcc92f365> <accomp>]
 rcvd [LCP ConfReq id=0x19 <asyncmap 0x0> <auth chap MD5> <magic
0x8050d4d> <pcomp> <accomp>]
 sent [LCP ConfRej id=0x19 <pcomp>]
 rcvd [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0xcc92f365> <accomp>]
 rcvd [LCP ConfReq id=0x1a <asyncmap 0x0> <auth chap MD5> <magic
0x8050d4d> <accomp>]
 sent [LCP ConfNak id=0x1a <auth pap>]
 rcvd [LCP ConfReq id=0x1b <asyncmap 0x0> <auth pap> <magic 0x8050d4d> <accomp>]
 sent [LCP ConfAck id=0x1b <asyncmap 0x0> <auth pap> <magic 0x8050d4d> <accomp>]
 sent [LCP EchoReq id=0x0 magic=0xcc92f365]
 sent [PAP AuthReq id=0x1 user="sit0382" password=<hidden>]
 rcvd [LCP DiscReq id=0x1c magic=0x8050d4d]
 rcvd [LCP EchoRep id=0x0 magic=0x8050d4d cc 92 f3 65]
 rcvd [PAP AuthAck id=0x1 ""]
 PAP authentication succeeded
 sent [CCP ConfReq id=0x1 <deflate 15> <deflate(old#) 15> <bsd v1 15>]
 sent [IPCP ConfReq id=0x1 <compress VJ 0f 01> <addr 0.0.0.0> <ms-dns1
0.0.0.0> <ms-dns3 0.0.0.0>]
 rcvd [LCP ProtRej id=0x1d 80 fd 01 01 00 0f 1a 04 78 00 18 04 78 00 15 03 2f]
 Protocol-Reject for 'Compression Control Protocol' (0x80fd) received
 rcvd [IPCP ConfNak id=0x1 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
 sent [IPCP ConfReq id=0x2 <compress VJ 0f 01> <addr 0.0.0.0> <ms-dns1
10.11.12.13> <ms-dns3 10.11.12.14>]
 rcvd [IPCP ConfNak id=0x2 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
 sent [IPCP ConfReq id=0x3 <compress VJ 0f 01> <addr 0.0.0.0> <ms-dns1
10.11.12.13> <ms-dns3 10.11.12.14>]
 rcvd [IPCP ConfNak id=0x3 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
 sent [IPCP ConfReq id=0x4 <compress VJ 0f 01> <addr 0.0.0.0> <ms-dns1
10.11.12.13> <ms-dns3 10.11.12.14>]
 rcvd [IPCP ConfNak id=0x4 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
 sent [IPCP ConfReq id=0x5 <compress VJ 0f 01> <addr 0.0.0.0> <ms-dns1
10.11.12.13> <ms-dns3 10.11.12.14>]
 sent [LCP EchoReq id=0x1 magic=0xcc92f365]
 rcvd [LCP EchoRep id=0x1 magic=0x8050d4d cc 92 f3 65]
 rcvd [IPCP ConfNak id=0x5 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
 sent [IPCP ConfReq id=0x6 <compress VJ 0f 01> <addr 0.0.0.0>]
 rcvd [IPCP ConfNak id=0x6 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
 sent [IPCP ConfReq id=0x7 <compress VJ 0f 01> <addr 0.0.0.0>]
 rcvd [IPCP ConfNak id=0x7 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
 sent [IPCP ConfReq id=0x8 <compress VJ 0f 01> <addr 0.0.0.0>]
 rcvd [IPCP ConfNak id=0x8 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
 sent [IPCP ConfReq id=0x9 <compress VJ 0f 01> <addr 0.0.0.0>]
 rcvd [IPCP ConfNak id=0x9 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
 sent [IPCP ConfReq id=0xa <compress VJ 0f 01> <addr 0.0.0.0>]
 sent [LCP EchoReq id=0x2 magic=0xcc92f365]
 rcvd [LCP EchoRep id=0x2 magic=0x8050d4d cc 92 f3 65]
 rcvd [IPCP ConfNak id=0xa <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
 sent [IPCP ConfReq id=0xb <compress VJ 0f 01> <addr 0.0.0.0>]
 rcvd [IPCP ConfNak id=0xb <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
 sent [IPCP ConfReq id=0xc <compress VJ 0f 01> <addr 0.0.0.0>]
 rcvd [IPCP ConfNak id=0xc <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
 sent [IPCP ConfReq id=0xd <compress VJ 0f 01> <addr 0.0.0.0>]
 rcvd [IPCP ConfNak id=0xd <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
 sent [IPCP ConfReq id=0xe <compress VJ 0f 01> <addr 0.0.0.0>]
 rcvd [IPCP ConfNak id=0xe <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
 sent [IPCP ConfReq id=0xf <compress VJ 0f 01> <addr 0.0.0.0>]
 sent [LCP EchoReq id=0x3 magic=0xcc92f365]
 rcvd [LCP EchoRep id=0x3 magic=0x8050d4d cc 92 f3 65]
 rcvd [IPCP ConfNak id=0xf <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
 sent [IPCP ConfReq id=0x10 <compress VJ 0f 01> <addr 0.0.0.0>]
 rcvd [IPCP ConfNak id=0x10 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
 sent [IPCP ConfReq id=0x11 <compress VJ 0f 01> <addr 0.0.0.0>]
 rcvd [IPCP ConfNak id=0x11 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
 sent [IPCP ConfReq id=0x12 <compress VJ 0f 01> <addr 0.0.0.0>]
 rcvd [IPCP ConfNak id=0x12 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
 sent [IPCP ConfReq id=0x13 <compress VJ 0f 01> <addr 0.0.0.0>]
 rcvd [IPCP ConfReq id=0x0]
 sent [IPCP ConfNak id=0x0 <addr 0.0.0.0>]
 rcvd [IPCP ConfRej id=0x13 <compress VJ 0f 01>]
 sent [IPCP ConfReq id=0x14 <addr 0.0.0.0>]
 rcvd [IPCP ConfNak id=0x14 <addr 80.214.104.146>]
 sent [IPCP ConfReq id=0x15 <addr 80.214.104.146>]
 rcvd [IPCP ConfAck id=0x15 <addr 80.214.104.146>]
 rcvd [IPCP ConfReq id=0x1]
 sent [IPCP ConfAck id=0x1]
 defaulting to 10.64.64.64
 Cannot determine ethernet address for proxy ARP
 local  IP address 80.214.104.146
 remote IP address 10.64.64.64
 primary   DNS address 10.11.12.13
 secondary DNS address 10.11.12.14
 Script /etc/ppp/ip-up started (pid 3213)
 Script /etc/ppp/ip-up finished (pid 3213), status = 0x0


3. CONNECTION FAILED:

 pppd 2.4.4 started by root, uid 0
 Serial connection established.
 using channel 5
 Using interface ppp0
 ppp0 <--> /dev/ttyUSB0
 sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0x2822e495> <accomp>]
 rcvd [LCP ConfReq id=0x14 <asyncmap 0x0> <auth chap MD5> <magic
0x8045e5c> <pcomp> <accomp>]
 sent [LCP ConfRej id=0x14 <pcomp>]
 rcvd [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0x2822e495> <accomp>]
 rcvd [LCP ConfReq id=0x15 <asyncmap 0x0> <auth chap MD5> <magic
0x8045e5c> <accomp>]
 sent [LCP ConfNak id=0x15 <auth pap>]
 rcvd [LCP ConfReq id=0x16 <asyncmap 0x0> <auth pap> <magic 0x8045e5c> <accomp>]
 sent [LCP ConfAck id=0x16 <asyncmap 0x0> <auth pap> <magic 0x8045e5c> <accomp>]
 sent [LCP EchoReq id=0x0 magic=0x2822e495]
 sent [PAP AuthReq id=0x1 user="sit0382" password=<hidden>]
 rcvd [LCP DiscReq id=0x17 magic=0x8045e5c]
 rcvd [LCP EchoRep id=0x0 magic=0x8045e5c 28 22 e4 95]
 rcvd [PAP AuthAck id=0x1 ""]
 PAP authentication succeeded
 sent [CCP ConfReq id=0x1 <deflate 15> <deflate(old#) 15> <bsd v1 15>]
 sent [IPCP ConfReq id=0x1 <compress VJ 0f 01> <addr 0.0.0.0> <ms-dns1
0.0.0.0> <ms-dns3 0.0.0.0>]
 rcvd [LCP ProtRej id=0x18 80 fd 01 01 00 0f 1a 04 78 00 18 04 78 00 15 03 2f]
 Protocol-Reject for 'Compression Control Protocol' (0x80fd) received
 rcvd [IPCP ConfNak id=0x1 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
 sent [IPCP ConfReq id=0x2 <compress VJ 0f 01> <addr 0.0.0.0> <ms-dns1
10.11.12.13> <ms-dns3 10.11.12.14>]
 rcvd [IPCP ConfNak id=0x2 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
 sent [IPCP ConfReq id=0x3 <compress VJ 0f 01> <addr 0.0.0.0> <ms-dns1
10.11.12.13> <ms-dns3 10.11.12.14>]
 rcvd [IPCP ConfNak id=0x3 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
 sent [IPCP ConfReq id=0x4 <compress VJ 0f 01> <addr 0.0.0.0> <ms-dns1
10.11.12.13> <ms-dns3 10.11.12.14>]
 rcvd [IPCP ConfNak id=0x4 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
 sent [IPCP ConfReq id=0x5 <compress VJ 0f 01> <addr 0.0.0.0> <ms-dns1
10.11.12.13> <ms-dns3 10.11.12.14>]
 sent [LCP EchoReq id=0x1 magic=0x2822e495]
 rcvd [LCP EchoRep id=0x1 magic=0x8045e5c 28 22 e4 95]
 rcvd [IPCP ConfNak id=0x5 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
 sent [IPCP ConfReq id=0x6 <compress VJ 0f 01> <addr 0.0.0.0>]
 rcvd [IPCP ConfNak id=0x6 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
 sent [IPCP ConfReq id=0x7 <compress VJ 0f 01> <addr 0.0.0.0>]
 rcvd [IPCP ConfNak id=0x7 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
 sent [IPCP ConfReq id=0x8 <compress VJ 0f 01> <addr 0.0.0.0>]
 rcvd [IPCP ConfNak id=0x8 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
 sent [IPCP ConfReq id=0x9 <compress VJ 0f 01> <addr 0.0.0.0>]
 rcvd [IPCP ConfNak id=0x9 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
 sent [IPCP ConfReq id=0xa <compress VJ 0f 01> <addr 0.0.0.0>]
 sent [LCP EchoReq id=0x2 magic=0x2822e495]
 rcvd [LCP EchoRep id=0x2 magic=0x8045e5c 28 22 e4 95]
 rcvd [IPCP ConfNak id=0xa <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
 sent [IPCP ConfReq id=0xb <compress VJ 0f 01> <addr 0.0.0.0>]
 rcvd [IPCP ConfNak id=0xb <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
 sent [IPCP ConfReq id=0xc <compress VJ 0f 01> <addr 0.0.0.0>]
 rcvd [IPCP ConfNak id=0xc <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
 sent [IPCP ConfReq id=0xd <compress VJ 0f 01> <addr 0.0.0.0>]
 rcvd [IPCP ConfNak id=0xd <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
 sent [IPCP ConfReq id=0xe <compress VJ 0f 01> <addr 0.0.0.0>]
 rcvd [IPCP ConfNak id=0xe <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
 sent [IPCP ConfReq id=0xf <compress VJ 0f 01> <addr 0.0.0.0>]
 sent [LCP EchoReq id=0x3 magic=0x2822e495]
 rcvd [LCP EchoRep id=0x3 magic=0x8045e5c 28 22 e4 95]
 rcvd [IPCP ConfNak id=0xf <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
 sent [IPCP ConfReq id=0x10 <compress VJ 0f 01> <addr 0.0.0.0>]
 rcvd [IPCP ConfNak id=0x10 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
 sent [IPCP ConfReq id=0x11 <compress VJ 0f 01> <addr 0.0.0.0>]
 rcvd [IPCP ConfNak id=0x11 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
 sent [IPCP ConfReq id=0x12 <compress VJ 0f 01> <addr 0.0.0.0>]
 rcvd [IPCP ConfNak id=0x12 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
 sent [IPCP ConfReq id=0x13 <compress VJ 0f 01> <addr 0.0.0.0>]
 rcvd [IPCP ConfNak id=0x13 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
 sent [IPCP ConfReq id=0x14 <compress VJ 0f 01> <addr 0.0.0.0>]
 sent [LCP EchoReq id=0x4 magic=0x2822e495]
 rcvd [LCP EchoRep id=0x4 magic=0x8045e5c 28 22 e4 95]
 rcvd [IPCP ConfNak id=0x14 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
 sent [IPCP ConfReq id=0x15 <compress VJ 0f 01> <addr 0.0.0.0>]
 rcvd [IPCP ConfNak id=0x15 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
 sent [IPCP ConfReq id=0x16 <compress VJ 0f 01> <addr 0.0.0.0>]
 rcvd [IPCP ConfNak id=0x16 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
 sent [IPCP ConfReq id=0x17 <compress VJ 0f 01> <addr 0.0.0.0>]
 rcvd [IPCP ConfNak id=0x17 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
 sent [IPCP ConfReq id=0x18 <compress VJ 0f 01> <addr 0.0.0.0>]
 rcvd [IPCP ConfNak id=0x18 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
 sent [IPCP ConfReq id=0x19 <compress VJ 0f 01> <addr 0.0.0.0>]
 sent [LCP EchoReq id=0x5 magic=0x2822e495]
 rcvd [LCP EchoRep id=0x5 magic=0x8045e5c 28 22 e4 95]
 rcvd [IPCP ConfNak id=0x19 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
 sent [IPCP ConfReq id=0x1a <compress VJ 0f 01> <addr 0.0.0.0>]
 rcvd [IPCP ConfNak id=0x1a <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
 sent [IPCP ConfReq id=0x1b <compress VJ 0f 01> <addr 0.0.0.0>]
 rcvd [IPCP ConfNak id=0x1b <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
 sent [IPCP ConfReq id=0x1c <compress VJ 0f 01> <addr 0.0.0.0>]
 rcvd [IPCP ConfNak id=0x1c <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
 sent [IPCP ConfReq id=0x1d <compress VJ 0f 01> <addr 0.0.0.0>]
 rcvd [IPCP ConfNak id=0x1d <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
 sent [IPCP ConfReq id=0x1e <compress VJ 0f 01> <addr 0.0.0.0>]
 sent [LCP EchoReq id=0x6 magic=0x2822e495]
 rcvd [LCP EchoRep id=0x6 magic=0x8045e5c 28 22 e4 95]
 rcvd [IPCP ConfNak id=0x1e <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
 sent [IPCP ConfReq id=0x1f <compress VJ 0f 01> <addr 0.0.0.0>]
 rcvd [IPCP ConfNak id=0x1f <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
 sent [IPCP ConfReq id=0x20 <compress VJ 0f 01> <addr 0.0.0.0>]
 rcvd [IPCP ConfNak id=0x20 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
 sent [IPCP ConfReq id=0x21 <compress VJ 0f 01> <addr 0.0.0.0>]
 rcvd [IPCP ConfNak id=0x21 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
 sent [IPCP ConfReq id=0x22 <compress VJ 0f 01> <addr 0.0.0.0>]
 rcvd [IPCP ConfNak id=0x22 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
 sent [IPCP ConfReq id=0x23 <compress VJ 0f 01> <addr 0.0.0.0>]
 sent [LCP EchoReq id=0x7 magic=0x2822e495]
 rcvd [LCP EchoRep id=0x7 magic=0x8045e5c 28 22 e4 95]
 rcvd [IPCP ConfNak id=0x23 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
 sent [IPCP ConfReq id=0x24 <compress VJ 0f 01> <addr 0.0.0.0>]
 rcvd [IPCP ConfNak id=0x24 <ms-dns1 10.11.12.13> <ms-dns3 10.11.12.14>]
 sent [IPCP ConfReq id=0x25 <compress VJ 0f 01> <addr 0.0.0.0>]
 Modem hangup
 Connection terminated.
 Exit.

Best Regards,
Pierre-Yves Paulus
