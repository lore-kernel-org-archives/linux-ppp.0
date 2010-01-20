From: James Carlson <carlsonj@workingcode.com>
Date: Wed, 20 Jan 2010 12:25:58 +0000
Subject: Re: pppd hangs on SIGHUP
Message-Id: <4B56F656.70407@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <8D.DA.01403.892965B4@cdptpa-omtalb.mail.rr.com>
In-Reply-To: <8D.DA.01403.892965B4@cdptpa-omtalb.mail.rr.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Leslie Rhorer wrote:
> nothing whatsoever.  The only way (of which I know) to release the terminal
> (/cev/ttyACM0) is to send a SIGKILL.  After doing so, /dev/ttyACM0 is
> released, and I can use a utility such as minicom to access the modem.  I
> can dial out and get a carrier.  I can see the ppp authentication request
> from the ISP.  What I cannot do, however, is get pppd to come back up.  If I
> start pppd again, it opens the /dev/ttyACM0 device and creates the lockfile,
> but it does not attempt to run chat or evidently do anything else other than
> refresh the lockfile if it is stale.  My only option at that point is to

If you attach a debugger to it, can you find out where it's stuck?  (Or
at least run "pstack `pgrep pppd`"?)

The symptoms sound like a kernel bug, but it's hard to tell.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
