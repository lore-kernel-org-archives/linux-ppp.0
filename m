From: David Miller <davem@davemloft.net>
Date: Mon, 07 Feb 2011 07:28:56 +0000
Subject: Re: [BUG] 2.6.38-rc2: Circular Locking Dependency
Message-Id: <20110206.232856.246531984.davem@davemloft.net>
List-Id: <linux-ppp.vger.kernel.org>
References: <4D3D45A3.7040809@t-online.de>
In-Reply-To: <4D3D45A3.7040809@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Knut_Petersen@t-online.de
Cc: linux-kernel@vger.kernel.org, paulus@samba.org, mostrows@earthlink.net, linux-ppp@vger.kernel.org

From: Knut Petersen <Knut_Petersen@t-online.de>
Date: Mon, 24 Jan 2011 10:25:55 +0100

> As I was hunting something different I found the following (potential)
> problem on an openSuSE 11.3 system with kernel 2.6.38-rc2.
> The message is triggerd by smpppd starting a dsl connection.
> 
> Knut
> 
> 
>  NET: Registered protocol family 24
> 
>  ===========================>  [ INFO: possible circular locking dependency detected ]
>  2.6.38-rc2-kape #7
>  -------------------------------------------------------
>  pppd/2529 is trying to acquire lock:
>   (&(&pch->downl)->rlock){+.....}, at: [<f814a634>] ppp_push+0x59/0x4a8
> [ppp_generic]
> 
>  but task is already holding lock:
>   (&(&ppp->wlock)->rlock){+.-...}, at: [<f814ae1b>]
> ppp_xmit_process+0x19/0x451 [ppp_generic]
> 
>  which lock already depends on the new lock.

I've stared over this trace several times and can't figure out what
the problem is.

Paul, any idea?
