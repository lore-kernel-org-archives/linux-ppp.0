From: Charlie Brady <charlieb-linux-ppp@budge.apana.org.au>
Date: Sun, 19 Aug 2007 16:22:05 +0000
Subject: Re: [patch 02/14] always create a new process group
Message-Id: <Pine.LNX.4.64.0708191217150.23139@e-smith.charlieb.ott.istop.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20070819014008.913828746@bongo.bofh.it>
In-Reply-To: <20070819014008.913828746@bongo.bofh.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


On Sun, 19 Aug 2007, Paul Mackerras wrote:

> Marco d'Itri writes:
>
>> pppd sends signals to the whole process group, so it must always create
>> a new one or it may kill the parent process and its siblings.
>> Currently setsid() is not called when the updetach option is used.
>> We want to make the detached and non-detached code paths as similar as
>> possible.
>
> I know there is a problem here but I don't think this patch is the
> right solution, because setsid fails and does nothing if the process
> is a process group leader, which it usually will be when run from a
> shell.

The return value from setsid is not checked, so I don't see the problem 
here. After the call, the pppd process is the leader of a process group 
(whether it was before or not), which is what we want.

> There is a reason why the setsid in detach() is only done
> after forking.

To be clear, what is that reason?

