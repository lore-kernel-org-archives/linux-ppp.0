From: James Carlson <carlsonj@workingcode.com>
Date: Thu, 24 Feb 2005 18:15:54 +0000
Subject: Re: Client requesting its authentication
Message-Id: <16926.6618.432100.808345@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <20050224162619.GB5787@ytsejam>
In-Reply-To: <20050224162619.GB5787@ytsejam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

ben_gal@libero.it writes:
> Because I've written a patch to pppd that permits eap-tls authentication.
> eap-tls provide mutual authentication, so if you (client) connect to a server,
> you want to be sure of its identity, so the authentication can't be
> skipped. 

My understanding of EAP-TLS is that you really don't want EAP to be
requested by both sides.  Instead, one side should request it, and the
EAP method *itself* provides mutual authentication.

Having both sides request EAP (or any authentication protocol) within
LCP means that both sides are intending to independently authenticate
the other.  In other words, you'd end up with each side independently
and simultaneously sending EAP Request messages and expecting EAP
Response messages in return.

That doesn't sound like what you want.

> sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb30db629> <pcomp> <accomp>]
> rcvd [LCP ConfNak id=0x1 <auth 0xc227>]

Well, we can't do that today.  But since you're writing a patch,
you're free to add it, and if you can justify why it's really the
right thing to do (still unclear to me), it might even get integrated.

> Is logged between a windows box (client) set to do eap-tls and the 
> pppd server.
> The server don't want to authenticate the client, but the client want
> eap authentication for itself and finally close the negotiation.

Wacky.  ;-}

If it wants EAP authentication, why on Earth didn't it just ask for
EAP authentication directly?  What's the point of this little dance?

-- 
James Carlson                                 <carlsonj@workingcode.com>
