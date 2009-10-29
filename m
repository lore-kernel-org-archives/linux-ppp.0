From: James Carlson <carlsonj@workingcode.com>
Date: Thu, 29 Oct 2009 17:04:53 +0000
Subject: Re: strange pppd error
Message-Id: <4AE9CB35.5050603@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <4AE9B268.1090607@bfs.de>
In-Reply-To: <4AE9B268.1090607@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

walter harms wrote:
> These are the first entries in the log. The link between the system is
> an ordinary    "modem <- phoneline -> modem"    connection. there is nothing
> in between (except the telco stuff of cause).

OK.  That certainly rules out a number of possibilities.  The new logs
help even more.

> btw: I have noticed that the  "ConfReq id" simply wraps at 255 would it be useful to
> have a patch that breaks the connection instead of continue counting ?

I can't imagine why you'd want to do that.  The ID number is _designed_
to roll over.  (In fact, it's completely ephemeral and needn't be
sequential at all.  All that's really needed for the protocol to work is
that the ID for unique messages is chosen so that identical IDs are
repeated as infrequently as possible.  It turns out that a simple
wrap-around increment does that just fine, but *any* such sequence
serves the purpose for the protocol requirements.)

> Oct 20 11:25:01  pppd[5792]: sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb655033a> <pcomp> <accomp>]
> Oct 20 11:25:09  pppd[5792]: rcvd [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb426be22> <pcomp> <accomp>]
> Oct 20 11:25:09  pppd[5792]: sent [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0xb426be22> <pcomp> <accomp>]
> Oct 20 11:25:09  pppd[5792]: sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb655033a> <pcomp> <accomp>]
> Oct 20 11:25:10  pppd[5792]: rcvd [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0xb655033a> <pcomp> <accomp>]

That looks good.  We send Configure-Request ID 1, and he acks it, and we
ack his request as well.

> Oct 20 11:25:12  pppd[5792]: rcvd [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb426be22> <pcomp> <accomp>]

That doesn't look so good.  The peer is retransmitting its LCP
Configure-Request, and it's unclear why it's doing that.  We've already
sent an ack.

The standard state machine doesn't support what this peer is doing.  I
suppose that if it somehow missed our Configure-Ack (how?), this could
be a valid thing to do.  But the question is how it could have missed
that message, when it just recently sent us Configure-Request.

Something odd is going on here.

> Oct 20 11:25:12  pppd[5792]: sent [LCP ConfReq id=0x2 <asyncmap 0x0> <magic 0x908697da> <pcomp> <accomp>]
> Oct 20 11:25:12  pppd[5792]: sent [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0xb426be22> <pcomp> <accomp>]

We behave as the standards require; jumping back to Ack-Sent state.

> Oct 20 11:25:14  pppd[5792]: sent [LCP ConfReq id=0x2 <asyncmap 0x0> <magic 0x908697da> <pcomp> <accomp>]

The peer hasn't responded.  We try again by resending Configure-Request.
 It's odd that we're retrying in just 2 seconds.  The default is 3.
Have you tweaked your configuration?

> Oct 20 11:25:14  pppd[5792]: rcvd [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb426be22> <pcomp> <accomp>]
> Oct 20 11:25:14  pppd[5792]: sent [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0xb426be22> <pcomp> <accomp>]

The peer sends us a new Configure-Request by itself.  Why he does this
is unclear.  It looks like his restart timer went off, but why didn't he
respond to either of the two Configure-Requests we've sent?

> Oct 20 11:25:14  pppd[5792]: rcvd [LCP ConfReq id=0x2 <asyncmap 0x0> <magic 0x8e9f9ca2> <pcomp> <accomp>]
> Oct 20 11:25:14  pppd[5792]: sent [LCP ConfAck id=0x2 <asyncmap 0x0> <magic 0x8e9f9ca2> <pcomp> <accomp>]
> Oct 20 11:25:14  pppd[5792]: rcvd [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0xb655033a> <pcomp> <accomp>]
> Oct 20 11:25:14  pppd[5792]: rcvd [LCP ConfAck id=0x2 <asyncmap 0x0> <magic 0x908697da> <pcomp> <accomp>]

He finally responds, but there's a problem here.  Note the first of
those two received Configure-Ack messages: it's ID 1.  He's actually
sending a duplicate Configure-Ack.  That's not a terribly legitimate
thing to do; he shouldn't be resending Configure-Ack at all.  The
standards don't support it.

As for the second Configure-Ack received above, it looks like there are
occasional long delays on this link, which wouldn't be surprising with a
modem.  I think you need to set at least "lcp-restart 3" or perhaps
higher, if this link is subject to lengthy delays.  Having a too-short
restart timer can cause all sorts of unwanted behavior.

> Oct 20 11:25:17  pppd[5792]: rcvd [LCP ConfReq id=0x2 <asyncmap 0x0> <magic 0x8e9f9ca2> <pcomp> <accomp>]
> Oct 20 11:25:17  pppd[5792]: sent [LCP ConfReq id=0x3 <asyncmap 0x0> <magic 0x7614dc03> <pcomp> <accomp>]
> Oct 20 11:25:17  pppd[5792]: sent [LCP ConfAck id=0x2 <asyncmap 0x0> <magic 0x8e9f9ca2> <pcomp> <accomp>]
> Oct 20 11:25:17  pppd[5792]: rcvd [LCP ConfAck id=0x2 <asyncmap 0x0> <magic 0x908697da> <pcomp> <accomp>]

What?  We sent only two Configure-Request messages with ID 0x2.  He sent
*THREE* Configure-Ack messages with ID 0x2!  That's not right.

I'm much more convinced now that the peer is junk.  It'll likely need
repair or replacement.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
