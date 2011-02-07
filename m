From: Paul Mackerras <paulus@samba.org>
Date: Mon, 07 Feb 2011 10:43:15 +0000
Subject: Re: [BUG] 2.6.38-rc2: Circular Locking Dependency
Message-Id: <20110207104315.GB17044@brick.ozlabs.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <4D3D45A3.7040809@t-online.de>
 <20110206.232856.246531984.davem@davemloft.net>
 <20110207102950.GA17044@brick.ozlabs.ibm.com>
In-Reply-To: <20110207102950.GA17044@brick.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Miller <davem@davemloft.net>
Cc: Knut_Petersen@t-online.de, linux-kernel@vger.kernel.org, mostrows@earthlink.net, linux-ppp@vger.kernel.org

On Mon, Feb 07, 2011 at 09:29:50PM +1100, Paul Mackerras wrote:

> We seem to have recursed in the ppp code because of (apparently)
> handling a softirq inside a spin_lock_bh region. :(  If I understand
> the original report correctly, the stack trace looks like this in part:
> 
>         [<c04153eb>] net_rx_action+0x3f/0xfe
>         [<c0128563>] __do_softirq+0x76/0xfd
>  -> #1 (_xmit_NETROM){+.-...}:
>         [<c01462b2>] lock_acquire+0x47/0x5e
>         [<c0471c9c>] _raw_spin_lock_irqsave+0x2e/0x3e
>         [<c040ed60>] skb_dequeue+0x12/0x4a
>         [<f814c237>] ppp_channel_push+0x2e/0x94 [ppp_generic]
> 
> So we were in ppp_channel_push, and the first thing it does is
> spin_lock_bh(&pch->downl), and then it calls skb_dequeue, which did a
> spin_lock_irqsave, and then somehow we get into __do_softirq.  I
> thought spin_lock_bh should have stopped softirqs from running?

OK, I think I have misinterpreted the lockdep info in the original
message.  If it's saying that we are trying to get ppp->rlock when we
have taken chan->downl, then that would indeed be a bug, since the lock
ordering as documented in the comments is ppp->rlock -> chan->downl.
I can't see in the code where that happens though and the lockdep
trace doesn't seem to be telling me either.

Paul.
