From: David Miller <davem@davemloft.net>
Date: Tue, 06 Jun 2017 19:16:47 +0000
Subject: Re: [PATCH] ppp: mppe: Use vsnprintf extension %phN
Message-Id: <20170606.151647.343740453758118261.davem@davemloft.net>
List-Id: <linux-ppp.vger.kernel.org>
References: <80f51106926c82374f6555b54af71a674b8bf94e.1496665332.git.joe@perches.com>
In-Reply-To: <80f51106926c82374f6555b54af71a674b8bf94e.1496665332.git.joe@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: joe@perches.com
Cc: paulus@samba.org, linux-ppp@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Joe Perches <joe@perches.com>
Date: Mon,  5 Jun 2017 05:22:50 -0700

> Using this extension reduces the object size.
> 
> $ size drivers/net/ppp/ppp_mppe.o*
>    text	   data	    bss	    dec	    hex	filename
>    5683	    216	      8	   5907	   1713	drivers/net/ppp/ppp_mppe.o.new
>    5808	    216	      8	   6032	   1790	drivers/net/ppp/ppp_mppe.o.old
> 
> Signed-off-by: Joe Perches <joe@perches.com>

Applied to net-next, thanks Joe.
