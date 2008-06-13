From: Charlie Brady <charlieb-linux-ppp@budge.apana.org.au>
Date: Fri, 13 Jun 2008 18:19:04 +0000
Subject: Re: possible bug on ppp_async
Message-Id: <Pine.LNX.4.64.0806131415560.3650@e-smith.charlieb.ott.istop.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <6b53b1990806091123l74a06bebu34160ad08366d1a8@mail.gmail.com>
In-Reply-To: <6b53b1990806091123l74a06bebu34160ad08366d1a8@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


On Fri, 13 Jun 2008, Gustavo Fernando Padovan wrote:

>> The problem seems the ioctl TCSETS, with the patch (and on kernel
>> 2.6.23) it returns immediately, and on kernel 2.6.24 (without the
>> patch) it goes to tty_mode_ioctl().
>
> This patch also resolves the 'bug'. It intercepts TCSETS on
> switch(cmd) and return -ENOIOCTLCMD;
>
>
> --- a/drivers/net/ppp_async.c        2008-06-13 11:59:10.000000000 -0300
> +++ b/drivers/net/ppp_async.c     2008-06-13 11:58:34.000000000 -0300

No, that patch doesn't resolve the bug. That just avoids the bug. The bug 
is that the driver "goes silly" when passed a TCSETS cmd, and you need to 
reload the driver to make it sane again.

Aren't you curious as to why TCSETS calls are made, and why things go 
wrong when they are?
