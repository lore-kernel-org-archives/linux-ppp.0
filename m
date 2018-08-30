From: Guillaume Nault <g.nault@alphalink.fr>
Date: Thu, 30 Aug 2018 11:06:01 +0000
Subject: Re: [PATCH net-next 5/5] ppp: handle PPPIOCGIDLE for 64-bit time_t
Message-Id: <20180830110601.GA19534@alphalink.fr>
List-Id: <linux-ppp.vger.kernel.org>
References: <20180829140409.833488-1-arnd@arndb.de>
 <20180829140409.833488-5-arnd@arndb.de>
In-Reply-To: <20180829140409.833488-5-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>
Cc: paulus@samba.org, linux-ppp@vger.kernel.org, netdev@vger.kernel.org, mitch@sfgoth.com, mostrows@earthlink.net, jchapman@katalix.com, xeb@mail.ru, davem@davemloft.net, viro@zeniv.linux.org.uk, y2038@lists.linaro.org, linux-kernel@vger.kernel.org, Karsten Keil <isdn@linux-pingi.de>, linux-doc@vger.kernel.org

On Wed, Aug 29, 2018 at 04:03:30PM +0200, Arnd Bergmann wrote:
> The ppp_idle structure is defined in terms of __kernel_time_t, which is
> defined as 'long' on all architectures, and this usage is not affected
> by the y2038 problem since it transports a time interval rather than an
> absolute time.
> 
> However, the ppp user space defines the same structure as time_t, which
> may be 64-bit wide on new libc versions even on 32-bit architectures.
> 
> It's easy enough to just handle both possible structure layouts on
> all architectures, to deal with the possibility that a user space ppp
> implementation comes with its own ppp_idle structure definition, as well
> as to document the fact that the driver is y2038-safe.
> 
> Doing this also avoids the need for a special compat mode translation,
> since 32-bit and 64-bit kernels now support the same interfaces.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  Documentation/networking/ppp_generic.txt |  2 ++
>  drivers/isdn/i4l/isdn_ppp.c              | 14 ++++++++---
>  drivers/net/ppp/ppp_generic.c            | 18 ++++++++++----
>  fs/compat_ioctl.c                        | 31 ------------------------
>  include/uapi/linux/ppp-ioctl.h           |  2 ++
>  include/uapi/linux/ppp_defs.h            | 14 +++++++++++
>  6 files changed, 42 insertions(+), 39 deletions(-)
> 
> diff --git a/Documentation/networking/ppp_generic.txt b/Documentation/networking/ppp_generic.txt
> index 61daf4b39600..fd563aff5fc9 100644
> --- a/Documentation/networking/ppp_generic.txt
> +++ b/Documentation/networking/ppp_generic.txt
> @@ -378,6 +378,8 @@ an interface unit are:
>    CONFIG_PPP_FILTER option is enabled, the set of packets which reset
>    the transmit and receive idle timers is restricted to those which
>    pass the `active' packet filter.
> +  Two versions of this command exist, to deal with user space
> +  expecting times as either 32-bit or 64-bit time_t seconds.
>  
>  * PPPIOCSMAXCID sets the maximum connection-ID parameter (and thus the
>    number of connection slots) for the TCP header compressor and
> diff --git a/drivers/isdn/i4l/isdn_ppp.c b/drivers/isdn/i4l/isdn_ppp.c
> index a7b275ea5de1..1f17126c5fa4 100644
> --- a/drivers/isdn/i4l/isdn_ppp.c
> +++ b/drivers/isdn/i4l/isdn_ppp.c
> @@ -543,11 +543,19 @@ isdn_ppp_ioctl(int min, struct file *file, unsigned int cmd, unsigned long arg)
>  		}
>  		is->pppcfg = val;
>  		break;
> -	case PPPIOCGIDLE:	/* get idle time information */
> +	case PPPIOCGIDLE32:	/* get idle time information */
>  		if (lp) {
> -			struct ppp_idle pidle;
> +			struct ppp_idle32 pidle;
>  			pidle.xmit_idle = pidle.recv_idle = lp->huptimer;
> -			if ((r = set_arg(argp, &pidle, sizeof(struct ppp_idle))))
> +			if ((r = set_arg(argp, &pidle, sizeof(struct ppp_idle32))))
> +				return r;
> +		}
> +		break;
> +	case PPPIOCGIDLE64:	/* get idle time information */
> +		if (lp) {
> +			struct ppp_idle64 pidle;
> +			pidle.xmit_idle = pidle.recv_idle = lp->huptimer;
> +			if ((r = set_arg(argp, &pidle, sizeof(struct ppp_idle64))))
>  				return r;
>  		}
>  		break;
> diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
> index 3a7aa2eed415..c8b8aa071140 100644
> --- a/drivers/net/ppp/ppp_generic.c
> +++ b/drivers/net/ppp/ppp_generic.c
> @@ -619,7 +619,8 @@ static long ppp_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>  	struct ppp_file *pf;
>  	struct ppp *ppp;
>  	int err = -EFAULT, val, val2, i;
> -	struct ppp_idle idle;
> +	struct ppp_idle32 idle32;
> +	struct ppp_idle64 idle64;
>  	struct npioctl npi;
>  	int unit, cflags;
>  	struct slcompress *vj;
> @@ -743,10 +744,17 @@ static long ppp_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>  		err = 0;
>  		break;
>  
> -	case PPPIOCGIDLE:
> -		idle.xmit_idle = (jiffies - ppp->last_xmit) / HZ;
> -		idle.recv_idle = (jiffies - ppp->last_recv) / HZ;
> -		if (copy_to_user(argp, &idle, sizeof(idle)))
> +	case PPPIOCGIDLE32:
> +                idle32.xmit_idle = (jiffies - ppp->last_xmit) / HZ;
> +                idle32.recv_idle = (jiffies - ppp->last_recv) / HZ;
> +                if (copy_to_user(argp, &idle32, sizeof(idle32)))
> 
Missing 'break;'

> +		err = 0;
> +		break;
> +
> +	case PPPIOCGIDLE64:
> +		idle64.xmit_idle = (jiffies - ppp->last_xmit) / HZ;
> +		idle64.recv_idle = (jiffies - ppp->last_recv) / HZ;
> +		if (copy_to_user(argp, &idle32, sizeof(idle32)))
> 
I guess you meant 'idle64' instead of 'idle32'.
