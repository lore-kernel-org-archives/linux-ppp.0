From: David Miller <davem@davemloft.net>
Date: Sat, 22 Jun 2019 13:44:47 +0000
Subject: Re: [PATCH] ppp: mppe: Add softdep to arc4
Message-Id: <20190622.094447.257491246684509114.davem@davemloft.net>
List-Id: <linux-ppp.vger.kernel.org>
References: <20190619133407.6800-1-tiwai@suse.de>
In-Reply-To: <20190619133407.6800-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: tiwai@suse.de
Cc: paulus@samba.org, linux-ppp@vger.kernel.org, netdev@vger.kernel.org

From: Takashi Iwai <tiwai@suse.de>
Date: Wed, 19 Jun 2019 15:34:07 +0200

> The arc4 crypto is mandatory at ppp_mppe probe time, so let's put a
> softdep line, so that the corresponding module gets prepared
> gracefully.  Without this, a simple inclusion to initrd via dracut
> failed due to the missing dependency, for example.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Applied.
