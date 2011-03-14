From: tony.chamberlain@lemko.com
Date: Mon, 14 Mar 2011 13:05:26 +0000
Subject: Re:  pptponfig centos 5.4
Message-Id: <W769127617248921300107926@webmail37>
List-Id: <linux-ppp.vger.kernel.org>
References: <W6630510430284451299766958@webmail23>
In-Reply-To: <W6630510430284451299766958@webmail23>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Using the Windows pptp when I connect it allows the remote host to set
my routes for the PPTP vpn.  Is there a way to do this in Linux too?
If I want to make a general tool to connect I would like to use it in
/etc/ppp/ip-up.local.  For instance, in one connection I want to do

     ip route replace 10.0.0.0/8 dev ppp0

but in another connection I want to do

     ip route replace 192.168.0.0/24 dev ppp0

I'd like to make a generic thing that would always set the correct route
(best thing to let the VPN server set my routes).  I suppose I could make
an interface and look up the tunnel in a text file and return the routes
but that is an extra step.

Tony


-----Original Message-----
From: James Cameron [mailto:quozl@laptop.org]
Sent: Thursday, March 10, 2011 04:19 PM
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



