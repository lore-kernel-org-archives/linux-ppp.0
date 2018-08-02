From: Kees Cook <keescook@chromium.org>
Date: Thu, 02 Aug 2018 23:27:01 +0000
Subject: Re: [PATCH] ppp: mppe: Remove VLA usage
Message-Id: <CAGXu5jKaNk8x9v+uVQ_O7gxr50s1-Q901JbQupnkBFYiUjd7UQ@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20180716040516.GA32783@beast> <CAK8P3a1tph9VPJnYYhBvH_1wZ79wXDvfnJt_CEruj3T-TBG1jg@mail.gmail.com>
In-Reply-To: <CAK8P3a1tph9VPJnYYhBvH_1wZ79wXDvfnJt_CEruj3T-TBG1jg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paul Mackerras <paulus@samba.org>
Cc: Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>, Herbert Xu <herbert@gondor.apana.org.au>, Eric Biggers <ebiggers@google.com>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-ppp@vger.kernel.org, Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, Jul 16, 2018 at 4:01 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Mon, Jul 16, 2018 at 6:05 AM, Kees Cook <keescook@chromium.org> wrote:
>> In the quest to remove all stack VLA usage from the kernel[1], this
>> removes the discouraged use of AHASH_REQUEST_ON_STACK (and associated
>> VLA) by switching to shash directly and keeping the associated descriptor
>> allocated with the regular state on the heap.
>>
>> [1] https://lkml.kernel.org/r/CA+55aFzCG-zNmZwX4A2FQpadafLfEzK6CC=qPXydAacU1RqZWA@mail.gmail.com
>>
>> Signed-off-by: Kees Cook <keescook@chromium.org>
>
> I had concerns at first that this approach might make it slower, but
> upon reading through implementation of the shash_ahash_ implementation,
> I concluded that it can only be better than before, improving both
> performance and stack usage.
>
> Acked-by: Arnd Bergmann <arnd@arndb.de>

Paul,

Is this something you can take via your tree?

Thanks,

-Kees


-- 
Kees Cook
Pixel Security
