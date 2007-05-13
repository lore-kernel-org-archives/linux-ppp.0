From: Bill Unruh <unruh@physics.ubc.ca>
Date: Sun, 13 May 2007 11:51:08 +0000
Subject: Re: problem installing ppp
Message-Id: <Pine.LNX.4.64.0705130444480.21186@info.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <10451321.post@talk.nabble.com>
In-Reply-To: <10451321.post@talk.nabble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Sat, 12 May 2007, Oliver McBride wrote:

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

What distro are you running? As far as I know all distros have the ppp
module installed. Look for ppp_generic.ko in /lib/modules/*
find /lib/modules -name ppp_generic\*
If it is not there, you are screwed. ppp needs that module ( and ppp_async). Without it ppp
will not run. If it is there, install it using modprobe.
modprobe ppp

