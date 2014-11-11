From: David Miller <davem@davemloft.net>
Date: Tue, 11 Nov 2014 20:15:38 +0000
Subject: Re: [PATCH resent] net: ppp: Don't call bpf_prog_create() in ppp_lock
Message-Id: <20141111.151538.1100779026961453082.davem@davemloft.net>
List-Id: <linux-ppp.vger.kernel.org>
References: <1415616621-3481-1-git-send-email-tiwai@suse.de>
In-Reply-To: <1415616621-3481-1-git-send-email-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: tiwai@suse.de
Cc: netdev@vger.kernel.org, paulus@samba.org, linux-ppp@vger.kernel.org, stefan.seyfried@googlemail.com

From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 10 Nov 2014 11:50:21 +0100

> In ppp_ioctl(), bpf_prog_create() is called inside ppp_lock, which
> eventually calls vmalloc() and hits BUG_ON() in vmalloc.c.  This patch
> works around the problem by moving the allocation outside the lock.
> 
> The bug was revealed by the recent change in net/core/filter.c, as it
> allocates via vmalloc() instead of kmalloc() now.
> 
> Reported-and-tested-by: Stefan Seyfried <stefan.seyfried@googlemail.com>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Applied and queued up for -stable, thanks.
