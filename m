From: "Ludovic MARCILLY" <lmarcilly@aressi.fr>
Date: Tue, 12 Sep 2006 12:21:58 +0000
Subject: Re-4: Authentication problems
Message-Id: <DIIE.000007710001E2CB@aressi.fr>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Ok. So if i want my client to authenticate with CHAP, i have to put these options in my config file on the client side:

refuse-pap
refuse-eap
refuse-mschap
refuse-mschap-v2

Am i right? I will test it now in order to be sure.

And if i just configure authentication on the server? For example, no require-[pap|chap|eap|mschap|mschap-v2] and no refuse-[pap|chap|eap|mschap|mschap-v2] in the config file on the client side but just enable chap on the server side. Will it work?

Thanks a lot for your help. I have difficulties to understand the require and refuse options.

-------- Original Message --------
Subject: Re: Re-2: Authentication problems (12-sept.-2006 13:21)
From:    James Carlson <carlsonj@workingcode.com>
To:      lmarcilly@aressi.fr

> Gilles Espinasse writes:
> > > So i can't put these options in the config file on the client side? If i
> > > understand, he server ask the client for PAP, CHAP or MS-CHAP method to
> > > authenticate? The client doesn't choose authentication method? Is it right?
> > >
> > If one authentication is not configured on the client side, pppd will 
> > answer
> > with a nak on the request and could offer another authentication method if
> > available (that the server may or not accept).
> 
> "Configured" in this case means that pppd has access to credentials --
> a user name and pass phrase or shared secret for a given
> authentication protocol -- and that it's not told _not_ to use them.
> 
> On the authenticatee ("client") side, all that you can do is agree to
> the peer's request or suggest an alternative; you can't demand to be
> identified with a given protocol.
> 
> Authentication must work that way.  Allowing the authenticatee to
> specify the means of validation is insecure.
> 
> On the other side, if you're setting up a "server," you use the
> 'require-pap' keyword (note that "+pap" is obsolescent) to say that
> the peers must use PAP to identify themselves.
> 
> -- 
> James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>


To: carlsonj@workingcode.com
    g.esp@free.fr
Cc: linux-ppp@vger.kernel.org


