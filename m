From: Guillaume Nault <gnault@redhat.com>
Date: Fri, 27 Dec 2019 12:05:36 +0000
Subject: Re: [PATCH v2] ppp: Remove redundant BUG_ON() check in ppp_pernet
Message-Id: <20191227120536.GA32264@linux-2.home>
List-Id: <linux-ppp.vger.kernel.org>
References: <1577243224-1923-1-git-send-email-vulab@iscas.ac.cn>
In-Reply-To: <1577243224-1923-1-git-send-email-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Xu Wang <vulab@iscas.ac.cn>
Cc: paulus@samba.org, davem@davemloft.net, linux-ppp@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Dec 25, 2019 at 03:07:04AM +0000, Xu Wang wrote:
> Passing NULL to ppp_pernet causes a crash via BUG_ON.
> Dereferencing net in net_generic() also has the same effect.
> This patch removes the redundant BUG_ON check on the same parameter.
> 
> Signed-off-by: Xu Wang <vulab@iscas.ac.cn>
> ---
>  drivers/net/ppp/ppp_generic.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
> index 3bf8a8b..22cc2cb 100644
> --- a/drivers/net/ppp/ppp_generic.c
> +++ b/drivers/net/ppp/ppp_generic.c
> @@ -296,8 +296,6 @@ static struct class *ppp_class;
>  /* per net-namespace data */
>  static inline struct ppp_net *ppp_pernet(struct net *net)
>  {
> -	BUG_ON(!net);
> -
>  	return net_generic(net, ppp_net_id);
>  }
Acked-by: Guillaume Nault <gnault@redhat.com>
