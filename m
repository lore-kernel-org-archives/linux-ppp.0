From: tony.chamberlain@lemko.com
Date: Wed, 12 Jan 2011 00:20:41 +0000
Subject: ppp / open vpn
Message-Id: <W90767349010091294791641@webmail30>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

For our customers I have to set up an openvpn server and client.
Our cell software creates Linux tunnels (e.g. tun0, tun1) when a cell
phone wants to do a data session.  Subsequently on startup our software
kills all the tunnels.  Unfortunately, it then kills the VPN client (this
on the client side).

So to get around this, a person at work changed in the ovpn file
dev tun0  to  dev ppp0 so it would not get killed.  As far as I understand
though, openvpn is not ppp.  I am wondering whether this will cause any
problems in CentOS, calling a tunnel ppp?

On a related note they want me to write something called "reroute" which
has a parameter (-V or -E) which will reroute all traffic, except 
192.168.5.10, either via VPN or via ETHERNET.  192.168.5.10 will always
go through VPN so I gave it its own route.  Basically what it does:

Through VPN:

0.0.0.0         0.0.0.0         128.0.0.0       U     0      0        0 ppp0
128.0.0.0       0.0.0.0         128.0.0.0       U     0      0        0 ppp0
0.0.0.0         192.168.5.1     0.0.0.0         UG    0      0        0 eth0

Through eth0 just
0.0.0.0         192.168.5.1     0.0.0.0         UG    0      0        0 eth0

I could remove the 0.0.0.0 with netmask 0.0.0.0 when routing through the
VPN but I don't want to forget what the original router (192.168.5.1) is.

So a question is, what has precedence, 0.0.0.0 with netmask 0.0.0.0 or
0.0.0.0 and 128.0.0.0 with a netmask of 128.0.0.0?  They bothe appear to
cover every address (not specifically specified in a previous route which I did not show).

For completion, here is the full set of routes:
10.6.1.50       192.168.5.15    255.255.255.255 UGH   0      0        0 eth0
192.168.5.10    0.0.0.0         255.255.255.255 UH    0      0        0 ppp0
192.168.5.0     0.0.0.0         255.255.255.0   U     0      0        0 eth0
10.4.55.0       0.0.0.0         255.255.255.0   U     0      0        0 eth0
169.254.0.0     0.0.0.0         255.255.0.0     U     0      0        0 eth0
10.0.0.0        192.168.5.15    255.0.0.0       UG    0      0        0 eth0
0.0.0.0         0.0.0.0         128.0.0.0       U     0      0        0 ppp0
128.0.0.0       0.0.0.0         128.0.0.0       U     0      0        0 ppp0
0.0.0.0         192.168.5.1     0.0.0.0         UG    0      0        0 eth0

ppp0      Link encap:UNSPEC  HWaddr 00-00-00-00-00-00-00-00-00-00-00-00-00-00-00-00
          inet addr:10.1.0.6  P-t-P:10.1.0.6  Mask:255.0.0.0
          UP POINTOPOINT RUNNING NOARP MULTICAST  MTU:1500  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:100
          RX bytes:0 (0.0 b)  TX bytes:0 (0.0 b)

we need the ip address 10.0.1.6
10.4.55.X should definitely be eth0





