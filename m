From: James Carlson <carlsonj@workingcode.com>
Date: Thu, 24 Feb 2005 18:53:20 +0000
Subject: Re: Client requesting its authentication
Message-Id: <16926.8864.855716.47324@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <20050224162619.GB5787@ytsejam>
In-Reply-To: <20050224162619.GB5787@ytsejam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

ben_gal@libero.it writes:
> > Instead, one side should request it, and the
> > EAP method *itself* provides mutual authentication.
> 
> Ok.
> The server must request it.
> But if the server doesn't request authentication?
> The client will connect to an untrusted server.
> We don't want this to happen.

If it doesn't request it, then, clearly, it doesn't support it or want
to demand it of its peers.  If your local policy rules are such that
you won't talk to someone who doesn't initiate authentication, then I
think the best answer is just to disconnect.

> > > Is logged between a windows box (client) set to do eap-tls and the 
> > > pppd server.
> > > The server don't want to authenticate the client, but the client want
> > > eap authentication for itself and finally close the negotiation.
> > 
> > Wacky.  ;-}
> > 
> > If it wants EAP authentication, why on Earth didn't it just ask for
> > EAP authentication directly?  What's the point of this little dance?
> 
> Because the server must ask.

OK ... but it still seems rather pointless to me.

That said, I see the point now, and, no, there's no option that
currently does that.  You'll need to add one or, better yet, make pppd
just do that by default when EAP TLS client side is configured.

-- 
James Carlson                                 <carlsonj@workingcode.com>
