From: David Corbin <dcorbin@machturtle.com>
Date: Tue, 19 Jul 2005 11:58:02 +0000
Subject: Re: auth eap
Message-Id: <200507190758.02654.dcorbin@machturtle.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <200507190713.53851.dcorbin@machturtle.com>
In-Reply-To: <200507190713.53851.dcorbin@machturtle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Tuesday 19 July 2005 07:36 am, James Carlson wrote:
> David Corbin writes:
> > I'm trying to get a PPTP tunnel running (on a gentoo client).  The tunnel
> > tries to start, but then fails.  At the end is my output from attempting
> > to diagnose the failure.
> >
> > >From the "No auth is possible", and the "auth eap", I assume there is a
> >
> > problem with the way something is built on my system, but I can find very
> > little useful information about 'eap'.
>
> The "no auth is possible" message means that there are no valid
> credentials for the protocol requested by the peer (nothing usable in
> the various /etc/ppp/*_secrets files), so there's no point even trying
> to authenticate.
>
> EAP (Extensible Authentication Protocol) is somewhat like a transport
> protocol.  It can carry any of a wide range of "authentication
> methods" -- what you might call protocols.
>
> In the current ppp-2.4 sources, there's support for the RFC-required
> MD5-Challenge (using /etc/ppp/chap-secrets) and draft SRP-SHA1 (using
> /etc/ppp/srp-secrets) methods.
>
> Thus "no auth is possible" message means that the pppd didn't find any
> usable keys in either location, meaning that no known EAP methods are
> usable, and the peer's request for EAP itself can't be satisfied.

>
> Since you're using Microsoft's proprietary PPTP, adding keys to those
> files probably won't help.  Your peer is likely planning to insist on
> one of the many proprietary EAP methods that pppd doesn't currently
> support, and will also require MPPE key exchange for use with tunnel
> encryption.
>
> To find out which EAP method is needed, you could either ask the
> person who owns that peer system, or set up some temporary credentials
> in /etc/ppp/chap-secrets and find out what EAP method the peer
> requests.  When it's not one that's implemented by pppd (almost a
> certainty), you'll need to go off and find code (a patch) that does
> this for you, or implement it yourself.


But I have /etc/ppp/chap-secrets, with a line like this (appropriate 
substituions apply).

$DOMAIN\\$USERNAME PPTP $PASSWORD *

So, I'm not sure what you by "temporary credentials"

>
> It might be easier, though, to find patches that support MPPE and
> MS-CHAPv2, and ask the owner of that peer system to enable MS-CHAPv2
> support.  Though you're still likely to have some trouble getting your
> system to support this, I'd expect that'd be more likely to succeed.

I'll see if he'll do that.

>
> For what it's worth (and it might not be much), PPTP is quirky and of
> probably questionable value.

yeah.  Well, I *tried* to get them to use a linux-based system, but some 
people are to MS-bound in the head.
