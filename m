From: James Cameron <quozl@laptop.org>
Date: Wed, 20 Jan 2010 05:47:01 +0000
Subject: Re: pppd hangs on SIGHUP
Message-Id: <20100120054701.GM32704@us.netrek.org>
List-Id: <linux-ppp.vger.kernel.org>
References: <8D.DA.01403.892965B4@cdptpa-omtalb.mail.rr.com>
In-Reply-To: <8D.DA.01403.892965B4@cdptpa-omtalb.mail.rr.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Tue, Jan 19, 2010 at 09:34:05PM -0800, Bill Unruh wrote:
> Leslie wrote:
> >asyncmap 0
> Not needed.

Agreed, the default is zero.

> >auth
> definitely do not want.
> You do not want them to authenticate to you.

Generally true.  This might be an exception though.  And it shouldn't
have anything to do with the reported problem of connections not
persisting after a SIGHUP.

> >"" "AT"
> Try AT&F
> instead

That will have the side-effect of resetting the modem settings.  Don't
do this if you've set them carefully prior to starting pppd.

-- 
James Cameron
http://quozl.linux.org.au/
