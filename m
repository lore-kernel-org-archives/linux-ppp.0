From: James Carlson <carlsonj@workingcode.com>
Date: Fri, 25 Feb 2005 12:52:00 +0000
Subject: Re: Client requesting its authentication
Message-Id: <16927.8048.993418.13355@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <20050224162619.GB5787@ytsejam>
In-Reply-To: <20050224162619.GB5787@ytsejam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Bill Unruh writes:
> > When you negotiate EAP, the side that sends LCP Configure-Request for
> > EAP is the authenticator; the other side is the authenticatee.  The
> > authenticator drives the conversation by sending EAP Request
> > messages.  The authenticatee merely responds.
> 
> Perhaps, but what he wants is for the far side to authenticate itself to
> him. Period. How it happens is irrelevant. Now if the far side refuses.
> then he has to decide what to do. It is up to him. He cannot force the
> other side to do anything. His only option is walking away or not.

How the authentication happens *is* relevant.

First of all, EAP TLS is not symmetric.  The two sides have different
data.  (Think of PAP with the "papcrypt" option; you couldn't reverse
roles there.)

Secondly, he wants to see EAP TLS happen.  Sure, he could challenge
the peer with some other authentication protocol (say, CHAP), but he's
decided that (for whatever reason) his security requirements include
having TLS in the picture.  So just switching to a different protocol
is unacceptable as well.

> > In this case, he wants his peer to be an authenticator.  It's supposed
> > to have the right keys.  His question is what should he do if that
> > peer *doesn't* behave as an authenticator.
> >
> 
> He decides whether or not to walk away.

Exactly.  That's what I said.

The interesting wrinkle is that he *could* use an unsolicited LCP
Configure-Nak to try to prod the peer into doing what he wants.
Windows apparently does this.  I don't think it's a worthwhile
exercise, but it's certainly doable.

> > He doesn't have the keys on his side to behave as an authenticator, so
> > that's out of the question.
> 
> That cannot be right, since he is also authenticating the far side. Ie, he
> MUST have enough info to do that.

The protocol isn't symmetric.  The authentication is mutual, but
different information is used.  You can't just reverse the roles.

-- 
James Carlson                                 <carlsonj@workingcode.com>
