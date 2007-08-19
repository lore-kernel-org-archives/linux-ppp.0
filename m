From: Paul Mackerras <paulus@samba.org>
Date: Sun, 19 Aug 2007 23:45:40 +0000
Subject: Re: [patch 02/14] always create a new process group
Message-Id: <18120.54820.721493.224065@cargo.ozlabs.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20070819014008.913828746@bongo.bofh.it>
In-Reply-To: <20070819014008.913828746@bongo.bofh.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Charlie Brady writes:

> The return value from setsid is not checked, so I don't see the problem 
> here. After the call, the pppd process is the leader of a process group 
> (whether it was before or not), which is what we want.

That's true, but it also means that pppd won't get the SIGINT if the
user types ^C, which is not what we want either.

> > There is a reason why the setsid in detach() is only done
> > after forking.
> 
> To be clear, what is that reason?

The child process won't be a process group leader, therefore the
setsid will succeed.

Paul.
