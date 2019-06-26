From: Levente <leventelist@gmail.com>
Date: Wed, 26 Jun 2019 11:30:08 +0000
Subject: IPv6 with pppd
Message-Id: <CACwWb3B6v7ayhoDpE-GAA8qKgbh=EM95eq9hHxHcZtusAaQqcw@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Dear maintainer,


I am struggling with IPv6 over PPP on Linux. The situation is that I
have a 3G modem, when I plug it in to the USB on my Debian box,
everything works as expected, I have IPv6 address from the provider,
and I am happy. But how?

This is the relevant log:

Jun 14 12:37:03 mercury pppd[3282]: Serial connection established.
Jun 14 12:37:03 mercury pppd[3282]: using channel 2
Jun 14 12:37:03 mercury pppd[3282]: Using interface ppp0
Jun 14 12:37:03 mercury pppd[3282]: Connect: ppp0 <--> /dev/ttyUSB3
Jun 14 12:37:04 mercury pppd[3282]: sent [LCP ConfReq id=0x1 <asyncmap
0x0> <magic 0xa2034878> <pcomp> <accomp>]
Jun 14 12:37:04 mercury pppd[3282]: rcvd [LCP ConfReq id=0x3 <asyncmap
0x0> <auth chap MD5> <magic 0xc700eac2> <pcomp> <accomp>]
Jun 14 12:37:04 mercury pppd[3282]: No auth is possible
Jun 14 12:37:04 mercury pppd[3282]: sent [LCP ConfRej id=0x3 <auth chap MD5>]
Jun 14 12:37:04 mercury pppd[3282]: rcvd [LCP ConfAck id=0x1 <asyncmap
0x0> <magic 0xa2034878> <pcomp> <accomp>]
Jun 14 12:37:04 mercury pppd[3282]: rcvd [LCP ConfReq id=0x4 <asyncmap
0x0> <magic 0xc700eac2> <pcomp> <accomp>]
Jun 14 12:37:04 mercury pppd[3282]: sent [LCP ConfAck id=0x4 <asyncmap
0x0> <magic 0xc700eac2> <pcomp> <accomp>]
Jun 14 12:37:04 mercury pppd[3282]: sent [LCP EchoReq id=0x0 magic=0xa2034878]
Jun 14 12:37:04 mercury pppd[3282]: sent [IPCP ConfReq id=0x1 <addr
0.0.0.0> <ms-dns1 0.0.0.0> <ms-dns2 0.0.0.0>]
Jun 14 12:37:04 mercury pppd[3282]: sent [IPV6CP ConfReq id=0x1 <addr
fe80::3d17:0512:2b44:658b>]
Jun 14 12:37:04 mercury pppd[3282]: rcvd [LCP DiscReq id=0x5 magic=0xc700eac2]
Jun 14 12:37:04 mercury pppd[3282]: rcvd [LCP EchoRep id=0x0
magic=0xc700eac2 a2 03 48 78]
Jun 14 12:37:05 mercury pppd[3282]: rcvd [IPV6CP ConfNak id=0x1 <addr
fe80::330e:c05c:0d76:f234>]
Jun 14 12:37:05 mercury pppd[3282]: sent [IPV6CP ConfReq id=0x2]
Jun 14 12:37:06 mercury pppd[3282]: rcvd [IPV6CP ConfNak id=0x1 <addr
fe80::fc17:3ad2:5917:3248>]
Jun 14 12:37:07 mercury pppd[3282]: sent [IPCP ConfReq id=0x1 <addr
0.0.0.0> <ms-dns1 0.0.0.0> <ms-dns2 0.0.0.0>]
Jun 14 12:37:08 mercury pppd[3282]: rcvd [IPV6CP ConfReq id=0x0 <addr
fe80::2c26:30b4:e65c:5b4a>]
Jun 14 12:37:08 mercury pppd[3282]: sent [IPV6CP ConfAck id=0x0 <addr
fe80::2c26:30b4:e65c:5b4a>]
Jun 14 12:37:08 mercury pppd[3282]: rcvd [IPV6CP ConfNak id=0x2 <addr
fe80::303e:582f:ea95:aa10>]
Jun 14 12:37:08 mercury pppd[3282]: sent [IPV6CP ConfReq id=0x3 <addr
fe80::303e:582f:ea95:aa10>]
Jun 14 12:37:08 mercury pppd[3282]: rcvd [IPV6CP ConfAck id=0x3 <addr
fe80::303e:582f:ea95:aa10>]
Jun 14 12:37:08 mercury pppd[3282]: local  LL address fe80::303e:582f:ea95:aa10
Jun 14 12:37:08 mercury pppd[3282]: remote LL address fe80::2c26:30b4:e65c:5b4a
Jun 14 12:37:08 mercury pppd[3282]: Script /etc/ppp/ipv6-up started (pid 3298)
Jun 14 12:37:08 mercury pppd[3282]: Script /etc/ppp/ipv6-up finished
(pid 3298), status = 0x0

After seeing the interface, I have the global scope address like this:

lev@mercury:~$ /sbin/ifconfig ppp0
ppp0: flagsC05<UP,POINTOPOINT,RUNNING,NOARP,MULTICAST>  mtu 1500
        inet6 2a00:1110:135:4594:303e:582f:ea95:aa10  prefixlen 64
scopeid 0x0<global>
        inet6 fe80::303e:582f:ea95:aa10  prefixlen 10  scopeid 0x20<link>
        ppp  txqueuelen 3  (Point-to-Point Protocol)
        RX packets 73  bytes 14234 (13.9 KiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 95  bytes 10012 (9.7 KiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

Please note that in the logs, I can't see that global scope address,
and I don't know how the IPv6CP assigns this address to the interface.
How is this done?

And when I plug the same modem to an OpenWRT box, I don't get the
global scope address, only the link-local address. Is this some PPP
specific problem, or there might be some IPv6 autoconfiguration magic
happening in the background? I don't think so, because that address
corresponds to a statically allocated address of the provider.

lev@mercury:~$ host 2a00:1110:135:4594:303e:582f:ea95:aa10
0.1.a.a.5.9.a.e.f.2.8.5.e.3.0.3.4.9.5.4.5.3.1.0.0.1.1.1.0.0.a.2.ip6.arpa
domain name pointer
2A00111001354594303E582FEA95AA10.mobile.pool.telekom.hu.

Could you help me out what is going on here, and why can't I get a
global scope address on the OpenWRT? I'm sure it is an OpenWRT issue,
but need help tracing it.


Thanks,
Levente
