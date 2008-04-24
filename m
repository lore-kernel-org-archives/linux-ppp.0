From: David Miller <davem@davemloft.net>
Date: Thu, 24 Apr 2008 01:54:14 +0000
Subject: Re: [PATCH] ppp_generic: use stats from net_device structure
Message-Id: <20080423.185414.200491073.davem@davemloft.net>
List-Id: <linux-ppp.vger.kernel.org>
References: <funllk$30g$1@ger.gmane.org>
In-Reply-To: <funllk$30g$1@ger.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: paulius.zaleckas@teltonika.lt
Cc: netdev@vger.kernel.org, linux-ppp@vger.kernel.org

From: Paulius Zaleckas <paulius.zaleckas@teltonika.lt>
Date: Wed, 23 Apr 2008 18:46:51 +0300

> Use stats which now is in the net_device instead of one declared in
> ppp structure.
> Kill ppp_net_stats function, because by default it is used identical
> internal_stats function from net/core/dev.c
> 
> Signed-of-by: Paulius Zaleckas <paulius.zaleckas@teltonika.lt>

Very nice simplification, patch applied.

Thank you!
