From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 16 Jul 2018 11:01:34 +0000
Subject: Re: [PATCH] ppp: mppe: Remove VLA usage
Message-Id: <CAK8P3a1tph9VPJnYYhBvH_1wZ79wXDvfnJt_CEruj3T-TBG1jg@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20180716040516.GA32783@beast>
In-Reply-To: <20180716040516.GA32783@beast>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kees Cook <keescook@chromium.org>
Cc: Paul Mackerras <paulus@samba.org>, "David S. Miller" <davem@davemloft.net>, Herbert Xu <herbert@gondor.apana.org.au>, Eric Biggers <ebiggers@google.com>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-ppp@vger.kernel.org, Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, Jul 16, 2018 at 6:05 AM, Kees Cook <keescook@chromium.org> wrote:
> In the quest to remove all stack VLA usage from the kernel[1], this
> removes the discouraged use of AHASH_REQUEST_ON_STACK (and associated
> VLA) by switching to shash directly and keeping the associated descriptor
> allocated with the regular state on the heap.
>
> [1] https://lkml.kernel.org/r/CA+55aFzCG-zNmZwX4A2FQpadafLfEzK6CC=qPXydAacU1RqZWA@mail.gmail.com
>
> Signed-off-by: Kees Cook <keescook@chromium.org>

I had concerns at first that this approach might make it slower, but
upon reading through implementation of the shash_ahash_ implementation,
I concluded that it can only be better than before, improving both
performance and stack usage.

Acked-by: Arnd Bergmann <arnd@arndb.de>
