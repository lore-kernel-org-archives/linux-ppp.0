From: tony.chamberlain@lemko.com
Date: Tue, 01 Jul 2008 14:56:36 +0000
Subject: PPTP VPN, PPTP CONFIG
Message-Id: <W2416827856326101214924196@webmail30>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org





I installed the PPTP VPN on a client to connect via pptpvpn to a server
which is running it. I used pptpconfig to config the network. When I
connect, the VPN runs fine. I looked in pptpconfig and saw it does a

usr sbin pppd call myserver logfd 1 updetach persist

(I used "myserver" in this mail instead of the actual name). So I made a file
etc init.d pptpvpn where under start) I do the above (along with some checking,
etc). This also works nicely, when I but (after chkconfig on) the VPN comes
up and I can connect.

Problem is, if somehow the pptp process dies, if it is in etc init.d it won't start up
automatically again (which I need), so instead I transfered to etc inittab:

 vp:35:respawn: usr sbin pppd call myserver logfd 1 updetach persist

A "kill -1 1" or reboot will start this, but a ps just shows two processes with that
but I can't ping. A few minutes later it shows two processes again but with new
PIDs. Then a few minutes later two new processes with the same parameters
(there are only 2 at a time). I can't ping anything on the VPN either (and I do
add the routes in ip-up.local so from the etc rc5.d script it starts up the route).

Anyway how can I either modify my script in etc init.d (linked to etc rc*.d) to respawn
in the (unlikely but possible) case the process dies, or modify etc inittab to work
correctly?

Thanks










