From: Eric Biggers <ebiggers@kernel.org>
Date: Tue, 11 Jun 2019 18:08:58 +0000
Subject: Re: [PATCH v3 6/7] ppp: mppe: switch to RC4 library interface
Message-Id: <20190611180857.GD66728@gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20190611134750.2974-1-ard.biesheuvel@linaro.org>
 <20190611134750.2974-7-ard.biesheuvel@linaro.org>
In-Reply-To: <20190611134750.2974-7-ard.biesheuvel@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: linux-crypto@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Johannes Berg <johannes@sipsolutions.net>, linux-ppp@vger.kernel.org, Paul Mackerras <paulus@samba.org>

On Tue, Jun 11, 2019 at 03:47:49PM +0200, Ard Biesheuvel wrote:
> @@ -728,8 +660,7 @@ static struct compressor ppp_mppe = {
>  static int __init ppp_mppe_init(void)
>  {
>  	int answer;
> -	if (!(crypto_has_skcipher("ecb(arc4)", 0, CRYPTO_ALG_ASYNC) &&
> -	      crypto_has_ahash("sha1", 0, CRYPTO_ALG_ASYNC)))
> +	if (!crypto_has_ahash("sha1", 0, CRYPTO_ALG_ASYNC))
>  		return -ENODEV;

Doesn't fips_enabled need to be checked here too?

- Eric
