From: Bill Unruh <unruh@physics.ubc.ca>
Date: Wed, 02 Apr 2008 15:38:28 +0000
Subject: Re: LCP Renegotiates After IP Connection
Message-Id: <Pine.LNX.4.64.0804020832060.4983@info.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <1207083431.8474.15.camel@pago>
In-Reply-To: <1207083431.8474.15.camel@pago>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Wed, 2 Apr 2008, James Carlson wrote:

> Bill Unruh writes:
>> On Tue, 1 Apr 2008, James Carlson wrote:
>>
>>> James Cameron writes:
>>>> Now, looking at your log in more detail ... I'm surprised that you get
>>>> an LCP ConfReq and ConfAck sequence up front consisting of 10 pairs of
>>>> packets, each with the same id and magic number.  It is as if the
>>>
>>> That's not a pppd problem.  We're sending Configure-Request (over and
>>
>> Who is we? Are you part of this or is this a sort of royal we?
>
> "We" are the local node for which the original poster supplied logs.
> "They" are the other node -- the one that doesn't speak PPP so well
> and for which we have no logs.

Since "James Cameron" was not the original poster, your suddenly using "we"
was confusing. It was not at all clear that you were in any way related to
the original poster, and it was not clear whether your descriptions were
hypothetical or based on some facts.


>
> I can certainly use other words if those two offend you in some way.

Nope, clarification is sufficient. So when you make statements as to what
happens in the negotiation attempts, we are to take them as having some
basis in fact and personal experience.




>
>>> over on the normal restart timer), and the peer is sending
>>> Configure-Ack each time, but isn't bothering to send
>>> Configure-Request.
>>
>> Sould not your side start to send a ConfReq with something other than
>> magic?
>
> No.
>
> When "we" send the very first Configure-Request, we're in Req-Sent
> state.  We then get Configure-Ack from the peer, and we enter Ack-Rcvd
> state.  The peer does nothing, and time passes.  Eventually, after 3
> seconds by default, we get TO+.  That (per the state machine) causes
> us to invoke action "scr" -- Send-Configure-Request -- and return to
> Req-Sent state, and the cycle starts over.
>
> If you read section 5.1 ("Configure-Request") of RFC 1661, it
> discusses how the Identifier is chosen, and explains that
> implementations are permitted to leave the ID field unchanged.
> Retransmit can be exactly that: retransmit, don't generate a new one
> from scratch.  That's how pppd does it.

Can be. But why make it so.

>
> The fail-safe here is TO-, the maximum restart count.  If we hit that,
> we fail with the familiar "LCP: timeout sending Config-Requests"
> message.
>
> In other words, the problem in the following sequence (shown by the
> original poster) is not in pppd; it's in the peer that isn't bothering
> to send Configure-Request, even though it's (inexplicably) able to
> respond with Configure-Ack.  My guess is that it has severe
> implementation flaws, and thus should not be used if the data to be
> carried or the time or health of the users are at all valuable.

Probably true. What is that "other side"? Maybe someone here has experience
with it, rather than everyone having to guess at what is going on.


>
> sent [LCP ConfReq id=0x1 <magic 0x913429f5>]
> rcvd [LCP ConfAck id=0x1 <magic 0x913429f5>]
> sent [LCP ConfReq id=0x1 <magic 0x913429f5>]
> rcvd [LCP ConfAck id=0x1 <magic 0x913429f5>]
>
> (But do feel free to press on if seeing grotesque bugs doesn't make
> you wary.)
>
>>> I guess it depends on your tolerance level for broken devices and how
>>> much you value your time.  ;-}
>>
>> Or the pressure to make it work by higherups.
>
> "No problem.  Here's a purchase order for a different device that
> actually implements PPP rather than just claiming to ..."

Then I would follow that. Agreed. But it could have been "We just purchased
5000 of those things at a really cheap non-returnable deal. You better make
them work."


