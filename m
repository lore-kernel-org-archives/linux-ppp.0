From: James Carlson <carlsonj@workingcode.com>
Date: Thu, 10 Mar 2005 19:59:00 +0000
Subject: Re: Blowfish encryption
Message-Id: <16944.42756.942173.649684@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <1110403872.18073.330.camel@linux.linxdev.com>
In-Reply-To: <1110403872.18073.330.camel@linux.linxdev.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

John Hasler writes:
> James Carlson writes:
> > So, they are concerned that someone will tap the telephone line and
> > manage to decode a V.90 data stream, but they're unconcerned whether the
> > next hop itself (the modem at the other end) is itself "secure," or that
> > hazards may exist between that modem and the ultimate packet destination,
> > which may be many hops away.
> 
> What makes you think that there is another hop?  Not everything goes out
> over the Internet.  This could be a simple point to point link.

I'm pointing out that the threat model is incomplete.

Sure; it's possible that the only nodes communicating over that link
are the endpoints, and no packets are ever forwarded through the link,
nor forwarded by either endpoint to any other system.

That's certainly one scenario.  However, since we don't have a threat
model to work from, it's hard to say that it's really the right one --
hence the "may" in my statement.  There's no way to tell.  The only
information given (wanting to encrypt packets over the link) is too
scant to come up with solid answers except for one: I don't think the
customer requesting this has really thought the problem through or, if
he has, he's not revealing enough to explain the problem to be solved.

It's just way too easy to give a customer exactly what he asked for
but not what he wanted.  That's probably bad news if what he's asking
for is "security."

-- 
James Carlson                                 <carlsonj@workingcode.com>
