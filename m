From: walter harms <wharms@bfs.de>
Date: Thu, 29 Oct 2009 16:42:00 +0000
Subject: Re: strange pppd error
Message-Id: <4AE9C5D8.7060208@bfs.de>
List-Id: <linux-ppp.vger.kernel.org>
References: <4AE9B268.1090607@bfs.de>
In-Reply-To: <4AE9B268.1090607@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org



James Carlson schrieb:
> I should always proof-read before sending.  :-/
> 
> James Carlson wrote:
>> walter harms wrote:
>>> Oct 20 13:56:12  pppd[5792]: rcvd [LCP ConfReq id=0xc8 <asyncmap 0x0> <magic 0xab132318> <pcomp> <accomp>]
>>> Oct 20 13:56:12  pppd[5792]: sent [LCP ConfReq id=0xc9 <asyncmap 0x0> <magic 0xf79dba92> <pcomp> <accomp>]
>>> Oct 20 13:56:12  pppd[5792]: sent [LCP ConfAck id=0xc8 <asyncmap 0x0> <magic 0xab132318> <pcomp> <accomp>]
>>> Oct 20 13:56:12  pppd[5792]: rcvd [LCP ConfAck id=0xc8 <asyncmap 0x0> <magic 0xd71a0c90> <pcomp> <accomp>]
>> Uh oh.  It looks like the peer is broken.  Note the ID number on that
>> message: it's 0xc8.  That's the ID on the peer's own Configure-Request,
>> which makes no sense at all.
> 
> One other clue I certainly should have noticed here is the magic number
> -- it's different from what we sent.  So that is *not* merely an errant
> response on the peer's part.
> 
> Why is the peer sending that last message above?  I don't know.  It's as
> though the peer is responding to an LCP Configure-Request that we never
> sent, at least according to the abbreviated log file presented here.
> 
> (You don't need to post the whole multi-megabyte log file, but posting
> the LCP initial negotiation on the link and any LCP negotiation messages
> seen up to the point of failure would be extremely helpful.)
> 
> What's the nature of the link between these two systems?  Is it possible
> for LCP messages from one link to be replayed on another link?  Is it
> possible for some other machine's messages to get injected on this link?
>  Could the link itself store and replay messages?
> 
> I think the first step would be finding out why the peer suddenly
> thought it received an LCP Configure-Request message from us with ID
> 0xc8 and Magic Number 0xd71a0c90, when we apparently sent no such thing.
> 

thx for your fast response.

These are the first entries in the log. The link between the system is
an ordinary    "modem <- phoneline -> modem"    connection. there is nothing
in between (except the telco stuff of cause).

btw: I have noticed that the  "ConfReq id" simply wraps at 255 would it be useful to
have a patch that breaks the connection instead of continue counting ?

re,
 wh


