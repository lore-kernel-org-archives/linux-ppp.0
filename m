From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Tue, 24 Dec 2019 11:42:12 +0000
Subject: Re: [PATCH] ppp: Remove redundant BUG_ON() check in ppp_pernet
Message-Id: <d3b4fbce-3349-d51d-4a2c-220ccadac506@cogentembedded.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <1577180224-16405-1-git-send-email-vulab@iscas.ac.cn>
In-Reply-To: <1577180224-16405-1-git-send-email-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Xu Wang <vulab@iscas.ac.cn>, paulus@samba.org
Cc: davem@davemloft.net, linux-ppp@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Hello!

On 12/24/2019 12:37 PM, Xu Wang wrote:

> Passing NULL to ppp_pernet causes a crash via BUG_ON.
> Dereferencing net in net_generici() also has the same effect.

   s/generici/generic/. :-)

> This patch removes the redundant BUG_ON check on the same parameter.
> 
> Signed-off-by: Xu Wang <vulab@iscas.ac.cn>
[...]

MBR, Sergei
