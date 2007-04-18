From: amyng <ang@shoppertrak.com>
Date: Wed, 18 Apr 2007 22:02:19 +0000
Subject: IPCP Negotiation Failure - Peer refuse to accept IP Address
Message-Id: <10066975.post@talk.nabble.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org



I'm running 2.4.4 pppd on Solaris (I know it's not Linux, but there's no
sun-ppp forum) trying to connect to a device (which I can get to by window
rasppp btw).

After receiving "Could not determine local IP address" IPCP confReq (see
following ppp log)...

$ pppd options in effect:
debug           # (from /etc/ppp/options)
kdebug 31               # (from /etc/ppp/options)
-detach         # (from /etc/ppp/options)
dump            # (from /etc/ppp/options)
noauth          # (from /etc/ppp/options)
/dev/ttya               # (from command line)
38400           # (from command line)
lock            # (from /etc/ppp/options)
connect /etc/ppp/ppp-on-dialer          # (from command line)
crtscts         # (from /etc/ppp/options)
local           # (from /etc/ppp/options)
ipcp-accept-local               # (from /etc/ppp/options)
ipcp-accept-remote              # (from /etc/ppp/options)
noipdefault             # (from /etc/ppp/options)
defaultroute            # (from /etc/ppp/options)
ipcp-no-addresses               # (from /etc/ppp/options)
noccp           # (from /etc/ppp/options)
Serial connection established.
Using interface ppp0
Connect: ppp0 <--> /dev/ttya
sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0x2f497226> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x11]
sent [LCP ConfAck id=0x11]
rcvd [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0x2f497226> <pcomp> <accomp>]
sent [IPCP ConfReq id=0x1 <compress VJ 0f 01> <addr 0.0.0.0>]
rcvd [IPCP ConfReq id=0x10 <addr 192.168.129.1>]
sent [IPCP ConfAck id=0x10 <addr 192.168.129.1>]
rcvd [IPCP ConfRej id=0x1 <compress VJ 0f 01> <addr 0.0.0.0>]
sent [IPCP ConfReq id=0x2]
rcvd [IPCP ConfAck id=0x2]
Could not determine local IP address
Connect time 0.7 minutes.
Sent 147 bytes, received 110 bytes.
ioctl(set NP 33 mode to 1): Invalid argument
sent [IPCP TermReq id=0x3 "Could not determine local IP address"]
rcvd [IPCP TermAck id=0x3 "Could not determine local IP address"]
sent [LCP TermReq id=0x2 "No network protocols running"]
sent [LCP TermReq id=0x3 "No network protocols running"]
Connection terminated.


I specified the local IP address in /etc/ppp/options and got a different
error:
$ pppd options in effect:
debug           # (from /etc/ppp/options)
kdebug 31               # (from /etc/ppp/options)
-detach         # (from /etc/ppp/options)
dump            # (from /etc/ppp/options)
noauth          # (from /etc/ppp/options)
/dev/ttya               # (from command line)
38400           # (from command line)
lock            # (from /etc/ppp/options)
connect /etc/ppp/ppp-on-dialer          # (from command line)
crtscts         # (from /etc/ppp/options)
local           # (from /etc/ppp/options)
ipcp-accept-local               # (from /etc/ppp/options)
ipcp-accept-remote              # (from /etc/ppp/options)
noipdefault             # (from /etc/ppp/options)
defaultroute            # (from /etc/ppp/options)
ipcp-no-addresses               # (from /etc/ppp/options)
192.168.129.2:          # (from /etc/ppp/options)
noccp           # (from /etc/ppp/options)
Serial connection established.
Using interface ppp0
Connect: ppp0 <--> /dev/ttya
sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0x2ae8f766> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x12]
sent [LCP ConfAck id=0x12]
rcvd [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0x2ae8f766> <pcomp> <accomp>]
sent [IPCP ConfReq id=0x1 <compress VJ 0f 01> <addr 192.168.129.2>]
rcvd [IPCP ConfReq id=0x11 <addr 192.168.129.1>]
sent [IPCP ConfAck id=0x11 <addr 192.168.129.1>]
rcvd [IPCP ConfRej id=0x1 <compress VJ 0f 01> <addr 192.168.129.2>]
sent [IPCP ConfReq id=0x2]
rcvd [IPCP ConfAck id=0x2]
Peer refused to agree to our IP address
Connect time 0.6 minutes.
Sent 142 bytes, received 110 bytes.
ioctl(set NP 33 mode to 1): Invalid argument
sent [IPCP TermReq id=0x3 "Refused our IP address"]
rcvd [IPCP TermAck id=0x3 "Refused our IP address"]
sent [LCP TermReq id=0x2 "No network protocols running"]
rcvd [LCP TermAck id=0x2 "No network protocols running"]
Connection terminated.

I have an output of a successful ppp connection from the same pppd connected
to a similar device using the same options:
$ pppd options in effect:
debug           # (from /etc/ppp/options)
kdebug 31               # (from /etc/ppp/options)
-detach         # (from /etc/ppp/options)
dump            # (from /etc/ppp/options)
noauth          # (from /etc/ppp/options)
/dev/ttya               # (from command line)
38400           # (from command line)
lock            # (from /etc/ppp/options)
connect /etc/ppp/ppp-on-dialer          # (from command line)
crtscts         # (from /etc/ppp/options)
local           # (from /etc/ppp/options)
ipcp-accept-local               # (from /etc/ppp/options)
ipcp-accept-remote              # (from /etc/ppp/options)
noipdefault             # (from /etc/ppp/options)
defaultroute            # (from /etc/ppp/options)
ipcp-no-addresses               # (from /etc/ppp/options)
192.168.129.2:          # (from /etc/ppp/options)
noccp           # (from /etc/ppp/options)
Serial connection established.
Using interface ppp0
Connect: ppp0 <--> /dev/ttya
sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0x2bd7801c> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x4]
sent [LCP ConfAck id=0x4]
rcvd [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0x2bd7801c> <pcomp> <accomp>]
sent [IPCP ConfReq id=0x1 <compress VJ 0f 01> <addr 192.168.129.2>]
rcvd [IPCP ConfReq id=0x3 <addr 192.168.129.1>]
sent [IPCP ConfAck id=0x3 <addr 192.168.129.1>]
sent [IPCP ConfReq id=0x1 <compress VJ 0f 01> <addr 192.168.129.2>]
rcvd [IPCP ConfRej id=0x1 <compress VJ 0f 01>]
sent [IPCP ConfReq id=0x2 <addr 192.168.129.2>]
rcvd [IPCP ConfAck id=0x2 <addr 192.168.129.2>]
local  IP address 192.168.129.2
remote IP address 192.168.129.1

I noticed that the failure case, the last IPCP ConfReq is sent without the
specified local IP Address:
sent [IPCP ConfReq id=0x2]
whereas the successful case, it does:
sent [IPCP ConfReq id=0x2 <addr 192.168.129.2>]

Any help would be greatly appreciated!!

Amy
-- 
View this message in context: http://www.nabble.com/IPCP-Negotiation-Failure---Peer-refuse-to-accept-IP-Address-tf3603388.html#a10066975
Sent from the linux-ppp mailing list archive at Nabble.com.

