From: Guillaume Nault <gnault@redhat.com>
Date: Mon, 15 Mar 2021 12:18:24 +0000
Subject: Re: Re: [BUG] net/ppp: A use after free in ppp_unregister_channe
Message-Id: <20210315121824.GC4296@linux.home>
List-Id: <linux-ppp.vger.kernel.org>
References: <6057386d.ca12.1782148389e.Coremail.lyl2019@mail.ustc.edu.cn>
 <20210312101258.GA4951@katalix.com>
 <2ad7aaa2.fcad.17826e87afb.Coremail.lyl2019@mail.ustc.edu.cn>
In-Reply-To: <2ad7aaa2.fcad.17826e87afb.Coremail.lyl2019@mail.ustc.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: lyl2019@mail.ustc.edu.cn
Cc: Tom Parkin <tparkin@katalix.com>, paulus@samba.org, davem@davemloft.net, linux-ppp@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Mar 12, 2021 at 10:47:53PM +0800, lyl2019@mail.ustc.edu.cn wrote:
> 
> 
> 
> > -----原始邮件-----
> > 发件人: "Tom Parkin" <tparkin@katalix.com>
> > 发送时间: 2021-03-12 18:12:58 (星期五)
> > 收件人: lyl2019@mail.ustc.edu.cn
> > 抄送: paulus@samba.org, davem@davemloft.net, linux-ppp@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
> > 主题: Re: [BUG] net/ppp: A use after free in ppp_unregister_channe
> > 
> > Thanks for the report!
> > 
> > On  Thu, Mar 11, 2021 at 20:34:44 +0800, lyl2019@mail.ustc.edu.cn wrote:
> > > File: drivers/net/ppp/ppp_generic.c
> > > 
> > > In ppp_unregister_channel, pch could be freed in ppp_unbridge_channels()
> > > but after that pch is still in use. Inside the function ppp_unbridge_channels,
> > > if "pchbb = pch" is true and then pch will be freed.
> > 
> > Do you have a way to reproduce a use-after-free scenario?
> > 
> > From static analysis I'm not sure how pch would be freed in
> > ppp_unbridge_channels when called via. ppp_unregister_channel.
> > 
> > In theory (at least!) the caller of ppp_register_net_channel holds 
> > a reference on struct channel which ppp_unregister_channel drops.
> > 
> > Each channel in a bridged pair holds a reference on the other.
> > 
> > Hence on return from ppp_unbridge_channels, the channel should not have
> > been freed (in this code path) because the ppp_register_net_channel
> > reference has not yet been dropped.
> > 
> > Maybe there is an issue with the reference counting or a race of some
> > sort?
> > 
> > > I checked the commit history and found that this problem is introduced from
> > > 4cf476ced45d7 ("ppp: add PPPIOCBRIDGECHAN and PPPIOCUNBRIDGECHAN ioctls").
> > > 
> > > I have no idea about how to generate a suitable patch, sorry.
> 
> This issue was reported by a path-sensitive static analyzer developed by our Lab,
> thus i have not a crash or bug log.
> 
> As the return type of ppp_unbridge_channels() is a int, can we return a value to
> inform caller that the channel is freed?

I don't think this is going to improve anything, as
ppp_unregister_channel() couldn't take any corrective action anyway.
