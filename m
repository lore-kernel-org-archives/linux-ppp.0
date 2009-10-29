From: James Carlson <carlsonj@workingcode.com>
Date: Thu, 29 Oct 2009 16:05:01 +0000
Subject: Re: strange pppd error
Message-Id: <4AE9BD2D.7080005@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <4AE9B268.1090607@bfs.de>
In-Reply-To: <4AE9B268.1090607@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

walter harms wrote:
> Oct 20 13:56:09  pppd[5792]: sent [LCP EchoReq id=0x0 magic=0xd71a0c90]
> Oct 20 13:56:09  pppd[5792]: sent [IPCP ConfReq id=0xc8 <compress VJ 0f 01> <addr 10.0.0.2>]
> Oct 20 13:56:09  pppd[5792]: rcvd [CCP ConfReq id=0xc7 <deflate 15> <deflate(old#) 15>]
> Oct 20 13:56:09  pppd[5792]: sent [CCP ConfReq id=0xbb]
> Oct 20 13:56:09  pppd[5792]: sent [CCP ConfRej id=0xc7 <deflate 15> <deflate(old#) 15>]
> Oct 20 13:56:09  pppd[5792]: rcvd [IPCP ConfReq id=0xc7 <compress VJ 0f 01> <addr 0.0.0.0>]
> Oct 20 13:56:09  pppd[5792]: sent [IPCP ConfNak id=0xc7 <addr 10.0.0.1>]

It looks like LCP was in Opened state up to this point.

> Oct 20 13:56:12  pppd[5792]: rcvd [LCP ConfReq id=0xc8 <asyncmap 0x0> <magic 0xab132318> <pcomp> <accomp>]

Something (perhaps a system reset) caused the peer to restart LCP.  This
is event RCR+ for us (see RFC 1661), which causes us to do tld,src,sca
and go to state Ack-Sent.

> Oct 20 13:56:12  pppd[5792]: sent [LCP ConfReq id=0xc9 <asyncmap 0x0> <magic 0xf79dba92> <pcomp> <accomp>]
> Oct 20 13:56:12  pppd[5792]: sent [LCP ConfAck id=0xc8 <asyncmap 0x0> <magic 0xab132318> <pcomp> <accomp>]

So far, so good.

> Oct 20 13:56:12  pppd[5792]: rcvd [LCP ConfAck id=0xc8 <asyncmap 0x0> <magic 0xd71a0c90> <pcomp> <accomp>]

Uh oh.  It looks like the peer is broken.  Note the ID number on that
message: it's 0xc8.  That's the ID on the peer's own Configure-Request,
which makes no sense at all.

The peer should be echoing back the ID on the Configure-Request that we
sent.  That message had ID set to 0xc9.  The IDs are completely
independent in each direction; our choice in our Configure-Request has
nothing to do with his choice in his Configure-Request.

In other words, the peer has a bug.  Because of this bug, we will (per
RFC 1661) discard that LCP Configure-Ack message as malformed, and stay
in state Ack-Sent.

> Oct 20 13:56:12  pppd[5792]: rcvd [LCP EchoReq id=0x0 magic=0xab132318]
> Oct 20 13:56:12  pppd[5792]: rcvd [LCP EchoRep id=0x0 magic=0xab132318]
> Oct 20 13:56:12  pppd[5792]: rcvd [CCP ConfReq id=0xc8 <deflate 15> <deflate(old#) 15>]
> Oct 20 13:56:12  pppd[5792]: Discarded non-LCP packet when LCP not open

This happens because the peer thinks LCP is done, but it's not.

> Oct 20 13:56:14  pppd[5792]: sent [LCP ConfReq id=0xc9 <asyncmap 0x0> <magic 0xf79dba92> <pcomp> <accomp>]

Our restart timer goes off, which is event TO+.  We stay in Ack-Sent
state, and send a new LCP Configure-Request message.

> Oct 20 13:56:15  pppd[5792]: rcvd [LCP ConfReq id=0xc9 <asyncmap 0x0> <magic 0xb84a827a> <pcomp> <accomp>]
> Oct 20 13:56:15  pppd[5792]: sent [LCP ConfAck id=0xc9 <asyncmap 0x0> <magic 0xb84a827a> <pcomp> <accomp>]
> Oct 20 13:56:15  pppd[5792]: rcvd [LCP ConfAck id=0xc9 <asyncmap 0x0> <magic 0xf79dba92> <pcomp> <accomp>]

It looks like everything works out at this point.  LCP goes to Opened
state, and we start bringing up the NCPs.

> Oct 20 13:56:18  pppd[5792]: rcvd [LCP ConfReq id=0xc9 <asyncmap 0x0> <magic 0xb84a827a> <pcomp> <accomp>]

The peer resends his Configure-Request.  He evidently got stuck in
Ack-Sent state himself, because he misconstrued our Configure-Request
message.

Oh well.  Fix or replace the peer.  It's broken.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
