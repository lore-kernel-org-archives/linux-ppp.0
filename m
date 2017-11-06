From: walter harms <wharms@bfs.de>
Date: Mon, 06 Nov 2017 13:34:36 +0000
Subject: Re: [PATCH v3 04/21] ppp: exit_net cleanup checks added
Message-Id: <5A0064EC.3090608@bfs.de>
List-Id: <linux-ppp.vger.kernel.org>
References: <4fdc4264-e338-6ee8-a662-7d98b45733a1@virtuozzo.com> <5e005fe5-e8b2-eee8-b185-a9e5fc1d7996@virtuozzo.com>
In-Reply-To: <5e005fe5-e8b2-eee8-b185-a9e5fc1d7996@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasily Averin <vvs@virtuozzo.com>
Cc: Linux Kernel Network Developers <netdev@vger.kernel.org>, linux-ppp@vger.kernel.org, Paul Mackerras <paulus@samba.org>

Hello Vasily Averin,
just a general hint:
when you send new versions of a patch please document also
what you have changed. Here an example from an other ML:

The problematic code looks like this:

	res_seq = res_hdr->xd_hdr.length_sn & TB_XDOMAIN_SN_MASK;
	res_seq >>= TB_XDOMAIN_SN_SHIFT;

TB_XDOMAIN_SN_SHIFT is 27, and right shifting a u8 27 bits is always
going to result in zero.  The fix is to declare these variables as u32.

Fixes: d1ff70241a27 ("thunderbolt: Add support for XDomain discovery protocol")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: I accidentally sent this through the wrong list, so I'm resending to
    netdev.  Also Mika asked me to split it up because the Fixes tags
    are different for these patches.


please notice the V2. that tell the reader what has changes against
the V1.

re,
 wh

Am 06.11.2017 14:23, schrieb Vasily Averin:
> Be sure that lists initialized in net_init hook were return
> to initial state.
> 
> Signed-off-by: Vasily Averin <vvs@virtuozzo.com>
> ---
>  drivers/net/ppp/ppp_generic.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
> index e365866..c0861d1 100644
> --- a/drivers/net/ppp/ppp_generic.c
> +++ b/drivers/net/ppp/ppp_generic.c
> @@ -960,6 +960,12 @@ static __net_exit void ppp_exit_net(struct net *net)
>  	rtnl_unlock();
>  
>  	idr_destroy(&pn->units_idr);
> +	WARN_ONCE(!list_empty(&pn->all_channels),
> +		  "net %x %s: all_channels list is not empty\n",
> +		  net->ns.inum, __func__);
> +	WARN_ONCE(!list_empty(&pn->new_channels),
> +		  "net %x %s: new_channels list is not empty\n",
> +		  net->ns.inum, __func__);
>  }
>  
>  static struct pernet_operations ppp_net_ops = {
