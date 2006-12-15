From: "Max Malzkuhn" <mmalzkuhn@edgewaternetworks.com>
Date: Fri, 15 Dec 2006 22:18:09 +0000
Subject: pppoe-server question
Message-Id: <005c01c72096$ea347c80$d50a0a0a@MaxLab>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hello All,
 
I searched the archives and saw a few people that had a problem similar to
mine, but saw no resolutions so I thought I'd try again.
 
I am trying to bring up a pppoe-server access concentrator on a RC5 linux
box.
 
I have rp.pppoe-server version 3.8 and pppd version 2.4.4.
 
I start the server as such:
 
pppoe-server -I eth1 -L 10.10.60.1 -R 10.10.60.100
 
The client and server converse through most of the PAD stuff, PADI, PADO,
PADR, PADS.
 
Then they need to exchange LCP and the syslog on the system running the
pppoe-server acts like it is doing so:
 
Dec 15 12:05:53 testwan pppd[15724]: rcvd [LCP ConfReq id=0x2 <magic
0x788d0dc1>]
Dec 15 12:05:53 testwan pppd[15724]: sent [LCP ConfAck id=0x2 <magic
0x788d0dc1>]
Dec 15 12:05:54 testwan pppd[15724]: sent [LCP ConfReq id=0x1 <magic
0x833ad232>]
Dec 15 12:05:57 testwan pppd[15724]: sent [LCP ConfReq id=0x1 <magic
0x833ad232>]
Dec 15 12:05:59 testwan pppd[15724]: rcvd [LCP ConfReq id=0x2 <magic
0x788d0dc1>]
Dec 15 12:05:59 testwan pppd[15724]: sent [LCP ConfAck id=0x2 <magic
0x788d0dc1>]
Dec 15 12:06:00 testwan pppd[15724]: sent [LCP ConfReq id=0x1 <magic
0x833ad232>]
Dec 15 12:06:03 testwan pppd[15724]: sent [LCP ConfReq id=0x1 <magic
0x833ad232>]
Dec 15 12:06:05 testwan pppd[15724]: rcvd [LCP ConfReq id=0x2 <magic
0x788d0dc1>]
Dec 15 12:06:05 testwan pppd[15724]: sent [LCP ConfAck id=0x2 <magic
0x788d0dc1>]
Dec 15 12:06:06 testwan pppd[15724]: sent [LCP ConfReq id=0x1 <magic
0x833ad232>]
Dec 15 12:06:09 testwan pppd[15724]: sent [LCP ConfReq id=0x1 <magic
0x833ad232>]
Dec 15 12:06:11 testwan pppoe-server[15691]: Sent PADT
Dec 15 12:06:11 testwan pppd[15724]: Terminating on signal 15

 
However, running ethereal on this interface on this same box shows only the
LCP packets coming in, none going out at all which
causes the client to timeout and send a PADT.
 
Anyone have any ideas why the server would imply it sent the packets when it
actually did not?
 
It should not be "pure" connectivity issue, because while this is happening,
I actually have an ssh session going on between these two systems on this
same interface.
 
Any assistance would be most appreciated.
 
Max

