From: Michal Ostrowski <mostrows@watson.ibm.com>
Date: Fri, 10 Dec 2004 13:38:35 +0000
Subject: Re: Kernel memory leak with PPPoE
Message-Id: <1102685915.4712.8.camel@brick.watson.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <87d5xi7ji9.fsf@stark.xeocode.com>
In-Reply-To: <87d5xi7ji9.fsf@stark.xeocode.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Fri, 2004-12-10 at 01:30 -0500, Greg Stark wrote:
> I'm not sure if this is the right list or perhaps linux-kernel. But I figure
> people here will at least be interested even if it's not strictly in your
> bailiwick.
> 
> The other day my ISP went down for a few days (They hadn't paid their bills to
> the ILEC, doh). I discovered that there's a kernel memory leak in the pppoe
> module somewhere.
> 
> Since there was no config option I have my pppd patched to keep retrying PPPoE
> forever rather than giving up after a few iterations. (Why do people write
> code with hard coded limitations like that anyways? argh!). 
> 

Can you try doing this another way?  When pppd fails,let pppd die and
start a new one.

My concern is that by trying to stick within one pppd process you may be
leaking something in pppd (e.g. not closing file-descriptors).  If the
leak does not occur when you run new pppd processes, then I'd be
inclined to think that it's a problem within pppd.


> After a few hours of PPPoE interface creation and teardown on PAP
> authentication failures my router box (a poor 486 with 24M of memory) started
> swapping. By the end of the first day it was swapping madly and eventually
> became totally unresponsive.
> 
> The same thing happened later after I rebooted it, except I stopped pppd
> completely. The problem did not go away. I'm pretty convinced it's a kernel
> memory leak by the fact that the machine kept swapping after pppd died. I've
> seen the same symptoms in the past too in the same circumstances (it's not a
> very reliable ISP).
> 

This is not the same thing as killing pppd every time you have a
failure.  By this point who knows what state your system is in.

> This isn't totally up to date source code, but I'm pretty sure the PPPoE
> kernel module hasn't undergone much work in the past year or so has it?
> 
> This is Linux 2.4.21 with the ppp_generic, pppox, pppoe modules. pppd version
> 2.4.2b2 which I believe I actually built from CVS sources.
> 
> I know it's suboptimal to report a bug report without reproducing it with a
> clean unpatched, preferably recent, version. However this is my router box and
> I upgrading it to linux 2.6 would be a major project (and I believe 2.4 suits
> the 486 better). And with the unpatched pppd I would have to script restarting
> pppd repeatedly (and deal with the consequences of the interface disappearing
> and reappearing) since the pppoe module has a hard coded constant number of
> retries before it aborts.
> 

You can change that if you'd like.  I just decided on something that
seemed sane.


I've looked through the 2.4.21 code, and in pppoe code there are few
allocations to begin with.   The ones that could be a leak I've verified
are not, or would only be a leak if the leak was actually in core net
code (in which case it probably would have manifested itself in other
ways and been dealt with already).

-- 
Michal Ostrowski <mostrows@watson.ibm.com>

