From: tony.chamberlain@lemko.com
Date: Fri, 11 Mar 2011 03:09:19 +0000
Subject: Re:  pptponfig centos 5.4
Message-Id: <W128383271048081299812959@webmail27>
List-Id: <linux-ppp.vger.kernel.org>
References: <W6630510430284451299766958@webmail23>
In-Reply-To: <W6630510430284451299766958@webmail23>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Yeah I did pptpsetup -whatever (i put all the parameters in and called the
connection "hill"  Then I did "pppd call hill".  That connected, set up
my IP and routes and I had ppp connections for a few minutes (5 or so) but 
then it would disconnect again

  

-----Original Message-----
From: James Cameron [mailto:quozl@laptop.org]
Sent: Thursday, March 10, 2011 03:19 PM
To: linux-ppp@vger.kernel.org
Subject: Re: pptponfig centos 5.4

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
--
To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html



