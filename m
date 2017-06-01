From: Guillaume Nault <g.nault@alphalink.fr>
Date: Thu, 01 Jun 2017 09:07:55 +0000
Subject: Re: [PATCH] driver: ppp: Remove unnecessary bh disable in xmit path
Message-Id: <20170601090755.cxmwqt6nwbumev5w@alphalink.fr>
List-Id: <linux-ppp.vger.kernel.org>
References: <1496281758-27671-1-git-send-email-gfree.wind@vip.163.com>
In-Reply-To: <1496281758-27671-1-git-send-email-gfree.wind@vip.163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Thu, Jun 01, 2017 at 09:49:18AM +0800, gfree.wind@vip.163.com wrote:
> From: Gao Feng <gfree.wind@vip.163.com>
> 
> Since the commit 55454a565836 ("ppp: avoid dealock on recursive xmit"),
> the PPP xmit path is protected by wrapper functions which disable the
> bh already. So it is unnecessary to disable the bh again in the real
> xmit path.
> 
Looks good, thanks!
But it seems you forgot to Cc. netdev@vger.kernel.org.
Please resubmit there.

You can also fix the subject to make clear this patch is for net-next.
Also, the "driver:" prefix isn't necessary.
Something like
[PATCH net-next] ppp: remove unnecessary bh disable in xmit path
