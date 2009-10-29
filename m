From: James Carlson <carlsonj@workingcode.com>
Date: Thu, 29 Oct 2009 16:14:42 +0000
Subject: Re: strange pppd error
Message-Id: <4AE9BF72.7000007@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <4AE9B268.1090607@bfs.de>
In-Reply-To: <4AE9B268.1090607@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

I should always proof-read before sending.  :-/

James Carlson wrote:
> walter harms wrote:
>> Oct 20 13:56:12  pppd[5792]: rcvd [LCP ConfReq id=0xc8 <asyncmap 0x0> <magic 0xab132318> <pcomp> <accomp>]
>> Oct 20 13:56:12  pppd[5792]: sent [LCP ConfReq id=0xc9 <asyncmap 0x0> <magic 0xf79dba92> <pcomp> <accomp>]
>> Oct 20 13:56:12  pppd[5792]: sent [LCP ConfAck id=0xc8 <asyncmap 0x0> <magic 0xab132318> <pcomp> <accomp>]
>> Oct 20 13:56:12  pppd[5792]: rcvd [LCP ConfAck id=0xc8 <asyncmap 0x0> <magic 0xd71a0c90> <pcomp> <accomp>]
> 
> Uh oh.  It looks like the peer is broken.  Note the ID number on that
> message: it's 0xc8.  That's the ID on the peer's own Configure-Request,
> which makes no sense at all.

One other clue I certainly should have noticed here is the magic number
-- it's different from what we sent.  So that is *not* merely an errant
response on the peer's part.

Why is the peer sending that last message above?  I don't know.  It's as
though the peer is responding to an LCP Configure-Request that we never
sent, at least according to the abbreviated log file presented here.

(You don't need to post the whole multi-megabyte log file, but posting
the LCP initial negotiation on the link and any LCP negotiation messages
seen up to the point of failure would be extremely helpful.)

What's the nature of the link between these two systems?  Is it possible
for LCP messages from one link to be replayed on another link?  Is it
possible for some other machine's messages to get injected on this link?
 Could the link itself store and replay messages?

I think the first step would be finding out why the peer suddenly
thought it received an LCP Configure-Request message from us with ID
0xc8 and Magic Number 0xd71a0c90, when we apparently sent no such thing.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
