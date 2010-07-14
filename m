From: Erik L <erik_list@caneris.com>
Date: Wed, 14 Jul 2010 03:42:30 +0000
Subject: Multilink packet loss 2.6.32 - would like to resolve and have
Message-Id: <15659855.171.1279078950097.JavaMail.root@zimbra.caneris.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi all,

Further to some of my posts [1] where applying a patch to undo the default multilink behaviour in 2.6.32 with one turning off fragmentation resolved the packet loss, now we're interested in revisiting this issue and resolving it the "proper" way so that we can have heterogeneous link speeds working. 

Unfortunately this would appear to be a chicken and egg problem: if we use the default behaviour of 2.6.32+, we get the massive packet loss. If we apply the round robin patch [2], we get no heterogeneous link speeds. 

I also tried another patch [3] to the default 2.6.32+ behaviour, but this didn't resolve the problem. There is still some packet loss, though it's a bit better than before.

Would appreciate any ideas...

Thanks
Erik

[1] http://marc.info/?l=linux-ppp&m7445627823484&w=2
[2] http://lkml.org/lkml/2010/3/26/170
[3] http://marc.info/?l=linux-ppp&m7555649304387&w=2
