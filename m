From: James Carlson <carlsonj@workingcode.com>
Date: Wed, 21 May 2008 23:14:13 +0000
Subject: Re: Re: about pppd termination?
Message-Id: <18484.44229.755243.499025@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <200805211447103125311@foxmail.com>
In-Reply-To: <200805211447103125311@foxmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

James Cameron writes:
> On Wed, May 21, 2008 at 10:23:53AM -0400, James Carlson wrote:
> > pppd acts as a process group leader, and sending a signal to the
> > process group means that all children created by pppd (at least those
> > that haven't gone off to start new process groups) will get the
> > signal.  This basically cleans up any charshunt or script that might
> > be running in preparation to exit.
> 
> That reminds me.  In the pptpconfig GUI we must define a handler for
> SIGINT before starting pppd, because if we don't the SIGINT we send to
> pppd comes back to us because of "kill(0,sig)".  Why is this?  popen is
> used to activate pppd, so that output from pppd is redirected to GUI.

I'm not familiar with that GUI.  Is this a "nodetach" case?  An
alternative might be to avoid sending signals to the process group if
pppd is not actually the group leader.

pppd ought to be in charge of its progeny, but parricide doesn't sound
like the right answer.  ;-}

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
