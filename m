From: Abdul J <postabdul@yahoo.com>
Date: Mon, 15 Nov 2004 23:31:08 +0000
Subject: Re: [PATCH] Multilink fix for ppp_generic.c
Message-Id: <20041115233108.51227.qmail@web60105.mail.yahoo.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <16792.10140.445933.617107@cargo.ozlabs.ibm.com>
In-Reply-To: <16792.10140.445933.617107@cargo.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hi Paul,

I assume that this patch is for a 2.5.x kernels. Would
it also work for 2.4.x or 2.6.x kernels?

Thanks,
Abdul


--- Paul Mackerras <paulus@samba.org> wrote:

> I released ppp-2.4.3 yesterday, with much improved
> support for
> multilink operation - when the first link is
> terminated, its pppd no
> longer exits immediately, but keeps running in order
> to keep the ppp
> interface up while there are other links still in
> the bundle.
> 
> However, this shows up a bug in the kernel ppp
> driver, which is that
> there is no way for the pppd controlling the bundle
> to know when the
> last link in the bundle is terminated.  This patch
> provides such a
> way: with this patch, pppd will get an EOF when
> reading from the
> /dev/ppp instance for the bundle when there are no
> channels connected.
> 
> Andrew, could this be considered for inclusion in
> 2.6.10 please?  The
> change does not affect older versions of pppd or
> normal non-multilink
> operation (I have tested to make sure of that).
> 
> Signed-off-by: Paul Mackerras <paulus@samba.org>
> 
> diff -urN linux-2.5/drivers/net/ppp_generic.c
> pmac-2.5/drivers/net/ppp_generic.c
> --- linux-2.5/drivers/net/ppp_generic.c	2004-10-29
> 07:03:21.000000000 +1000
> +++ pmac-2.5/drivers/net/ppp_generic.c	2004-11-15
> 08:53:54.000000000 +1100
> @@ -19,7 +19,7 @@
>   * PPP driver, written by Michael Callahan and Al
> Longyear, and
>   * subsequently hacked by Paul Mackerras.
>   *
> - * =FILEVERSION 20020217=
> + * =FILEVERSION 20041108=
>   */
>  
>  #include <linux/config.h>
> @@ -412,6 +412,17 @@
>  		ret = 0;
>  		if (pf->dead)
>  			break;
> +		if (pf->kind = INTERFACE) {
> +			/*
> +			 * Return 0 (EOF) on an interface that has no
> +			 * channels connected, unless it is looping
> +			 * network traffic (demand mode).
> +			 */
> +			struct ppp *ppp = PF_TO_PPP(pf);
> +			if (ppp->n_channels = 0
> +			    && (ppp->flags & SC_LOOP_TRAFFIC) = 0)
> +				break;
> +		}
>  		ret = -EAGAIN;
>  		if (file->f_flags & O_NONBLOCK)
>  			break;
> @@ -491,6 +502,14 @@
>  		mask |= POLLIN | POLLRDNORM;
>  	if (pf->dead)
>  		mask |= POLLHUP;
> +	else if (pf->kind = INTERFACE) {
> +		/* see comment in ppp_read */
> +		struct ppp *ppp = PF_TO_PPP(pf);
> +		if (ppp->n_channels = 0
> +		    && (ppp->flags & SC_LOOP_TRAFFIC) = 0)
> +			mask |= POLLIN | POLLRDNORM;
> +	}
> +				
>  	return mask;
>  }
>  
> @@ -2559,7 +2578,8 @@
>  		/* remove it from the ppp unit's list */
>  		ppp_lock(ppp);
>  		list_del(&pch->clist);
> -		--ppp->n_channels;
> +		if (--ppp->n_channels = 0)
> +			wake_up_interruptible(&ppp->file.rwait);
>  		ppp_unlock(ppp);
>  		if (atomic_dec_and_test(&ppp->file.refcnt))
>  			ppp_destroy_interface(ppp);
> -
> To unsubscribe from this list: send the line
> "unsubscribe linux-ppp" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at 
> http://vger.kernel.org/majordomo-info.html
> 



		
__________________________________ 
Do you Yahoo!? 
The all-new My Yahoo! - Get yours free! 
http://my.yahoo.com 
 

