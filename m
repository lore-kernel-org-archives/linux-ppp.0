From: James Carlson <carlsonj@workingcode.com>
Date: Thu, 24 Feb 2005 21:36:45 +0000
Subject: Re: Client requesting its authentication
Message-Id: <16926.18669.159553.517079@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <20050224162619.GB5787@ytsejam>
In-Reply-To: <20050224162619.GB5787@ytsejam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Bill Unruh writes:
> > Ok.
> > The server must request it.
> 
> There IS NO SERVER. ppp is a point to point protocol in which both sides
> have entirely equal status. If you want eap, then ask for it. do not try to
> force the other side to ask for it. Both are entirely equal peers.

More or less.  What he means is that the system that is designated as
the authenticator must ask for it, and he's concerned about what the
authenticatee should do if the authenticator doesn't behave as
expected.  EAP and TLS aren't symmetric that way.

> > But if the server doesn't request authentication?
> > The client will connect to an untrusted server.
> > We don't want this to happen.
> 
> Then ask the other side  to authenticate itself. What is difficult about
> that?

In that case, his side will be the authenticator, and he doesn't want
that to happen.

-- 
James Carlson                                 <carlsonj@workingcode.com>
