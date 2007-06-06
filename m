From: Jerald Fitzjerald <jfj@freemail.gr>
Date: Wed, 06 Jun 2007 08:52:19 +0000
Subject: Help with PPPoE
Message-Id: <466675C3.5060907@freemail.gr>
List-Id: <linux-ppp.vger.kernel.org>
References: <4593E72B.30603@freemail.gr>
In-Reply-To: <4593E72B.30603@freemail.gr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi.

I'm trying to setup a PPPoE in a Linux-From-Scratch system based on an old SuSE.
Things seem to work, but although i use the options `usepeerdns`
and `defaultroute`, pppd does not update the routing table nor
the resolv.conf.

By looking at resolv.conf it sais:

	# Modified_by:  dhcpcd
	search lan
	nameserver 10.0.0.138

and the fact that the routing table is:

	Kernel IP routing table
	Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
	62.103.129.27   *               255.255.255.255 UH    0      0        0 ppp0
	10.0.0.0        *               255.255.255.0   U     0      0        0 eth0
	link-local      *               255.255.0.0     U     0      0        0 eth0
	loopback        *               255.0.0.0       U     0      0        0 lo
	default         10.0.0.138      0.0.0.0         UG    0      0        0 eth0

I have to suppose that somebody else has setup eth0 to be the default
gateway (maybe it's the distribution's LFS was built upon, ip-up scripts).
ifconfig is:

	eth0      Link encap:Ethernet  HWaddr 00:90:F5:47:77:3B  
	          inet addr:10.0.0.1  Bcast:10.0.0.255  Mask:255.255.255.0
        	  UP BROADCAST NOTRAILERS RUNNING MULTICAST  MTU:1500  Metric:1
	          RX packets:55 errors:0 dropped:0 overruns:0 frame:0
        	  TX packets:52 errors:0 dropped:0 overruns:0 carrier:0
	          collisions:0 txqueuelen:1000 
	          RX bytes:3926 (3.8 Kb)  TX bytes:3439 (3.3 Kb)
        	  Interrupt:17 Base address:0x2000 

	lo        Link encap:Local Loopback  
        	  inet addr:127.0.0.1  Mask:255.0.0.0
	          UP LOOPBACK RUNNING  MTU:16436  Metric:1
        	  RX packets:0 errors:0 dropped:0 overruns:0 frame:0
	          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
        	  collisions:0 txqueuelen:0 
	          RX bytes:0 (0.0 b)  TX bytes:0 (0.0 b)

	ppp0      Link encap:Point-to-Point Protocol  
        	  inet addr:87.203.57.58  P-t-P:62.103.129.27  Mask:255.255.255.255
	          UP POINTOPOINT RUNNING NOARP MULTICAST  MTU:1492  Metric:1
        	  RX packets:8 errors:0 dropped:0 overruns:0 frame:0
	          TX packets:3 errors:0 dropped:0 overruns:0 carrier:0
        	  collisions:0 txqueuelen:3 
	          RX bytes:290 (290.0 b)  TX bytes:54 (54.0 b)

So I kill pppd and say:

	route del default

and re-run pppd:
This time I have the routing table:

	Kernel IP routing table
	Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
	62.103.129.27   *               255.255.255.255 UH    0      0        0 ppp0
	10.0.0.0        *               255.255.255.0   U     0      0        0 eth0
	link-local      *               255.255.0.0     U     0      0        0 eth0
	loopback        *               255.0.0.0       U     0      0        0 lo
	default         *               0.0.0.0         U     0      0        0 ppp0

But unfortunately, the network is unreachable.  I try to connect
to hosts by IP address, but I'm not getting any packets.

Finally the messages of pppd with `debug` (before removing the default route):

	Plugin rp-pppoe.so loaded.
	RP-PPPoE plugin version 3.3 compiled against pppd 2.4.4
	using channel 2
	Using interface ppp0
	Connect: ppp0 <--> eth0
	sent [LCP ConfReq id=0x1 <mru 1492> <magic 0x318827ee>]
	rcvd [LCP ConfReq id=0x5 <mru 1492> <auth pap> <magic 0x2f5b3234>]
	sent [LCP ConfAck id=0x5 <mru 1492> <auth pap> <magic 0x2f5b3234>]
	rcvd [LCP ConfAck id=0x1 <mru 1492> <magic 0x318827ee>]
	sent [LCP EchoReq id=0x0 magic=0x318827ee]
	sent [PAP AuthReq id=0x1 user="xxxxxxxxxxxxxxxx" password=<hidden>]
	rcvd [LCP EchoRep id=0x0 magic=0x2f5b3234]
	rcvd [LCP ConfReq id=0x1 <auth pap> <magic 0x62218e35>]
	sent [LCP ConfReq id=0x2 <mru 1492> <magic 0xe636f07e>]
	sent [LCP ConfAck id=0x1 <auth pap> <magic 0x62218e35>]
	rcvd [LCP ConfNak id=0x2 <mru 1500>]
	sent [LCP ConfReq id=0x3 <magic 0xe636f07e>]
	rcvd [LCP ConfAck id=0x3 <magic 0xe636f07e>]
	sent [LCP EchoReq id=0x0 magic=0xe636f07e]
	sent [PAP AuthReq id=0x2 user="xxxxxxxxxxxxxxxx" password=<hidden>]
	rcvd [LCP EchoRep id=0x0 magic=0x62218e35]
	rcvd [PAP AuthAck id=0x2 ""]
	PAP authentication succeeded
	peer from calling number 00:90:1A:41:64:F5 authorized
	kernel does not support PPP filtering
	sent [IPCP ConfReq id=0x1 <addr 0.0.0.0> <ms-dns1 0.0.0.0> <ms-dns3 0.0.0.0>]
	rcvd [IPCP ConfReq id=0x1 <addr 62.103.129.26>]
	sent [IPCP ConfAck id=0x1 <addr 62.103.129.26>]
	rcvd [IPCP ConfNak id=0x1 <addr 85.75.185.8> <ms-dns1 195.170.0.1> <ms-dns3 195.170.2.2>]
	sent [IPCP ConfReq id=0x2 <addr 85.75.185.8> <ms-dns1 195.170.0.1> <ms-dns3 195.170.2.2>]
	rcvd [IPCP ConfAck id=0x2 <addr 85.75.185.8> <ms-dns1 195.170.0.1> <ms-dns3 195.170.2.2>]
	not replacing existing default route via 10.0.0.138
	local  IP address 85.75.185.8
	remote IP address 62.103.129.26
	primary   DNS address 195.170.0.1
	secondary DNS address 195.170.2.2
	Script /etc/ppp/ip-up started (pid 5082)
	Script /etc/ppp/ip-up finished (pid 5082), status = 0x0

My kernel is 2.6.17.13

How can I debug this further?
Any help will be vastly appreciated.

jf.

