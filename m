From: Woody Wu <narkewoody@gmail.com>
Date: Fri, 17 Mar 2017 03:18:23 +0000
Subject: Setup pppd over rs-485 point-to-point
Message-Id: <2d19b2f1-bb0f-9a09-6d40-f05388c66af5@gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi,

I want to setup pppd to connect a Linux laptop to an embedded Linux 
device. The Linux box connected to a rs-232 to rs485 converter, then the 
convert connected via a two-wire rs-485 cable to the embedded Linux 
device's rs-485 port.

I firstly started pppd command on the embedded device like as below:
   pppd nodetach noauth nocrtscts 192.168.2.1:192.168.2.2 /dev/tts4 38400
then I started the pppd command from the laptop:
   pppd nodetach noauth nocrtscts /dev/ttyUSB0 38400

But I cannot get it with success.  Blow are the outputs from the 
embedded device:

-------------
using channel 11
Using interface ppp0
Connect: ppp0 <--> /dev/tts4
sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0x6798784> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0x6798784> <pcomp> <accomp>]
rcvd [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0x6798784> <pcomp> <accomp>]
sent [CCP ConfReq id=0x1 <deflate 15> <deflate(old#) 15>]
sent [IPCP ConfReq id=0x1 <compress VJ 0f 01> <addr 192.168.1.1>]
rcvd [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfReq id=0x2 <asyncmap 0x0> <magic 0x9f25675c> <pcomp> <accomp>]
sent [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfReq id=0x2 <asyncmap 0x0> <magic 0x9f25675c> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfReq id=0x2 <asyncmap 0x0> <magic 0x9f25675c> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfReq id=0x2 <asyncmap 0x0> <magic 0x9f25675c> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfReq id=0x2 <asyncmap 0x0> <magic 0x9f25675c> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfReq id=0x2 <asyncmap 0x0> <magic 0x9f25675c> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfReq id=0x2 <asyncmap 0x0> <magic 0x9f25675c> <pcomp> <accomp>]
rcvd [LCP ConfAck id=0x2 <asyncmap 0x0> <magic 0x9f25675c> <pcomp> <accomp>]
sent [CCP ConfReq id=0x2 <deflate 15> <deflate(old#) 15>]
sent [IPCP ConfReq id=0x2 <compress VJ 0f 01> <addr 192.168.1.1>]
rcvd [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfReq id=0x3 <asyncmap 0x0> <magic 0x65fa025d> <pcomp> <accomp>]
sent [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfReq id=0x3 <asyncmap 0x0> <magic 0x65fa025d> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfReq id=0x3 <asyncmap 0x0> <magic 0x65fa025d> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfReq id=0x3 <asyncmap 0x0> <magic 0x65fa025d> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfReq id=0x3 <asyncmap 0x0> <magic 0x65fa025d> <pcomp> <accomp>]
rcvd [LCP ConfAck id=0x3 <asyncmap 0x0> <magic 0x65fa025d> <pcomp> <accomp>]
sent [CCP ConfReq id=0x3 <deflate 15> <deflate(old#) 15>]
sent [IPCP ConfReq id=0x3 <compress VJ 0f 01> <addr 192.168.1.1>]
rcvd [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfReq id=0x4 <asyncmap 0x0> <magic 0x2231fbc0> <pcomp> <accomp>]
sent [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfReq id=0x4 <asyncmap 0x0> <magic 0x2231fbc0> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfReq id=0x4 <asyncmap 0x0> <magic 0x2231fbc0> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfReq id=0x4 <asyncmap 0x0> <magic 0x2231fbc0> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfReq id=0x4 <asyncmap 0x0> <magic 0x2231fbc0> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfReq id=0x4 <asyncmap 0x0> <magic 0x2231fbc0> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfReq id=0x4 <asyncmap 0x0> <magic 0x2231fbc0> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfReq id=0x4 <asyncmap 0x0> <magic 0x2231fbc0> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfReq id=0x4 <asyncmap 0x0> <magic 0x2231fbc0> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfReq id=0x4 <asyncmap 0x0> <magic 0x2231fbc0> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
LCP: timeout sending Config-Requests
Connection terminated.
Modem hangup
-------------

And, below are the outputs from the laptop:

-------------
using channel 11
Using interface ppp0
Connect: ppp0 <--> /dev/ttyUSB1
sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfNak id=0x1 <magic 0x65b0bb44>]
rcvd [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0x6798784> <pcomp> <accomp>]
sent [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0x6798784> <pcomp> <accomp>]
rcvd [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0x6798784> <pcomp> <accomp>]
Received bad configure-ack:  02 06 00 00 00 00 05 06 06 79 87 84 07 02 08 02
sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfNak id=0x1 <magic 0xa68f2c25>]
sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfNak id=0x1 <magic 0x999e75e8>]
rcvd [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfNak id=0x1 <magic 0xe48a6820>]
rcvd [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfNak id=0x1 <magic 0xe6e1b1f2>]
rcvd [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfNak id=0x1 <magic 0x6dadc190>]
rcvd [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfNak id=0x1 <magic 0x2853972c>]
rcvd [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfNak id=0x1 <magic 0x7098fa53>]
rcvd [LCP ConfReq id=0x2 <asyncmap 0x0> <magic 0x9f25675c> <pcomp> <accomp>]
sent [LCP ConfAck id=0x2 <asyncmap 0x0> <magic 0x9f25675c> <pcomp> <accomp>]
rcvd [LCP ConfAck id=0x2 <asyncmap 0x0> <magic 0x9f25675c> <pcomp> <accomp>]
rcvd [CCP ConfReq id=0x2 <deflate 15> <deflate(old#) 15>]
Discarded non-LCP packet when LCP not open
rcvd [IPCP ConfReq id=0x2 <compress VJ 0f 01> <addr 192.168.1.1>]
Discarded non-LCP packet when LCP not open
sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfNak id=0x1 <magic 0x9caf929f>]
rcvd [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfNak id=0x1 <magic 0xe985c8da>]
rcvd [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfNak id=0x1 <magic 0x7687563e>]
rcvd [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfNak id=0x1 <magic 0x15ee5953>]
sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfNak id=0x1 <magic 0xdc3fa3d3>]
rcvd [LCP ConfReq id=0x3 <asyncmap 0x0> <magic 0x65fa025d> <pcomp> <accomp>]
sent [LCP ConfAck id=0x3 <asyncmap 0x0> <magic 0x65fa025d> <pcomp> <accomp>]
rcvd [LCP ConfAck id=0x3 <asyncmap 0x0> <magic 0x65fa025d> <pcomp> <accomp>]
rcvd [CCP ConfReq id=0x3 <deflate 15> <deflate(old#) 15>]
Discarded non-LCP packet when LCP not open
rcvd [IPCP ConfReq id=0x3 <compress VJ 0f 01> <addr 192.168.1.1>]
Discarded non-LCP packet when LCP not open
sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfNak id=0x1 <magic 0xcd5ff25f>]
rcvd [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfNak id=0x1 <magic 0xab78829e>]
rcvd [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfNak id=0x1 <magic 0xdd2bda4d>]
sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfNak id=0x1 <magic 0x808f9e80>]
rcvd [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfNak id=0x1 <magic 0x812567ed>]
sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfNak id=0x1 <magic 0xc85ce0ab>]
rcvd [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfNak id=0x1 <magic 0xdadb426e>]
sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfNak id=0x1 <magic 0x2f02532>]
sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfNak id=0x1 <magic 0x908d45ee>]
sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfNak id=0x1 <magic 0xbec415ec>]
rcvd [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb3a3da0c> <pcomp> <accomp>]
sent [LCP ConfNak id=0x1 <magic 0x4d50dea6>]
rcvd [LCP ConfNak id=0x1 <magic 0x4d50dea6>]
sent [LCP ConfReq id=0x2 <asyncmap 0x0> <magic 0x3652fa84> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x2 <asyncmap 0x0> <magic 0x3652fa84> <pcomp> <accomp>]
sent [LCP ConfNak id=0x2 <magic 0x7b4602cc>]
rcvd [LCP ConfNak id=0x2 <magic 0x7b4602cc>]
sent [LCP ConfReq id=0x3 <asyncmap 0x0> <magic 0x4d4c86ad> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x3 <asyncmap 0x0> <magic 0x4d4c86ad> <pcomp> <accomp>]
sent [LCP ConfNak id=0x3 <magic 0xb130d3ae>]
rcvd [LCP ConfNak id=0x3 <magic 0xb130d3ae>]
sent [LCP ConfReq id=0x4 <asyncmap 0x0> <magic 0x5a1aad5> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x4 <asyncmap 0x0> <magic 0x5a1aad5> <pcomp> <accomp>]
sent [LCP ConfNak id=0x4 <magic 0x26436890>]
rcvd [LCP ConfNak id=0x4 <magic 0x26436890>]
sent [LCP ConfReq id=0x5 <asyncmap 0x0> <magic 0xa74ff8ce> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x5 <asyncmap 0x0> <magic 0xa74ff8ce> <pcomp> <accomp>]
sent [LCP ConfNak id=0x5 <magic 0x33aaea4c>]
rcvd [LCP ConfNak id=0x5 <magic 0x33aaea4c>]
sent [LCP ConfReq id=0x6 <asyncmap 0x0> <magic 0x17689d3c> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x6 <asyncmap 0x0> <magic 0x17689d3c> <pcomp> <accomp>]
sent [LCP ConfNak id=0x6 <magic 0x75c004cc>]
rcvd [LCP ConfNak id=0x6 <magic 0x75c004cc>]
sent [LCP ConfReq id=0x7 <asyncmap 0x0> <magic 0x30370fd6> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x7 <asyncmap 0x0> <magic 0x30370fd6> <pcomp> <accomp>]
sent [LCP ConfNak id=0x7 <magic 0x30f05bd5>]
rcvd [LCP ConfNak id=0x7 <magic 0x30f05bd5>]
sent [LCP ConfReq id=0x8 <asyncmap 0x0> <magic 0x7d6dbfb8> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x8 <asyncmap 0x0> <magic 0x7d6dbfb8> <pcomp> <accomp>]
sent [LCP ConfNak id=0x8 <magic 0x470b32bb>]
rcvd [LCP ConfNak id=0x8 <magic 0x470b32bb>]
sent [LCP ConfReq id=0x9 <asyncmap 0x0> <magic 0x867ff64e> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x9 <asyncmap 0x0> <magic 0x867ff64e> <pcomp> <accomp>]
sent [LCP ConfNak id=0x9 <magic 0xd39b62f3>]
rcvd [LCP ConfNak id=0x9 <magic 0xd39b62f3>]
sent [LCP ConfReq id=0xa <asyncmap 0x0> <magic 0xc8942ab> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0xa <asyncmap 0x0> <magic 0xc8942ab> <pcomp> <accomp>]
sent [LCP ConfNak id=0xa <magic 0xf72b23a6>]
rcvd [LCP ConfNak id=0xa <magic 0xf72b23a6>]
Serial line is looped back.
sent [LCP TermReq id=0xb "Loopback detected"]
rcvd [LCP TermReq id=0xb "Loopback detected"]
sent [LCP TermAck id=0xb]
rcvd [LCP TermAck id=0xb]
Connection terminated.
-------------


On the otherhand, I can make success with similar commands when two 
devices connected with rs-232.  So I guess, this failure was because the 
rs-485 is half-duplex.  But I searched google, people seemed say pppd 
should work over a point-to-point rs-485 connection.  So I want to get 
help from your experts.

Thanks in advance.
-woody
