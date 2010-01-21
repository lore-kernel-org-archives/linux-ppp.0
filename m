From: "Leslie Rhorer" <lrhorer@satx.rr.com>
Date: Thu, 21 Jan 2010 02:20:23 +0000
Subject: RE: pppd hangs on SIGHUP
Message-Id: <5B.72.01403.ED9B75B4@cdptpa-omtalb.mail.rr.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <8D.DA.01403.892965B4@cdptpa-omtalb.mail.rr.com>
In-Reply-To: <8D.DA.01403.892965B4@cdptpa-omtalb.mail.rr.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org



> -----Original Message-----
> From: linux-ppp-owner@vger.kernel.org [mailto:linux-ppp-
> owner@vger.kernel.org] On Behalf Of James Carlson
> Sent: Wednesday, January 20, 2010 6:26 AM
> To: Leslie Rhorer
> Cc: linux-ppp@vger.kernel.org
> Subject: Re: pppd hangs on SIGHUP
> 
> Leslie Rhorer wrote:
> > nothing whatsoever.  The only way (of which I know) to release the
> terminal
> > (/cev/ttyACM0) is to send a SIGKILL.  After doing so, /dev/ttyACM0 is
> > released, and I can use a utility such as minicom to access the modem.
> I
> > can dial out and get a carrier.  I can see the ppp authentication
> request
> > from the ISP.  What I cannot do, however, is get pppd to come back up.
> If I
> > start pppd again, it opens the /dev/ttyACM0 device and creates the
> lockfile,
> > but it does not attempt to run chat or evidently do anything else other
> than
> > refresh the lockfile if it is stale.  My only option at that point is to
> 
> If you attach a debugger to it, can you find out where it's stuck?  (Or
> at least run "pstack `pgrep pppd`"?)

	I'll try  that.  Right now the system is in the middle of a 72 hour
test, but after that I'll force a hang and see what I get.


> The symptoms sound like a kernel bug, but it's hard to tell.

