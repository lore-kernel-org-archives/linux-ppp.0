From: Bill Unruh <unruh@physics.ubc.ca>
Date: Thu, 24 Feb 2005 22:48:47 +0000
Subject: Re: Client requesting its authentication
Message-Id: <Pine.LNX.4.61.0502241443220.10098@string.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <20050224162619.GB5787@ytsejam>
In-Reply-To: <20050224162619.GB5787@ytsejam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Thu, 24 Feb 2005, James Carlson wrote:

>
> That's precisely the problem: that's not true.
>
> When you negotiate EAP, the side that sends LCP Configure-Request for
> EAP is the authenticator; the other side is the authenticatee.  The
> authenticator drives the conversation by sending EAP Request
> messages.  The authenticatee merely responds.

Perhaps, but what he wants is for the far side to authenticate itself to
him. Period. How it happens is irrelevant. Now if the far side refuses.
then he has to decide what to do. It is up to him. He cannot force the
other side to do anything. His only option is walking away or not.

>
> Both sides, of course, *may* be either authenticator or authenticatee
> or both, provided that the other side plays the opposite role.
>
> In this case, he wants his peer to be an authenticator.  It's supposed
> to have the right keys.  His question is what should he do if that
> peer *doesn't* behave as an authenticator.
>

He decides whether or not to walk away.


> He doesn't have the keys on his side to behave as an authenticator, so
> that's out of the question.

That cannot be right, since he is also authenticating the far side. Ie, he
MUST have enough info to do that.

>
>> That is precisely what he wants, is for the far side to
>> authenticate itself to him.
>
> Not exactly.  He wants the other side to be authenticator, so the keys
> all work out right, *and* so that he gets the EAP-TLS mutual
> authentication.
>
> He doesn't want to proceed as an authenticatee if the peer doesn't ask
> for anything, because he's depending on the mutual-auth built into TLS
> for part of his security.
>
> He could send LCP Configure-Nak to suggest EAP, but pppd doesn't do
> that currently.  I pointed out that doing so is probably worthless, as
> if the peer isn't already asking, it probably doesn't even know how to
> do it.  Thus, hanging up the connection is probably the right answer
> anyway.

ppp does ask for pap or chap. (Ie if the far side asks for pap, and youcan
offer chap, it does do a confnak). But as you say, since eap is the
strongest authentication model, it should be offered first anyway if
available. Of course as we both know, implimentations of ppp shall we say
vary widely.


>
> (Which implies that Windows is being a little silly here.)


