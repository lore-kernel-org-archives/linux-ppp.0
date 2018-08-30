From: Guillaume Nault <g.nault@alphalink.fr>
Date: Thu, 30 Aug 2018 11:04:59 +0000
Subject: Re: [PATCH net-next 3/5] ppp: move PPPIOCSCOMPRESS32 to ppp-generic.c
Message-Id: <20180830110459.GA19111@alphalink.fr>
List-Id: <linux-ppp.vger.kernel.org>
References: <20180829140409.833488-1-arnd@arndb.de>
 <20180829140409.833488-3-arnd@arndb.de>
In-Reply-To: <20180829140409.833488-3-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>
Cc: paulus@samba.org, linux-ppp@vger.kernel.org, netdev@vger.kernel.org, mitch@sfgoth.com, mostrows@earthlink.net, jchapman@katalix.com, xeb@mail.ru, davem@davemloft.net, viro@zeniv.linux.org.uk, y2038@lists.linaro.org, linux-kernel@vger.kernel.org, Kirill Tkhai <ktkhai@virtuozzo.com>

On Wed, Aug 29, 2018 at 04:03:28PM +0200, Arnd Bergmann wrote:
> PPPIOCSCOMPRESS is only implemented in ppp_generic, so it's best to move
> the compat handling there. My first approach was to keep it in a new
> ppp_compat_ioctl() function, but it turned out to be much simpler to do
> it in the regular ioctl handler, by allowing both structure layouts to
> be handled directly there.
> 
Acked-by: Guillaume Nault <g.nault@alphalink.fr>
