From: "Leslie Rhorer" <lrhorer@satx.rr.com>
Date: Fri, 22 Jan 2010 04:36:49 +0000
Subject: RE: pppd hangs on SIGHUP
Message-Id: <5E.76.02205.95B295B4@cdptpa-omtalb.mail.rr.com>
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
> Sent: Thursday, January 21, 2010 8:13 PM
> To: Leslie Rhorer
> Cc: 'James Carlson'; linux-ppp@vger.kernel.org
> Subject: Re: pppd hangs on SIGHUP
> 
> I must be looking at different source.  Ah, yes, I am.  You're using
> Debian patched source, I guess.  Here's what I do to compile pppd with
> debugging ...
> 
> git clone git://ozlabs.org/~paulus/ppp.git
> 
> ... then ./configure and make ... and the -g flag is already used.  You
> may be using source that has had debugging disabled.  Distribution
> source often does this.
> 
> --
> James Cameron
> http://quozl.linux.org.au/

	Thanks.  I think I got it working using the Debian source.  It
compiled with the -g option, anyway.  Right now I am running the command
under strace, and we can see what that reports during the next hang.  When
it does hang, I'll run ddb against the hung process to see what it reports,
and I can post the contents of the strace files.

