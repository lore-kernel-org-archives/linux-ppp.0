From: James Carlson <carlsonj@workingcode.com>
Date: Thu, 24 Feb 2005 22:36:29 +0000
Subject: Re: Client requesting its authentication
Message-Id: <16926.22253.925646.118960@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <20050224162619.GB5787@ytsejam>
In-Reply-To: <20050224162619.GB5787@ytsejam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Bill Unruh writes:
> On Thu, 24 Feb 2005, James Carlson wrote:
> 
> >
> > In that case, his side will be the authenticator, and he doesn't want
> > that to happen.
> 
> Why?
> 
> Especially aqs in eap his side IS an authenticator as well as an
> authenticatee.

That's precisely the problem: that's not true.

When you negotiate EAP, the side that sends LCP Configure-Request for
EAP is the authenticator; the other side is the authenticatee.  The
authenticator drives the conversation by sending EAP Request
messages.  The authenticatee merely responds.

Both sides, of course, *may* be either authenticator or authenticatee
or both, provided that the other side plays the opposite role.

In this case, he wants his peer to be an authenticator.  It's supposed
to have the right keys.  His question is what should he do if that
peer *doesn't* behave as an authenticator.

He doesn't have the keys on his side to behave as an authenticator, so
that's out of the question.

> That is precisely what he wants, is for the far side to
> authenticate itself to him.

Not exactly.  He wants the other side to be authenticator, so the keys
all work out right, *and* so that he gets the EAP-TLS mutual
authentication.

He doesn't want to proceed as an authenticatee if the peer doesn't ask
for anything, because he's depending on the mutual-auth built into TLS
for part of his security.

He could send LCP Configure-Nak to suggest EAP, but pppd doesn't do
that currently.  I pointed out that doing so is probably worthless, as
if the peer isn't already asking, it probably doesn't even know how to
do it.  Thus, hanging up the connection is probably the right answer
anyway.

(Which implies that Windows is being a little silly here.)

-- 
James Carlson                                 <carlsonj@workingcode.com>
