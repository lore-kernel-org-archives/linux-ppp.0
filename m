From: ben_gal@libero.it
Date: Thu, 24 Feb 2005 18:08:07 +0000
Subject: Re: Client requesting its authentication
Message-Id: <20050224180807.GB2421@ytsejam>
List-Id: <linux-ppp.vger.kernel.org>
References: <20050224162619.GB5787@ytsejam>
In-Reply-To: <20050224162619.GB5787@ytsejam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Thu, Feb 24, 2005 at 09:43:11AM -0800, Bill Unruh wrote:
> He understood you perfectly. That is precicely what the refuse-... do,
> except that 
> you cannot force the other side to authenticate you .

 This is what I wanted to know.

> If you
> want them to authenticate themselves to you then you must say do.
> Ie, authentication is under the control of whoever wants the other side to
> be authenticated. Nothing else makes any sense. Of course since eap in some
> sense is a bilateral authentication one might argue that y our request is
> sensible, but the way to do it is for you to demand eap authentication from
> the other side, and to refuse all other types of authentication from the
> other side, as Carlson suggested.
> Why by the way do you want to force the other side to authenticate you?

Because I've written a patch to pppd that permits eap-tls authentication.
eap-tls provide mutual authentication, so if you (client) connect to a server,
you want to be sure of its identity, so the authentication can't be
skipped. 

This is the behaviour I were looking for:

using channel 4
Using interface ppp0
Connect: ppp0 <--> /dev/ttyS1
sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb30db629> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x0 <asyncmap 0x0> <magic 0x290d2a43> <pcomp> <accomp>]
sent [LCP ConfAck id=0x0 <asyncmap 0x0> <magic 0x290d2a43> <pcomp> <accomp>]
sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb30db629> <pcomp> <accomp>]
rcvd [LCP ConfNak id=0x1 <auth 0xc227>]
sent [LCP ConfReq id=0x2 <asyncmap 0x0> <magic 0xb30db629> <pcomp> <accomp>]
rcvd [LCP ConfNak id=0x2 <auth 0xc227>]
sent [LCP ConfReq id=0x3 <asyncmap 0x0> <magic 0xb30db629> <pcomp> <accomp>]
rcvd [LCP ConfNak id=0x3 <auth 0xc227>]
sent [LCP ConfReq id=0x4 <asyncmap 0x0> <magic 0xb30db629> <pcomp> <accomp>]
rcvd [LCP ConfNak id=0x4 <auth 0xc227>]
sent [LCP ConfReq id=0x5 <asyncmap 0x0> <magic 0xb30db629> <pcomp> <accomp>]
rcvd [LCP ConfNak id=0x5 <auth 0xc227>]
sent [LCP ConfReq id=0x6 <asyncmap 0x0> <magic 0xb30db629> <pcomp> <accomp>]
rcvd [LCP ConfNak id=0x6 <auth 0xc227>]
sent [LCP ConfReq id=0x7 <asyncmap 0x0> <magic 0xb30db629> <pcomp> <accomp>]
rcvd [LCP ConfNak id=0x7 <auth 0xc227>]
sent [LCP ConfReq id=0x8 <asyncmap 0x0> <magic 0xb30db629> <pcomp> <accomp>]
rcvd [LCP ConfNak id=0x8 <auth 0xc227>]
sent [LCP ConfReq id=0x9 <asyncmap 0x0> <magic 0xb30db629> <pcomp> <accomp>]
rcvd [LCP ConfNak id=0x9 <auth 0xc227>]
sent [LCP ConfReq id=0xa <asyncmap 0x0> <magic 0xb30db629> <pcomp> <accomp>]
rcvd [LCP ConfNak id=0xa <auth 0xc227>]
sent [LCP ConfReq id=0xb <asyncmap 0x0> <magic 0xb30db629> <pcomp> <accomp>]
rcvd [LCP TermReq id=0x1 ")\r*C\000<\37777777715t\000\000\002\37777777734"]
sent [LCP TermAck id=0x1]
Modem hangup
Connection terminated.

Is logged between a windows box (client) set to do eap-tls and the 
pppd server.
The server don't want to authenticate the client, but the client want
eap authentication for itself and finally close the negotiation.

