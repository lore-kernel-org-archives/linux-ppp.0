From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Tue, 13 Apr 2004 23:10:02 +0000
Subject: Re: PPP connect hangs at "getlogname (AUTO_PPP), read:"
Message-Id: <Pine.LNX.4.58.0404131907380.29193@localhost.localdomain>
List-Id: <linux-ppp.vger.kernel.org>
References: <Pine.LNX.4.58.0404130851580.8284@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.58.0404130851580.8284@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org



On Wed, 14 Apr 2004, James Cameron wrote:

> G'day, a different James here ...

ok, i think i can handle more than one. :-)
 
> Robert P. J. Day wrote:
> > ppp async is compiled into the kernel.  but i also just noticed that
> > ppp sync is there as well, i'm hoping it's not a problem to have them
> > both built into the kernel.
> 
> I don't think that both being built should be a problem.  
> 
> The two PPTP projects regularly find users who have compiled the PPP
> components into the kernel, yet they do not function for them unless
> they are compiled as modules.  We haven't got to the bottom of this.  We
> even have evidence of a few people finding it works fine built
> statically.
> 
> So I would suggest building the PPP kernel components as modules, just
> to see if it makes any difference.  ;-)

ok, i can do that.  i'm about to head out for food, but i'm prepared to 
spend some time later or tomorrow doing whatever debugging people want to 
suggest.  this is really pretty important for our project, so i 
desperately need a solution.

rday

p.s.  i'm assuming you're suggesting building *all* of the PPP components
as modules?
