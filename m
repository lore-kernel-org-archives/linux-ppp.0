From: James Carlson <carlson@workingcode.com>
Date: Tue, 13 Apr 2004 18:23:19 +0000
Subject: Re: PPP connect hangs at "getlogname (AUTO_PPP), read:"
Message-Id: <16508.12311.21903.817684@c-24-147-210-59.ne.client2.attbi.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <Pine.LNX.4.58.0404130851580.8284@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.58.0404130851580.8284@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Robert P. J. Day writes:
> as i understand it, this message represents some sort of
> incompatibilty/mismatch between the user space PPP code and the kernel
> code on the embedded system.  it has nothing to do with the server side,
> since it hasn't even got that far, is that accurate?

It's this code on the client that fails (pppd/sys-linux.c):

	/* Open an instance of /dev/ppp and connect the channel to it */
	if (ioctl(fd, PPPIOCGCHAN, &chindex) = -1) {
	    error("Couldn't get channel number: %m");
	    goto err;
	}

I botched my earlier hastily-concocted analysis, though.  It's not
doing that ioctl on the /dev/ppp driver; it's doing it on 'fd' which
is connected to the serial device.  On 2.4.x, that should be handled
in drivers/net/ppp_async.c.

So, check to see:

	- Definition of PPPIOCGCHAN used for compiling ppp_async.o and
          pppd/sys-linux.o is the same.  (Should be from a common
          <linux/if_ppp.h> include file.  Note that there's an extra
          one of these shipped helpfully with the pppd sources, and if
          that's out of step with your kernel, then you're in trouble.)

	- ppp_async.o was really compiled with this kernel and isn't
          from some other system.

	- Kernel was compiled to support ppp_async (CONFIG_PPP_ASYNC
          set to 'm' or 'y' in the 'config' file).

> i suspect it's time to just go drink heavily.  argh.

It's always time for that ...

-- 
James Carlson                                  <carlson@workingcode.com>
