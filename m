From: ipcpblues <tsutherland@iders.ca>
Date: Wed, 12 Dec 2007 21:15:45 +0000
Subject: IPCP-Nak doesn't do anything
Message-Id: <14303969.post@talk.nabble.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


Hi,

I'm trying to get two PPP devices to work together to setup a PPP
connection.  I have control over one of them - meaning I can set whatever
options I please - but I can't control the other device, it's options are
hard-wired.

I think I've almost got them working because they pass the LCP request - ack
stage and enter the IPCP stage.  In the IPCP stage, my IPCP-Req is Ack'd, so
I'm halfway there.  Their IPCP-Req is received by me with IP-addr=0.0.0.0
and I respond with IPCP-Nak IP-addr2.168.20.50.  All this seems correct
to me, but then the device doesn't accept my Nak and either re-sends its
original IPCP-Req or goes back to the LCP-Req stage.  

Does any have ideas on why this could happen or something I can try?

My log is below, Thanks for reading :)

# pppd file options.pppBCM nodetach
pppd options in effect:
debug           # (from options.pppBCM)
nodetach                # (from command line)
dump            # (from options.pppBCM)
noauth          # (from options.pppBCM)
/dev/ttyUSB1            # (from options.pppBCM)
9600            # (from options.pppBCM)
lock            # (from options.pppBCM)
nocrtscts               # (from options.pppBCM)
asyncmap ffffffff               # (from options.pppBCM)
192.168.30.1:192.168.30.50              # (from options.pppBCM)
nobsdcomp               # (from options.pppBCM)
nodeflate               # (from options.pppBCM)
using channel 21
Using interface ppp0
Connect: ppp0 <--> /dev/ttyUSB1
sent [LCP ConfReq id=0x1 <magic 0xec2490cf> <pcomp> <accomp>]
rcvd [LCP ConfAck id=0x1 <magic 0xec2490cf> <pcomp> <accomp>]
sent [LCP ConfReq id=0x1 <magic 0xec2490cf> <pcomp> <accomp>]
rcvd [LCP ConfAck id=0x1 <magic 0xec2490cf> <pcomp> <accomp>]
sent [LCP ConfReq id=0x1 <magic 0xec2490cf> <pcomp> <accomp>]
rcvd [LCP ConfAck id=0x1 <magic 0xec2490cf> <pcomp> <accomp>]
sent [LCP ConfReq id=0x1 <magic 0xec2490cf> <pcomp> <accomp>]
rcvd [LCP ConfAck id=0x1 <magic 0xec2490cf> <pcomp> <accomp>]
sent [LCP ConfReq id=0x1 <magic 0xec2490cf> <pcomp> <accomp>]
rcvd [LCP ConfAck id=0x1 <magic 0xec2490cf> <pcomp> <accomp>]
sent [LCP ConfReq id=0x1 <magic 0xec2490cf> <pcomp> <accomp>]
rcvd [LCP ConfAck id=0x1 <magic 0xec2490cf> <pcomp> <accomp>]
sent [LCP ConfReq id=0x1 <magic 0xec2490cf> <pcomp> <accomp>]
rcvd [LCP ConfAck id=0x1 <magic 0xec2490cf> <pcomp> <accomp>]
sent [LCP ConfReq id=0x1 <magic 0xec2490cf> <pcomp> <accomp>]
rcvd [LCP ConfAck id=0x1 <magic 0xec2490cf> <pcomp> <accomp>]
sent [LCP ConfReq id=0x1 <magic 0xec2490cf> <pcomp> <accomp>]
rcvd [LCP ConfAck id=0x1 <magic 0xec2490cf> <pcomp> <accomp>]
sent [LCP ConfReq id=0x1 <magic 0xec2490cf> <pcomp> <accomp>]
rcvd [LCP ConfAck id=0x1 <magic 0xec2490cf> <pcomp> <accomp>]
sent [LCP ConfReq id=0x1 <magic 0xec2490cf> <pcomp> <accomp>]
rcvd [LCP ConfAck id=0x1 <magic 0xec2490cf> <pcomp> <accomp>]
sent [LCP ConfReq id=0x1 <magic 0xec2490cf> <pcomp> <accomp>]
rcvd [LCP ConfAck id=0x1 <magic 0xec2490cf> <pcomp> <accomp>]
sent [LCP ConfReq id=0x1 <magic 0xec2490cf> <pcomp> <accomp>]
rcvd [LCP ConfAck id=0x1 <magic 0xec2490cf> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x25 <asyncmap 0x0> <magic 0xa5a44a5a>]
sent [LCP ConfAck id=0x25 <asyncmap 0x0> <magic 0xa5a44a5a>]
sent [IPCP ConfReq id=0x1 <compress VJ 0f 01> <addr 192.168.30.1>]
sent [IPCP ConfReq id=0x1 <compress VJ 0f 01> <addr 192.168.30.1>]
rcvd [IPCP ConfAck id=0x1 <compress VJ 0f 01> <addr 192.168.30.1>]
sent [IPCP ConfReq id=0x1 <compress VJ 0f 01> <addr 192.168.30.1>]
rcvd [IPCP ConfAck id=0x1 <compress VJ 0f 01> <addr 192.168.30.1>]
rcvd [IPCP ConfReq id=0x27 <addr 0.0.0.0>]
sent [IPCP ConfNak id=0x27 <addr 192.168.30.50>]
sent [IPCP ConfReq id=0x1 <compress VJ 0f 01> <addr 192.168.30.1>]
rcvd [IPCP ConfAck id=0x1 <compress VJ 0f 01> <addr 192.168.30.1>]
rcvd [IPCP ConfReq id=0x28 <addr 0.0.0.0>]
sent [IPCP ConfNak id=0x28 <addr 192.168.30.50>]
sent [IPCP ConfReq id=0x1 <compress VJ 0f 01> <addr 192.168.30.1>]
rcvd [IPCP ConfAck id=0x1 <compress VJ 0f 01> <addr 192.168.30.1>]
sent [IPCP ConfReq id=0x1 <compress VJ 0f 01> <addr 192.168.30.1>]
rcvd [IPCP ConfAck id=0x1 <compress VJ 0f 01> <addr 192.168.30.1>]
rcvd [IPCP ConfReq id=0x2a <addr 0.0.0.0>]
sent [IPCP ConfNak id=0x2a <addr 192.168.30.50>]
sent [IPCP ConfReq id=0x1 <compress VJ 0f 01> <addr 192.168.30.1>]
rcvd [IPCP ConfAck id=0x1 <compress VJ 0f 01> <addr 192.168.30.1>]
rcvd [LCP ConfReq id=0x2c <asyncmap 0x0> <magic 0xa5a44a5a>]
sent [LCP ConfReq id=0x2 <magic 0xae75be4b> <pcomp> <accomp>]
sent [LCP ConfAck id=0x2c <asyncmap 0x0> <magic 0xa5a44a5a>]
rcvd [LCP ConfAck id=0x2 <magic 0xae75be4b> <pcomp> <accomp>]
sent [IPCP ConfReq id=0x2 <compress VJ 0f 01> <addr 192.168.30.1>]
sent [IPCP ConfReq id=0x2 <compress VJ 0f 01> <addr 192.168.30.1>]
rcvd [IPCP ConfAck id=0x2 <compress VJ 0f 01> <addr 192.168.30.1>]
rcvd [IPCP ConfReq id=0x2d <addr 0.0.0.0>]
sent [IPCP ConfNak id=0x2d <addr 192.168.30.50>]
sent [IPCP ConfReq id=0x2 <compress VJ 0f 01> <addr 192.168.30.1>]
rcvd [IPCP ConfAck id=0x2 <compress VJ 0f 01> <addr 192.168.30.1>]
sent [IPCP ConfReq id=0x2 <compress VJ 0f 01> <addr 192.168.30.1>]
rcvd [IPCP ConfAck id=0x2 <compress VJ 0f 01> <addr 192.168.30.1>] 

-- 
View this message in context: http://www.nabble.com/IPCP-Nak-doesn%27t-do-anything-tp14303969p14303969.html
Sent from the linux-ppp mailing list archive at Nabble.com.

