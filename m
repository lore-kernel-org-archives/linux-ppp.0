From: Matthew Percival <matthew@capgo.com>
Date: Wed, 01 Feb 2006 05:06:16 +0000
Subject: Hot to perform a null login?
Message-Id: <1138770376.8869.17.camel@localhost.localdomain>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

G'Day,

	I am trying to use a GSM modem to create a GPRS connection via pppd.  I
have managed to work most things out, but am finding authentication a
stumbling block: I need to send a blank name and password, but pppd is
sending my local name (which is obviously being treated as incorrect by
the server).  Looking through the pppd code, I came across null_login(),
which looks like it may provide what I need, but I cannot seem to get
pppd to call it --- obviously I am misunderstanding something along the
way, and have something set up wrong.

	Could someone please tell me how to configure pppd to reply to a PAP
request with a blank name and password?  I'll include dumps of my pppd
and chat scripts below, in case they are relevant.

	-- Matthew

/etc/ppp/peers/gprs-script:
115200
noauth
debug
crtscts
noipdefault
modem
usepeerdns
defaultroute
pap-max-authreq 3
connect-delay 10000
connect '/usr/sbin/chat -v -f /etc/ppp/gprs-init'

/etc/ppp/gprs-init:
TIMEOUT 10
ABORT "NO CARRIER"
ABORT "NO DIALTONE"
ABORT "BUSY"
ABORT "ERROR"
"" AT+WOPEN=1 OK
\dAT+CPIN? TIMEOUT 5 READY-\dAT+CPINU69-OK
\dAT+CPIN? TIMEOUT 10 READY
\dAT+CREG=1 OK
\dAT+CGDCONT=1,"IP","telstra.internet" OK
\dAT+CGDATA=1 ""

