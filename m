From: Jakub Kicinski <kuba@kernel.org>
Date: Tue, 15 Sep 2020 01:02:44 +0000
Subject: Re: [RESEND net-next v2 01/12] net: mvpp2: Prepare to use the new tasklet API
Message-Id: <20200914180244.3581836c@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20200914073131.803374-1-allen.lkml@gmail.com>
        <20200914073131.803374-2-allen.lkml@gmail.com>
In-Reply-To: <20200914073131.803374-2-allen.lkml@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Allen Pais <allen.lkml@gmail.com>
Cc: davem@davemloft.net, m.grzeschik@pengutronix.de, paulus@samba.org, oliver@neukum.org, woojung.huh@microchip.com, UNGLinuxDriver@microchip.com, petkan@nucleusys.com, netdev@vger.kernel.org, linux-usb@vger.kernel.org, linux-ppp@vger.kernel.org, Allen Pais <apais@linux.microsoft.com>, Romain Perier <romain.perier@gmail.com>

On Mon, 14 Sep 2020 13:01:20 +0530 Allen Pais wrote:
> From: Allen Pais <apais@linux.microsoft.com>
> 
> The future tasklet API will no longer allow to pass an arbitrary
> "unsigned long" data parameter. The tasklet data structure will need to
> be embedded into a data structure that will be retrieved from the tasklet
> handler. Currently, there are no ways to retrieve the "struct mvpp2_port
> *" from a given "struct mvpp2_port_pcpu *". This commit adds a new field
> to get the address of the main port for each pcpu context.
> 
> Signed-off-by: Romain Perier <romain.perier@gmail.com>
> Signed-off-by: Allen Pais <apais@linux.microsoft.com>
> ---
>  drivers/net/ethernet/marvell/mvpp2/mvpp2.h      | 1 +
>  drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/net/ethernet/marvell/mvpp2/mvpp2.h b/drivers/net/ethernet/marvell/mvpp2/mvpp2.h
> index 32753cc771bf..198860a4527d 100644
> --- a/drivers/net/ethernet/marvell/mvpp2/mvpp2.h
> +++ b/drivers/net/ethernet/marvell/mvpp2/mvpp2.h
> @@ -861,6 +861,7 @@ struct mvpp2_port_pcpu {
>  	struct hrtimer tx_done_timer;
>  	struct net_device *dev;
>  	bool timer_scheduled;
> +	struct mvpp2_port *port;
>  };
>  
>  struct mvpp2_queue_vector {
> diff --git a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
> index 6e140d1b8967..e8e68e8acdb3 100644
> --- a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
> +++ b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
> @@ -6025,6 +6025,7 @@ static int mvpp2_port_probe(struct platform_device *pdev,
>  		err = -ENOMEM;
>  		goto err_free_txq_pcpu;
>  	}
> +	port->pcpu->port = port;
>  
>  	if (!port->has_tx_irqs) {
>  		for (thread = 0; thread < priv->nthreads; thread++) {

Not 100% sure but I think this is yours:

drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:6442:13: warning: dereference of noderef expression

port->pcpu is __percpu, no?
