From: Christopher Fowler <cfowler@outpostsentinel.com>
Date: Thu, 10 Mar 2005 19:10:33 +0000
Subject: Re: Blowfish encryption
Message-Id: <1110481833.18073.447.camel@linux.linxdev.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <1110403872.18073.330.camel@linux.linxdev.com>
In-Reply-To: <1110403872.18073.330.camel@linux.linxdev.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

I think the thing I'll want to use is ECP.  Does pppd come with it?

On Thu, 2005-03-10 at 14:00, James Carlson wrote:
> Christopher Fowler writes:
> > Some of these tin-hat people I tell them to simply buy encrypted modems
> > that do the encryption between the.  Are there anyone out there selling
> > good ones anymore?
> 
> Dunno.  Google seems to think so:
> 
> http://www.securtelecom.com/Products/Corporate/EncryptionSolutions/encryptionsolutions.htm
> 
> > Th issue is that there are two boxes connected via a modem and using PPP
> > for IP traffic.  The customer wants to be sure all traffic across that
> > phone line is encrypted.
> 
> That's just baffling.  So, they are concerned that someone will tap
> the telephone line and manage to decode a V.90 data stream, but
> they're unconcerned whether the next hop itself (the modem at the
> other end) is itself "secure," or that hazards may exist between that
> modem and the ultimate packet destination, which may be many hops
> away.
> 
> How does that work?
> 
> That's why I was asking about the threat model.  It doesn't sound
> rational.  In the particular case of irrational requests, it tends to
> be difficult to design sufficient technical solutions.  :-/
> 
> >  Since they use so many network product some
> > old those protocol may be plain-text.  By having ppp encrypt what it
> > sends that would cover any data that travels across.
> 
> Again, ECP and IPsec are likely the best ways to deal with this,
> though they solve very different problems.
> 
> ECP solves the PPP link encryption problem.  It does *not* help with
> any traffic once it's forwarded past that single link.  It's therefore
> of very limited utility in providing real security.
> 
> IPsec solves the end-to-end problem.  It does *not* help if the peer
> you're talking to is compromised, but, then, likely nothing other than
> scissors will.
> 
> 	http://www.physics.usyd.edu.au/~matthewa/scissors.pdf

