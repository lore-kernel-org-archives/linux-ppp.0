From: Bill Unruh <unruh@physics.ubc.ca>
Date: Wed, 06 Oct 2004 22:13:51 +0000
Subject: Re: PPP getting timeout on IPCP config requests on new FC3t2 box
Message-Id: <Pine.LNX.4.58.0410061510210.17146@string.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <Pine.LNX.4.60.0410061642580.14152@dell.enoriver.com>
In-Reply-To: <Pine.LNX.4.60.0410061642580.14152@dell.enoriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Wed, 6 Oct 2004, Robert P. J. Day wrote:

> 
>    for quite some time, we've been able to connect to a fedora code 2 
> box running an mgetty on /dev/ttyS0.  just today, i set up a fedora 
> core 3 test 2 (FC3t2) box, and reproduced, as closely as possible, the 
> dial-in PPP environment.
> 
>    that is, i edited

Of course how you edited them is unknown to us.


> 
>  	/etc/inittab
>  	/etc/mgetty+sendfax/
>  		login.config
>  		mgetty.config

You should also have edited /etc/ppp/options and put in the debug
option, and /etc/syslog.conf and put in a line like
daemon.*;local2.*		/var/log/daemonlog

and then done 
killall -1 syslogd


> 
> and made the same changes to the new FC3t2 box that were on the older 
> FC2t3 box.  (the older box has ppp-2.4.1, and the newer has 
> ppp.2.4.2).

How in the world are we to know what you actually had. 


> 
>    now, trying to connect to the new box gives me, in the 
> /var/log/messages file:

on which machine? On the FC3 machine which is actin as the host or on
the originating machine?

> 
> Oct  6 16:40:55 localhost pppd[2609]: pppd 2.4.2 started by a_ppp, uid 
> 0
> Oct  6 16:40:55 localhost kernel: PPP generic driver version 2.4.2
> Oct  6 16:40:55 localhost pppd[2609]: Using interface ppp0
> Oct  6 16:40:55 localhost pppd[2609]: Connect: ppp0 <--> /dev/ttyS0
> Oct  6 16:40:56 localhost udev[2821]: creating device node '/dev/ppp'
> Oct  6 16:40:58 localhost kernel: PPP Deflate Compression module 
> registered
> Oct  6 16:40:58 localhost pppd[2609]: Deflate (15) compression enabled
> Oct  6 16:41:05 localhost sshd(pam_unix)[2860]: session opened for 
> user root by root(uid=0)
> Oct  6 16:41:32 localhost pppd[2609]: IPCP: timeout sending 
> Config-Requests

This is very very unhelpful. YOu need that debug option.


> Oct  6 16:41:32 localhost pppd[2609]: Connection terminated.
> Oct  6 16:41:32 localhost pppd[2609]: Exit.
> 
> 
>     i'm not sure if there's something i've missed in the configuration. 
> i didn't install *everything* on the newer box, due to cramped disk 
> space.  so is there a software RPM i might have forgotten?  some file 
> i overlooked?
> 
>    thoughts on what to check?  thanks.

www.theory.physics.ubc.ca/ppp-linux.html
for debugging help.
