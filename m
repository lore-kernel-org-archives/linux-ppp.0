From: Charles Price <cpwp@w3z.co.uk>
Date: Mon, 18 Oct 2004 13:53:16 +0000
Subject: Kernel-mode PPPoE server.
Message-Id: <200410181453.16399.cpwp@w3z.co.uk>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi All,

I'm having trouble configuring a kernel-mode PPPoE server using:
Gentoo Linux (Kernel 2.6.8-gentoo-r10)
PPP from CVS
rp-pppoe-3.5

Whenever a client initiates a connection to my server, the following is 
appended to syslog:
<SNIP> 
Sep 30 09:51:13 pppoe2 pppoe-server[5686]: Session 2 created for client 
00:03:47:92:cf:e1 (10.67.15.2) on eth0 using Service-Name ''
Sep 30 09:51:13 pppoe2 pppd[5686]: Plugin /etc/ppp/plugins/rp-pppoe.so loaded.
Sep 30 09:51:13 pppoe2 pppd[5686]: RP-PPPoE plugin version 3.5 compiled 
against pppd 2.4.2
Sep 30 09:51:13 pppoe2 pppd[5686]: pppd 2.4.2 started by root, uid 0
Sep 30 09:51:13 pppoe2 pppd[5686]: using channel 2
Sep 30 09:51:13 pppoe2 pppd[5686]: Using interface ppp1
Sep 30 09:51:13 pppoe2 pppd[5686]: Connect: ppp1 <--> eth0
Sep 30 09:51:13 pppoe2 pppd[5686]: Couldn't increase MTU to 1500
Sep 30 09:51:13 pppoe2 pppd[5686]: Couldn't increase MRU to 1500
Sep 30 09:51:14 pppoe2 pppd[5686]: rcvd [LCP ConfReq id=0x1 <mru 1492> <magic 
0x34254d72>]
<trimmed>
Sep 30 09:51:41 pppoe2 pppd[5686]: rcvd [LCP ConfReq id=0x1 <mru 1492> <magic 
0x34254d72>]
Sep 30 09:51:44 pppoe2 pppoe-server[5474]: PADT: Generic-Error: RP-PPPoE: 
System call error: Input/output error
Sep 30 09:51:44 pppoe2 pppoe-server[5474]: Sent PADT
Sep 30 09:51:44 pppoe2 pppoe-server[5474]: Stopping session 2 reason: Received 
PADT
Sep 30 09:51:44 pppoe2 pppd[5686]: Terminating on signal 15.
</SNIP>

The client repeatedly sends LCP ConfReq packets to the server  but receives no 
reply. I have the PPP and PPPoE modules compiled and running and am using the 
following options to pppd:

lock
asyncmap 0
mru 1492
mtu 1492
nodetach
lcp-max-configure 60
lcp-restart 2
idle 43200
noipx
proxyarp
login
require-chap
login
lcp-echo-interval 60
lcp-echo-failure 5
debug

I have a working PPPoE server running on SuSE Linux 8.1 (using the kernel that 
is shipped with this configuration) but would like to build another one using 
Gentoo Linux.

Does anyone have an ideas as to why the server will not send LCP ConfAck 
packets?

Regards,

Charlie Price
