From: Jochen Hayek <Jochen+gmane.linux.ppp@Hayek.name>
Date: Tue, 01 Jul 2008 17:41:21 +0000
Subject: pppd and IP forwarding
Message-Id: <loom.20080701T172354-415@post.gmane.org>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Dear all,

I run pppd (version 2.4.3) on a Linux with some 2.6.16 kernel (machine J).

I connect to the Internet via an UMTS modem,
and that works fine.

There is another Linux with some 2.6.21 kernel (machine R).

J and R are connected via ethernet,
and the TCP/IP and all that between them works fine, too.

I want to let R enjoy J's connection to the outside world.

I read pppd's man page.
It talks about "proxarp" and "ktune".
Alright, I added those options,
and I also did a "echo 1 > /proc/sys/net/ip4/ip_forward"
before starting pppd again.

(I made R's /etc/resolv.conf to include appropriate nameserver lines.
Maybe I would dare to do a ping to a name instead of an IP address later on.)

I tried to ping on R to an IP address outside
and it looks on J's gkrell (a system monitor),
as if there were some traffic on ppp0,
but there is no visible response to R,
at least no feedback on R.
Other connections attempted in a firefox on R also do not succeed.

I also removed proxyarp from the pppd options,
that made no difference to me.

Anybody any idea?

Any help appreciated.

Thanks in advance!

J.


