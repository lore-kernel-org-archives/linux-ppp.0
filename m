From: Guillaume Nault <g.nault@alphalink.fr>
Date: Thu, 30 Aug 2018 11:05:04 +0000
Subject: Re: [PATCH net-next 4/5] ppp: move PPPIOCSPASS32/PPPIOCSACTIVE32 to ppp_generic.c
Message-Id: <20180830110504.GA19457@alphalink.fr>
List-Id: <linux-ppp.vger.kernel.org>
References: <20180829140409.833488-1-arnd@arndb.de>
 <20180829140409.833488-4-arnd@arndb.de>
In-Reply-To: <20180829140409.833488-4-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>
Cc: paulus@samba.org, linux-ppp@vger.kernel.org, netdev@vger.kernel.org, mitch@sfgoth.com, mostrows@earthlink.net, jchapman@katalix.com, xeb@mail.ru, davem@davemloft.net, viro@zeniv.linux.org.uk, y2038@lists.linaro.org, linux-kernel@vger.kernel.org

On Wed, Aug 29, 2018 at 04:03:29PM +0200, Arnd Bergmann wrote:
> PPPIOCSPASS and PPPIOCSACTIVE are implemented in ppp_generic and isdn_ppp,
> but the latter one doesn't work for compat mode in general, so we can
> move these two into the generic code.
> 
> Again, the best implementation I could come up with was to merge
> the compat handling into the regular ppp_ioctl() function and
> treating all ioctl commands as compatible.
> 
Acked-by: Guillaume Nault <g.nault@alphalink.fr>
