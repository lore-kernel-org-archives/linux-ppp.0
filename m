From: Guillaume Nault <gnault@redhat.com>
Date: Mon, 15 Mar 2021 12:04:07 +0000
Subject: Re: [BUG] net/ppp: A use after free in ppp_unregister_channe
Message-Id: <20210315120407.GB4296@linux.home>
List-Id: <linux-ppp.vger.kernel.org>
References: <6057386d.ca12.1782148389e.Coremail.lyl2019@mail.ustc.edu.cn>
 <20210312101258.GA4951@katalix.com>
In-Reply-To: <20210312101258.GA4951@katalix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tom Parkin <tparkin@katalix.com>
Cc: lyl2019@mail.ustc.edu.cn, paulus@samba.org, davem@davemloft.net, linux-ppp@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Mar 12, 2021 at 10:12:58AM +0000, Tom Parkin wrote:
> Thanks for the report!
> 
> On  Thu, Mar 11, 2021 at 20:34:44 +0800, lyl2019@mail.ustc.edu.cn wrote:
> > File: drivers/net/ppp/ppp_generic.c
> > 
> > In ppp_unregister_channel, pch could be freed in ppp_unbridge_channels()
> > but after that pch is still in use. Inside the function ppp_unbridge_channels,
> > if "pchbb = pch" is true and then pch will be freed.
> 
> Do you have a way to reproduce a use-after-free scenario?
> 
> From static analysis I'm not sure how pch would be freed in
> ppp_unbridge_channels when called via. ppp_unregister_channel.
> 
> In theory (at least!) the caller of ppp_register_net_channel holds 
> a reference on struct channel which ppp_unregister_channel drops.

Agreed: ppp_unregister_channel() is going to drop a refcount from pch
in any case. So holding a refcount on pch is a hard requirement for any
caller of ppp_unregister_channel(), regardless of the channel bridging
code.

To lyl2019: Note that this refcount is (unsurprisingly) held by calling
ppp_register_net_channel().
