From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Tue, 13 Apr 2004 18:53:29 +0000
Subject: Re: PPP connect hangs at "getlogname (AUTO_PPP), read:"
Message-Id: <Pine.LNX.4.58.0404131440040.8463@localhost.localdomain>
List-Id: <linux-ppp.vger.kernel.org>
References: <Pine.LNX.4.58.0404130851580.8284@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.58.0404130851580.8284@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

man, this is getting tedious, my apologies to everyone on the list.
argh.

On Tue, 13 Apr 2004, James Carlson wrote:

> It's this code on the client that fails (pppd/sys-linux.c):
> 
> 	/* Open an instance of /dev/ppp and connect the channel to it */
> 	if (ioctl(fd, PPPIOCGCHAN, &chindex) = -1) {
> 	    error("Couldn't get channel number: %m");
> 	    goto err;
> 	}

yup, i already found that and was trying to figure out if there was
something obvious that was dying.
 
> I botched my earlier hastily-concocted analysis, though.  It's not
> doing that ioctl on the /dev/ppp driver; it's doing it on 'fd' which
> is connected to the serial device.  On 2.4.x, that should be handled
> in drivers/net/ppp_async.c.
> 
> So, check to see:
> 
> 	- Definition of PPPIOCGCHAN used for compiling ppp_async.o and
>           pppd/sys-linux.o is the same.  (Should be from a common
>           <linux/if_ppp.h> include file.  Note that there's an extra
>           one of these shipped helpfully with the pppd sources, and if
>           that's out of step with your kernel, then you're in trouble.)

in the kernel source tree, we have the file include/linux/if_ppp.h, 
containing: 
  ...
  *  =FILEVERSION 20000724=
  ...
  #define PPPIOCGCHAN  _IOR('t', 55, int)  /* get ppp channel number */
  ...

in the ppp-2.4.1 source, also in the file include/linux/if_ppp.h, we
have:
  ...
  *  =FILEVERSION 20000724=
  ...
  #define PPPIOCGCHAN  _IOR('t', 55, int)  /* get ppp channel number */
  ...

no obvious mismatch there.
 
> 	- ppp_async.o was really compiled with this kernel and isn't
>           from some other system.
> 
> 	- Kernel was compiled to support ppp_async (CONFIG_PPP_ASYNC
>           set to 'm' or 'y' in the 'config' file).

ppp async is compiled into the kernel.  but i also just noticed that
ppp sync is there as well, i'm hoping it's not a problem to have them
both built into the kernel.

again, i'm baffled.  this started out as such a simple exercise ...

rday
