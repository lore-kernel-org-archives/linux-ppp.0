From: Clifford Kite <kite_linux-ppp@ev1.net>
Date: Fri, 24 Sep 2004 00:51:02 +0000
Subject: Re: pppd 2.4.2  with SMP -- crash --
Message-Id: <Pine.LNX.4.21.0409231935420.899-100000@corncob.localhost.tld>
List-Id: <linux-ppp.vger.kernel.org>
References: <32820.213.41.172.145.1095773626.squirrel@panel.lost-oasis.net>
In-Reply-To: <32820.213.41.172.145.1095773626.squirrel@panel.lost-oasis.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Thu, 23 Sep 2004, Clifford Kite wrote:
|On Fri, 24 Sep 2004, marc ferraton wrote:
||Is whis ?
||in slack 10.0 /usr/include/pcap-bpf.h
|
|That appears to be a newer version of bpf.h in the Slackware 9.1 tcpdump
|package I have installed.  I don't know why the name changed but it breaks
|the compile.  A workaround might be to symlink it to bpf.h:
|
|cd /usr/include/net
|ln -sf pcap-bpf.h bpf.h

Aaggrhh!  I failed to use the directory to which pcap-bpf.h belongs,
which is different from that for bpf.h .  The symlink should, of
course, be

ln -sf /usr/include/pcap-bpf.h bpf.h

---
Clifford Kite                                 http://ckite.no-ip.net

