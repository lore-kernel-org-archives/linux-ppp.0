From: Knut Petersen <Knut_Petersen@t-online.de>
Date: Tue, 08 Feb 2011 07:51:22 +0000
Subject: Re: [BUG] 2.6.38-rc2: Circular Locking Dependency
Message-Id: <4D50F5FA.7050202@t-online.de>
List-Id: <linux-ppp.vger.kernel.org>
References: <4D3D45A3.7040809@t-online.de> <20110206.232856.246531984.davem@davemloft.net> <20110207102950.GA17044@brick.ozlabs.ibm.com> <20110207104315.GB17044@brick.ozlabs.ibm.com>
In-Reply-To: <20110207104315.GB17044@brick.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paul Mackerras <paulus@samba.org>
Cc: David Miller <davem@davemloft.net>, linux-kernel@vger.kernel.org, mostrows@earthlink.net, linux-ppp@vger.kernel.org, xiaosuo@gmail.com, eric.dumazet@gmail.com

Hi everybody!

I bisected the problem with the following result:

aa9421041128abb4d269ee1dc502ff65fb3b7d69 is the first bad commit
commit aa9421041128abb4d269ee1dc502ff65fb3b7d69
Author: Changli Gao <xiaosuo@gmail.com>
Date:   Sat Dec 4 02:31:41 2010 +0000

    net: init ingress queue

    The dev field of ingress queue is forgot to initialized, then NULL
    pointer dereference happens in qdisc_alloc().

    Move inits of tx queues to netif_alloc_netdev_queues().

    Signed-off-by: Changli Gao <xiaosuo@gmail.com>
    Acked-by: Eric Dumazet <eric.dumazet@gmail.com>
    Signed-off-by: David S. Miller <davem@davemloft.net>

:040000 040000 dcbb6ab41c4308cba1bc6823d200dcf92aa402d8
b5e190ec681d26ffe62d1d0214c4ef77b8034189 M      net

cu,
 Knut
