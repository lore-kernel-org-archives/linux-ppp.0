From: Clifford Kite <kite_linux-ppp@ev1.net>
Date: Fri, 24 Sep 2004 14:06:21 +0000
Subject: Re: pppd 2.4.2  with SMP -- crash --
Message-Id: <Pine.LNX.4.21.0409240830310.1340-100000@corncob.localhost.tld>
List-Id: <linux-ppp.vger.kernel.org>
References: <32820.213.41.172.145.1095773626.squirrel@panel.lost-oasis.net>
In-Reply-To: <32820.213.41.172.145.1095773626.squirrel@panel.lost-oasis.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Fri, 24 Sep 2004, marc ferraton wrote:

|last thing:
|pppd compile error become also with cdrom source slackware, the shell 
|proccess ppp.SlackBuild produce same result
| >>demand.c:53:21: net/bpf.h: No such file or directory
| >>make[1]: *** [demand.o] Error 1
| >>make[1]: Leaving directory `/home/forum/ML370_P17/ppp-2.4.2/pppd'
|How Patrick can build it ?, I have not found bpf.h in others packages

Good question.  A quick look at Slackware 10.0 sources shows that
tcpdump and libpcap are both maintained by the same person.  So the
pppd source must eventually change.  And P.V. didn't change the source
in that regard for Slack 10.0.  My *guess* would be that the newer
tcpdump had not appeared at the time the 10.0 pppd binary was built.

|bash-2.05b$ grep bpf /var/log/packages/*
|/var/log/packages/tcpdump-3.8.3-i486-2:usr/include/pcap-bpf.h

---
Clifford Kite                                 http://ckite.no-ip.net


