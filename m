From: Denys Fedoryschenko <denys@visp.net.lb>
Date: Tue, 20 Oct 2009 11:36:49 +0000
Subject: Re: kernel panic in latest vanilla stable, while using nameif with  "alive" pppoe interfaces
Message-Id: <200910201436.50249.denys@visp.net.lb>
List-Id: <linux-ppp.vger.kernel.org>
References: <200910190002.39937.denys@visp.net.lb> <200910200308.57381.denys@visp.net.lb> <aa79d98a0910192004g43de90d5p823293b888cf0c1d@mail.gmail.com>
In-Reply-To: <aa79d98a0910192004g43de90d5p823293b888cf0c1d@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Cyrill Gorcunov <gorcunov@gmail.com>
Cc: Michal Ostrowski <mostrows@gmail.com>, Eric Dumazet <eric.dumazet@gmail.com>, netdev <netdev@vger.kernel.org>, linux-ppp@vger.kernel.org, paulus@samba.org, mostrows@earthlink.net

On Tuesday 20 October 2009 06:04:35 Cyrill Gorcunov wrote:
> On 10/20/09, Denys Fedoryschenko <denys@visp.net.lb> wrote:
> > On Tuesday 20 October 2009 00:22:39 Michal Ostrowski wrote:
> >> I'm assuming that there was a race in us sending patches at nearly the
> >> same
> >> time I'm convinced now that the flush_lock can die, and the patch I sent
> >> out kills it.
> >
> > o_O
> >
> > I am drowning in patches. Just let me know which one to test :-)
>
> Oh ;) Try out latest Michal's patch (and then mine). I'll continue
> digg this issue at next spare time slot. Thanks!
Tried your patch, panic almost immediately
Here is a text of panic message over netconsole
http://www.nuclearcat.com/files/panic_pppoe3.txt
It is  different now, before it was pppoe_device_event, now in pppoe_rcv

