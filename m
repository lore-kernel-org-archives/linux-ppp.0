From: James Cameron <james.cameron@hp.com>
Date: Tue, 13 Apr 2004 22:58:18 +0000
Subject: Re: PPP connect hangs at "getlogname (AUTO_PPP), read:"
Message-Id: <20040413225818.GA21157@hp.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <Pine.LNX.4.58.0404130851580.8284@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.58.0404130851580.8284@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

G'day, a different James here ...

Robert P. J. Day wrote:
> ppp async is compiled into the kernel.  but i also just noticed that
> ppp sync is there as well, i'm hoping it's not a problem to have them
> both built into the kernel.

I don't think that both being built should be a problem.  

The two PPTP projects regularly find users who have compiled the PPP
components into the kernel, yet they do not function for them unless
they are compiled as modules.  We haven't got to the bottom of this.  We
even have evidence of a few people finding it works fine built
statically.

So I would suggest building the PPP kernel components as modules, just
to see if it makes any difference.  ;-)

-- 
James Cameron                         http://quozl.netrek.org/
HP Open Source, Volunteer             http://opensource.hp.com/
PPTP Client Project, Release Engineer http://pptpclient.sourceforge.net/
