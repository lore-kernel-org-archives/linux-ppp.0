From: Michael Tokarev <mjt@tls.msk.ru>
Date: Wed, 21 Jul 2004 13:54:59 +0000
Subject: Re: rename ppp interface
Message-Id: <40FE75B3.7000106@tls.msk.ru>
List-Id: <linux-ppp.vger.kernel.org>
References: <20040716095908.GA32556@suse.de>
In-Reply-To: <20040716095908.GA32556@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Arvin Schnell wrote:
[]
> --- ./pppd/options.c.orig	2004-07-19 12:59:21.000000000 +0000
> +++ ./pppd/options.c	2004-07-19 14:35:04.253865964 +0000
> +    { "ifname", o_string, req_ifname,
> +      "Set PPP interface name",
> +      OPT_PRIO | OPT_PRIV | OPT_STATIC, NULL, MAXIFNAMELEN },

Is there any reason to use new option instead of existing
"linkname" option?  Currently, linkname is used only for
informational purposes (to be passed into scripts, and to
create /var/run/ppp-$linkname.pid file).  Existing option
seems to be better, but it may lead to unexpected problems,
namely, users who use it expects to see interface named pppN
(with current version), but with this change things may change
too.

> --- ./pppd/sys-linux.c.orig	2004-07-19 12:33:29.000000000 +0000
> +++ ./pppd/sys-linux.c	2004-07-19 14:37:36.463754450 +0000
> @@ -649,6 +649,21 @@
>  	}
>  	if (x < 0)
>  		error("Couldn't create new ppp unit: %m");
> +
> +	if (x = 0 && req_ifname[0] != '\0') {
> +		struct ifreq ifr;
> +		char t[MAXIFNAMELEN];
> +		memset(&ifr, 0, sizeof(struct ifreq));
> +		slprintf(t, sizeof(t), "%s%d", PPP_DRV_NAME, ifunit);
> +		strncpy(ifr.ifr_name, t, IF_NAMESIZE);
> +		strncpy(ifr.ifr_newname, req_ifname, IF_NAMESIZE);
> +		x = ioctl(sock_fd, SIOCSIFNAME, &ifr);
> +		if (x < 0)
> +		    error("Couldn't rename interface %s to %s: %m", t, req_ifname);

I'd suggest to change this into warn().

> +		else
> +		    info("Renamed interface %s to %s", t, req_ifname);

Is such a verbosity really necessary?  Pppd is already too noizy...

/mjt
