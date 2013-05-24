From: David Miller <davem@davemloft.net>
Date: Fri, 24 May 2013 01:32:52 +0000
Subject: Re: [PATCH v3 3/4] ppp_mppe: cleanup kernel log messages
Message-Id: <20130523.183252.2126974375260355007.davem@davemloft.net>
List-Id: <linux-ppp.vger.kernel.org>
References: <1369222373-7701-1-git-send-email-jorge@dti2.net>
	<1369222373-7701-3-git-send-email-jorge@dti2.net>
In-Reply-To: <1369222373-7701-3-git-send-email-jorge@dti2.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jorge@dti2.net
Cc: netdev@vger.kernel.org, linux-ppp@vger.kernel.org

From: "Jorge Boncompte [DTI2]" <jorge@dti2.net>
Date: Wed, 22 May 2013 13:32:52 +0200

> @@ -43,6 +43,8 @@
>   *                    deprecated in 2.6
>   */
>  
> +#define DEBUG
> +

You've got to be kidding me.  Don't do this.
