From: James Carlson <carlsonj@workingcode.com>
Date: Thu, 11 Feb 2010 13:39:36 +0000
Subject: Re: Control pppd behaviour
Message-Id: <4B740898.6050108@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <27543592.post@talk.nabble.com>
In-Reply-To: <27543592.post@talk.nabble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Ashmath Khan wrote:
> Thanks James for long explanation.
> 
> Let me explain. I am actually looking for a different retry mechanism
> for failures. My retry interval would vary depending on the number of
> retries. To given an example:
> nth retry is to be attempted at (n - 1)3 x 10 secs after previous attempt

Why?  You still haven't explained what you're doing.

What problem are you attempting to solve?  Can you give us any hints at all?

> So the retry interval is not constant but derived from a formula.
> 
> Are such things possible without modifying the code ?

No.  See pppd/fsm.c, f->timeouttime, and the TIMEOUT() macro.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
