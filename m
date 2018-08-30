From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 30 Aug 2018 11:54:48 +0000
Subject: Re: [PATCH net-next 1/5] pppoe: fix PPPOEIOCSFWD compat handling
Message-Id: <CAK8P3a1WSa5yPWXYGieAc0+Xk=CAy_G-RhNNcQBsGQGOU-8WfA@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20180829140409.833488-1-arnd@arndb.de> <20180830110453.GC1473@alphalink.fr>
In-Reply-To: <20180830110453.GC1473@alphalink.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: g.nault@alphalink.fr
Cc: Paul Mackerras <paulus@samba.org>, linux-ppp@vger.kernel.org, Networking <netdev@vger.kernel.org>, mitch@sfgoth.com, mostrows@earthlink.net, jchapman@katalix.com, xeb@mail.ru, David Miller <davem@davemloft.net>, Al Viro <viro@zeniv.linux.org.uk>, y2038 Mailman List <y2038@lists.linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, Aug 30, 2018 at 1:04 PM Guillaume Nault <g.nault@alphalink.fr> wrote:
>
> On Wed, Aug 29, 2018 at 04:03:26PM +0200, Arnd Bergmann wrote:
> > Support for handling the PPPOEIOCSFWD ioctl in compat mode was added in
> > linux-2.5.69 along with hundreds of other commands, but was always broken
> > sincen only the structure is compatible, but the command number is not,
> > due to the size being sizeof(size_t), or at first sizeof(sizeof((struct
> > sockaddr_pppox)), which is different on 64-bit architectures.
> >
> And the implementation was broken until 2016 (see 29e73269aa4d ("pppoe:
> fix reference counting in PPPoE proxy")), and nobody ever noticed. I
> should probably have removed this ioctl entirely instead of fixing it.
> Clearly, it has never been used.
>
> If you think it's worth fixing (as opposed to dropping this ioctl or
> its compat mode), then,
> Acked-by: Guillaume Nault <g.nault@alphalink.fr>

I don't care much, but fixing it seems seems easier than coming
up with a convincing rationale for dropping.

I'll update the changelog text to include your additional background
information though, unless someone else prefers to have it dropped.

       Arnd
