From: Tyler Sutherland <tsutherland@iders.ca>
Date: Tue, 01 Apr 2008 20:57:11 +0000
Subject: LCP Renegotiates After IP Connection
Message-Id: <1207083431.8474.15.camel@pago>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi There,

I have a situation where I'm trying to maintain a PPP connection from my
Linux PC to an embedded Linux device.

I am able to get the PPP connection working such that each end has an IP
address and I can ping the other end for twenty seconds, but then I
receive an [LCP ConfReq] packet and the PPP connection sets itself up
again.  This interrupts the IP connection and breaks my ability to ping.

I'm trying to figure out why this is happening, because I want to have a
stable PPP connection.  If someone can help me I'd appreciate it very
much.

The embedded device seems to want to restart the connection every 20
seconds.  This is what the pppd debug log looks like from my end:

~ #  pppd nodetach file /etc/ppp/options.pppUSB1 
pppd options in effect:
nodetach        # (from command line)
debug           # (from /etc/ppp/options.pppUSB1)
dump            # (from /etc/ppp/options.pppUSB1)
noauth          # (from /etc/ppp/options.pppUSB1)
/dev/ttyUSB1    # (from /etc/ppp/options.pppUSB1)
57600           # (from /etc/ppp/options.pppUSB1)
lock            # (from /etc/ppp/options.pppUSB1)
noaccomp                # (from /etc/ppp/options.pppUSB1)
asyncmap ffffffff               # (from /etc/ppp/options.pppUSB1)
nopcomp         # (from /etc/ppp/options.pppUSB1)
10.2.10.5:10.2.10.20            # (from /etc/ppp/options.pppUSB1)
nobsdcomp               # (from /etc/ppp/options.pppUSB1)
nodeflate               # (from /etc/ppp/options.pppUSB1)
using channel 18
Using interface ppp0
Connect: ppp0 <--> /dev/ttyUSB1
sent [LCP ConfReq id=0x1 <magic 0x913429f5>]
rcvd [LCP ConfAck id=0x1 <magic 0x913429f5>]
sent [LCP ConfReq id=0x1 <magic 0x913429f5>]
rcvd [LCP ConfAck id=0x1 <magic 0x913429f5>]
sent [LCP ConfReq id=0x1 <magic 0x913429f5>]
rcvd [LCP ConfAck id=0x1 <magic 0x913429f5>]
sent [LCP ConfReq id=0x1 <magic 0x913429f5>]
rcvd [LCP ConfAck id=0x1 <magic 0x913429f5>]
sent [LCP ConfReq id=0x1 <magic 0x913429f5>]
rcvd [LCP ConfAck id=0x1 <magic 0x913429f5>]
rcvd [LCP ConfReq id=0x6c <asyncmap 0x0> <magic 0xa5a44a5a>]
sent [LCP ConfAck id=0x6c <asyncmap 0x0> <magic 0xa5a44a5a>]
sent [IPCP ConfReq id=0x1 <compress VJ 0f 01> <addr 10.2.10.5>]
sent [IPCP ConfReq id=0x1 <compress VJ 0f 01> <addr 10.2.10.5>]
rcvd [IPCP ConfAck id=0x1 <compress VJ 0f 01> <addr 10.2.10.5>]
rcvd [IPCP ConfReq id=0x6d <addr 10.2.10.20>]
sent [IPCP ConfAck id=0x6d <addr 10.2.10.20>]
local  IP address 10.2.10.5
remote IP address 10.2.10.20

(there's 20 seconds here where I can ping the other side.)

rcvd [LCP ConfReq id=0x6e <asyncmap 0x0> <magic 0xa5a44a5a>]
Connect time 0.3 minutes.
Sent 0 bytes, received 0 bytes.
sent [LCP ConfReq id=0x2 <magic 0x1cba1779>]
sent [LCP ConfAck id=0x6e <asyncmap 0x0> <magic 0xa5a44a5a>]
rcvd [LCP ConfAck id=0x2 <magic 0x1cba1779>]
sent [IPCP ConfReq id=0x2 <compress VJ 0f 01> <addr 10.2.10.5>]
sent [IPCP ConfReq id=0x2 <compress VJ 0f 01> <addr 10.2.10.5>]
rcvd [IPCP ConfAck id=0x2 <compress VJ 0f 01> <addr 10.2.10.5>]
rcvd [IPCP ConfReq id=0x6f <addr 10.2.10.20>]
sent [IPCP ConfAck id=0x6f <addr 10.2.10.20>]
local  IP address 10.2.10.5
remote IP address 10.2.10.20

(there's 20 seconds here where I can ping the other side.)

rcvd [LCP ConfReq id=0x70 <asyncmap 0x0> <magic 0xa5a44a5a>]
Connect time 0.3 minutes.
Sent 0 bytes, received 0 bytes.
sent [LCP ConfReq id=0x3 <magic 0xf53f0cb6>]
sent [LCP ConfAck id=0x70 <asyncmap 0x0> <magic 0xa5a44a5a>]
rcvd [LCP ConfAck id=0x3 <magic 0xf53f0cb6>]
sent [IPCP ConfReq id=0x3 <compress VJ 0f 01> <addr 10.2.10.5>]
sent [IPCP ConfReq id=0x3 <compress VJ 0f 01> <addr 10.2.10.5>]
rcvd [IPCP ConfAck id=0x3 <compress VJ 0f 01> <addr 10.2.10.5>]
rcvd [IPCP ConfReq id=0x71 <addr 10.2.10.20>]
sent [IPCP ConfAck id=0x71 <addr 10.2.10.20>]
local  IP address 10.2.10.5
remote IP address 10.2.10.20

(and it repeats to inifinity.)

Any ideas would be great.

Thanks,

Tyler
tsutherland@iders.ca




