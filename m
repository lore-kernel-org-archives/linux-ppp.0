From: Emanuil Hristov <int986@gmail.com>
Date: Thu, 19 Jan 2012 22:55:36 +0000
Subject: Re: Single core gets pegged on multi-core PPTP server
Message-Id: <CAFnNQmy8yDVuAToaxfi4BA3wSU4mvhJ22O3KdBjn=vtSL-zvLg@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <CAJuWrdtDgeCOSEvD-ytfwGj4UQeOtjeqUZd3Y1SLpbbsSvrycg@mail.gmail.com>
In-Reply-To: <CAJuWrdtDgeCOSEvD-ytfwGj4UQeOtjeqUZd3Y1SLpbbsSvrycg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Bradley Peterson <despite@gmail.com>
Cc: paulus@samba.org, linux-ppp@vger.kernel.org, netdev@vger.kernel.org, int986@gmail.com

Hi,
try with more recent version of accel-ppp (1.5 is lastest) and newer
kernel - there
are several critical bugs in older kernels


P.S the project accel-pptp has changed its name to accel-ppp

cheers

On Fri, Jan 20, 2012 at 12:35 AM, Bradley Peterson <despite@gmail.com> wrot=
e:
> Hello,
>
> I am trying to test the capacity of a linux PPTP server, both in
> number of connections, and in packets per second. =A0I am using kernel
> 2.6.38.8, with the ppp, pptp, and gre modules, and accel-pptp 0.8.3.
> I have RPS, RFS, and XPS enabled on the network devices for SMP
> support.
>
> But I'm seeing one CPU get pegged out with soft interrupt, while the
> others are almost completely idle.
>
> In my current test, I'm starting 250 pptp connections from another
> server, then running iperf across each connection. =A0The client machine
> pegs out, sure, but I'm surprised the server pegs out a single CPU.
> With RPS, I would expect softirq's to be more balanced.
>
> Where could the bottleneck be? =A0Do all ppp packets need to be
> processed serially?
>
> Brad
> --
> To unsubscribe from this list: send the line "unsubscribe netdev" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
