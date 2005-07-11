From: Sasha Shipka <xaotuk@gmail.com>
Date: Mon, 11 Jul 2005 15:17:37 +0000
Subject: frozen ppp
Message-Id: <440a9a95050711081730710cc3@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

I'm trying to use wireless pppoe connection to my ISP from linux.
I'm using rp-pppoe and pppd 2.4.3. Kernel is 2.4.23 with mppe patch
from pptp site.
As I can see they use ms server solution (mschapv2 etc.).
After I connect, ppp if is up and running. I can open smaller web
pages or irc connection. But if I try do download a file or open
bigger web page my connection frozes. When it's frozen my ppp log goes
like this:

ul 11 14:56:02 duat pppd[7741]: rcvd [proto=0xcba5] 69 73 df e1 5f ed
4c cb a0 3f ae 62 eb e6 0b 95 42 3b ef 7f f6 8d ea b3 18 9d c1 6d f9
35 2c 70 ...
Jul 11 14:56:02 duat pppd[7741]: Unsupported protocol 0xcba5 received
Jul 11 14:56:02 duat pppd[7741]: sent [LCP ProtRej id=0x2 cb a5 69 73
df e1 5f ed 4c cb a0 3f ae 62 eb e6 0b 95 42 3b ef 7f f6 8d ea b3 18
9d c1 6d f9 35 ...]
Jul 11 14:56:02 duat pppd[7741]: rcvd [proto=0x2160] 39 46 b0 a7 ca 94
63 3d 4a 70 fb 91 e5 47 49 a2 bd ee 7c 6a c9 3f 4f 34 51 d5 5c 5e 81
1f 0a b4 ...
Jul 11 14:56:02 duat pppd[7741]: Unsupported protocol 0x2160 received
Jul 11 14:56:02 duat pppd[7741]: sent [LCP ProtRej id=0x3 21 60 39 46
b0 a7 ca 94 63 3d 4a 70 fb 91 e5 47 49 a2 bd ee 7c 6a c9 3f 4f 34 51
d5 5c 5e 81 1f ...]
Jul 11 14:56:02 duat pppd[7741]: rcvd [proto=0xa662] 79 1c 0c 79 6f fe
b4 0e 4a 0b e9 81 6a 8f 89 6d 61 29 a2 37 c2 b6 95 f0 cc ba a8 e5 6f
ab fb f1 ...

Pattern is id, which is increased every time.
Things I tried:
* to reduce or increase mtu on ppp interface.
* to add following line to iptables:
iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN -j TCPMSS 
--clamp-mss-to-pmtu
* to disable mru decrease in ccp.c code (I saw that in archives of this list)
* to add nomppe-128 to pppd options

Nothing of those didn't help...
