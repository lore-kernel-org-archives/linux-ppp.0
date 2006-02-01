From: Matthew Percival <matthew@capgo.com>
Date: Wed, 01 Feb 2006 22:09:51 +0000
Subject: Re: Hot to perform a null login?
Message-Id: <1138831791.9407.6.camel@localhost.localdomain>
List-Id: <linux-ppp.vger.kernel.org>
References: <1138770376.8869.17.camel@localhost.localdomain>
In-Reply-To: <1138770376.8869.17.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

G'Day,

> Matthew, could you show us a debug log of the connection attempt?  Bill
> asked for that before, and it would be really helpful.  Add the option
> debug to the command line you use to start pppd.

	Here's the full log from what I sent yesterday:

Feb  1 16:28:16 localhost chat[15870]: timeout set to 10 seconds
Feb  1 16:28:16 localhost chat[15870]: abort on (NO CARRIER)
Feb  1 16:28:16 localhost chat[15870]: abort on (NO DIALTONE)
Feb  1 16:28:16 localhost chat[15870]: abort on (BUSY)
Feb  1 16:28:16 localhost chat[15870]: abort on (ERROR)
Feb  1 16:28:16 localhost chat[15870]: send (AT+WOPEN=1^M)
Feb  1 16:28:16 localhost chat[15870]: expect (OK)
Feb  1 16:28:16 localhost chat[15870]: AT+WOPEN=1^M^M
Feb  1 16:28:16 localhost chat[15870]: OK
Feb  1 16:28:16 localhost chat[15870]:  -- got it 
Feb  1 16:28:16 localhost chat[15870]: send (\dAT+CPIN?^M)
Feb  1 16:28:18 localhost chat[15870]: timeout set to 5 seconds
Feb  1 16:28:18 localhost chat[15870]: expect (READY)
Feb  1 16:28:18 localhost chat[15870]: ^M
Feb  1 16:28:18 localhost chat[15870]: AT+CPIN?^M^M
Feb  1 16:28:18 localhost chat[15870]: +CPIN: SIM PIN^M
Feb  1 16:28:23 localhost chat[15870]: alarm
Feb  1 16:28:23 localhost chat[15870]: send (\dAT+CPIN=xxxx^M)
Feb  1 16:28:24 localhost chat[15870]: expect (OK)
Feb  1 16:28:24 localhost chat[15870]: AT+CPIN=xxxx^M^M
Feb  1 16:28:24 localhost chat[15870]: OK
Feb  1 16:28:24 localhost chat[15870]:  -- got it 
Feb  1 16:28:24 localhost chat[15870]: send (\dAT+CPIN?^M)
Feb  1 16:28:26 localhost chat[15870]: timeout set to 10 seconds
Feb  1 16:28:26 localhost chat[15870]: expect (READY)
Feb  1 16:28:26 localhost chat[15870]: ^M
Feb  1 16:28:26 localhost chat[15870]: AT+CPIN?^M^M
Feb  1 16:28:26 localhost chat[15870]: +CPIN: READY
Feb  1 16:28:26 localhost chat[15870]:  -- got it 
Feb  1 16:28:26 localhost chat[15870]: send (\dAT+CREG=1^M)
Feb  1 16:28:27 localhost chat[15870]: expect (OK)
Feb  1 16:28:27 localhost chat[15870]: ^M
Feb  1 16:28:27 localhost chat[15870]: AT+CREG=1^M^M
Feb  1 16:28:27 localhost chat[15870]: OK
Feb  1 16:28:27 localhost chat[15870]:  -- got it 
Feb  1 16:28:27 localhost chat[15870]: send (\dAT
+CGDCONT=1,"IP","telstra.internet"^M)
Feb  1 16:28:28 localhost chat[15870]: expect (OK)
Feb  1 16:28:28 localhost chat[15870]: ^M
Feb  1 16:28:28 localhost chat[15870]: AT
+CGDCONT=1,"IP","telstra.internet"^M^M
Feb  1 16:28:28 localhost chat[15870]: OK
Feb  1 16:28:28 localhost chat[15870]:  -- got it 
Feb  1 16:28:28 localhost chat[15870]: send (\dAT+CGDATA=1^M)
Feb  1 16:28:29 localhost pppd[15869]: Serial connection established.
Feb  1 16:28:29 localhost pppd[15869]: using channel 12
Feb  1 16:28:29 localhost pppd[15869]: Using interface ppp0
Feb  1 16:28:29 localhost pppd[15869]: Connect: ppp0 <--> /dev/ttyS0
Feb  1 16:28:29 localhost pppd[15869]: rcvd [LCP ConfReq id=0x1 <mru
1500> <asyncmap 0x0> <pcomp> <accomp> <auth pap>]
Feb  1 16:28:29 localhost pppd[15869]: sent [LCP ConfReq id=0x1
<asyncmap 0x0> <magic 0xbab2643b> <pcomp> <accomp>]
Feb  1 16:28:29 localhost pppd[15869]: sent [LCP ConfAck id=0x1 <mru
1500> <asyncmap 0x0> <pcomp> <accomp> <auth pap>]
Feb  1 16:28:29 localhost pppd[15869]: rcvd [LCP ConfRej id=0x1 <magic
0xbab2643b>]
Feb  1 16:28:29 localhost pppd[15869]: sent [LCP ConfReq id=0x2
<asyncmap 0x0> <pcomp> <accomp>]
Feb  1 16:28:29 localhost pppd[15869]: rcvd [LCP ConfAck id=0x2
<asyncmap 0x0> <pcomp> <accomp>]
Feb  1 16:28:29 localhost pppd[15869]: sent [PAP AuthReq id=0x1
user="matthew" password=<hidden>]
Feb  1 16:28:32 localhost pppd[15869]: sent [PAP AuthReq id=0x2
user="matthew" password=<hidden>]
Feb  1 16:28:35 localhost pppd[15869]: sent [PAP AuthReq id=0x3
user="matthew" password=<hidden>]
Feb  1 16:28:38 localhost pppd[15869]: No response to PAP
authenticate-requests
Feb  1 16:28:38 localhost pppd[15869]: sent [LCP TermReq id=0x3 "Failed
to authenticate ourselves to peer"]
Feb  1 16:28:38 localhost pppd[15869]: rcvd [PAP AuthNak id=0x1 "Sorry
auth. failed!"]
Feb  1 16:28:38 localhost pppd[15869]: Discarded non-LCP packet when LCP
not open
Feb  1 16:28:39 localhost pppd[15869]: rcvd [LCP TermReq id=0x2]
Feb  1 16:28:39 localhost pppd[15869]: sent [LCP TermAck id=0x2]
Feb  1 16:28:39 localhost pppd[15869]: Hangup (SIGHUP)
Feb  1 16:28:39 localhost pppd[15869]: Modem hangup
Feb  1 16:28:39 localhost pppd[15869]: Connection terminated.
Feb  1 16:28:40 localhost pppd[15869]: Exit.

> I agree with Bill that the "sent [PAP AuthReq" suggests that your end is
> attempting to authenticate the peer.  Use the dump option to find out
> where the options are coming from.

pppd options in effect:
debug debug             # (from /etc/ppp/peers/gprs-script)
connect-delay 10000             # (from /etc/ppp/peers/gprs-script)
dump            # (from command line)
noauth          # (from /etc/ppp/peers/gprs-script)
/dev/ttyS0              # (from command line)
115200          # (from /etc/ppp/peers/gprs-script)
lock            # (from /etc/ppp/options)
connect /usr/sbin/chat -v -f /etc/ppp/gprs-init         #
(from /etc/ppp/peers/gprs-script)
crtscts         # (from /etc/ppp/peers/gprs-script)
modem           # (from /etc/ppp/peers/gprs-script)
asyncmap 0              # (from /etc/ppp/options)
hide-password           # (from /etc/ppp/options)
pap-max-authreq 3               # (from /etc/ppp/peers/gprs-script)
noipdefault             # (from /etc/ppp/peers/gprs-script)
defaultroute            # (from /etc/ppp/peers/gprs-script)
proxyarp                # (from /etc/ppp/options)
usepeerdns              # (from /etc/ppp/peers/gprs-script)
noipx           # (from /etc/ppp/options)

	Thanks,

	Matthew

