From: David Miller <davem@davemloft.net>
Date: Thu, 05 Aug 2010 04:56:09 +0000
Subject: Re: [PATCH] ppp: make channel_ops const
Message-Id: <20100804.215609.191412753.davem@davemloft.net>
List-Id: <linux-ppp.vger.kernel.org>
References: <20100804103436.72e234d6@nehalam>
In-Reply-To: <20100804103436.72e234d6@nehalam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: shemminger@vyatta.com
Cc: paulus@samba.org, linux-ppp@vger.kernel.org, netdev@vger.kernel.org

From: Stephen Hemminger <shemminger@vyatta.com>
Date: Wed, 4 Aug 2010 10:34:36 -0700

> The PPP channel ops structure should be const.
> Cleanup the declarations to use standard C99 format.
> 
> Signed-off-by: Stephen Hemminger <shemminger@vyatta.com>

Applied.
