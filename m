From: James Carlson <carlsonj@workingcode.com>
Date: Tue, 12 Sep 2006 11:13:39 +0000
Subject: Re: Re-2: Authentication problems
Message-Id: <17670.38499.412785.764581@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <0001E280.45068483@aressi.fr>
In-Reply-To: <0001E280.45068483@aressi.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Gilles Espinasse writes:
> > So i can't put these options in the config file on the client side? If i
> > understand, he server ask the client for PAP, CHAP or MS-CHAP method to
> > authenticate? The client doesn't choose authentication method? Is it right?
> >
> If one authentication is not configured on the client side, pppd will answer
> with a nak on the request and could offer another authentication method if
> available (that the server may or not accept).

"Configured" in this case means that pppd has access to credentials --
a user name and pass phrase or shared secret for a given
authentication protocol -- and that it's not told _not_ to use them.

On the authenticatee ("client") side, all that you can do is agree to
the peer's request or suggest an alternative; you can't demand to be
identified with a given protocol.

Authentication must work that way.  Allowing the authenticatee to
specify the means of validation is insecure.

On the other side, if you're setting up a "server," you use the
'require-pap' keyword (note that "+pap" is obsolescent) to say that
the peers must use PAP to identify themselves.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
