From: Eric Biggers <ebiggers3@gmail.com>
Date: Wed, 23 May 2018 21:17:09 +0000
Subject: Re: [PATCH] ppp: remove the PPPIOCDETACH ioctl
Message-Id: <20180523211709.GA63112@gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20180523032958.GE658@sol.localdomain>
 <20180523035952.25768-1-ebiggers3@gmail.com>
 <20180523135708.GB1569@alphalink.fr>
 <20180523.115636.2241611659399097483.davem@davemloft.net>
In-Reply-To: <20180523.115636.2241611659399097483.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Miller <davem@davemloft.net>
Cc: g.nault@alphalink.fr, linux-ppp@vger.kernel.org, paulus@samba.org, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, ebiggers@google.com

On Wed, May 23, 2018 at 11:56:36AM -0400, David Miller wrote:
> From: Guillaume Nault <g.nault@alphalink.fr>
> Date: Wed, 23 May 2018 15:57:08 +0200
> 
> > I'd rather add
> > +	if (cmd = PPPIOCDETACH) {
> > +		err = -EINVAL;
> > +		goto out;
> > +	}
> > 
> > Making PPPIOCDETACH unknown to ppp_generic means that the ioctl would
> > be handled by the underlying channel when pf->kind = CHANNEL (see the
> > chan->ops->ioctl() call further down). That shouldn't be a problem per
> > se, but even though PPPIOCDETACH is unsupported, I feel that it should
> > remain a ppp_generic thing. I don't really want its value to be reused
> > for other purposes in the future or have different behaviour depending
> > on the underlying channel.
> > 
> > Also PPPIOCDETACH can already fail with -EINVAL. Therefore, if ever
> > there really were programs out there using this call, they'd already
> > have to handle this case. Unconditionally returning -EINVAL would
> > further minimise possibilities for breakage.
> 
> I agree.

Okay, I'll do that and leave the ioctl number reserved.
I will add a pr_warn_once() too.

Thanks,

- Eric
