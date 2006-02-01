From: Matthew Percival <matthew@capgo.com>
Date: Wed, 01 Feb 2006 23:03:02 +0000
Subject: Re: Hot to perform a null login?
Message-Id: <1138834982.8826.7.camel@localhost.localdomain>
List-Id: <linux-ppp.vger.kernel.org>
References: <1138770376.8869.17.camel@localhost.localdomain>
In-Reply-To: <1138770376.8869.17.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

G'Day,

> > pap-max-authreq 3               # (from /etc/ppp/peers/gprs-script)
> 
> Make this one 5 or 7 to make sure that it is not just a timeout.

	I originally had this at the default (10), and later reduced it to cut
out a little bit of time.

> > defaultroute            # (from /etc/ppp/peers/gprs-script)
> > proxyarp                # (from /etc/ppp/options)
> 
> It makes no sense to have both proxyarp and defaultroute. GEt rid of the
> proxyarp.


	proxyarp was in there by default: I had simply not touched it.  I just
checked what it does now, and it is not something I need, so I have
commented it out.

I now have the following options:
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
pap-max-authreq 10              # (from /etc/ppp/peers/gprs-script)
noipdefault             # (from /etc/ppp/peers/gprs-script)
defaultroute            # (from /etc/ppp/peers/gprs-script)
usepeerdns              # (from /etc/ppp/peers/gprs-script)
noipx           # (from /etc/ppp/options)

