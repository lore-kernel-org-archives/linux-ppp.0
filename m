From: Benjamin Cama <benoar@dolka.fr>
Date: Sun, 14 Feb 2021 23:15:53 +0000
Subject: Re: Configuring pppd to accept link-local IPv6 interface id from remote peer
Message-Id: <0dd1a7673eb530e20ff0f680a2c181511b8d2f94.camel@dolka.fr>
List-Id: <linux-ppp.vger.kernel.org>
References: <d529e496-ac5f-9498-0e3d-1fa1ec2c4750@aelius.com>
In-Reply-To: <d529e496-ac5f-9498-0e3d-1fa1ec2c4750@aelius.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-ppp@vger.kernel.org

Le dimanche 14 février 2021 à 17:46 -0500, James Carlson a écrit :
> On 2021-02-14 16:24, Benjamin Cama wrote:
> > Well, I actually sent last year a patch (attached again to this
> > message) to Paul and Cc'ed here about sending a zero identifier to do
> > exactly (to my understanding) what Nicholas is intending to do: let the
> > “server”-side choose the interface identifier.
> > 
> > It is a very small change that is basically activated on the “client”-
> > side with:
> > 
> >   ipv6 ::,
> > 
> > thus sending a zero identifier for our side. It worked quite well for
> > my work case (virtual serial links), where having short addresses when
> > autoconfiguring helps a lot, too. I couldn't resist also citing the
> > “stability to global scope addresses” argument from the RFC, which is
> > indeed relevant to me, at least.
> 
> I assume that's a reference to autoconf behavior.  It's actually not
> required that autoconf uses the same lower 64 bits to form those
> addresses, though it it often does.

Well, it was the default for a very long time, and is still used for
“permanent addresses” that are still always configured anyway.

> And even where it does, it's
> certainly possible to use other mechanisms to do the "right thing."  In
> Linux I believe you can set the client portion for stateless autoconf
> with something like:
> 
>   ip token set ::123/64 dev ppp0
> 
> I'd do that in an ipv6-up script.

Well, I was not aware of the tokenized interface identifier support in
iproute2, even if this was kind of envisioned in the RFC (although the
manual here only cites a draft as formal reference…). Thanks for
letting me know!

> But, yeah, that's the only possible reason I can see to care about it,
> and it seems like a pretty weak one to me.  (Usually you'll want more
> than just a static address, and DHCPv6 gives you DNS and other really
> handy bits as well.)

I agree this is not the most useful feature I witnessed. To be more
precise on my use-case, this is about knowing in advance, from the
server-side, what will the client address be *when they are not
provisionned* for a particular id, but just use autoconf for the prefix
*and the iid part*, if one could call this mechanism “iid
autoconfiguration”. In this case, I also get resolvers through RA, and
even client registration in the DNS —if this was what you thought
about— can be then done on the server-side, as iid and thus global
address is deterministic (*if acknowledged* at IPv6CP level, which is a
small caveat I did not take into account, I admit; thus my suggestion
above about failing, then: maybe this would need a patch for that,
too?).

> > What do you think about it?
> 
> That's a much more elegant configuration option than my suggestion.  I
> like it.

To be fair, I did not check *all the cases* where the state machine
could stumble on zero iid. I *think* this is ok as zero is check here
and there, but I would prefer someone most knowledgeable double-check
it.

> (I don't like the idea that people seem to care about IPv6 link-local
> addresses.  Not at all.  But I like the change, especially if it means
> the question doesn't need to be answered again.)

Well, people are afraid of it when they see beginners misuse it (which
is very often the case). But stable global addressing and non-globally
addressed link with stable link-local addresses (e.g. inter-router
links, etc) can be very useful too for advanced use.

Thanks for your comments.
--
Benjamin
