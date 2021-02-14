From: James Carlson <carlsonj@workingcode.com>
Date: Sun, 14 Feb 2021 22:46:29 +0000
Subject: Re: Configuring pppd to accept link-local IPv6 interface id from remote peer
Message-Id: <8979942a-92bb-dc1f-6349-6afd26305848@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <d529e496-ac5f-9498-0e3d-1fa1ec2c4750@aelius.com>
In-Reply-To: <d529e496-ac5f-9498-0e3d-1fa1ec2c4750@aelius.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-ppp@vger.kernel.org

On 2021-02-14 16:24, Benjamin Cama wrote:
> Le dimanche 14 février 2021 à 11:23 -0500, James Carlson a écrit :
>> RFC 2472 is a little weird with respect to the Interface-Identifier
>> option.  It's possible to send an all-zero identifier, but we're really
>> in uncharted waters if the peer can't give us an address or rejects the
>> option.
> 
> Could I suggest that then IPv6CP just fails?

The RFC says that it's out of scope.  Sure; I think failure would be fine.

> Well, I actually sent last year a patch (attached again to this
> message) to Paul and Cc'ed here about sending a zero identifier to do
> exactly (to my understanding) what Nicholas is intending to do: let the
> “server”-side choose the interface identifier.
> 
> It is a very small change that is basically activated on the “client”-
> side with:
> 
>   ipv6 ::,
> 
> thus sending a zero identifier for our side. It worked quite well for
> my work case (virtual serial links), where having short addresses when
> autoconfiguring helps a lot, too. I couldn't resist also citing the
> “stability to global scope addresses” argument from the RFC, which is
> indeed relevant to me, at least.

I assume that's a reference to autoconf behavior.  It's actually not
required that autoconf uses the same lower 64 bits to form those
addresses, though it it often does.  And even where it does, it's
certainly possible to use other mechanisms to do the "right thing."  In
Linux I believe you can set the client portion for stateless autoconf
with something like:

  ip token set ::123/64 dev ppp0

I'd do that in an ipv6-up script.

But, yeah, that's the only possible reason I can see to care about it,
and it seems like a pretty weak one to me.  (Usually you'll want more
than just a static address, and DHCPv6 gives you DNS and other really
handy bits as well.)

> What do you think about it?

That's a much more elegant configuration option than my suggestion.  I
like it.

(I don't like the idea that people seem to care about IPv6 link-local
addresses.  Not at all.  But I like the change, especially if it means
the question doesn't need to be answered again.)

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
