From: "Guihong Xu" <ghxu@utstar.com>
Date: Mon, 13 Dec 2004 19:54:13 +0000
Subject: Both local and peer are using the same IP on ppp0
Message-Id: <ECECKNPHLONFDECFPGONKEKCCCAA.ghxu@utstar.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi,

This is my first time to post an email in a mail list. Hope I don't break
any rules.

We have an embedded system running PPP between two control modules. One
module is in active mode and serves as ppp server. The other one is standby
and is getting IP address from ppp server.

The command used to start ppp in server mode is:

   /usr/sbin/pppd 192.168.200.1:192.168.200.2 silent /dev/tts/T0

The command used to start ppp in client mode in standby module is:

   /usr/sbin/pppd noipdefault /dev/tts/T0


Most of the time, ppp works fine after standby reboots. But occasionally ppp
link cannot come up in standby system after it reboots. By this time we have
following in active system:

-----------
bash-2.05#

bash-2.05#
bash-2.05# ifconfig ppp0
ppp0      Link encap:Point-to-Point Protocol
          inet addr:192.168.200.2  P-t-P:192.168.200.2  Mask:255.255.255.255
          UP POINTOPOINT RUNNING NOARP MULTICAST  MTU:1500  Metric:1
          RX packets:4340 errors:0 dropped:0 overruns:0 frame:0
          TX packets:4433 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:3

bash-2.05#
bash-2.05#

------------

Please note that local inet addr should be 192.168.200.1.


The syslog message:

Dec  8 17:51:26 (none) pppd[307]: pppd 2.4.2b3 started by root, uid 0
Dec  8 17:51:26 (none) pppd[307]: Using interface ppp0
Using interface ppp0
Dec  8 17:51:26 (none) pppd[307]: Connect: ppp0 <--> /dev/tts/T0
Connect: ppp0 <--> /dev/tts/T0
Dec  8 17:51:27 (none) pppd[307]: local  IP address 192.168.200.1
Dec  8 17:51:27 (none) pppd[307]: remote IP address 192.168.200.2
Script /etc/ppp/ip-up started (pid 313)
Script /etc/ppp/ip-up finished (pid 313), status = 0x0


Also, please note that ip-down script has never been invoked.

The link kernel we are using is timesys 2.4.7.

Does anybody know how pppd enters this state or a fix has been in latest
release?

Thanks in advance.

-guihong


