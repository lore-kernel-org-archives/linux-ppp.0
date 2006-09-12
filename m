From: James Carlson <carlsonj@workingcode.com>
Date: Tue, 12 Sep 2006 12:27:28 +0000
Subject: Re: Re-4: Authentication problems
Message-Id: <17670.42928.503705.546835@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <DIIE.000007710001E2CB@aressi.fr>
In-Reply-To: <DIIE.000007710001E2CB@aressi.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Ludovic MARCILLY writes:
> Ok. So if i want my client to authenticate with CHAP, i have to put these options in my config file on the client side:
> 
> refuse-pap
> refuse-eap
> refuse-mschap
> refuse-mschap-v2
> 
> Am i right?

No.

If you want to authenticate with CHAP, then just put the right
credentials into /etc/ppp/chap-secrets.  That's all you need to do.
For example, this in the pppd options:

	user lmarcilly

and this in the /etc/ppp/chap-secrets file:

	lmarcilly * "my pass phrase"

That's it.  Those "refuse-*" options are there in case there's some
reason you _MUST_ prevent yourself from using those other protocols
when available.

They're potential workarounds for unforseen cases.  They're not meant
to be used in most instances.

In fact, that's true of most of the pppd options.  The best
configuration *BY FAR* is the one that sets the fewest options.  The
rest should be left to the default, which is generally chosen to be
the most interoperable configuration.

> I will test it now in order to be sure.
> 
> And if i just configure authentication on the server? For example, no require-[pap|chap|eap|mschap|mschap-v2] and no refuse-[pap|chap|eap|mschap|mschap-v2] in the config file on the client side but just enable chap on the server side. Will it work?

Yes.

> Thanks a lot for your help. I have difficulties to understand the
> require and refuse options.

require = server
refuse = client

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
