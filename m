From: carlsonj@workingcode.com
Date: Thu, 28 Oct 2004 14:08:55 +0000
Subject: Re: ppp 2.4.3 cvs authentication issue
Message-Id: <16768.64887.665355.330103@carlson.workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20041028124517.7204.qmail@web25210.mail.ukl.yahoo.com>
In-Reply-To: <20041028124517.7204.qmail@web25210.mail.ukl.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

a b writes:
> require-mschap-v2               # (from
> /etc/ppp/options.poptop)
> refuse-pap              # (from
> /etc/ppp/options.poptop)
> refuse-chap             # (from
> /etc/ppp/options.poptop)
> refuse-mschap           # (from
> /etc/ppp/options.poptop)
> refuse-eap              # (from
> /etc/ppp/options.poptop)

For what it's worth, you likely don't need all of those options.  A
simple "auth" should do it -- and even that is not really required.
pppd automatically detects what credentials you have configured, and
will refuse authentication schemes that don't have appropriate
credentials.

This is by design.  The defaults for the configuration options are
meant to make sense for most users.  Having too many configuration
options specified is itself a symptom of a problem.

> sent [CCP ConfReq id=0x1 <mppe +H -M +S -L -D -C>]
> rcvd [CCP ConfReq id=0x1 <deflate 15> <deflate(old#)
> 15> <bsd v1 15>]
> MPPE required but peer negotiation failed

That looks like a combination of things.  MPPE obviously has a bug --
it should not have just given up there, but rather sent Configure-Nak
first.  The other thing is that the peer apparently isn't configured
to use MPPE.

-- 
James Carlson                                 <carlsonj@workingcode.com>
