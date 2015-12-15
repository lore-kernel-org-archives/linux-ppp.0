From: David Miller <davem@davemloft.net>
Date: Tue, 15 Dec 2015 18:15:13 +0000
Subject: Re: [PATCH net-next] pppoe: optional deactivation of PADT packet handling
Message-Id: <20151215.131513.158032872643262839.davem@davemloft.net>
List-Id: <linux-ppp.vger.kernel.org>
References: <712ac4d53ca9fb8621164a1b72c74eae8c8529aa.1450194732.git.g.nault@alphalink.fr>
In-Reply-To: <712ac4d53ca9fb8621164a1b72c74eae8c8529aa.1450194732.git.g.nault@alphalink.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: g.nault@alphalink.fr
Cc: netdev@vger.kernel.org, linux-ppp@vger.kernel.org

From: Guillaume Nault <g.nault@alphalink.fr>
Date: Tue, 15 Dec 2015 17:06:39 +0100

> @@ -109,6 +109,18 @@ struct pppoe_net {
>  	rwlock_t hash_lock;
>  };
>  
> +/* PADT packets belong to PPPoE's discovery stage (i.e. control plane)
> + * and should be handled by user space. Unfortunately, some programs
> + * don't listen out for PADT packets and rely on pppoe module for
> + * closing session after reception of PADT.
> + *
> + * This option can be deactivated when PPPoE discovery is handled by
> + * a PADT aware program.
> + */
> +static bool handle_padt __read_mostly = true;
> +module_param(handle_padt, bool, 0444);
> +MODULE_PARM_DESC(handle_padt, "Let kernel interpret incoming PADT");

No module options, please.
