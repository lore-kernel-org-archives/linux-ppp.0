From: Alexey Osipov <simba@lerlan.ru>
Date: Thu, 19 Jan 2012 23:28:16 +0000
Subject: Re: Single core gets pegged on multi-core PPTP server
Message-Id: <1327015696.4513.6.camel@dahari>
List-Id: <linux-ppp.vger.kernel.org>
References: <CAJuWrdtDgeCOSEvD-ytfwGj4UQeOtjeqUZd3Y1SLpbbsSvrycg@mail.gmail.com>
	 <CAFnNQmy8yDVuAToaxfi4BA3wSU4mvhJ22O3KdBjn=vtSL-zvLg@mail.gmail.com>
In-Reply-To: <CAFnNQmy8yDVuAToaxfi4BA3wSU4mvhJ22O3KdBjn=vtSL-zvLg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Emanuil Hristov <int986@gmail.com>
Cc: paulus@samba.org, linux-ppp@vger.kernel.org, netdev@vger.kernel.org, Bradley Peterson <despite@gmail.com>

Hi,

AFAIK, accel-ppp != accel-pptp.

accel-pptp - kernel module for speed-up pptp processing done by pppd.

accel-ppp - entirely new implementation of ppp written from scratch. No
pppd is used in this case.

So, if in your configuration, you need to use some other plugins for
pppd, you can't just switch from accel-pptp to accel-ppp, because
accel-ppp have it's own plugin API.

Regards,
Alexey.

В Птн, 20/01/2012 в 00:55 +0200, Emanuil Hristov пишет:
> Hi,
> try with more recent version of accel-ppp (1.5 is lastest) and newer
> kernel - there
> are several critical bugs in older kernels
> 
> 
> P.S the project accel-pptp has changed its name to accel-ppp
> 
> cheers
> 
> On Fri, Jan 20, 2012 at 12:35 AM, Bradley Peterson <despite@gmail.com> wrote:
> > Hello,
> >
> > I am trying to test the capacity of a linux PPTP server, both in
> > number of connections, and in packets per second.  I am using kernel
> > 2.6.38.8, with the ppp, pptp, and gre modules, and accel-pptp 0.8.3.
> > I have RPS, RFS, and XPS enabled on the network devices for SMP
> > support.
> >
> > But I'm seeing one CPU get pegged out with soft interrupt, while the
> > others are almost completely idle.
> >
> > In my current test, I'm starting 250 pptp connections from another
> > server, then running iperf across each connection.  The client machine
> > pegs out, sure, but I'm surprised the server pegs out a single CPU.
> > With RPS, I would expect softirq's to be more balanced.
> >
> > Where could the bottleneck be?  Do all ppp packets need to be
> > processed serially?
> >
> > Brad
> > --
> > To unsubscribe from this list: send the line "unsubscribe netdev" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> --
> To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


