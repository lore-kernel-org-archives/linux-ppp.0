From: jfj <jfj@freemail.gr>
Date: Mon, 18 Sep 2006 15:31:26 +0000
Subject: pppd security
Message-Id: <450EBBCE.5030204@freemail.gr>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi.

I don't know much about pppd so this may be completely
wrong.

Suppose this setup:

I have a custom kernel which "secures" sockets. That is,
any program that will try to use a socket without "unlocking"
it first, will get some ERROR. This way, only trusted
programs will be able to use sockets and connect to the
net.

So, sockets are secured at the TCP/IP layers.

My question now is, if it is possible to attack this by
sending data directly to the PPP layer. Can one open
/dev/ppp, construct a UDP packet, encapsulate this into
a PPP packet, write it to some /dev/ppp device and reach
some internet host?

Thanks,

jerald

