From: Harvey Harrison <harvey.harrison@gmail.com>
Date: Thu, 06 Jan 2011 19:07:56 +0000
Subject: Re: [PATCH] net: ppp: use {get,put}_unaligned_be{16,32}
Message-Id: <AANLkTin+pgnTs67odj2qtrMD3AzgQ+Wv43a6NbBy6G8t@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <1294306655-22033-1-git-send-email-xiaosuo@gmail.com>
In-Reply-To: <1294306655-22033-1-git-send-email-xiaosuo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Changli Gao <xiaosuo@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Paul Mackerras <paulus@samba.org>, linux-ppp@vger.kernel.org, netdev@vger.kernel.org

On Thu, Jan 6, 2011 at 1:37 AM, Changli Gao <xiaosuo@gmail.com> wrote:
> Signed-off-by: Changli Gao <xiaosuo@gmail.com>
> ---
>  drivers/net/ppp_async.c   |   10 +++++-----
>  drivers/net/ppp_deflate.c |    9 ++++-----
>  drivers/net/ppp_generic.c |    9 ++++-----
>  drivers/net/ppp_mppe.c    |    7 +++----
>  drivers/net/ppp_synctty.c |    3 ++-
>  5 files changed, 18 insertions(+), 20 deletions(-)
> diff --git a/drivers/net/ppp_async.c b/drivers/net/ppp_async.c
> index 78d70a6..cbe1e13 100644
> --- a/drivers/net/ppp_async.c
> +++ b/drivers/net/ppp_async.c
> @@ -32,6 +32,7 @@
>  #include <linux/init.h>
>  #include <linux/jiffies.h>
>  #include <linux/slab.h>
> +#include <linux/unaligned/be_struct.h>

#include <asm/unaligned.h>

Same for the other occurances, otherwise looks OK.

Harvey
