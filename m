From: Clifford Kite <kite_linux-ppp@ev1.net>
Date: Fri, 24 Sep 2004 17:46:31 +0000
Subject: Re: pppd 2.4.2  with SMP -- crash --
Message-Id: <Pine.LNX.4.21.0409241108350.1953-100000@corncob.localhost.tld>
List-Id: <linux-ppp.vger.kernel.org>
References: <32820.213.41.172.145.1095773626.squirrel@panel.lost-oasis.net>
In-Reply-To: <32820.213.41.172.145.1095773626.squirrel@panel.lost-oasis.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Fri, 24 Sep 2004, Gilles Espinasse wrote:

|If this interest you, here is how libpcap-0.8.3 and ppp-2.4.2 are build
|in IPCop
|
|http://cvs.sourceforge.net/viewcvs.py/ipcop/ipcop/lfs/libpcap?rev=1.5.2.3&view=markup
|http://cvs.sourceforge.net/viewcvs.py/ipcop/ipcop/lfs/ppp?rev=1.20.2.3&view=markup

Yes, the second link above contains

cd $(DIR_APP)/pppd && sed -i -e 's/#include <net\/bpf.h>/#include <pcap.h>/' sys-linux.c
cd $(DIR_APP)/pppd && sed -i -e 's/#include <net\/bpf.h>/#include <pcap.h>/' demand.c

which, in essence, is a patch modifying the pppd source to change the name
and location of the new libpcap bandpass filter header file.

---
Clifford Kite                                 http://ckite.no-ip.net

