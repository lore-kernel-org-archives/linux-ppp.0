From: Guillaume Nault <g.nault@alphalink.fr>
Date: Thu, 01 Jun 2017 10:43:22 +0000
Subject: Re: [PATCH net-next] ppp: remove unnecessary bh disable in xmit path
Message-Id: <20170601104322.tipz5zocqmbqu46l@alphalink.fr>
List-Id: <linux-ppp.vger.kernel.org>
References: <1496311119-59204-1-git-send-email-gfree.wind@vip.163.com>
In-Reply-To: <1496311119-59204-1-git-send-email-gfree.wind@vip.163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gfree.wind@vip.163.com
Cc: paulus@samba.org, linux-ppp@vger.kernel.org, netdev@vger.kernel.org

On Thu, Jun 01, 2017 at 05:58:39PM +0800, gfree.wind@vip.163.com wrote:
> From: Gao Feng <gfree.wind@vip.163.com>
> 
> Since the commit 55454a565836 ("ppp: avoid dealock on recursive xmit"),
> the PPP xmit path is protected by wrapper functions which disable the
> bh already. So it is unnecessary to disable the bh again in the real
> xmit path.
> 
Thanks!

Acked-by: Guillaume Nault <g.nault@alphalink.fr>
