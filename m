From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Thu, 15 Apr 2004 13:26:20 +0000
Subject: Re: PPP connect hangs at "getlogname (AUTO_PPP), read:"
Message-Id: <Pine.LNX.4.58.0404150924560.3610@localhost.localdomain>
List-Id: <linux-ppp.vger.kernel.org>
References: <Pine.LNX.4.58.0404130851580.8284@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.58.0404130851580.8284@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org



On Wed, 14 Apr 2004, James Cameron wrote:

> Robert P. J. Day wrote:
> > p.s.  i'm assuming you're suggesting building *all* of the PPP
> > components as modules?
> 
> Yes.  Here's my 2.6.2 .config, for what it's worth ...
> 
> CONFIG_PPP=m
> CONFIG_PPP_MULTILINK=y
> CONFIG_PPP_FILTER=y
> CONFIG_PPP_ASYNC=m
> CONFIG_PPP_SYNC_TTY=m
> CONFIG_PPP_DEFLATE=m
> CONFIG_PPP_BSDCOMP=m

ok, i'll give that a shot.  and to clarify what someone suggested earlier, 
we shouldn't be concerned that our user space PPP is version 2.4.1, while
the kernel code is labelled as 2.4.2, right?

someone else here just suggested downloading the 2.4.2 user space code,
but based on what i read, i thought that that wouldn't make a big 
difference.  is that a fair assessment?

rday
