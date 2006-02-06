From: "Ionut Turturica" <ionut.turturica@galati.uti.ro>
Date: Mon, 06 Feb 2006 20:13:43 +0000
Subject: PPPoE stuff
Message-Id: <op.s4kigj0bblqxiz@jono.amd>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


Any hints for this?
I'm trying to connect a XP machine with a rp-pppoe server. I see that XP  
client keeps requesting CallBack, and we refuse it..

Feb  6 22:06:22 lfs pppoe-server[31771]: Session 2 created for client  
00:11:2f:22:c0:7a (10.67.15.2) on br0 using Service-Name ''
Feb  6 22:06:22 lfs pppd[31771]: pppd 2.4.4b1 started by root, uid 0
Feb  6 22:06:22 lfs pppd[31771]: using channel 495
Feb  6 22:06:22 lfs pppd[31771]: Using interface ppp1
Feb  6 22:06:22 lfs pppd[31771]: Connect: ppp1 <--> /dev/pts/11
Feb  6 22:06:23 lfs pppd[31771]: sent [LCP ConfReq id=0x1 <auth pap>  
<magic 0x3d25fa22>]
Feb  6 22:06:26 lfs pppd[31771]: sent [LCP ConfReq id=0x1 <auth pap>  
<magic 0x3d25fa22>]
Feb  6 22:06:27 lfs pppd[31771]: rcvd [LCP ConfReq id=0x2 <mru 1480>  
<magic 0x4c9160fa> <callback CBCP>]
Feb  6 22:06:27 lfs pppd[31771]: sent [LCP ConfRej id=0x2 <callback CBCP>]
Feb  6 22:06:29 lfs pppd[31771]: sent [LCP ConfReq id=0x1 <auth pap>  
<magic 0x3d25fa22>]
Feb  6 22:06:32 lfs pppd[31771]: sent [LCP ConfReq id=0x1 <auth pap>  
<magic 0x3d25fa22>]
Feb  6 22:06:35 lfs pppd[31771]: rcvd [LCP ConfReq id=0x4 <mru 1480>  
<magic 0x4c9160fa> <callback CBCP>]
Feb  6 22:06:35 lfs pppd[31771]: sent [LCP ConfRej id=0x4 <callback CBCP>]
Feb  6 22:06:35 lfs pppd[31771]: sent [LCP ConfReq id=0x1 <auth pap>  
<magic 0x3d25fa22>]
Feb  6 22:06:41 lfs last message repeated 2 times
Feb  6 22:06:42 lfs pptp[31703]: anon log[decaps_gre:pptp_gre.c:407]:  
buffering packet 1003 (expecting 1000, lost or reordered)
Feb  6 22:06:43 lfs pppd[31771]: rcvd [LCP ConfReq id=0x6 <mru 1480>  
<magic 0x4c9160fa> <callback CBCP>]
Feb  6 22:06:43 lfs pppd[31771]: sent [LCP ConfRej id=0x6 <callback CBCP>]
Feb  6 22:06:44 lfs pppd[31771]: sent [LCP ConfReq id=0x1 <auth pap>  
<magic 0x3d25fa22>]
Feb  6 22:06:46 lfs pptp[31703]: anon log[decaps_gre:pptp_gre.c:407]:  
buffering packet 1012 (expecting 1011, lost or reordered)
Feb  6 22:06:47 lfs pppd[31771]: sent [LCP ConfReq id=0x1 <auth pap>  
<magic 0x3d25fa22>]
Feb  6 22:06:50 lfs pppd[31771]: sent [LCP ConfReq id=0x1 <auth pap>  
<magic 0x3d25fa22>]
Feb  6 22:06:51 lfs pppd[31771]: rcvd [LCP ConfReq id=0x8 <mru 1480>  
<magic 0x4c9160fa> <callback CBCP>]
Feb  6 22:06:51 lfs pppd[31771]: sent [LCP ConfRej id=0x8 <callback CBCP>]
Feb  6 22:06:53 lfs pppd[31771]: LCP: timeout sending Config-Requests
Feb  6 22:06:53 lfs pppd[31771]: Connection terminated.
Feb  6 22:06:53 lfs pppd[31771]: Modem hangup
Feb  6 22:06:53 lfs pppd[31771]: Waiting for 1 child processes...
Feb  6 22:06:53 lfs pppd[31771]:   script /usr/sbin/pppoe -n -I br0 -e  
2:00:11:2f:22:c0:7a -S '', pid 31772
Feb  6 22:06:57 lfs pptp[31703]: anon log[decaps_gre:pptp_gre.c:407]:  
buffering packet 1075 (expecting 1074, lost or reordered)
Feb  6 22:06:58 lfs pppd[31771]: sending SIGTERM to process 31772
Feb  6 22:06:58 lfs pppd[31771]: Exit.
Feb  6 22:06:58 lfs pppoe-server[31611]: Session 2 closed for client  
00:11:2f:22:c0:7a (10.67.15.2) on br0
Feb  6 22:06:58 lfs pppoe-server[31611]: Sent PADT

