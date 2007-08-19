From: Paul Mackerras <paulus@samba.org>
Date: Sun, 19 Aug 2007 03:35:37 +0000
Subject: Re: [patch 03/14] be sure to close /dev/ppp when reconnecting
Message-Id: <18119.47753.170059.765070@cargo.ozlabs.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20070819014009.015076277@bongo.bofh.it>
In-Reply-To: <20070819014009.015076277@bongo.bofh.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Marco d'Itri writes:

> From: Simon Peter <dn.tlp@gmx.net>
> Subject: [patch 03/14] Bug#306261: pppd does not properly close /dev/ppp on persist
> 
> When using the kernel PPPoE driver, pppd never
> closes /dev/ppp when the link has come down.

If that's true, I'd rather find out where it should be closing things
but isn't.

> It opens superfluous fds to the device each time it re-opens the
> connection, with the unclosed ones falsely reported always ready for
> data by select().
> 
> This makes pppd eat up 100% CPU time after the first persist because of
> the always instantly returning select() on the unclosed fds.

I use pppd with the kernel pppoe driver and persist mode and I have
never seen this problem, so there must be more to it than this.

Paul.
