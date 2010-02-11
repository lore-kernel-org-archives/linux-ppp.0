From: James Carlson <carlsonj@workingcode.com>
Date: Thu, 11 Feb 2010 15:45:19 +0000
Subject: Re: Control pppd behaviour
Message-Id: <4B74260F.6010805@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <27543592.post@talk.nabble.com>
In-Reply-To: <27543592.post@talk.nabble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Ashmath Khan wrote:
> Its neither about PPP negotiation nor about separate invocation of pppd.
> 
> As I mentioned its about retry mechanism or the algorithm or you can
> call it the strategy employed to retry if things fail.
> 
> For the normal retries if the retry interval is 30 secs and max retries is 5 ...
> then the 1st retry is at 30 secs
> 2nd at 60 secs
> 3rd at 90 secs
> 
> But I need it something like this:
> 1st retry at 30 secs
> 2nd retry at 120 secs
> 3rd retry at 300 secs etc..
> 
> Hope its clear. thanks.

Ashmath Khan wrote:
> I want to consider all failure cases(at lcp, at chap etc), any
> negotiation failure etc, for which pppd would retry with the server
> from scratch.
> Basically I don't pppd to retry after a failure but I want pppd to
> exit, and then the retry will be done by my program by relaunching
> pppd. is this possible ? maybe i need to keep the retries as zero ?
> thanks.

How about using the pppd "updetach" option, and using a script to invoke
and retry pppd as desired?

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>

