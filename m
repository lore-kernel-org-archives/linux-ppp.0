From: ben_gal@libero.it
Date: Thu, 24 Feb 2005 18:35:28 +0000
Subject: Re: Client requesting its authentication
Message-Id: <20050224183528.GC2421@ytsejam>
List-Id: <linux-ppp.vger.kernel.org>
References: <20050224162619.GB5787@ytsejam>
In-Reply-To: <20050224162619.GB5787@ytsejam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Thu, Feb 24, 2005 at 01:15:54PM -0500, James Carlson wrote:
> > Because I've written a patch to pppd that permits eap-tls authentication.
> > eap-tls provide mutual authentication, so if you (client) connect to a server,
> > you want to be sure of its identity, so the authentication can't be
> > skipped. 
> 
> My understanding of EAP-TLS is that you really don't want EAP to be
> requested by both sides. 

Mine is the same :)

> Instead, one side should request it, and the
> EAP method *itself* provides mutual authentication.

Ok.
The server must request it.
But if the server doesn't request authentication?
The client will connect to an untrusted server.
We don't want this to happen.

> Having both sides request EAP (or any authentication protocol) within
> LCP means that both sides are intending to independently authenticate
> the other.  In other words, you'd end up with each side independently
> and simultaneously sending EAP Request messages and expecting EAP
> Response messages in return.
> 
> That doesn't sound like what you want.

No, this isn't. I want the server asking the client EAP.
And the client refuse connection if there's no authentication.

> 
> > sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb30db629> <pcomp> <accomp>]
> > rcvd [LCP ConfNak id=0x1 <auth 0xc227>]
> 
> Well, we can't do that today.  But since you're writing a patch,
> you're free to add it, and if you can justify why it's really the
> right thing to do (still unclear to me), it might even get integrated.

Ok.

> > Is logged between a windows box (client) set to do eap-tls and the 
> > pppd server.
> > The server don't want to authenticate the client, but the client want
> > eap authentication for itself and finally close the negotiation.
> 
> Wacky.  ;-}
> 
> If it wants EAP authentication, why on Earth didn't it just ask for
> EAP authentication directly?  What's the point of this little dance?

Because the server must ask.
