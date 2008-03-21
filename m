From: Vladi Lemurov <fix@stekloprom.ru>
Date: Fri, 21 Mar 2008 04:58:55 +0000
Subject: pppd + static routes
Message-Id: <47E3408F.1000609@stekloprom.ru>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hello!

I have pppd installed and working fine, clients are windows xp.
They connect to our server and use it as default gateway. This is ok,
I do need them to use this pppd server as default gateway. But in
this case all their connections go through the vpn server (default gw).
There is a number of networks which I want to be routed through their 
ISP default gw. We could solve it through .cmd file but this solution 
seems to be lame. Is it possible to push the routes via ppp. I've heard
that MS ISA server can do this (AFAIK via DHCP). I've googled a lot but
found nothing yet. Please help.
		Vladi Lemuroff.

