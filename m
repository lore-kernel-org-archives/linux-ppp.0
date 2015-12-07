From: Yan Seiner <yan@seiner.com>
Date: Mon, 07 Dec 2015 17:35:13 +0000
Subject: MTU strategies
Message-Id: <5665C351.3020500@seiner.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

I have a question on MTU size strategies.

I have a router that terminates a VPN.  The router connects via ppp to 
my ISP.  I have a physical interface, with a virtual interface for 
pppoe, and a tun interface for the VPN that runs over the pppoe interface.

The physical interface (eth0) has a MTU of 1500.

The pppoe interface has an MTU of 1492.

The vpn interface has an MTU of 1452, a figure I picked somewhat 
arbitrarily, assuming a 40 byte overhead for the vpn.

My question is then for the other interfaces on the router that face the 
LAN and the DMZ.  Should these be set to 1492 or 1500?

And my other question is for the DHCP clients.  Should they be set to 
1492 (and the one host that uses the VPN should be set to 1452)?

root@AP1:~# ifconfig eth0
eth0      Link encap:Ethernet  HWaddr 00:0D:B9:35:C2:0C
           inet6 addr: fe80::20d:b9ff:fe35:c20c/64 Scope:Link
           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
           RX packets:184584 errors:0 dropped:0 overruns:0 frame:0
           TX packets:117581 errors:0 dropped:0 overruns:0 carrier:0
           collisions:0 txqueuelen:1000
           RX bytes:208509762 (198.8 MiB)  TX bytes:16719097 (15.9 MiB)

root@AP1:~# ifconfig pppoe-wan
pppoe-wan Link encap:Point-to-Point Protocol
           inet addr:198.251.62.82  P-t-P:198.251.52.2 Mask:255.255.255.255
           UP POINTOPOINT RUNNING NOARP MULTICAST  MTU:1492  Metric:1
           RX packets:182822 errors:0 dropped:0 overruns:0 frame:0
           TX packets:114465 errors:0 dropped:0 overruns:0 carrier:0
           collisions:0 txqueuelen:3
           RX bytes:204567089 (195.0 MiB)  TX bytes:14019020 (13.3 MiB)

root@AP1:~# ifconfig tun0
tun0      Link encap:UNSPEC  HWaddr 
00-00-00-00-00-00-00-00-00-00-00-00-00-00-00-00
           inet addr:10.117.1.6  P-t-P:10.117.1.5 Mask:255.255.255.255
           UP POINTOPOINT RUNNING NOARP MULTICAST  MTU:1452  Metric:1
           RX packets:289 errors:0 dropped:0 overruns:0 frame:0
           TX packets:407 errors:0 dropped:0 overruns:0 carrier:0
           collisions:0 txqueuelen:100
           RX bytes:39746 (38.8 KiB)  TX bytes:76331 (74.5 KiB)

