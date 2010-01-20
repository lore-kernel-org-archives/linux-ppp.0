From: "Leslie Rhorer" <lrhorer@satx.rr.com>
Date: Wed, 20 Jan 2010 06:10:22 +0000
Subject: RE: pppd hangs on SIGHUP
Message-Id: <FE.54.19307.84E965B4@cdptpa-omtalb.mail.rr.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <8D.DA.01403.892965B4@cdptpa-omtalb.mail.rr.com>
In-Reply-To: <8D.DA.01403.892965B4@cdptpa-omtalb.mail.rr.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

> -----Original Message-----
> From: quozl@us.netrek.org [mailto:quozl@us.netrek.org] On Behalf Of James
> Cameron
> Sent: Tuesday, January 19, 2010 11:43 PM
> To: Leslie Rhorer
> Cc: linux-ppp@vger.kernel.org
> Subject: Re: pppd hangs on SIGHUP
> 
> Sounds normal.

	Normal that one cannot load and run pppd?  I see no way in which
that could ever be construed as "normal".

>  What do you have set for parameters holdoff and maxfail?

	Both are default.  I suppose I could increase the holdoff parameter.

> Perhaps you need non-default values.  Ten is the default on my Debian
> system for maxfail, which means your method would work ten times.

	From the man page (emphasis mine):

maxfail n
              Terminate after n CONSECUTIVE FAILED connection attempts.  A
value of 0 means no limit.  The default value is 10.

	First of all, it would make no sense at all for the system to
terminate after ten successful attempts.  Secondly, it has never made it to
ten consecutive attempts, failed or otherwise.  Finally, it isn't failing
after even a single connection attempt.  It just hangs before even making
the attempt after what should be a graceful disconnect.

	I do wonder, though, if I set the maxconnect value to some
moderately large value, rather than issuing an external SIGHUP, if pppd will
like it better?  With the persist directive in place, will pppd exit
altogether, or will it terminate the connection and redial?

