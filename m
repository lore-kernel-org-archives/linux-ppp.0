From: James Chapman <jchapman@katalix.com>
Date: Mon, 16 Jun 2008 12:53:22 +0000
Subject: Re: ppp on 2.6.18
Message-Id: <48566242.1080306@katalix.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <a1d91fa0806160536r646577e2n7099431aa934a556@mail.gmail.com>
In-Reply-To: <a1d91fa0806160536r646577e2n7099431aa934a556@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mohammed shareef <mdshareef@gmail.com>
Cc: omap <linux-omap@vger.kernel.org>, linux-ppp@vger.kernel.org

mohammed shareef wrote:
> Dear all,
> 
> i have enabled ppp services when configuring the kernel 2.6.18.
> 
> the kernel bootup  of omap5912 osk says this:
> 
> PPP generic driver version 2.4.2
> PPP Deflate Compression module registered
> PPP BSD Compression module registered
> 
> but when i type "pppd -h" in the osk console i get:
> 
> # pppd -h
> -sh: pppd: not found

You don't have the userspace pppd installed.

-- 
James Chapman
Katalix Systems Ltd
http://www.katalix.com
Catalysts for your Embedded Linux software development

