From: Guillaume Nault <g.nault@alphalink.fr>
Date: Tue, 31 Oct 2017 15:48:49 +0000
Subject: Re: [PATCH net-next] ppp: Destroy the mutex when cleanup
Message-Id: <20171031154849.nzi2rtx33iteyhbj@alphalink.fr>
List-Id: <linux-ppp.vger.kernel.org>
References: <1509445537-39319-1-git-send-email-gfree.wind@vip.163.com>
In-Reply-To: <1509445537-39319-1-git-send-email-gfree.wind@vip.163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gfree.wind@vip.163.com
Cc: paulus@samba.org, davem@davemloft.net, linux-ppp@vger.kernel.org, netdev@vger.kernel.org

On Tue, Oct 31, 2017 at 06:25:37PM +0800, gfree.wind@vip.163.com wrote:
> From: Gao Feng <gfree.wind@vip.163.com>
> 
> The mutex_destroy only makes sense when enable DEBUG_MUTEX. For the
> good readbility, it's better to invoke it in exit func when the init
> func invokes mutex_init.
> 
> Signed-off-by: Gao Feng <gfree.wind@vip.163.com>
> ---
>  drivers/net/ppp/ppp_generic.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
> index af7f93e..4489133 100644
> --- a/drivers/net/ppp/ppp_generic.c
> +++ b/drivers/net/ppp/ppp_generic.c
> @@ -960,6 +960,7 @@ static __net_exit void ppp_exit_net(struct net *net)
>  	unregister_netdevice_many(&list);
>  	rtnl_unlock();
>  
> +	mutex_destroy(&pn->all_ppp_mutex);
>  	idr_destroy(&pn->units_idr);
>  }
>  

Acked-by: Guillaume Nault <g.nault@alphalink.fr>

Thanks!
