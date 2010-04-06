From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
Date: Tue, 06 Apr 2010 20:30:02 +0000
Subject: Re: [PATCH v2] crypto: add blkcipher implementation of ARC4
Message-Id: <20100406203002.GA1842@Chamillionaire.breakpoint.cc>
List-Id: <linux-ppp.vger.kernel.org>
References: <1270280969-11357-1-git-send-email-sebastian@breakpoint.cc>
 <1270280969-11357-3-git-send-email-sebastian@breakpoint.cc>
 <20100405084209.GA16788@gondor.apana.org.au>
 <20100405170406.GA24215@Chamillionaire.breakpoint.cc>
 <20100406124412.GA24488@gondor.apana.org.au>
In-Reply-To: <20100406124412.GA24488@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org, linux-wireless@vger.kernel.org, linux-ppp@vger.kernel.org

* Herbert Xu | 2010-04-06 20:44:12 [+0800]:

>On Mon, Apr 05, 2010 at 07:04:06PM +0200, Sebastian Andrzej Siewior wrote:
>>
>> +static void arc4_key_to_iv(const u8 *in_key, u32 key_len, struct arc4_iv *iv)
>> +{
>> +	int i, j = 0, k = 0;
>> +
>> +	iv->iv.x = 1;
>> +	iv->iv.y = 0;
>> +
>> +	for (i = 0; i < 256; i++)
>> +		iv->iv.S[i] = i;
>> +
>> +	for (i = 0; i < 256; i++)
>> +	{
>> +		u8 a = iv->iv.S[i];
>> +		j = (j + in_key[k] + a) & 0xff;
>> +		iv->iv.S[i] = iv->iv.S[j];
>> +		iv->iv.S[j] = a;
>> +		if (++k >= key_len)
>> +			k = 0;
>> +	}
>> +}
>> +
>> +static void arc4_ivsetup(struct arc4_iv *iv)
>> +{
>> +	struct arc4_iv tmp_iv;
>> +
>> +	if (iv->type = ARC4_TYPE_IV)
>> +		return;
>> +
>> +	memcpy(&tmp_iv, iv, sizeof(tmp_iv));
>> +	arc4_key_to_iv(tmp_iv.key.key, tmp_iv.key.key_len, iv);
>> +	iv->type = ARC4_TYPE_IV;
>> +}
>
>We need to verify that 1 <= key_len <= 256.
Good point. All arc4 users don't care about return value of setkey so I
think that I just change void to int add the check for the valid key
length.

While we are here, the .setkey() callback could be removed, couldn't it?
It returns 0 even it is doing nothing what looks kinda wrong. However it
shouldn't be called at all since min/max key is 0. Any objections on
that?

>
>Cheers,

Sebastian
