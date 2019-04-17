From: Al Viro <viro@zeniv.linux.org.uk>
Date: Wed, 17 Apr 2019 21:16:38 +0000
Subject: Re: [PATCH v3 04/26] compat_ioctl: move PPPIOCSCOMPRESS32 to ppp-generic.c
Message-Id: <20190417211637.GV2217@ZenIV.linux.org.uk>
List-Id: <linux-ppp.vger.kernel.org>
References: <20190416202013.4034148-1-arnd@arndb.de>
 <20190416202013.4034148-5-arnd@arndb.de>
In-Reply-To: <20190416202013.4034148-5-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-fsdevel@vger.kernel.org, y2038@lists.linaro.org, linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>, "David S. Miller" <davem@davemloft.net>, linux-ppp@vger.kernel.org, netdev@vger.kernel.org

On Tue, Apr 16, 2019 at 10:19:42PM +0200, Arnd Bergmann wrote:
> +#ifdef CONFIG_COMPAT
> +struct ppp_option_data32 {
> +	compat_caddr_t	ptr;

Huh?  compat_uptr_t, surely?  I realize that compat_ioctl.c is bogus
that way right now, but let's not spread that crap into the places
where it's harder to find...

>  	err = -EFAULT;
> -	if (copy_from_user(&data, (void __user *) arg, sizeof(data)))
> -		goto out;
> +#ifdef CONFIG_COMPAT
> +	if (compat) {
> +		struct ppp_option_data32 data32;
> +
> +		if (copy_from_user(&data32, (void __user *) arg,
> +				   sizeof(data32)))
> +			goto out;
> +
> +		data.ptr = compat_ptr(data32.ptr);
> +		data.length = data32.length;
> +		data.transmit = data32.transmit;
> +	} else
> +#endif
> +	{
> +		if (copy_from_user(&data, (void __user *) arg, sizeof(data)))
> +			goto out;
> +	}

*UGH*

Do that in caller, please.  And sod the flag argument...
