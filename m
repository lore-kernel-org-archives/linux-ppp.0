From: "Gilles Espinasse" <g.esp@free.fr>
Date: Sun, 13 May 2007 06:03:59 +0000
Subject: Re: problem installing ppp
Message-Id: <03d301c79524$7fb35950$f9b5a8c0@pii350>
List-Id: <linux-ppp.vger.kernel.org>
References: <10451321.post@talk.nabble.com>
In-Reply-To: <10451321.post@talk.nabble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


----- Original Message ----- 
From: "Oliver McBride" <mcbride_oliver@yahoo.com>
To: <linux-ppp@vger.kernel.org>
Sent: Sunday, May 13, 2007 3:11 AM
Subject: problem installing ppp


>
> im using kernel 2.6.9 and its configurations do not support PPP.
> unfortunately imnot allowed to change server config.
> i get this error while running pppd:
> This system lacks kernel support for PPP. This could be because the PPP
> kernel module could not be loaded, or because PPP was not included in the
> kernel configuration. If PPP was included as a module, try `/sbin/modprobe
> -v ppp'. If that fails, check that ppp.o exists in /lib/modules/`uname
> -r`/net. See README.linux file in the ppp distribution for more details.
>
> i want to know if i can solve this problem without changing  server
> config,for example by installing a rpm,or adding other files?
> best regards
> -- 
>
There is a kernel part that can't be installed independantly from your
kernel and a userspace part compiled from ppp sources.
Depending of your distribution, you may change the kernel package installed
for one that support ppp or you will need to recompile that kernel version
sources to accomodate your needs and hardware.

For the kernel part, you need to set ppp support on your kernel .config,
recompile, install the new compiled kernel and reboot.

Gilles

