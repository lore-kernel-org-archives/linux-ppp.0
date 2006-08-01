From: Paul Mackerras <paulus@samba.org>
Date: Tue, 01 Aug 2006 04:29:43 +0000
Subject: Re: [PATCH] Missing failure handling
Message-Id: <17614.55479.693532.236235@cargo.ozlabs.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20060720191629.GD7643@lumumba.uhasselt.be>
In-Reply-To: <20060720191629.GD7643@lumumba.uhasselt.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Panagiotis Issaris <takis@lumumba.uhasselt.be>
Cc: linux-kernel@vger.kernel.org, linux-ppp@vger.kernel.org

Panagiotis Issaris writes:

> -	cardmap_set(&all_ppp_units, unit, ppp);
> +	ret = cardmap_set(&all_ppp_units, unit, ppp);
> +	if (ret != 0) {
> +		printk(KERN_ERR "PPP: couldn't set cardmap\n");	

This is a pretty useless message, in that it will mean nothing to a
user who sees it.  It would be better to set ret = -ENOMEM and not
print the message, I think.

Paul.
