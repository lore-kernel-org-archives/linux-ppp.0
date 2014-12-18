From: arthurpaulino <arthurpaulino@great.ufc.br>
Date: Thu, 18 Dec 2014 20:49:25 +0000
Subject: PPP compression
Message-Id: <3b4526880d737ed5094d632636e6fef8@great.ufc.br>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hello,

I saw this e-mall address at http://ppp.samba.org/resources.html.
We do have some questions about ppp. About ppp compression, to be more
specific.

We need to decompress the payload of some packets to verify if they are
encrypted on Android devices.

We configured a PPTP VPN server with no encryption. The compression
algorithm negotiated during the connection phase is Deflate.

For instance, in these packets

19:59:09.883213 IP 191.10.97.74 > 200.129.43.196: GREv1, call 1152, seq
106, length 51: compressed PPP data
	0x0000:  4500 0047 cc42 4000 402f 59ab bf0a 614a
	0x0010:  c881 2bc4 3001 880b 0027 0480 0000 006a
	0x0020:  ff03 00fd 005c 02f7 1e3f 8327 ce85 cfc1
	0x0030:  13e8 4b86 80ff 8d1c 6eb0 dee3 7f23 e4de
	0x0040:  e3ef 4258 ef11 00
19:59:09.884437 IP 191.10.97.74 > 200.129.43.196: GREv1, call 1152, seq
107, length 43: compressed PPP data
	0x0000:  4500 003f cc43 4000 402f 59b2 bf0a 614a
	0x0010:  c881 2bc4 3001 880b 001f 0480 0000 006b
	0x0020:  ff03 00fd 005d 026b 5e04 4edd 294b e09a
	0x0030:  5f31 04e8 0547 0ac0 34d7 4fc3 ae19 00
19:59:09.885609 IP 191.10.97.74 > 200.129.43.196: GREv1, call 1152, seq
108, length 44: compressed PPP data
	0x0000:  4500 0040 cc44 4000 402f 59b0 bf0a 614a
	0x0010:  c881 2bc4 3001 880b 0020 0480 0000 006c
	0x0020:  ff03 00fd 005e 026b 3e06 ae27 1c56 c035
	0x0030:  bf66 0858 c168 ab03 d3ac 781a bb66 0000

We figured out that hex FD means that the payload is compressed. Then
comes a coherency counter (fd 005c, fd 005d, fd 005e). And then, the
compressed payload itself.

Is there a way to call the deflate algorithm implemented on the linux
kernel? Are we following the right path? We're trying to avoid
implementing
Deflate from zero.

Thank you
