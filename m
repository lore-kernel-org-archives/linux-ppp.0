From: Michael Tokarev <mjt@tls.msk.ru>
Date: Wed, 21 Jul 2004 13:47:26 +0000
Subject: Re: rename ppp interface
Message-Id: <40FE73EE.8060303@tls.msk.ru>
List-Id: <linux-ppp.vger.kernel.org>
References: <20040716095908.GA32556@suse.de>
In-Reply-To: <20040716095908.GA32556@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

James Cameron wrote:
> I'm certainly interested in the patch; in the PPTP projects we regularly
> get "change the interface name" as a wishlist request.  Can you tell me
> which kernel version range supports the ioctl?

The SIOCSIFNAME ioctl is supported for ages.  Linux `nameif' program
that uses it is very old too.  At least, linux 2.2 does support it.
All after all, error() in patch may be changed into warn().

/mjt
