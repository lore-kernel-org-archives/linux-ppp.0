From: "JC Janos" <jcjanos245@gmail.com>
Date: Sat, 15 Nov 2008 02:43:05 +0000
Subject: pppoe config connects, but can't ping *past* gateway. something wrong with my routes?
Message-Id: <7259d7020811141843i44d31119u999b70ccd717c61e@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi,

I'm setting up my 1st linux router/firewall for my office. I'm
connecting to the net via ATT DSL using PPPoE.  It's connected, but
something's wrong with my config (routing?) as I can't seem to ping
past my gateway.

I'm running a headless Opensuse 11.0 box,

uname -a
  Linux router 2.6.25.18-0.2-default #1 SMP 2008-10-21 16:30:26 +0200
i686 i686 i386 GNU/Linux

pppd --version
	pppd version 2.4.4

ATT have allocated a Static block x.x.x.144/29 to me.

From the info I've been able to find online, I've set up ppp config as follows,

/etc/ppp/peers/att
	plugin /usr/lib/pppd/2.4.4/rp-pppoe.so
	eth0
	user "username@att.net"

/etc/ppp/pap-secrets
	"username@att.net" *  "password" *

/etc/ppp/options
	debug
	ktune
	logfile  /var/log/ppp.log
	
	noauth
	hide-password
	noipdefault
	persist
	holdoff 30
	
	noaccomp
	nobsdcomp
	noccp
	nodeflate
	nopcomp
	novj
	novjccomp
	lcp-max-configure 10
	lcp-max-failure   10
	lcp-max-terminate  3
	lcp-restart        3
	
	default-asyncmap


/etc/ppp/ip-up.local
	echo /sbin/ip route list | awk '/^default / { print $3 }' > /etc/default-route
	/sbin/route del default
	/sbin/route add default netmask 255.255.255.248 gw x.x.x.150
	
	
	/sbin/ip addr add x.x.x.145 dev $1 label $1:1
	/sbin/ip addr add x.x.x.146 dev $1 label $1:2
	/sbin/ip addr add x.x.x.147 dev $1 label $1:3
	/sbin/ip addr add x.x.x.148 dev $1 label $1:4
	/sbin/ip addr add x.x.x.149 dev $1 label $1:5
	/sbin/route add -net x.x.x.145 netmask 255.255.255.255 dev $1:1 gw x.x.x.150
	/sbin/route add -net x.x.x.146 netmask 255.255.255.255 dev $1:2 gw x.x.x.150
	/sbin/route add -net x.x.x.147 netmask 255.255.255.255 dev $1:3 gw x.x.x.150
	/sbin/route add -net x.x.x.148 netmask 255.255.255.255 dev $1:4 gw x.x.x.150
	/sbin/route add -net x.x.x.149 netmask 255.255.255.255 dev $1:5 gw x.x.x.150


/etc/ppp/ip-down.local
	/sbin/route del -net x.x.x.145
	/sbin/route del -net x.x.x.146
	/sbin/route del -net x.x.x.147
	/sbin/route del -net x.x.x.148
	/sbin/route del -net x.x.x.149
	/sbin/ip addr del x.x.x.145 dev $1 label $1:1
	/sbin/ip addr del x.x.x.146 dev $1 label $1:2
	/sbin/ip addr del x.x.x.147 dev $1 label $1:3
	/sbin/ip addr del x.x.x.148 dev $1 label $1:4
	/sbin/ip addr del x.x.x.149 dev $1 label $1:5
	
	/sbin/route del default
	/sbin/route add default gw `cat /etc/default-route`
	
	rm /var/run/ppp0.pid
	rm /var/run/pppd2.tdb
	rm /var/run/ppp-ppp0.pid

When I launch the connection, it authenticates and connects,

	pppd call att

	...
	Plugin /usr/lib64/pppd/2.4.4/rp-pppoe.so loaded.
	RP-PPPoE plugin version 3.3 compiled against pppd 2.4.4
	using channel 9
	Using interface ppp0
	Connect: ppp0 <--> eth0
	sent [LCP ConfReq id=0x1 <mru 1492> <magic 0x8f0a4f8>]
	rcvd [LCP ConfReq id=0xf8 <mru 1492> <auth pap> <magic 0x3e333e58>]
	sent [LCP ConfAck id=0xf8 <mru 1492> <auth pap> <magic 0x3e333e58>]
	rcvd [LCP ConfAck id=0x1 <mru 1492> <magic 0x8f0a4f8>]
	sent [PAP AuthReq id=0x1 user="username@att.net" password=<hidden>]
	rcvd [PAP AuthAck id=0x1 ""]
	PAP authentication succeeded
	peer from calling number 00:30:88:20:59:3C authorized
	sent [IPCP ConfReq id=0x1 <addr 0.0.0.0>]
	rcvd [IPCP ConfReq id=0x95 <addr 99.164.169.50>]
	sent [IPCP ConfAck id=0x95 <addr 99.164.169.50>]
	rcvd [IPCP ConfNak id=0x1 <addr x.x.x.150>]
	sent [IPCP ConfReq id=0x2 <addr x.x.x.150>]
	rcvd [IPCP ConfAck id=0x2 <addr x.x.x.150>]
	local  IP address x.x.x.150
	remote IP address 99.164.169.50
	Script /etc/ppp/ip-up started (pid 3118)
	Script /etc/ppp/ip-up finished (pid 3118), status = 0x0


Checking with Ping, I can

ping to my self,

	ping -c 1 x.x.x.150
		PING x.x.x.150 (x.x.x.150) 56(84) bytes of data.
		64 bytes from x.x.x.150: icmp_seq=1 ttld time=0.027 ms

and to my gateway,

	ping -c 1 99.164.169.50
		PING 99.164.169.50 (99.164.169.50) 56(84) bytes of data.
		64 bytes from 99.164.169.50: icmp_seq=1 ttl%5 time.9 ms

but can NOT get anywhere past that,
# TO EXT DNS
	ping -c 1 192.150.18.101
		connect: Network is unreachable

I'm guessing that I've gotten something wrong in the routing.  Here
the current table,

netstat -r
	Kernel IP routing table
	Destination     Gateway         Genmask         Flags   MSS Window  irtt Iface
	99.164.169.50   *               255.255.255.255 UH        0 0          0 ppp0
	x.x.x.145       x.x.x.150       255.255.255.255 UGH       0 0          0 ppp0
	x.x.x.146       x.x.x.150       255.255.255.255 UGH       0 0          0 ppp0
	x.x.x.147       x.x.x.150       255.255.255.255 UGH       0 0          0 ppp0
	x.x.x.148       x.x.x.150       255.255.255.255 UGH       0 0          0 ppp0
	x.x.x.149       x.x.x.150       255.255.255.255 UGH       0 0          0 ppp0
	default         x.x.x.150       255.255.255.248 UG        0 0          0 ppp0
	loopback        *               255.0.0.0       U         0 0          0 lo

Any idea as to what's missing/wrong with my config that's preventing
ping/access past the gateway?


--JC
