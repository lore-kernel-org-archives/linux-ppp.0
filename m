From: Guillaume Nault <gnault@redhat.com>
Date: Mon, 15 Mar 2021 11:50:58 +0000
Subject: Re: [BUG] net/ppp: A use after free in ppp_unregister_channe
Message-Id: <20210315115058.GA4296@linux.home>
List-Id: <linux-ppp.vger.kernel.org>
References: <6057386d.ca12.1782148389e.Coremail.lyl2019@mail.ustc.edu.cn>
In-Reply-To: <6057386d.ca12.1782148389e.Coremail.lyl2019@mail.ustc.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lyl2019@mail.ustc.edu.cn
Cc: paulus@samba.org, davem@davemloft.net, linux-ppp@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Tom Parkin <tparkin@katalix.com>

On Thu, Mar 11, 2021 at 08:34:44PM +0800, lyl2019@mail.ustc.edu.cn wrote:
> File: drivers/net/ppp/ppp_generic.c
> 
> In ppp_unregister_channel, pch could be freed in ppp_unbridge_channels()
> but after that pch is still in use. Inside the function ppp_unbridge_channels,
> if "pchbb = pch" is true and then pch will be freed.

No. It's freed only if if the refcount drops to 0. And the caller of
ppp_unregister_channel() must hold its own refcount. So
ppp_unbridge_channels() is not going to drop the last refcount in this
case.

> I checked the commit history and found that this problem is introduced from
> 4cf476ced45d7 ("ppp: add PPPIOCBRIDGECHAN and PPPIOCUNBRIDGECHAN ioctls").

Next time, please also Cc. the author of the patch.

> I have no idea about how to generate a suitable patch, sorry.

There's no patch to send as far as I can see.
