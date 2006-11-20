From: "Alex Palenschat" <alex@nssmgmt.com>
Date: Mon, 20 Nov 2006 22:16:41 +0000
Subject: Logging problem with 2.4.4
Message-Id: <52F47F7BD5796E418409D951306CEBA5015DDD80@indivisu-gkylsu.indivisuallearning.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hello, I am running ppp 2.4.4 on CentOS 4.4 (RHEL Clone) and have my ppp
configured to use the radius plugin. I have copied the
dictionary.microsoft file from the source tree into my config directory
and included it in my main dictionary file.
This works well, but there are some errors being logged and the primary
problem is that pppd is not logging which user is connecting. This is
only a problem because I track user activity by that. 
Here are some sample logs:

Nov 19 18:53:04 dialin mgetty[4328]: data dev=ttyR0, pidC28,
caller='none', conn='38400', name='', cmd='/usr/local/sbin/pppd',
user='/AutoPPP/'
Nov 19 18:53:04 dialin pppd[4328]: Plugin radius.so loaded.
Nov 19 18:53:04 dialin pppd[4328]: RADIUS plugin initialized.
Nov 19 18:53:04 dialin pppd[4328]: Plugin radattr.so loaded.
Nov 19 18:53:04 dialin pppd[4328]: RADATTR plugin initialized.
Nov 19 18:53:04 dialin pppd[4328]: pppd 2.4.4 started by a_ppp, uid 0
Nov 19 18:53:04 dialin pppd[4328]: Using interface ppp0
Nov 19 18:53:04 dialin pppd[4328]: Connect: ppp0 <--> /dev/ttyR0
Nov 19 18:53:09 dialin pppd[4328]: rc_avpair_gen: received unknown
attribute 25 of length 30:
0x434F0496000001370001C0A8010901C70A4B25DE5060000000000000001A
Nov 19 18:53:10 dialin pppd[4328]: found interface eth0 for proxy arp
Nov 19 18:53:10 dialin pppd[4328]: local  IP address 192.168.1.15
Nov 19 18:53:10 dialin pppd[4328]: remote IP address 192.168.1.219
Nov 19 19:05:24 dialin pppd[4328]: Hangup (SIGHUP)
Nov 19 19:05:24 dialin pppd[4328]: Modem hangup
Nov 19 19:05:24 dialin pppd[4328]: rc_avpair_new: unknown attribute 48
Nov 19 19:05:24 dialin pppd[4328]: rc_avpair_new: unknown attribute 47
Nov 19 19:05:24 dialin pppd[4328]: Connect time 12.3 minutes.
Nov 19 19:05:24 dialin pppd[4328]: Sent 919114 bytes, received 212459
bytes.
Nov 19 19:05:24 dialin pppd[4328]: Connection terminated.
Nov 19 19:05:24 dialin pppd[4328]: Exit.

Any help or pointers would be appreciated,

Alex