Oct 20 11:24:32  pppd[5792]: pppd 2.4.2b3 started by root, uid 0
Oct 20 11:25:00  pppd[5792]: Serial connection established.
Oct 20 11:25:00  pppd[5792]: using channel 59
Oct 20 11:25:00  pppd[5792]: Using interface ppp0
Oct 20 11:25:00  pppd[5792]: Connect: ppp0 <--> /dev/modem
Oct 20 11:25:01  pppd[5792]: sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb655033a> <pcomp> <accomp>]
Oct 20 11:25:09  pppd[5792]: rcvd [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb426be22> <pcomp> <accomp>]
Oct 20 11:25:09  pppd[5792]: sent [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0xb426be22> <pcomp> <accomp>]
Oct 20 11:25:09  pppd[5792]: sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb655033a> <pcomp> <accomp>]
Oct 20 11:25:10  pppd[5792]: rcvd [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0xb655033a> <pcomp> <accomp>]
Oct 20 11:25:10  pppd[5792]: sent [LCP EchoReq id=0x0 magic=0xb655033a]
Oct 20 11:25:10  pppd[5792]: sent [IPCP ConfReq id=0x1 <compress VJ 0f 01> <addr 10.0.0.2>]
Oct 20 11:25:12  pppd[5792]: rcvd [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb426be22> <pcomp> <accomp>]
Oct 20 11:25:12  pppd[5792]: sent [LCP ConfReq id=0x2 <asyncmap 0x0> <magic 0x908697da> <pcomp> <accomp>]
Oct 20 11:25:12  pppd[5792]: sent [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0xb426be22> <pcomp> <accomp>]
Oct 20 11:25:14  pppd[5792]: sent [LCP ConfReq id=0x2 <asyncmap 0x0> <magic 0x908697da> <pcomp> <accomp>]
Oct 20 11:25:14  pppd[5792]: rcvd [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0xb426be22> <pcomp> <accomp>]
Oct 20 11:25:14  pppd[5792]: sent [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0xb426be22> <pcomp> <accomp>]
Oct 20 11:25:14  pppd[5792]: rcvd [LCP EchoReq id=0x0 magic=0xb426be22]
Oct 20 11:25:14  pppd[5792]: rcvd [LCP ConfReq id=0x2 <asyncmap 0x0> <magic 0x8e9f9ca2> <pcomp> <accomp>]
Oct 20 11:25:14  pppd[5792]: sent [LCP ConfAck id=0x2 <asyncmap 0x0> <magic 0x8e9f9ca2> <pcomp> <accomp>]
Oct 20 11:25:14  pppd[5792]: rcvd [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0xb655033a> <pcomp> <accomp>]
Oct 20 11:25:14  pppd[5792]: rcvd [LCP ConfAck id=0x2 <asyncmap 0x0> <magic 0x908697da> <pcomp> <accomp>]
Oct 20 11:25:14  pppd[5792]: sent [LCP EchoReq id=0x0 magic=0x908697da]
Oct 20 11:25:14  pppd[5792]: sent [IPCP ConfReq id=0x2 <compress VJ 0f 01> <addr 10.0.0.2>]
Oct 20 11:25:14  pppd[5792]: rcvd [CCP ConfReq id=0x1 <deflate 15> <deflate(old#) 15>]
Oct 20 11:25:14  pppd[5792]: sent [CCP ConfReq id=0x1]
Oct 20 11:25:14  pppd[5792]: sent [CCP ConfRej id=0x1 <deflate 15> <deflate(old#) 15>]
Oct 20 11:25:14  pppd[5792]: rcvd [IPCP ConfReq id=0x1 <compress VJ 0f 01> <addr 0.0.0.0>]
Oct 20 11:25:14  pppd[5792]: sent [IPCP ConfNak id=0x1 <addr 10.0.0.1>]
Oct 20 11:25:17  pppd[5792]: sent [IPCP ConfReq id=0x2 <compress VJ 0f 01> <addr 10.0.0.2>]
Oct 20 11:25:17  pppd[5792]: sent [CCP ConfReq id=0x1]
Oct 20 11:25:17  pppd[5792]: rcvd [LCP ConfReq id=0x2 <asyncmap 0x0> <magic 0x8e9f9ca2> <pcomp> <accomp>]
Oct 20 11:25:17  pppd[5792]: sent [LCP ConfReq id=0x3 <asyncmap 0x0> <magic 0x7614dc03> <pcomp> <accomp>]
Oct 20 11:25:17  pppd[5792]: sent [LCP ConfAck id=0x2 <asyncmap 0x0> <magic 0x8e9f9ca2> <pcomp> <accomp>]
Oct 20 11:25:17  pppd[5792]: rcvd [LCP ConfAck id=0x2 <asyncmap 0x0> <magic 0x908697da> <pcomp> <accomp>]
Oct 20 11:25:17  pppd[5792]: rcvd [LCP EchoReq id=0x0 magic=0x8e9f9ca2]
Oct 20 11:25:17  pppd[5792]: rcvd [LCP EchoRep id=0x0 magic=0x8e9f9ca2]
Oct 20 11:25:17  pppd[5792]: rcvd [CCP ConfReq id=0x2 <deflate 15> <deflate(old#) 15>]
Oct 20 11:25:17  pppd[5792]: Discarded non-LCP packet when LCP not open
Oct 20 11:25:17  pppd[5792]: rcvd [IPCP ConfReq id=0x2 <compress VJ 0f 01> <addr 0.0.0.0>]
Oct 20 11:25:17  pppd[5792]: Discarded non-LCP packet when LCP not open
Oct 20 11:25:17  pppd[5792]: rcvd [IPCP ConfAck id=0x2 <compress VJ 0f 01> <addr 10.0.0.2>]
Oct 20 11:25:17  pppd[5792]: Discarded non-LCP packet when LCP not open
Oct 20 11:25:17  pppd[5792]: rcvd [CCP ConfAck id=0x1]



