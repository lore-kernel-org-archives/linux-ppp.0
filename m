From: James Carlson <carlsonj@workingcode.com>
Date: Thu, 11 Feb 2010 13:18:28 +0000
Subject: Re: Control pppd behaviour
Message-Id: <4B7403A4.1070406@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <27543592.post@talk.nabble.com>
In-Reply-To: <27543592.post@talk.nabble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Ashmath Khan wrote:
> I am not looking for multiple options with which pppd needs to try.
> Let me give an example, normally if auth fails...it will retry after
> 'a' seconds for 'n' number of times.
> What I would need is say it should try after 'a' seconds for first
> retry, after '2a' seconds for second try after first retry fails and
> so on..etc. Basically I want to change the retry mechanism. Is there a
> way to change without changing the code ?

It's still unclear what you're after.

Are you asking about the details of how the protocol itself works?  In
other words, are you asking about how you can modify the algorithm that
decides when to send PPP negotiation packets?

If so, then you'll need to change the source code and recompile.  There
are documented parameters that allow you to change the maximum number of
retries and the interval between retries, but none that change the
algorithm used to determine when retries occur.  The algorithm is simple
and fixed: when the timer expires and there are retries left, the TO+
event is delivered, and that causes the timer to be restarted and a new
message to be generated.

Perhaps the real question here is: "what are you trying to do?"  If you
could explain what higher-level problem you're trying to solve, it might
be possible for someone to give you a better answer.

Are you trying to work around a problem?  If so, what problem, with what
symptoms and debug log messages?  Are you trying to interoperate with a
peer that has bugs?  Are you trying to experiment with PPP itself?

On the off chance that you're trying to "work around" an error message
such as "LCP: timeout sending Config-Requests", you shouldn't.  That
message doesn't mean there's anything wrong with the timer algorithm.
It means that either the physical link isn't working properly or that
the peer just isn't running PPP at all.  With a dial-up link, it usually
means that the chat script has failed.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
