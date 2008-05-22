From: Paul Mackerras <paulus@samba.org>
Date: Thu, 22 May 2008 00:38:39 +0000
Subject: Re: Re: about pppd termination?
Message-Id: <18484.49295.166752.468897@cargo.ozlabs.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <200805211447103125311@foxmail.com>
In-Reply-To: <200805211447103125311@foxmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

James Cameron writes:

> That reminds me.  In the pptpconfig GUI we must define a handler for
> SIGINT before starting pppd, because if we don't the SIGINT we send to
> pppd comes back to us because of "kill(0,sig)".  Why is this?  popen is
> used to activate pppd, so that output from pppd is redirected to GUI.

Because pppd does kill_my_pg when it gets a SIGTERM, SIGINT or SIGHUP
even if it hasn't detached, and it probably shouldn't.  Calling
kill_my_pg is the right thing to do if pppd has detached, because then
it has done a setsid.  But if it hasn't detached, then any signal sent
to the process group will get to any connector/disconnector processes
that are running anyway.  There does still remain the question of how
pppd gets any connector/disconnector processes to stop if pppd has to
terminate for other reasons, such as getting a SIGSEGV, though.

Paul.
