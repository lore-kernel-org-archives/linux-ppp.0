From: "David S. Miller" <davem@davemloft.net>
Date: Wed, 08 Feb 2006 23:58:59 +0000
Subject: Re: [PATCH] ppp: don't use 0 in pointer context
Message-Id: <20060208.155859.82670094.davem@davemloft.net>
List-Id: <linux-ppp.vger.kernel.org>
References: <20060208232214.GC14543@mipter.zuzino.mipt.ru>
	<E1F6z45-0006qL-00@gondolin.me.apana.org.au>
In-Reply-To: <E1F6z45-0006qL-00@gondolin.me.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: herbert@gondor.apana.org.au
Cc: adobriyan@gmail.com, dlstevens@us.ibm.com, carlsonj@workingcode.com, linux-ppp@vger.kernel.org, netdev@vger.kernel.org, netdev-owner@vger.kernel.org, viro@ftp.linux.org.uk

From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Thu, 09 Feb 2006 10:49:37 +1100

> The difference between gcc -pedantic and sparse is that it doesn't
> warn about obviously correct cases like p != 0 or p = 0.

So obviously correct that you left out an equals sign in the
second case :-)
