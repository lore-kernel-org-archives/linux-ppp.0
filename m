From: David Miller <davem@davemloft.net>
Date: Mon, 14 Jul 2014 21:36:24 +0000
Subject: Re: [PATCH 1/1] net: pppoe: use correct channel MTU when using Multilink PPP
Message-Id: <20140714.143624.287339351063026762.davem@davemloft.net>
List-Id: <linux-ppp.vger.kernel.org>
References: <53C1BC5B.9010004@kristov.de>
In-Reply-To: <53C1BC5B.9010004@kristov.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: develop@kristov.de
Cc: netdev@vger.kernel.org, linux-ppp@vger.kernel.org, mostrows@gmail.com

From: Christoph Schulz <develop@kristov.de>
Date: Sun, 13 Jul 2014 00:53:15 +0200

> The PPP channel MTU is used with Multilink PPP when ppp_mp_explode() (see
> ppp_generic module) tries to determine how big a fragment might be. According
> to RFC 1661, the MTU excludes the 2-byte PPP protocol field, see the
> corresponding comment and code in ppp_mp_explode():
> 
> 		/*
> 		 * hdrlen includes the 2-byte PPP protocol field, but the
> 		 * MTU counts only the payload excluding the protocol field.
> 		 * (RFC1661 Section 2)
> 		 */
> 		mtu = pch->chan->mtu - (hdrlen - 2);
> 
> However, the pppoe module *does* include the PPP protocol field in the channel
> MTU, which is wrong as it causes the PPP payload to be 1-2 bytes too big under
> certain circumstances (one byte if PPP protocol compression is used, two
> otherwise), causing the generated Ethernet packets to be dropped. So the pppoe
> module has to subtract two bytes from the channel MTU. This error only
> manifests itself when using Multilink PPP, as otherwise the channel MTU is not
> used anywhere.

Applied and queued up for -stable, thank you.
