From: Clifford Kite <kite_linux-ppp@ev1.net>
Date: Fri, 23 Jan 2004 20:53:13 +0000
Subject: pppd 2.4.2, Control-C bug?
Message-Id: <Pine.LNX.4.21.0401231150020.2019-100000@corncob.localhost.tld>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Problem:  After pppd 2.4.2 - with the updetach option - is run by root
from a terminal window, a control-C from the keyboard before the PPP
link completes doesn't terminate pppd.

The line below was derived from my usual connection script and used for
testing.

/usr/sbin/pppd connect '/usr/sbin/chat -v "" ATZ\&F OK ATM0W1\&D1%E1s95G \
OK ATDTxxx-xxxx TIMEOUT 45 V90 \\c TIMEOUT 15 CONNECT \\d\\c' /dev/ttyS1 \
115200 crtscts modem updetach lock defaultroute debug

Control-C at the keyboard before the connection completes results in

Terminating on signal 2.

repeated, seemingly without end.  "kill -TERM $(pidof pppd)" doesn't
terminate pppd or the messages.  "kill -KILL $(pidof pppd)" does both.

From /var/log/messages:
Jan 23 11:19:34 corncob pppd[1849]: pppd 2.4.2 started by root, uid 0
Jan 23 11:19:34 corncob pppd[1849]: Removed stale lock on ttyS1 (pid 1828)
Jan 23 11:19:35 corncob pppd[1849]: Terminating on signal 2.
Jan 23 11:19:50 corncob last message repeated 33707 times

The same thing occurs after a Control-C before completion of the
usual connection script, which reports pppd's return status after
"kill -KILL $(pidof pppd)":

The pppd return status is 137

Pppd 2.4.2b3 does correctly terminate with a Control-C by root at the
keyboard.

Is it me or pppd 2.4.2? :)

--
Clifford Kite                                 http://ckite.no-ip.net



