From: Jay Nitikman <jay@permeable.com>
Date: Mon, 14 Nov 2005 13:20:49 +0000
Subject: Re: ioctl(ppp_dev_fd, PPPIOCSCOMPRESS, (caddr_t) &data) fails
Message-Id: <43788F31.6050409@permeable.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <43762E6B.5020108@permeable.com>
In-Reply-To: <43762E6B.5020108@permeable.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

I finally got it to work with modules.  I found conflicting module 
information online, but the following works for me:

Compiled in Kernel: PPP
Kernel Module: PPP-MPPE, SHA1, SHA256, SHA512, ARC4

Set "mpppe stateless" in options.pptp

It really worked for six months with PPP-MPPE compiled into the kernel.

Thanks,

James Cameron wrote:
> Try it as a module?  I've never got it to work statically compiled.
> 

-- 
-----------------
Jay Nitikman
jay@permeable.com
-----------------
