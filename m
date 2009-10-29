From: walter harms <wharms@bfs.de>
Date: Thu, 29 Oct 2009 15:19:04 +0000
Subject: strange pppd error
Message-Id: <4AE9B268.1090607@bfs.de>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi List,
i run pppd 2.4.2 in an embedded environment since years. Now i have seen a
problem that i never encountered before.

Two modem got stuck while handshake. below you can see the logs i have  (actualy
that is a factual endless loop, what means you see only a few bytes from several megs.)

i would like to prevent this from happening again. any with an idea out there ?

(it does not seem to be reproducible. after reset the device behaves normal.)
re
 wh

Oct 20 13:56:09  pppd[5792]: sent [LCP EchoReq id=0x0 magic=0xd71a0c90]
Oct 20 13:56:09  pppd[5792]: sent [IPCP ConfReq id=0xc8 <compress VJ 0f 01> <addr 10.0.0.2>]
Oct 20 13:56:09  pppd[5792]: rcvd [CCP ConfReq id=0xc7 <deflate 15> <deflate(old#) 15>]
Oct 20 13:56:09  pppd[5792]: sent [CCP ConfReq id=0xbb]
Oct 20 13:56:09  pppd[5792]: sent [CCP ConfRej id=0xc7 <deflate 15> <deflate(old#) 15>]
Oct 20 13:56:09  pppd[5792]: rcvd [IPCP ConfReq id=0xc7 <compress VJ 0f 01> <addr 0.0.0.0>]
Oct 20 13:56:09  pppd[5792]: sent [IPCP ConfNak id=0xc7 <addr 10.0.0.1>]
Oct 20 13:56:12  pppd[5792]: rcvd [LCP ConfReq id=0xc8 <asyncmap 0x0> <magic 0xab132318> <pcomp> <accomp>]
Oct 20 13:56:12  pppd[5792]: sent [LCP ConfReq id=0xc9 <asyncmap 0x0> <magic 0xf79dba92> <pcomp> <accomp>]
Oct 20 13:56:12  pppd[5792]: sent [LCP ConfAck id=0xc8 <asyncmap 0x0> <magic 0xab132318> <pcomp> <accomp>]
Oct 20 13:56:12  pppd[5792]: rcvd [LCP ConfAck id=0xc8 <asyncmap 0x0> <magic 0xd71a0c90> <pcomp> <accomp>]
Oct 20 13:56:12  pppd[5792]: rcvd [LCP EchoReq id=0x0 magic=0xab132318]
Oct 20 13:56:12  pppd[5792]: rcvd [LCP EchoRep id=0x0 magic=0xab132318]
Oct 20 13:56:12  pppd[5792]: rcvd [CCP ConfReq id=0xc8 <deflate 15> <deflate(old#) 15>]
Oct 20 13:56:12  pppd[5792]: Discarded non-LCP packet when LCP not open
Oct 20 13:56:12  pppd[5792]: rcvd [IPCP ConfReq id=0xc8 <compress VJ 0f 01> <addr 0.0.0.0>]
Oct 20 13:56:12  pppd[5792]: Discarded non-LCP packet when LCP not open
Oct 20 13:56:12  pppd[5792]: rcvd [IPCP ConfAck id=0xc8 <compress VJ 0f 01> <addr 10.0.0.2>]
Oct 20 13:56:12  pppd[5792]: Discarded non-LCP packet when LCP not open
Oct 20 13:56:12  pppd[5792]: rcvd [CCP ConfAck id=0xbb]
Oct 20 13:56:12  pppd[5792]: Discarded non-LCP packet when LCP not open
Oct 20 13:56:14  pppd[5792]: sent [LCP ConfReq id=0xc9 <asyncmap 0x0> <magic 0xf79dba92> <pcomp> <accomp>]
Oct 20 13:56:15  pppd[5792]: rcvd [LCP ConfReq id=0xc9 <asyncmap 0x0> <magic 0xb84a827a> <pcomp> <accomp>]
Oct 20 13:56:15  pppd[5792]: sent [LCP ConfAck id=0xc9 <asyncmap 0x0> <magic 0xb84a827a> <pcomp> <accomp>]
Oct 20 13:56:15  pppd[5792]: rcvd [LCP ConfAck id=0xc9 <asyncmap 0x0> <magic 0xf79dba92> <pcomp> <accomp>]
Oct 20 13:56:15  pppd[5792]: sent [LCP EchoReq id=0x0 magic=0xf79dba92]
Oct 20 13:56:15  pppd[5792]: sent [IPCP ConfReq id=0xc9 <compress VJ 0f 01> <addr 10.0.0.2>]
Oct 20 13:56:15  pppd[5792]: rcvd [CCP ConfReq id=0xc8 <deflate 15> <deflate(old#) 15>]
Oct 20 13:56:15  pppd[5792]: sent [CCP ConfReq id=0xbc]
Oct 20 13:56:15  pppd[5792]: sent [CCP ConfRej id=0xc8 <deflate 15> <deflate(old#) 15>]
Oct 20 13:56:15  pppd[5792]: rcvd [IPCP ConfReq id=0xc8 <compress VJ 0f 01> <addr 0.0.0.0>]
Oct 20 13:56:15  pppd[5792]: sent [IPCP ConfNak id=0xc8 <addr 10.0.0.1>]
Oct 20 13:56:18  pppd[5792]: sent [IPCP ConfReq id=0xc9 <compress VJ 0f 01> <addr 10.0.0.2>]
Oct 20 13:56:18  pppd[5792]: sent [CCP ConfReq id=0xbc]
Oct 20 13:56:18  pppd[5792]: rcvd [LCP ConfReq id=0xc9 <asyncmap 0x0> <magic 0xb84a827a> <pcomp> <accomp>]
Oct 20 13:56:18  pppd[5792]: sent [LCP ConfReq id=0xca <asyncmap 0x0> <magic 0x577826a2> <pcomp> <accomp>]
Oct 20 13:56:18  pppd[5792]: sent [LCP ConfAck id=0xc9 <asyncmap 0x0> <magic 0xb84a827a> <pcomp> <accomp>]
Oct 20 13:56:18  pppd[5792]: rcvd [LCP ConfAck id=0xc9 <asyncmap 0x0> <magic 0xf79dba92> <pcomp> <accomp>]
Oct 20 13:56:18  pppd[5792]: rcvd [LCP EchoReq id=0x0 magic=0xb84a827a]
Oct 20 13:56:18  pppd[5792]: rcvd [LCP EchoRep id=0x0 magic=0xb84a827a]
Oct 20 13:56:18  pppd[5792]: rcvd [CCP ConfReq id=0xc9 <deflate 15> <deflate(old#) 15>]
Oct 20 13:56:18  pppd[5792]: Discarded non-LCP packet when LCP not open
Oct 20 13:56:18  pppd[5792]: rcvd [IPCP ConfReq id=0xc9 <compress VJ 0f 01> <addr 0.0.0.0>]
Oct 20 13:56:18  pppd[5792]: Discarded non-LCP packet when LCP not open
Oct 20 13:56:18  pppd[5792]: rcvd [IPCP ConfAck id=0xc9 <compress VJ 0f 01> <addr 10.0.0.2>]
Oct 20 13:56:18  pppd[5792]: Discarded non-LCP packet when LCP not open
Oct 20 13:56:18  pppd[5792]: rcvd [CCP ConfAck id=0xbc]
Oct 20 13:56:18  pppd[5792]: Discarded non-LCP packet when LCP not open
Oct 20 13:56:20  pppd[5792]: sent [LCP ConfReq id=0xca <asyncmap 0x0> <magic 0x577826a2> <pcomp> <accomp>]
Oct 20 13:56:21  pppd[5792]: rcvd [LCP ConfReq id=0xca <asyncmap 0x0> <magic 0x1683b46a> <pcomp> <accomp>]
Oct 20 13:56:21  pppd[5792]: sent [LCP ConfAck id=0xca <asyncmap 0x0> <magic 0x1683b46a> <pcomp> <accomp>]
Oct 20 13:56:21  pppd[5792]: rcvd [LCP ConfAck id=0xca <asyncmap 0x0> <magic 0x577826a2> <pcomp> <accomp>]
Oct 20 13:56:21  pppd[5792]: sent [LCP EchoReq id=0x0 magic=0x577826a2]
Oct 20 13:56:21  pppd[5792]: sent [IPCP ConfReq id=0xca <compress VJ 0f 01> <addr 10.0.0.2>]
Oct 20 13:56:21  pppd[5792]: rcvd [CCP ConfReq id=0xc9 <deflate 15> <deflate(old#) 15>]
Oct 20 13:56:21  pppd[5792]: sent [CCP ConfReq id=0xbd]
Oct 20 13:56:21  pppd[5792]: sent [CCP ConfRej id=0xc9 <deflate 15> <deflate(old#) 15>]
Oct 20 13:56:21  pppd[5792]: rcvd [IPCP ConfReq id=0xc9 <compress VJ 0f 01> <addr 0.0.0.0>]
Oct 20 13:56:21  pppd[5792]: sent [IPCP ConfNak id=0xc9 <addr 10.0.0.1>]
Oct 20 13:56:24  pppd[5792]: rcvd [LCP ConfReq id=0xca <asyncmap 0x0> <magic 0x1683b46a> <pcomp> <accomp>]
Oct 20 13:56:24  pppd[5792]: sent [LCP ConfReq id=0xcb <asyncmap 0x0> <magic 0x75410637> <pcomp> <accomp>
