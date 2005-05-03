From: "David S. Miller" <davem@davemloft.net>
Date: Tue, 03 May 2005 21:37:26 +0000
Subject: Re: [PATCH] ppp: remove redundant NULL pointer checks before kfree
Message-Id: <20050503143726.63758ce3.davem@davemloft.net>
List-Id: <linux-ppp.vger.kernel.org>
References: <Pine.LNX.4.62.0504290049240.2476@dragon.hyggekrogen.localhost>
In-Reply-To: <Pine.LNX.4.62.0504290049240.2476@dragon.hyggekrogen.localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jesper Juhl <juhl-lkml@dif.dk>
Cc: paulus@samba.org, linux-ppp@vger.kernel.org, netdev@oss.sgi.com, linux-kernel@vger.kernel.org

On Fri, 29 Apr 2005 00:54:44 +0200 (CEST)
Jesper Juhl <juhl-lkml@dif.dk> wrote:

> kfree() and vfree() can both deal with NULL pointers. This patch removes 
> redundant NULL pointer checks from the ppp code in drivers/net/
> 
> Signed-off-by: Jesper Juhl <juhl-lkml@dif.dk>

Applied, thanks Jesper.
