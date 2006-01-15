From: Babarovic Ivica <ivica@asist-traffic.com>
Date: Sun, 15 Jan 2006 18:02:54 +0000
Subject: pppd over gprs modem
Message-Id: <43CA8E4E.2020603@asist-traffic.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi!

I'm trying to configure pppd to run over GPRS modem.
So far withouth any success. Peer just keeps on reseting the link.

This is how I start up pppd:
 pppd /dev/ttyS1 19200 nocrtscts noauth defaultroute novj novjccomp user
simobil ipcp-accept-local ipcp-accept-remote connect "exec
/usr/sbin/chat -v '' atd*99***# '' \d\c" debug

and this is what I get in logs:
Nov 25 08:54:39 nova pppd[1175]: pppd 2.4.3 started by root, uid 0
Nov 25 08:54:40 nova chat[1176]: send (atd*99***#^M)
Nov 25 08:54:40 nova chat[1176]: send (dc^M)
Nov 25 08:54:40 nova pppd[1175]: Serial connection established.
Nov 25 08:54:40 nova pppd[1175]: using channel 75
Nov 25 08:54:40 nova pppd[1175]: Using interface ppp0
Nov 25 08:54:40 nova pppd[1175]: Connect: ppp0 <--> /dev/ttyS1
Nov 25 08:54:40 nova pppd[1175]: rcvd [LCP ConfReq id=0x3 <asyncmap
0xa0000> <pcomp> <accomp> <magic 0x4895f5d2> <auth chap MD5>]
Nov 25 08:54:40 nova pppd[1175]: sent [LCP ConfReq id=0x1 <asyncmap 0x0>
<magic 0x1f8c437d> <pcomp> <accomp>]
Nov 25 08:54:40 nova pppd[1175]: sent [LCP ConfNak id=0x3 <auth pap>]
Nov 25 08:54:40 nova pppd[1175]: rcvd [LCP ConfNak id=0x1 <asyncmap
0xa0000>]
Nov 25 08:54:40 nova pppd[1175]: sent [LCP ConfReq id=0x2 <asyncmap
0xa0000> <magic 0x1f8c437d> <pcomp> <accomp>]
Nov 25 08:54:40 nova pppd[1175]: rcvd [LCP ConfReq id=0x5 <asyncmap
0xa0000> <pcomp> <accomp> <magic 0x4895f5d2> <auth pap>]
Nov 25 08:54:40 nova pppd[1175]: sent [LCP ConfAck id=0x5 <asyncmap
0xa0000> <pcomp> <accomp> <magic 0x4895f5d2> <auth pap>]
Nov 25 08:54:40 nova pppd[1175]: rcvd [LCP ConfAck id=0x2 <asyncmap
0xa0000> <magic 0x1f8c437d> <pcomp> <accomp>]
Nov 25 08:54:40 nova pppd[1175]: sent [PAP AuthReq id=0x1 user="simobil"
password=<hidden>]
Nov 25 08:54:41 nova pppd[1175]: rcvd [PAP AuthAck id=0x1 ""]
Nov 25 08:54:41 nova pppd[1175]: PAP authentication succeeded
Nov 25 08:54:41 nova pppd[1175]: sent [CCP ConfReq id=0x1 <deflate 15>
<deflate(old#) 15> <bsd v1 15>]
Nov 25 08:54:41 nova pppd[1175]: sent [IPCP ConfReq id=0x1 <addr
192.168.254.57>]
Nov 25 08:54:41 nova pppd[1175]: rcvd [LCP ProtRej id=0x6 80 fd 01 01 00
0f 1a 04 78 00 18 04 78 00 15 03 2f]
Nov 25 08:54:41 nova pppd[1175]: Protocol-Reject for 'Compression
Control Protocol' (0x80fd) received
Nov 25 08:54:41 nova pppd[1175]: rcvd [LCP TermReq id=0x7]
Nov 25 08:54:41 nova pppd[1175]: LCP terminated by peer
Nov 25 08:54:41 nova pppd[1175]: sent [LCP TermAck id=0x7]
Nov 25 08:54:44 nova pppd[1175]: rcvd [LCP TermReq id=0x7]
Nov 25 08:54:44 nova pppd[1175]: sent [LCP TermAck id=0x7]
Nov 25 08:54:44 nova pppd[1175]: Connection terminated.
Nov 25 08:54:45 nova chat[1179]: send (atd*99***#^M)
Nov 25 08:54:45 nova chat[1179]: send (dc^M)
Nov 25 08:54:45 nova pppd[1175]: Serial connection established.
Nov 25 08:54:45 nova pppd[1175]: using channel 76
Nov 25 08:54:45 nova pppd[1175]: Using interface ppp0
Nov 25 08:54:45 nova pppd[1175]: Connect: ppp0 <--> /dev/ttyS1
Nov 25 08:54:45 nova pppd[1175]: tcflush failed: Bad file descriptor
Nov 25 08:54:46 nova pppd[1175]: tcsetattr: Invalid argument (line 1010)
Nov 25 08:54:46 nova pppd[1175]: Exit.



Why is LCP terminated by peer?
Any ideas?

System is running on a 2.6.14 kernel. with this options:
CONFIG_PPP=y
CONFIG_PPP_FILTER=y
CONFIG_PPP_ASYNC=y
CONFIG_PPP_SYNC_TTY=y
CONFIG_PPP_DEFLATE=y
CONFIG_PPP_BSDCOMP=y

