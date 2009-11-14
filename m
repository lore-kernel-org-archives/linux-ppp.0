From: David Miller <davem@davemloft.net>
Date: Sat, 14 Nov 2009 03:46:50 +0000
Subject: Re: [PATCH] ppp: fix BUG on non-linear SKB (multilink receive)
Message-Id: <20091113.194650.214404898.davem@davemloft.net>
List-Id: <linux-ppp.vger.kernel.org>
References: <Pine.LNX.4.58.0911121144380.25398@benxen>
In-Reply-To: <Pine.LNX.4.58.0911121144380.25398@benxen>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ben@netservers.co.uk
Cc: paulus@samba.org, netdev@vger.kernel.org, linux-ppp@vger.kernel.org

From: Ben McKeegan <ben@netservers.co.uk>
Date: Thu, 12 Nov 2009 13:09:57 +0000 (GMT)

> @@ -1944,7 +1944,13 @@ ppp_receive_mp_frame(struct ppp *ppp, st
> 
>  	/* Pull completed packets off the queue and receive them. */
>  	while ((skb = ppp_mp_reconstruct(ppp)))
> -		ppp_receive_nonmp_frame(ppp, skb);
> +	  	if (pskb_may_pull(skb, 2))
> +			ppp_receive_nonmp_frame(ppp, skb);
> +		else {
> +			++ppp->dev->stats.rx_length_errors;
> +			kfree_skb(skb);
> +			ppp_receive_error(ppp);
> +		}
> 
>  	return;

This fix looks correct, but could you please enclose the while()
loop in braces, that dangling else and the subsequent "return;"
statement look confusing otherwise.

Thanks.
