From: xiaozhao <dragonlinux@gmail.com>
Date: Fri, 08 Jan 2010 03:58:16 +0000
Subject: pppd's mtu setup
Message-Id: <27071075.post@talk.nabble.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


Sorry I copy these from gitweb trunk:
when lcp is up, it will call netif_set_mtu to set stack's ppp interface mtu
with MIN(MIN(mtu, mru), ao->mru), but why it is followed by ppp_send_config
with mtu only?
the 2nd setting could be different with first setting.
I can see sys-linux didn't do anything with 2nd mtu setting so it is
correct, but why there is 2nd setting and with different mtu?

    mtu = ho->neg_mru? ho->mru: PPP_MRU;

1908     mru = go->neg_mru? MAX(wo->mru, go->mru): PPP_MRU;

1909 #ifdef HAVE_MULTILINK

1910     if (!(multilink && go->neg_mrru && ho->neg_mrru))

1911 #endif /* HAVE_MULTILINK */

1912         netif_set_mtu(f->unit, MIN(MIN(mtu, mru), ao->mru));

1913     ppp_send_config(f->unit, mtu,

1914                     (ho->neg_asyncmap? ho->asyncmap: 0xffffffff),

1915                     ho->neg_pcompression, ho->neg_accompression);


thanks,
xiaozhao
-- 
View this message in context: http://old.nabble.com/pppd%27s-mtu-setup-tp27071075p27071075.html
Sent from the linux-ppp mailing list archive at Nabble.com.

