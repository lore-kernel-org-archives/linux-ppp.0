From: Warren Turkal <wt@penguintechs.com>
Date: Mon, 07 Nov 2005 22:47:57 +0000
Subject: Re: linux ppp problem
Message-Id: <200511071647.57838.wt@penguintechs.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <200511070400.34908.wt@penguintechs.com>
In-Reply-To: <200511070400.34908.wt@penguintechs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Monday 07 November 2005 04:37 pm, James Cameron wrote:
> I've also seen something like this on 2.6.13.4 using a CDMA modem on

I just noticed that the old pppd process is still up, and I can't poff it. I 
think the ttyACM0 device is still held open by this pppd process, and that 
may be what causes udev to allocate ttyACM1 instead.

wt
