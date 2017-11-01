From: David Miller <davem@davemloft.net>
Date: Wed, 01 Nov 2017 12:21:52 +0000
Subject: Re: [PATCH net-next] ppp: Destroy the mutex when cleanup
Message-Id: <20171101.212152.1217584341582256505.davem@davemloft.net>
List-Id: <linux-ppp.vger.kernel.org>
References: <1509445537-39319-1-git-send-email-gfree.wind@vip.163.com>
In-Reply-To: <1509445537-39319-1-git-send-email-gfree.wind@vip.163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gfree.wind@vip.163.com
Cc: paulus@samba.org, linux-ppp@vger.kernel.org, netdev@vger.kernel.org

From: gfree.wind@vip.163.com
Date: Tue, 31 Oct 2017 18:25:37 +0800

> From: Gao Feng <gfree.wind@vip.163.com>
> 
> The mutex_destroy only makes sense when enable DEBUG_MUTEX. For the
> good readbility, it's better to invoke it in exit func when the init
> func invokes mutex_init.
> 
> Signed-off-by: Gao Feng <gfree.wind@vip.163.com>

Applied.
