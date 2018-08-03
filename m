From: David Miller <davem@davemloft.net>
Date: Fri, 03 Aug 2018 19:55:13 +0000
Subject: Re: [PATCH net-next] ppp: mppe: Remove VLA usage
Message-Id: <20180803.125513.1756655974530187845.davem@davemloft.net>
List-Id: <linux-ppp.vger.kernel.org>
References: <20180803163745.GA45715@beast>
In-Reply-To: <20180803163745.GA45715@beast>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: keescook@chromium.org
Cc: netdev@vger.kernel.org, paulus@samba.org, linux-ppp@vger.kernel.org, linux-kernel@vger.kernel.org

From: Kees Cook <keescook@chromium.org>
Date: Fri, 3 Aug 2018 09:37:45 -0700

> In the quest to remove all stack VLA usage from the kernel[1], this
> removes the discouraged use of AHASH_REQUEST_ON_STACK (and associated
> VLA) by switching to shash directly and keeping the associated descriptor
> allocated with the regular state on the heap.
> 
> [1] https://lkml.kernel.org/r/CA+55aFzCG-zNmZwX4A2FQpadafLfEzK6CC=qPXydAacU1RqZWA@mail.gmail.com
> 
> Signed-off-by: Kees Cook <keescook@chromium.org>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> ---
> Paul suggested this go via netdev directly:
> https://lkml.kernel.org/r/20180803031315.GA30807@fergus

Applied, thanks Kees.
