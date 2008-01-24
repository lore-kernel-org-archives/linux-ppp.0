From: David Miller <davem@davemloft.net>
Date: Thu, 24 Jan 2008 04:54:25 +0000
Subject: Re: [PATCH] ppp: sparse warning fixes
Message-Id: <20080123.205425.144643934.davem@davemloft.net>
List-Id: <linux-ppp.vger.kernel.org>
References: <20080123154019.7cd9c471@deepthought>
In-Reply-To: <20080123154019.7cd9c471@deepthought>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: shemminger@vyatta.com
Cc: paulus@samba.org, linux-ppp@vger.kernel.org, netdev@vger.kernel.org

From: Stephen Hemminger <shemminger@vyatta.com>
Date: Wed, 23 Jan 2008 15:40:19 -0800

> Fix a bunch of warnings in PPP and related drivers. Mostly because
> sparse doesn't like it when the the function is only marked private
> in the forward declaration.
> 
> Signed-off-by: Stephen Hemminger <shemminger@vyatta.com>

Applied, thanks Stephen.
