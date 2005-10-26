From: Gregory Colpart <gcolpart@evolix.net>
Date: Wed, 26 Oct 2005 19:41:49 +0000
Subject: Error message with persist option
Message-Id: <20051026194149.GA17341@test-scsi>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hello,

I have a i386 Debian 3.1 box with a kernel 2.4.30 and pppd 2.4.3
My DSL connnection is PPPoA with a modem PCI card Bewan ST
(unicorn driver).

When I pon/poff, it works fine. But every 24 hours, my ISP reset
my connection and persist option fails to reactivate it.


See my debug messages :

* End of connection

21:00:03 pppd[29191]: rcvd [LCP TermReq id=0xe7]
21:00:03 pppd[29191]: LCP terminated by peer
21:00:03 pppd[29191]: Connect time 1440.0 minutes.
21:00:03 pppd[29191]: Sent 410466878 bytes, received 450988023
bytes. 
21:00:03 pppd[29191]: Script /etc/ppp/ip-down started (pid 31487) 
21:00:03 pppd[29191]: Script /etc/ppp/ipv6-down started (pid
31488) 
21:00:03 pppd[29191]: Couldn't increase MTU to 1500. Using 1492
21:00:03 pppd[29191]: Couldn't increase MRU to 1500. Using 1492
21:00:03 pppd[29191]: sent [LCP TermAck id=0xe7]
21:00:03 pppd[29191]: Script /etc/ppp/ipv6-down finished (pid
31488), status = 0x0
21:00:03 pppd[29191]: Script /etc/ppp/ip-down finished (pid
31487), status = 0x0
21:00:06 pppd[29191]: Connection terminated.
21:00:06 pppd[29191]: Connect time 1440.0 minutes.
21:00:06 pppd[29191]: Sent 410466878 bytes, received 450988023
bytes. 
21:00:06 pppd[29191]: using channel 933
21:00:06 pppd[29191]: Using interface ppp0
21:00:06 pppd[29191]: Connect: ppp0 <--> 8.35
21:00:06 pppd[29191]: Couldn't increase MTU to 1500. Using 1492
21:00:06 pppd[29191]: Couldn't increase MRU to 1500. Using 1492
21:00:07 pppd[29191]: sent [LCP ConfReq id=0x4 <mru 1492> <magic
0x465bebe1>]
21:00:07 pppd[29191]: Modem hangup 

* try to reconnect with persist option

21:00:17 pppd[29191]: using channel 934
21:00:17 pppd[29191]: in make_ppp_unit, already had /dev/ppp
open?
21:00:17 pppd[29191]: Using interface ppp0
21:00:17 pppd[29191]: Connect: ppp0 <--> 8.35
21:00:17 pppd[29191]: Couldn't increase MTU to 1500. Using 1492
21:00:17 pppd[29191]: Couldn't increase MRU to 1500. Using 1492
21:00:17 pppd[29191]: sent [LCP ConfReq id=0x5 <mru 1492> <magic
0x252c61a9>]
21:00:44 last message repeated 9 times
21:00:47 pppd[29191]: LCP: timeout sending Config-Requests
21:00:47 pppd[29191]: Connection terminated.
21:00:47 pppd[29191]: Modem hangup 

* another chance

21:00:47 pppd[29191]: using channel 935
21:00:47 pppd[29191]: Using interface ppp0
21:00:47 pppd[29191]: Connect: ppp0 <--> 8.35
21:00:47 pppd[29191]: Couldn't increase MTU to 1500. Using 1492
21:00:47 pppd[29191]: Couldn't increase MRU to 1500. Using 1492
21:00:47 pppd[29191]: sent [LCP ConfReq id=0x6 <mru 1492> <magic
0xf00f7f8c>]
21:00:47 pppd[29191]: Connection terminated.
21:00:47 pppd[29191]: sent [LCP TermReq id=0x7]
21:00:47 pppd[29191]: write: Bad file descriptor (9)
21:00:50 pppd[29191]: sent [LCP TermReq id=0x8]
21:00:50 pppd[29191]: write: Bad file descriptor (9)
21:00:53 pppd[29191]: Connection terminated.
21:00:53 pppd[29191]: sent [LCP ConfReq id=0x9 <mru 1492> <magic
0x9c6381e4>]
21:00:53 pppd[29191]: write: Bad file descriptor (9)
21:00:53 pppd[29191]: sent [LCP TermReq id=0xa]
21:00:53 pppd[29191]: write: Bad file descriptor (9)
21:00:56 pppd[29191]: sent [LCP TermReq id=0xb]
21:00:56 pppd[29191]: write: Bad file descriptor (9)
21:00:59 pppd[29191]: Connection terminated.
21:00:59 pppd[29191]: Modem hangup 

* another chance

21:00:59 pppd[29191]: using channel 936

[infinite loop]



If I "poff & pon", all is right !
My temporary solution is a crontab script with "poff & pon" :-P

I found some similar bug in mailing-list archives but no real
solution. I am going to see PPP sources : perhaps file descriptor
ppp_dev_fd seems not to be reset to -1 in make_ppp_unit() when my
ISP reset his connection every 24 hours...

All ideas are welcome !



My PPP(oA) configuration is classic.

file /etc/ppp/peers/dsl-provider :

***
# ISP login
user "foo@bar"

# Load the PPPoA plugin
plugin /usr/lib/pppd/2.4.3/pppoatm.so

# VP.VC pair used by your ISP
8.35

# perhaps a bug with PMTU IPv6
mtu 1492
mru 1492
***


file /etc/ppp/options :

***
lock
noipdefault
noauth
hide-password
lcp-echo-interval 20
lcp-echo-failure 3
persist
holdoff 10
debug
ipv6 ,
***


My lspci message for PCI card :

0000:00:0e.0 ATM network controller: STMicroelectronics ST70137
[Unicorn] ADSL DMT Transceiver (rev 10)



Thanks,
--
Gregory Colpart <reg@evolix.fr>  GnuPG:1024D/C1027A0E
Evolix - Informatique et Logiciels Libres http://www.evolix.fr

