From: Clifford Kite <kite_linux-ppp@ev1.net>
Date: Thu, 23 Sep 2004 23:28:17 +0000
Subject: Re: pppd 2.4.2  with SMP -- crash --
Message-Id: <Pine.LNX.4.21.0409231812060.485-100000@corncob.localhost.tld>
List-Id: <linux-ppp.vger.kernel.org>
References: <32820.213.41.172.145.1095773626.squirrel@panel.lost-oasis.net>
In-Reply-To: <32820.213.41.172.145.1095773626.squirrel@panel.lost-oasis.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Fri, 24 Sep 2004, marc ferraton wrote:

|Clifford Kite wrote:
|> On Thu, 23 Sep 2004, marc ferraton wrote:
|> 
|> |demand.c:53:21: net/bpf.h: No such file or directory
|> |make[1]: *** [demand.o] Error 1
|> 
|> The file is /usr/include/net/bpf.h here.  It is apparently a libpcap header
|> file and comes with the Slackware tcpdump package - YMMV.
|> 
|> ---
|> Clifford Kite                                 http://ckite.no-ip.net
|> 
|> 
|Hi,
|
|Is whis ?
|in slack 10.0 /usr/include/pcap-bpf.h

That appears to be a newer version of bpf.h in the Slackware 9.1 tcpdump
package I have installed.  I don't know why the name changed but it breaks
the compile.  A workaround might be to symlink it to bpf.h:

cd /usr/include/net
ln -sf pcap-bpf.h bpf.h

Somebody is eventually going to have to change the name, either the
maintainer of Slackware, or pppd, or tcpdump, but I don't know which
one should make the change.  In pppd 2.4.2 pbf.h is present in both
demand.c and sys-linux.c .

---
Clifford Kite                                 http://ckite.no-ip.net

