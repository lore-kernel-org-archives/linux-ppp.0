From: James Carlson <carlsonj@workingcode.com>
Date: Thu, 22 May 2008 00:38:22 +0000
Subject: Re: Re: about pppd termination?
Message-Id: <18484.49278.193122.809540@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <200805211447103125311@foxmail.com>
In-Reply-To: <200805211447103125311@foxmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

James Cameron writes:
> On Wed, May 21, 2008 at 07:14:13PM -0400, James Carlson wrote:
> > An alternative might be to avoid sending signals to the process group
> > if pppd is not actually the group leader.
> 
> This would have the side effect of not terminating the processes that
> pppd started.  Wouldn't it be better if pppd made itself the group
> leader?

Yes ... I was just trying to understand how you got into that state.

The detach() function (as long as you don't use nodetach) should get
you into that process group leader status.

Is it possible that the signal was sent before the setsid() was done
(i.e., before IPCP went Opened)?  If so, then we might need to tweak
how the process group is managed in the special case of (at least)
updetach.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
