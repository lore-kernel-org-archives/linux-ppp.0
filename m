From: "Leslie Rhorer" <lrhorer@satx.rr.com>
Date: Wed, 20 Jan 2010 05:53:19 +0000
Subject: RE: pppd hangs on SIGHUP
Message-Id: <5F.F7.01403.94A965B4@cdptpa-omtalb.mail.rr.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <8D.DA.01403.892965B4@cdptpa-omtalb.mail.rr.com>
In-Reply-To: <8D.DA.01403.892965B4@cdptpa-omtalb.mail.rr.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

> > 	I call pppd with `pppd call cricket`
> >
> > 	Active options in the /etc/ppp/options file:
> >
> > asyncmap 0
> Not needed.

	It was left as default.

> > usehostname
> not needed

	Ditto.

> > auth
> definitely do not want.
> You do not want them to authenticate to you.

	I know that, but the comment in  the default options file says:

# Please do not disable this setting. It is expected to be standard in
# future releases of pppd. Use the call option (see manpage) to disable
# authentication for specific peers.

	Which is why I left it enabled in the options file and set "noauth"
in the calling file.

> > 	Contents of /etc/ppp/chatfile
> >
> > ABORT "NO CARRIER"
> > ABORT "NO DIALTONE"
> > ABORT "ERROR"
> > ABORT "NO ANSWER"
> > ABORT "BUSY"
> > "" "AT"
> Try AT&F
> instead

	AT&F doesn't seem to do anything.  OTOH, it doesn't cause any
errors, but since pppd doesn't even spawn chat during this failure, it's
exceedingly unlikely it would make a difference.

