From: David Miller <davem@davemloft.net>
Date: Sat, 28 Dec 2019 00:31:13 +0000
Subject: Re: [PATCH] ppp: Remove redundant BUG_ON() check in ppp_pernet
Message-Id: <20191227.163113.718146091776171084.davem@davemloft.net>
List-Id: <linux-ppp.vger.kernel.org>
References: <1577180224-16405-1-git-send-email-vulab@iscas.ac.cn>
In-Reply-To: <1577180224-16405-1-git-send-email-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: vulab@iscas.ac.cn
Cc: paulus@samba.org, linux-ppp@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Xu Wang <vulab@iscas.ac.cn>
Date: Tue, 24 Dec 2019 09:37:04 +0000

> Passing NULL to ppp_pernet causes a crash via BUG_ON.
> Dereferencing net in net_generici() also has the same effect.
> This patch removes the redundant BUG_ON check on the same parameter.
> 
> Signed-off-by: Xu Wang <vulab@iscas.ac.cn>

Applied, thanks.
