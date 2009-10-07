From: David Miller <davem@davemloft.net>
Date: Wed, 07 Oct 2009 08:28:21 +0000
Subject: Re: [PATCH] net/ppp: fix comments - ppp_{sync,asynctty}_receive()
Message-Id: <20091007.012821.184426837.davem@davemloft.net>
List-Id: <linux-ppp.vger.kernel.org>
References: <20091001142844.C50E511186D@xenon.ts.pxnet.com>
In-Reply-To: <20091001142844.C50E511186D@xenon.ts.pxnet.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: tilman@imap.cc
Cc: alan@lxorguk.ukuu.org.uk, alan@linux.intel.com, paulus@samba.org, linux-ppp@vger.kernel.org, netdev@vger.kernel.org, jarkao2@gmail.com, linux-kernel@vger.kernel.org

From: Tilman Schmidt <tilman@imap.cc>
Date: Thu,  1 Oct 2009 16:28:44 +0200 (CEST)

> The receive_buf methods of the N_PPP and N_SYNC_PPP line disciplines,
> ppp_asynctty_receive() and ppp_sync_receive(), call tty_unthrottle()
> which may sleep. Fix the comments claiming otherwise.
> 
> Impact: documentation
> Signed-off-by: Tilman Schmidt <tilman@imap.cc>

Applied, thanks.
