From: Matt Dooner <dclscratch@gmail.com>
Date: Fri, 23 Jan 2015 11:56:23 +0000
Subject: pppd hangup only when traffic sent over connection
Message-Id: <CAJi99x1irCJMuwb06HpB0XFyFZpZPWa6b2E3pVGQyE_qJwk5NQ@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hello,

I'm experiencing an issue where pppd hangs up, but only when traffic
is sent over the connection. The connection is stable if it is idle,
but soon after any traffic is sent over the connection pppd hangs up.
For example, 15-30 pings or a few lines into a telnet session kills
the connection. I suspect this is the result of a lack of support for
a Link Quality Report (which is Confreq'd by the target).

As you can see in the debug about below if-down is started after the
"rcvd [LCP ConfReq id=0xf0 <mru 400> <quality lqr 00 00 01 2c> <magic
0xc0a80ea5> <pcomp> <accomp>]". This ConfReq occured after 17
successful pings over the link, and the link went down after the
ConfReq. Is this expected behaviour?

Thanks in advance,
Matt

using channel 14
Using interface ppp0
Connect: ppp0 <--> /dev/ttyO1
sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0x9ad4ff1a> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0xd5 <mru 400> <quality lqr 00 00 01 2c> <magic
0xc0a80ea5> <pcomp> <accomp>]
sent [LCP ConfRej id=0xd5 <quality lqr 00 00 01 2c>]
rcvd [LCP ConfRej id=0x1 <asyncmap 0x0>]
sent [LCP ConfReq id=0x2 <magic 0x9ad4ff1a> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0xd6 <mru 400> <magic 0xc0a80ea5> <pcomp> <accomp>]
sent [LCP ConfAck id=0xd6 <mru 400> <magic 0xc0a80ea5> <pcomp> <accomp>]
rcvd [LCP ConfAck id=0x2 <magic 0x9ad4ff1a> <pcomp> <accomp>]
kernel does not support PPP filtering
sent [IPCP ConfReq id=0x1 <addr 0.0.0.0>]
rcvd [IPCP ConfReq id=0xd7 <addr 192.168.14.165>]
sent [IPCP ConfAck id=0xd7 <addr 192.168.14.165>]
sent [IPCP ConfReq id=0x1 <addr 0.0.0.0>]
rcvd [IPCP ConfNak id=0x1 <addr 192.168.14.166>]
sent [IPCP ConfReq id=0x2 <addr 192.168.14.166>]
sent [IPCP ConfReq id=0x2 <addr 192.168.14.166>]
rcvd [IPCP ConfAck id=0x2 <addr 192.168.14.166>]
local  IP address 192.168.14.166
remote IP address 192.168.14.165
Script /etc/ppp/ip-up started (pid 1686)
Script /etc/ppp/ip-up finished (pid 1686), status = 0x0
rcvd [LCP ConfReq id=0xf0 <mru 400> <quality lqr 00 00 01 2c> <magic
0xc0a80ea5> <pcomp> <accomp>]
Connect time 1.3 minutes.
Sent 2112 bytes, received 2344 bytes.
Script /etc/ppp/ip-down started (pid 1695)
sent [LCP ConfReq id=0x3 <asyncmap 0x0> <magic 0x49d0163a> <pcomp> <accomp>]
sent [LCP ConfRej id=0xf0 <quality lqr 00 00 01 2c>]
Script /etc/ppp/ip-down finished (pid 1695), status = 0x0
sent [LCP ConfReq id=0x3 <asyncmap 0x0> <magic 0x49d0163a> <pcomp> <accomp>]
sent [LCP ConfReq id=0x3 <asyncmap 0x0> <magic 0x49d0163a> <pcomp> <accomp>]
sent [LCP ConfReq id=0x3 <asyncmap 0x0> <magic 0x49d0163a> <pcomp> <accomp>]
sent [LCP ConfReq id=0x3 <asyncmap 0x0> <magic 0x49d0163a> <pcomp> <accomp>]
sent [LCP ConfReq id=0x3 <asyncmap 0x0> <magic 0x49d0163a> <pcomp> <accomp>]
sent [LCP ConfReq id=0x3 <asyncmap 0x0> <magic 0x49d0163a> <pcomp> <accomp>]
sent [LCP ConfReq id=0x3 <asyncmap 0x0> <magic 0x49d0163a> <pcomp> <accomp>]
sent [LCP ConfReq id=0x3 <asyncmap 0x0> <magic 0x49d0163a> <pcomp> <accomp>]
sent [LCP ConfReq id=0x3 <asyncmap 0x0> <magic 0x49d0163a> <pcomp> <accomp>]
LCP: timeout sending Config-Requests
Connection terminated.
Modem hangup
