From: Paul Mackerras <paulus@samba.org>
Date: Mon, 13 Aug 2007 09:38:22 +0000
Subject: Re: [PATCH] [384/2many] MAINTAINERS - PPP PROTOCOL DRIVERS AND
Message-Id: <18112.9870.744182.247752@cargo.ozlabs.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <46bffb62.YUHsMJB9NIlhwots%joe@perches.com>
In-Reply-To: <46bffb62.YUHsMJB9NIlhwots%joe@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: joe@perches.com
Cc: torvalds@linux-foundation.org, linux-ppp@vger.kernel.org, linux-kernel@vger.kernel.org, akpm@linux-foundation.org

joe@perches.com writes:

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 62354a9..70667e6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3679,6 +3679,7 @@ P:	Paul Mackerras
>  M:	paulus@samba.org
>  L:	linux-ppp@vger.kernel.org
>  S:	Maintained
> +F:	drivers/net/ppp_*

Except for drivers/net/ppp_synctty.c.

Paul.
