From: David Miller <davem@davemloft.net>
Date: Sun, 02 Aug 2009 19:27:59 +0000
Subject: Re: [PATCH] ppp: fix lost fragments in ppp_mp_explode()
Message-Id: <20090802.122759.19460185.davem@davemloft.net>
List-Id: <linux-ppp.vger.kernel.org>
References: <4A6EFEB4.2000500@netservers.co.uk>
In-Reply-To: <4A6EFEB4.2000500@netservers.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ben@netservers.co.uk
Cc: paulus@samba.org, gabriele.paoloni@intel.com, netdev@vger.kernel.org, linux-ppp@vger.kernel.org

From: Ben McKeegan <ben@netservers.co.uk>
Date: Tue, 28 Jul 2009 14:35:48 +0100

> 
> This patch fixes the corner cases where the sum of MTU of the free
> channels (adjusted for fragmentation overheads) is less than the MTU
> of PPP link.

Applied, thanks.

