From: James Carlson <carlsonj@workingcode.com>
Date: Tue, 13 Sep 2016 14:05:52 +0000
Subject: Re: CHAP Auth issue at CentOS-6.8
Message-Id: <57D807C0.50204@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <CAGc3wVD6QP4T4wzYsV0hiFU4aXqX0O0fka=f966jNfWCTb4OXA@mail.gmail.com>
In-Reply-To: <CAGc3wVD6QP4T4wzYsV0hiFU4aXqX0O0fka=f966jNfWCTb4OXA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 09/13/2016 09:25 AM, Sekar D wrote:
> Yes. It happens only when I bring up DSL line before 2 minutes. The
> same DSL lines are working fine without any issue at CentOS-5.11. I
> could see the issue only at CentOS-6.8. So I would like to know that I
> need to configure more to avoid these issues.

I don't think there's anything you can do.  The peer is refusing your
request.  I think it's game over at that point.

There's nothing obviously wrong on your end, at least in what's revealed
in this short debug log.

I suggest calling the provider's technical support line.  You'll need
their help in finding out why your connection request is being refused.

If you can't do that, or if they can't help, then you'll need to find a
new provider.

> Sep 13 15:16:15 Linux pppoe[9426]: PADS: Service-Name: ''
> Sep 13 15:16:15 Linux pppoe[9426]: PPP session is 11525 (0x2d05)

PPPoE is in use.  That helps a bit.  It would help to know if there's
anything different about a successful connection.

Could it be that it just takes a *very* long time for this provider to
tear down a previous connection?

Could there be a bug in PPPoE rather than in pppd itself?  (Note that
PPPoE is just a transport; it's completely distinct from PPP.)

> Sep 13 15:16:16 Linux pppd[9425]: sent [LCP ConfReq id=0x1 <mru 1492>
> <magic 0x539b3bc6>]
> Sep 13 15:16:16 Linux pppd[9425]: rcvd [LCP ConfReq id=0x4c <mru 1492>
> <auth chap MD5> <magic 0x22bf9b51>]
> Sep 13 15:16:16 Linux pppd[9425]: sent [LCP ConfAck id=0x4c <mru 1492>
> <auth chap MD5> <magic 0x22bf9b51>]
> Sep 13 15:16:16 Linux pppd[9425]: rcvd [LCP ConfAck id=0x1 <mru 1492>
> <magic 0x539b3bc6>]

That looks like a perfectly reasonable LCP negotiation, with the peer
asking for CHAP authentication.

> Sep 13 15:16:16 Linux pppd[9425]: sent [LCP EchoReq id=0x0 magic=0x539b3bc6]
> Sep 13 15:16:16 Linux pppd[9425]: rcvd [CHAP Challenge id=0x1
> <24a06e14743d399c933b61865730ea63>, name = "BSLYO656"]
> Sep 13 15:16:16 Linux pppd[9425]: sent [CHAP Response id=0x1
> <502b6f4ee944310f014e0033e9b5438b>, name = "fti/hbufbty"]
> Sep 13 15:16:16 Linux pppd[9425]: rcvd [LCP EchoRep id=0x0 magic=0x22bf9b51]

They challenge and you respond.  No problem there.

> Sep 13 15:16:16 Linux pppd[9425]: rcvd [CHAP Failure id=0x1 "CHAP
> authentication failure, unit 509"]

The peer refuses your request, and gives a pretty bogus error message to
boot.  What the heck does "unit 509" mean?  It's certainly not any kind
of standard PPP error message.  If anybody knows, it would have to be
the technical support people at your provider.

> Sep 13 15:16:16 Linux pppd[9425]: CHAP authentication failed: CHAP
> authentication failure, unit 509
> Sep 13 15:16:16 Linux pppd[9425]: CHAP authentication failed
> Sep 13 15:16:16 Linux pppd[9425]: sent [LCP TermReq id=0x2 "Failed to
> authenticate ourselves to peer"]

Due to the authentication failure, we shut things down.  This is all normal.

> /var/run/pppoe-adsl-0.pid.pppoe -I eth1.101 -T 0 -U  -m 1412   , pid
> 9426

This part is sort of interesting.  Why "-U"?  I'm far from an expert in
Roaring Penguin's PPPoE client, but I think that would imply that you
have multiple simultaneous PPPoE sessions running.  Does your provider
even allow that?

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
