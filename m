From: David Miller <davem@davemloft.net>
Date: Tue, 10 Dec 2019 04:32:51 +0000
Subject: Re: [PATCH] ppp: Adjust indentation into ppp_async_input
Message-Id: <20191209.203251.2060454946547270295.davem@davemloft.net>
List-Id: <linux-ppp.vger.kernel.org>
References: <20191209223859.19013-1-natechancellor@gmail.com>
In-Reply-To: <20191209223859.19013-1-natechancellor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: natechancellor@gmail.com
Cc: paulus@samba.org, linux-ppp@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com

From: Nathan Chancellor <natechancellor@gmail.com>
Date: Mon,  9 Dec 2019 15:38:59 -0700

> Clang warns:
> 
> ../drivers/net/ppp/ppp_async.c:877:6: warning: misleading indentation;
> statement is not part of the previous 'if' [-Wmisleading-indentation]
>                                 ap->rpkt = skb;
>                                 ^
> ../drivers/net/ppp/ppp_async.c:875:5: note: previous statement is here
>                                 if (!skb)
>                                 ^
> 1 warning generated.
> 
> This warning occurs because there is a space before the tab on this
> line. Clean up this entire block's indentation so that it is consistent
> with the Linux kernel coding style and clang no longer warns.
> 
> Fixes: 6722e78c9005 ("[PPP]: handle misaligned accesses")
> Link: https://github.com/ClangBuiltLinux/linux/issues/800
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>

Applied.
