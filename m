From: "Jason S. Friedman" <jason@powerpull.net>
Date: Mon, 19 Jul 2004 02:45:04 +0000
Subject: Can reach remote server, but not beyond
Message-Id: <37173.192.168.0.150.1090205104.squirrel@www.powerpull.net>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

I'm having two problems, or perhaps they are two
manifestations of the same problem.  I'm connecting to my
Windows PPP server at the office.  I read all of the
online documentation carefully, and I'm thinking it's a
routing issue, but I can't quite figure it out.

Here's the output from my pppd call:

$ pppd call xemkt dump debug logfd 2 nodetach
pppd options in effect:
debug debug             # (from command line)
nodetach                # (from command line)
logfd 2         # (from command line)
linkname xemkt          # (from /etc/ppp/peers/xemkt)
dump            # (from command line)
noauth          # (from /etc/ppp/options.pptp)
name eprime\\jfriedman          # (from /etc/ppp/peers/xemkt)
remotename xemkt                # (from /etc/ppp/peers/xemkt)
                # (from /etc/ppp/options.pptp)
pty pptp 63.85.19.5 --nolaunchpppd              # (from
/etc/ppp/peers/xemkt)
ipparam xemkt           # (from /etc/ppp/peers/xemkt)
nobsdcomp               # (from /etc/ppp/options.pptp)
nodeflate               # (from /etc/ppp/options.pptp)
using channel 32
Using interface ppp0
Connect: ppp0 <--> /dev/pts/16
sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0x2a64963>
<pcomp> <accomp>]
rcvd [LCP ConfReq id=0x0 <auth chap MS>]
sent [LCP ConfAck id=0x0 <auth chap MS>]
rcvd [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0x2a64963>
<pcomp> <accomp>]
rcvd [CHAP Challenge id=0x1 <e2d3cbea01192130>, name = ""]
sent [CHAP Response id=0x1
<0000000000000000000000000000000000000000000000005ec369ac448ac47b784ee8afc90360a58a6a03e6ac09340901>,
name = "eprime\\jfriedman"]
rcvd [CHAP Challenge id=0x2 <e469983121ccefb0>, name = ""]
sent [CHAP Response id=0x2
<000000000000000000000000000000000000000000000000ae1d5e8f22e7a2b8043d55ef6ad1bbd52547ef376808a5c901>,
name = "eprime\\jfriedman"]
rcvd [CHAP Success id=0x2 ""]
CHAP authentication succeeded
sent [IPCP ConfReq id=0x1 <compress VJ 0f 01> <addr 0.0.0.0>]
rcvd [IPCP ConfReq id=0x0 <addr 63.85.19.5>]
sent [IPCP ConfAck id=0x0 <addr 63.85.19.5>]
sent [IPCP ConfReq id=0x1 <compress VJ 0f 01> <addr 0.0.0.0>]
rcvd [IPCP ConfReq id=0x1 <addr 63.85.19.5>]
sent [IPCP ConfAck id=0x1 <addr 63.85.19.5>]
rcvd [IPCP ConfRej id=0x1 <compress VJ 0f 01>]
sent [IPCP ConfReq id=0x2 <addr 0.0.0.0>]
rcvd [IPCP ConfNak id=0x2 <addr 10.105.30.1>]
sent [IPCP ConfReq id=0x3 <addr 10.105.30.1>]
rcvd [IPCP ConfAck id=0x3 <addr 10.105.30.1>]
local  IP address 10.105.30.1
remote IP address 63.85.19.5
Script /etc/ppp/ip-up started (pid 10504)
Script /etc/ppp/ip-up finished (pid 10504), status = 0x0
Terminating on signal 2.
Script /etc/ppp/ip-down started (pid 10509)
sent [LCP TermReq id=0x2 "User request"]
Modem hangup
Connection terminated.
Connect time 0.7 minutes.
Sent 409591244 bytes, received 50 bytes.

That last line comes after I hit CTRL-C.  A lot of bytes
in very little time.

While the ppp connection is established, I get:
$ ifconfig ppp0
ppp0      Link encap:Point-to-Point Protocol
          inet addr:10.105.30.1  P-t-P:63.85.19.5 
Mask:255.255.255.255
          UP POINTOPOINT RUNNING NOARP MULTICAST  MTU:1500
 Metric:1
          RX packets:5 errors:0 dropped:0 overruns:0 frame:0
          TX packets:77875 errors:0 dropped:0 overruns:0
carrier:0
          collisions:0 txqueuelen:3
          RX bytes:50 (50.0 b)  TX bytes:27335900 (26.0 Mb)

I can ping 10.105.30.1, but I cannot ping 63.85.19.5.  I
also cannot ping any machines on the LAN of the PPP host.
