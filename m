From: Clifford Kite <kite_linux-ppp@ev1.net>
Date: Thu, 23 Sep 2004 20:41:09 +0000
Subject: Re: pppd 2.4.2  with SMP -- crash --
Message-Id: <Pine.LNX.4.21.0409231537190.27029-100000@corncob.localhost.tld>
List-Id: <linux-ppp.vger.kernel.org>
References: <32820.213.41.172.145.1095773626.squirrel@panel.lost-oasis.net>
In-Reply-To: <32820.213.41.172.145.1095773626.squirrel@panel.lost-oasis.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Thu, 23 Sep 2004, marc ferraton wrote:

|demand.c:53:21: net/bpf.h: No such file or directory
|make[1]: *** [demand.o] Error 1

The file is /usr/include/net/bpf.h here.  It is apparently a libpcap header
file and comes with the Slackware tcpdump package - YMMV.

---
Clifford Kite                                 http://ckite.no-ip.net

