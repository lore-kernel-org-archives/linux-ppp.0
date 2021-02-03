From: Jakub Kicinski <kuba@kernel.org>
Date: Wed, 03 Feb 2021 04:07:27 +0000
Subject: Re: [PATCH 0/9] drivers: net: update tasklet_init callers
Message-Id: <20210202200727.4641cd7e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20210130234730.26565-1-kernel@esmil.dk>
In-Reply-To: <20210130234730.26565-1-kernel@esmil.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: netdev@vger.kernel.org, linux-usb@vger.kernel.org, linux-ppp@vger.kernel.org, Michael Grzeschik <m.grzeschik@pengutronix.de>, "David S. Miller" <davem@davemloft.net>, Paul Mackerras <paulus@samba.org>, Woojung Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com, Petko Manolov <petkan@nucleusys.com>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, Jing Xiangfeng <jingxiangfeng@huawei.com>, Oliver Neukum <oneukum@suse.com>, linux-kernel@vger.kernel.org

On Sun, 31 Jan 2021 00:47:21 +0100 Emil Renner Berthing wrote:
> This updates the remaining callers of tasklet_init() in drivers/net
> to the new API introduced in 
> commit 12cc923f1ccc ("tasklet: Introduce new initialization API")
> 
> All changes are done by coccinelle using the following semantic patch.
> Coccinelle needs a little help parsing drivers/net/arcnet/arcnet.c

Applied, thanks!
