From: "cyx_mail" <cyx_mail@foxmail.com>
Date: Fri, 27 Jun 2008 05:33:26 +0000
Subject: can pppoe-server supports multicasting?
Message-Id: <200806271333256098666@foxmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

HI,all!

Can pppoe-server supports multicasting with multicast routing daemon such as pimd, igmpproxy?

I got a demo board ,which can access the media muticastiong server from WAN interface "eth0". pppoe-server runs from the cmd line "pppoe-server -k -I eth1 -L 192.168.1.1 -R 192.168.1.2 -N 12 ", "eth1" is the LAN interface of this demo board.
Windows XP dials to this demo board. the ppp interface is ppp0 in demo board. Then I run igmpproxy with the configuration file:

quickleave
phyint eth0 upstream  ratelimit 0
phyint ppp0 downstream  ratelimit 0
 
But VLC media player can't play the media source.Why?

2008-06-27 



