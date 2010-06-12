From: James Carlson <carlsonj@workingcode.com>
Date: Sat, 12 Jun 2010 21:28:11 +0000
Subject: Re: PPPoE mutiple session issue.
Message-Id: <4C13FBEB.103@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <AANLkTik_K8aDmuoNjCkKNWoS5bx6kokZCagmzzw5pxcW@mail.gmail.com>
In-Reply-To: <AANLkTik_K8aDmuoNjCkKNWoS5bx6kokZCagmzzw5pxcW@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 6/12/2010 1:15 AM, arun b wrote:
> Thank you for the detaild response....
> as I mentioned before..
> I want to run multiple pppd sessions which results in interface (ppp0,
> ppp1, ppp2......).
> well the connectivity is... as below
> the hardware I am using is connected to pc with ethernet crosscable.
> on pc i run  - pppoe-server
>        sudo pppoe-server -I eth0:0 -R 10.0.0.2
> 
> on my hardware, which is a client,  pppd is executed.
>   pppd eth0 user xxxx passwordd dddd
> 
> though i am able to create mutlipel interfaces . i am not be able to
> commuicte over all insted..
> 
> 
> I guess these is due to same server -IP :(

If you can't give us detailed information, there's likely to be little
that anyone can do to help you.  Any details you care to share would be
appreciated -- "netstat -nr" output, packet traces (as I requested last
time), debug output, et cetera.

My understanding is that pppoe-server will not hand out the same IP
address to each connection, so that shouldn't be the problem you're
having.  But, yes, if you did have conflicting addresses on the links,
then you'd have a problem.

However, it's impossible to determine what sort of problem you might be
having if you won't provide details.  We just can't see your computer
from here.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
