From: James Cameron <quozl@laptop.org>
Date: Thu, 10 Mar 2011 21:19:52 +0000
Subject: Re: pptponfig centos 5.4
Message-Id: <20110310211952.GB6776@us.netrek.org>
List-Id: <linux-ppp.vger.kernel.org>
References: <W6630510430284451299766958@webmail23>
In-Reply-To: <W6630510430284451299766958@webmail23>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Thu, Mar 10, 2011 at 02:22:38PM +0000, tony.chamberlain@lemko.com wrote:
> I remember one of the James's wrote pptpconfig ;-)

My name is on it.  The regret lingers on.  "PHP-GTK, why?", I ask
myself.

> I guess my main questions about centos 5.4 vs. 4.5
> 
>   1. Is there a different install method?
>   2. Should I be using
> rpm -Uvh http://pptpclient.sourceforge.net/yum/stable/fc6/pptp-release-current.noarch.rpm
> 
> or a different location to get the repository?

I don't know.

Alternatives, should you still require them ...

1.  pptpsetup is included in pptp, and is a non-GUI for achieving the
same thing as pptpconfig,

2.  Network Manager has a pptp plugin which does the same and more.

-- 
James Cameron
http://quozl.linux.org.au/
