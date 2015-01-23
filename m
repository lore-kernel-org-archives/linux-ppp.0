From: James Carlson <carlsonj@workingcode.com>
Date: Fri, 23 Jan 2015 12:54:02 +0000
Subject: Re: pppd hangup only when traffic sent over connection
Message-Id: <54C2446A.3020400@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <CAJi99x1irCJMuwb06HpB0XFyFZpZPWa6b2E3pVGQyE_qJwk5NQ@mail.gmail.com>
In-Reply-To: <CAJi99x1irCJMuwb06HpB0XFyFZpZPWa6b2E3pVGQyE_qJwk5NQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 01/23/15 06:56, Matt Dooner wrote:
> I'm experiencing an issue where pppd hangs up, but only when traffic
> is sent over the connection. The connection is stable if it is idle,
> but soon after any traffic is sent over the connection pppd hangs up.
> For example, 15-30 pings or a few lines into a telnet session kills
> the connection. I suspect this is the result of a lack of support for
> a Link Quality Report (which is Confreq'd by the target).

What type of connection is this?  Is it by any chance a 3GPP link?

I agree that the LQR request is one oddity here.  It's hard to imagine,
though, how rejection of LQR could possibly cause the link to fail.
You'd probably have to ask the administrator of that remote system about
that.

And if the refusal of that one option did in fact cause the link to
fail, I'd expect that the peer would just hang up immediately or perhaps
send an LCP Terminate-Request with some explanatory text ("sorry, I
require LQR and you can't refuse") and then hang up.  Allowing the link
to come up and then flaking out like this is deceptive behavior at best.
 Are you sure you want to connect to this peer?

The other oddities I see are the rejection of ACCM (asyncmap), which is
somewhat unusual for what appears to be a normal serial link, and the
absurdly low MRU 400.  What are they thinking?  What can one reasonably
do on an IP link with an MRU smaller than the minimum IP MTU?

It's also surprising to see a link without authentication enabled, but I
guess that's normal in your environment.  You haven't disclosed much
about what you're doing, so there's a bit of guesswork here.

There's something odd with this link.

> As you can see in the debug about below if-down is started after the
> "rcvd [LCP ConfReq id=0xf0 <mru 400> <quality lqr 00 00 01 2c> <magic
> 0xc0a80ea5> <pcomp> <accomp>]". This ConfReq occured after 17
> successful pings over the link, and the link went down after the
> ConfReq. Is this expected behaviour?

I see the local system doing the right thing with respect to the
messages it receives.  The peer appears to be behaving strangely and
you'll probably need to get in touch with the person who controls that
device for more information.

> sent [IPCP ConfReq id=0x1 <addr 0.0.0.0>]
> rcvd [IPCP ConfReq id=0xd7 <addr 192.168.14.165>]
> sent [IPCP ConfAck id=0xd7 <addr 192.168.14.165>]
> sent [IPCP ConfReq id=0x1 <addr 0.0.0.0>]
> rcvd [IPCP ConfNak id=0x1 <addr 192.168.14.166>]

Here's the first hint of some sort of communications problem.  We had to
send the IPCP Configure-Request twice before the peer responded with
that Configure-Nak.  The peer simply didn't respond the first time.
That doesn't happen if the peer is behaving normally.  (If the link has
a really long delay to it -- we can't tell because timing is omitted
here -- you'd expect to see some duplicate responses.  So this looks
like outright packet loss.)

I think the peer may be bug-ridden.  I'd take this as a sign to find
another.

> sent [IPCP ConfReq id=0x2 <addr 192.168.14.166>]
> sent [IPCP ConfReq id=0x2 <addr 192.168.14.166>]
> rcvd [IPCP ConfAck id=0x2 <addr 192.168.14.166>]

The same thing happens again here.  This isn't good at all.

> local  IP address 192.168.14.166
> remote IP address 192.168.14.165
> Script /etc/ppp/ip-up started (pid 1686)
> Script /etc/ppp/ip-up finished (pid 1686), status = 0x0
> rcvd [LCP ConfReq id=0xf0 <mru 400> <quality lqr 00 00 01 2c> <magic
> 0xc0a80ea5> <pcomp> <accomp>]

The peer requests LCP re-negotiation at this point.  That's perfectly
legal, but certainly unusual.  Yes, it causes everything to be torn down
and started over -- LCP drops out of Opened state, causing IPCP to halt.

> Connect time 1.3 minutes.
> Sent 2112 bytes, received 2344 bytes.
> Script /etc/ppp/ip-down started (pid 1695)
> sent [LCP ConfReq id=0x3 <asyncmap 0x0> <magic 0x49d0163a> <pcomp> <accomp>]
> sent [LCP ConfRej id=0xf0 <quality lqr 00 00 01 2c>]

We do the right thing here: we restart LCP and reject the offered LQR
option.

> Script /etc/ppp/ip-down finished (pid 1695), status = 0x0
> sent [LCP ConfReq id=0x3 <asyncmap 0x0> <magic 0x49d0163a> <pcomp> <accomp>]
> sent [LCP ConfReq id=0x3 <asyncmap 0x0> <magic 0x49d0163a> <pcomp> <accomp>]
> sent [LCP ConfReq id=0x3 <asyncmap 0x0> <magic 0x49d0163a> <pcomp> <accomp>]
> sent [LCP ConfReq id=0x3 <asyncmap 0x0> <magic 0x49d0163a> <pcomp> <accomp>]
> sent [LCP ConfReq id=0x3 <asyncmap 0x0> <magic 0x49d0163a> <pcomp> <accomp>]
> sent [LCP ConfReq id=0x3 <asyncmap 0x0> <magic 0x49d0163a> <pcomp> <accomp>]
> sent [LCP ConfReq id=0x3 <asyncmap 0x0> <magic 0x49d0163a> <pcomp> <accomp>]
> sent [LCP ConfReq id=0x3 <asyncmap 0x0> <magic 0x49d0163a> <pcomp> <accomp>]
> sent [LCP ConfReq id=0x3 <asyncmap 0x0> <magic 0x49d0163a> <pcomp> <accomp>]
> LCP: timeout sending Config-Requests

We try multiple times to finish the re-negotiation procedure, but the
peer simply refuses to respond.  The peer is clearly broken.  Time to
find another with fewer bugs.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
