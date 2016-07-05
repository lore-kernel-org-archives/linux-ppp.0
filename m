From: Cong Wang <xiyou.wangcong@gmail.com>
Date: Tue, 05 Jul 2016 17:59:55 +0000
Subject: Re: Problem: BUG_ON hit in ppp_pernet() when re-connect after changing shared key on LAC
Message-Id: <CAM_iQpVyNghNJHES5-npZgYGFXps0-XTwJyJ-9pLDAuYJ_syWw@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <7fabf4defe2f468bbcc829247de956c0@svr-chch-ex1.atlnz.lc>
In-Reply-To: <7fabf4defe2f468bbcc829247de956c0@svr-chch-ex1.atlnz.lc>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Bennett <Matt.Bennett@alliedtelesis.co.nz>
Cc: "linux-ppp@vger.kernel.org" <linux-ppp@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "g.nault@alphalink.fr" <g.nault@alphalink.fr>

On Mon, Jul 4, 2016 at 7:50 PM, Matt Bennett
<Matt.Bennett@alliedtelesis.co.nz> wrote:
> Using printk I have confirmed that ppp_pernet() is called from
> ppp_connect_channel() when the BUG occurs (i.e. pch->chan_net is NULL).
>
> This behavior appears to have been introduced in commit 1f461dc ("ppp:
> take reference on channels netns").

We have some race condition here, where a parallel ppp_unregister_channel()
could happen while we are in ppp_connect_channel().

We need some synchronization for them. I am not sure what is the right lock
here since ppp locking looks crazy.
