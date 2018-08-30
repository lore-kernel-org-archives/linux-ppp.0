From: Guillaume Nault <g.nault@alphalink.fr>
Date: Thu, 30 Aug 2018 11:04:53 +0000
Subject: Re: [PATCH net-next 1/5] pppoe: fix PPPOEIOCSFWD compat handling
Message-Id: <20180830110453.GC1473@alphalink.fr>
List-Id: <linux-ppp.vger.kernel.org>
References: <20180829140409.833488-1-arnd@arndb.de>
In-Reply-To: <20180829140409.833488-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>
Cc: paulus@samba.org, linux-ppp@vger.kernel.org, netdev@vger.kernel.org, mitch@sfgoth.com, mostrows@earthlink.net, jchapman@katalix.com, xeb@mail.ru, davem@davemloft.net, viro@zeniv.linux.org.uk, y2038@lists.linaro.org, linux-kernel@vger.kernel.org

On Wed, Aug 29, 2018 at 04:03:26PM +0200, Arnd Bergmann wrote:
> Support for handling the PPPOEIOCSFWD ioctl in compat mode was added in
> linux-2.5.69 along with hundreds of other commands, but was always broken
> sincen only the structure is compatible, but the command number is not,
> due to the size being sizeof(size_t), or at first sizeof(sizeof((struct
> sockaddr_pppox)), which is different on 64-bit architectures.
> 
And the implementation was broken until 2016 (see 29e73269aa4d ("pppoe:
fix reference counting in PPPoE proxy")), and nobody ever noticed. I
should probably have removed this ioctl entirely instead of fixing it.
Clearly, it has never been used.

If you think it's worth fixing (as opposed to dropping this ioctl or
its compat mode), then,
Acked-by: Guillaume Nault <g.nault@alphalink.fr>