And the log shows:
Feb  2 09:52:26 localhost pppd[9081]: pppd 2.4.3 started by matthew, uid
1000
Feb  2 09:52:27 localhost chat[9082]: timeout set to 10 seconds
Feb  2 09:52:27 localhost chat[9082]: abort on (NO CARRIER)
Feb  2 09:52:27 localhost chat[9082]: abort on (NO DIALTONE)
Feb  2 09:52:27 localhost chat[9082]: abort on (BUSY)
Feb  2 09:52:27 localhost chat[9082]: abort on (ERROR)
Feb  2 09:52:27 localhost chat[9082]: send (AT+WOPEN=1^M)
Feb  2 09:52:27 localhost chat[9082]: expect (OK)
Feb  2 09:52:27 localhost chat[9082]: AT+WOPEN=1^M^M
Feb  2 09:52:27 localhost chat[9082]: OK
Feb  2 09:52:27 localhost chat[9082]:  -- got it 
Feb  2 09:52:27 localhost chat[9082]: send (\dAT+CPIN?^M)
Feb  2 09:52:28 localhost chat[9082]: timeout set to 5 seconds
Feb  2 09:52:28 localhost chat[9082]: expect (READY)
Feb  2 09:52:28 localhost chat[9082]: ^M
Feb  2 09:52:28 localhost chat[9082]: AT+CPIN?^M^M
Feb  2 09:52:28 localhost chat[9082]: +CPIN: SIM PIN^M
Feb  2 09:52:33 localhost chat[9082]: alarm
Feb  2 09:52:33 localhost chat[9082]: send (\dAT+CPINU69^M)
Feb  2 09:52:35 localhost chat[9082]: expect (OK)
Feb  2 09:52:35 localhost chat[9082]: AT+CPINU69^M^M
Feb  2 09:52:35 localhost chat[9082]: OK
Feb  2 09:52:35 localhost chat[9082]:  -- got it 
Feb  2 09:52:35 localhost chat[9082]: send (\dAT+CPIN?^M)
Feb  2 09:52:36 localhost chat[9082]: timeout set to 10 seconds
Feb  2 09:52:36 localhost chat[9082]: expect (READY)
Feb  2 09:52:36 localhost chat[9082]: ^M
Feb  2 09:52:36 localhost chat[9082]: AT+CPIN?^M^M
Feb  2 09:52:36 localhost chat[9082]: +CPIN: READY
Feb  2 09:52:36 localhost chat[9082]:  -- got it 
Feb  2 09:52:36 localhost chat[9082]: send (\dAT+CREG=1^M)
Feb  2 09:52:38 localhost chat[9082]: expect (OK)
Feb  2 09:52:38 localhost chat[9082]: ^M
Feb  2 09:52:38 localhost chat[9082]: AT+CREG=1^M^M
Feb  2 09:52:38 localhost chat[9082]: OK
Feb  2 09:52:38 localhost chat[9082]:  -- got it 
Feb  2 09:52:38 localhost chat[9082]: send (\dAT
+CGDCONT=1,"IP","telstra.internet"^M)
Feb  2 09:52:39 localhost chat[9082]: expect (OK)
Feb  2 09:52:39 localhost chat[9082]: ^M
Feb  2 09:52:39 localhost chat[9082]: AT
+CGDCONT=1,"IP","telstra.internet"^M^M
Feb  2 09:52:39 localhost chat[9082]: OK
Feb  2 09:52:39 localhost chat[9082]:  -- got it 
Feb  2 09:52:39 localhost chat[9082]: send (\dAT+CGDATA=1^M)
Feb  2 09:52:40 localhost pppd[9081]: Serial connection established.
Feb  2 09:52:40 localhost pppd[9081]: using channel 2
Feb  2 09:52:40 localhost pppd[9081]: Using interface ppp0
Feb  2 09:52:40 localhost pppd[9081]: Connect: ppp0 <--> /dev/ttyS0
Feb  2 09:52:40 localhost pppd[9081]: rcvd [LCP ConfReq id=0x1 <mru
1500> <asyncmap 0x0> <pcomp> <accomp> <auth pap>]
Feb  2 09:52:40 localhost pppd[9081]: sent [LCP ConfReq id=0x1 <asyncmap
0x0> <magic 0xa6a311d> <pcomp> <accomp>]
Feb  2 09:52:40 localhost pppd[9081]: sent [LCP ConfAck id=0x1 <mru
1500> <asyncmap 0x0> <pcomp> <accomp> <auth pap>]
Feb  2 09:52:40 localhost pppd[9081]: rcvd [LCP ConfRej id=0x1 <magic
0xa6a311d>]
Feb  2 09:52:40 localhost pppd[9081]: sent [LCP ConfReq id=0x2 <asyncmap
0x0> <pcomp> <accomp>]
Feb  2 09:52:40 localhost pppd[9081]: rcvd [LCP ConfAck id=0x2 <asyncmap
0x0> <pcomp> <accomp>]
Feb  2 09:52:40 localhost pppd[9081]: sent [PAP AuthReq id=0x1
user="matthew" password=<hidden>]
Feb  2 09:52:43 localhost pppd[9081]: sent [PAP AuthReq id=0x2
user="matthew" password=<hidden>]
Feb  2 09:52:46 localhost pppd[9081]: sent [PAP AuthReq id=0x3
user="matthew" password=<hidden>]
Feb  2 09:52:49 localhost pppd[9081]: sent [PAP AuthReq id=0x4
user="matthew" password=<hidden>]
Feb  2 09:52:52 localhost pppd[9081]: sent [PAP AuthReq id=0x5
user="matthew" password=<hidden>]
Feb  2 09:52:55 localhost pppd[9081]: sent [PAP AuthReq id=0x6
user="matthew" password=<hidden>]
Feb  2 09:52:58 localhost pppd[9081]: sent [PAP AuthReq id=0x7
user="matthew" password=<hidden>]
Feb  2 09:53:01 localhost pppd[9081]: sent [PAP AuthReq id=0x8
user="matthew" password=<hidden>]
Feb  2 09:53:04 localhost pppd[9081]: sent [PAP AuthReq id=0x9
user="matthew" password=<hidden>]
Feb  2 09:53:07 localhost pppd[9081]: sent [PAP AuthReq id=0xa
user="matthew" password=<hidden>]
Feb  2 09:53:10 localhost pppd[9081]: No response to PAP
authenticate-requests
Feb  2 09:53:10 localhost pppd[9081]: sent [LCP TermReq id=0x3 "Failed
to authenticate ourselves to peer"]
Feb  2 09:53:10 localhost pppd[9081]: rcvd [PAP AuthNak id=0xa "Sorry
auth. failed!"]
Feb  2 09:53:10 localhost pppd[9081]: Discarded non-LCP packet when LCP
not open
Feb  2 09:53:11 localhost pppd[9081]: rcvd [LCP TermReq id=0x2]
Feb  2 09:53:11 localhost pppd[9081]: sent [LCP TermAck id=0x2]
Feb  2 09:53:11 localhost pppd[9081]: Hangup (SIGHUP)
Feb  2 09:53:11 localhost pppd[9081]: Modem hangup
Feb  2 09:53:11 localhost pppd[9081]: Connection terminated.
Feb  2 09:53:12 localhost pppd[9081]: Exit.

	If it still looks like the problem is at the other end, I will try to
contact them, and see if I can actually get a response on this.

	Thanks for the assistance so far,

	Matthew

