From: James Carlson <carlsonj@workingcode.com>
Date: Thu, 24 Feb 2005 17:43:00 +0000
Subject: Re: Client requesting its authentication
Message-Id: <16926.4644.319643.486591@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <20050224162619.GB5787@ytsejam>
In-Reply-To: <20050224162619.GB5787@ytsejam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

ben_gal@libero.it writes:
> > You'd do it with "refuse-pap refuse-chap refuse-mschap
> > refuse-mschap-v2".
> 
> Sorry, I made the question in a wrong manner.
> I don't want to tell the peer what authentication to do if necessary, but
> I want to tell it that I want to authenticate myself (and with EAP), else I 
> won't connect.
> Is there a way?

That's exactly the question I answered -- for the "client" aka
"authenticatee" case.  If the peer (authenticator, server) proposes
some other method, pppd will refuse and suggest EAP instead.

I also noted that you don't need to configure this at all, because
this is already the default for pppd: if the peer requests something
we can't do (because it's not configured), we'll suggest something we
can do.

For the server (authenticator) case, you use the "require-*" options
to tune the behavior.  And as in the client case, there's really no
need to do this, as offering the best usable algorithm first is what
pppd does by default.

-- 
James Carlson                                 <carlsonj@workingcode.com>
