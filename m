From: =?UTF-8?Q?David_Bala=C5=BEic?= <xerces9@gmail.com>
Date: Wed, 22 Apr 2020 17:45:12 +0000
Subject: PPPoE Modem hangup after random time - how to debug?
Message-Id: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi!

I have a router running openwrt connected to a GPON ONT, running a
PPPoE connection (hw details below).

The problem is, that after some random time one to 20 hours, the
connection breaks. Then in about a minute it reconnects (successfully,
each time).
This happens almost every day.

I enabled the debug option, but there is nothing useful in the logs:

** there is nothing related before this line **
Tue Apr 21 10:04:32 2020 daemon.notice pppd[6515]: Modem hangup
Tue Apr 21 10:04:32 2020 daemon.info pppd[6515]: Connect time 1094.4 minutes.
Tue Apr 21 10:04:32 2020 daemon.info pppd[6515]: Sent 612360704 bytes,
received 3423392867 bytes.
Tue Apr 21 10:04:32 2020 daemon.notice netifd: Network device
'pppoe-wan' link is down
Tue Apr 21 10:04:32 2020 daemon.debug pppd[6515]: Script
/lib/netifd/ppp-down started (pid 7655)
Tue Apr 21 10:04:32 2020 daemon.notice pppd[6515]: Connection terminated.
Tue Apr 21 10:04:32 2020 daemon.debug pppd[6515]: Send PPPOE Discovery
V1T1 PADT session 0x1 length 28
Tue Apr 21 10:04:32 2020 daemon.debug pppd[6515]:  dst
a4:xx:xx:xx:xx:44  src c4:xx:xx:xx:xx:ed
Tue Apr 21 10:04:32 2020 daemon.debug pppd[6515]:  [host-uniq  00 00
19 73] [AC-cookie  ed 89 xx xx xx xx xx xx xx xx xx xx xx xx xx 75]
Tue Apr 21 10:04:32 2020 daemon.info pppd[6515]: Sent PADT
Tue Apr 21 10:04:32 2020 daemon.debug pppd[6515]: Waiting for 1 child
processes...
Tue Apr 21 10:04:32 2020 daemon.debug pppd[6515]:   script
/lib/netifd/ppp-down, pid 7655
Tue Apr 21 10:04:32 2020 daemon.debug pppd[6515]: Script
/lib/netifd/ppp-down finished (pid 7655), status = 0x1
Tue Apr 21 10:04:32 2020 daemon.info pppd[6515]: Exit.


The command line is:

 /usr/sbin/pppd nodetach ipparam wan ifname pppoe-wan
lcp-echo-interval 1 lcp-echo-failure 5 lcp-echo-adaptive +ipv6 set
AUTOIPV6=1 nodefaultroute usepeerdns maxfail 1 user XXXXXX password
YYYYYY ip-up-script /lib/netifd/ppp-up ipv6-up-script
/lib/netifd/ppp6-up ip-down-script /lib/netifd/ppp-down
ipv6-down-script /lib/netifd/ppp-down mtu 1492 mru 1492 plugin
rp-pppoe.so nic-eth1.3902

(the PPPoE goes over VLAN 3902, pppd version is  2.4.7)

I wrote about this on the openwrt forum [1], not much progress unfortunately.

Any ides? How to proceed? Sniff packets?

What does normally prompt pppd to to print "Modem hangup" ?

Thanks in advance,
David

[1] https://forum.openwrt.org/t/pppoe-disconnects-every-few-hours/61239

Setup details:

ONT: Innbox G21 (provided by ISP)
router: Netgear WNDR 3700v2 running OpenWRT 19.7.2
ISP provided router (not in use): Ubee TVW625  - I did not see such
disconnections when using this router (I ran a script calling ping in
a loop, for days, logging output, not problem except a lost (single)
packet every now and then)
