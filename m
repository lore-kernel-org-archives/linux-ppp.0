From: jfj <jfj@freemail.gr>
Date: Thu, 28 Dec 2006 15:47:55 +0000
Subject: Help with PPPoE
Message-Id: <4593E72B.30603@freemail.gr>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi.

I have kernel 2.6.17.13 with "PPP over Ethernet" compiled in (not a module)
and pppd 2.4.4b1.  I have added the option "plugin rp-pppoe.so" to
/etc/ppp/options.

Now when I type

	pppd eth0

I get

	unrecognized option 'eth0'

But wasn't the plugin supposed to enable this device?

If I use this script in /etc/ppp/peers/mydsl

	#
	# PPP over Ethernet options (using roaring pinguin external program)
	#
	plugin rp-pppoe.so
	noauth
	# pppoe has a lower mtu/mru
	mtu 1492
	mru 1492
	# switch off all compressions (this is a must)
	nopcomp
	# this is recommended
	novjccomp
	noccp
	debug

And run

	pppd call mydsl

Nothing happens (pppd can't even be interrupted with ctrl-c) and
/var/log/messages sais:

	Dec 28 20:43:18 linux pppd[5324]: Plugin rp-pppoe.so loaded.
	Dec 28 20:43:18 linux pppd[5324]: RP-PPPoE plugin version 3.3 compiled against pppd 2.4.4b1
	Dec 28 20:43:18 linux pppd[5324]: pppd 2.4.4b1 started by root, uid 0
	Dec 28 20:43:18 linux pppd[5324]: using channel 3
	Dec 28 20:43:18 linux pppd[5324]: Using interface ppp0
	Dec 28 20:43:18 linux pppd[5324]: Connect: ppp0 <--> /dev/tty6
	Dec 28 20:43:18 linux pppd[5324]: sent [LCP ConfReq id=0x1 <mru 1492> <asyncmap 0x0> <magic 0xad6cc157> <accomp>]
	Dec 28 20:43:50 linux last message repeated 16 times
	Dec 28 20:44:52 linux last message repeated 31 times
	Dec 28 20:45:16 linux last message repeated 12 times
	Dec 28 20:45:18 linux pppd[5324]: LCP: timeout sending Config-Requests 
	Dec 28 20:45:18 linux pppd[5324]: Connection terminated.
	Dec 28 20:45:18 linux pppd[5324]: Receive serial link is not 8-bit clean:
	Dec 28 20:45:18 linux pppd[5324]: Problem: all had bit 7 set to 0
	Dec 28 20:45:18 linux pppd[5324]: Modem hangup
	Dec 28 20:45:18 linux pppd[5324]: Exit.

Please help!

jerald


