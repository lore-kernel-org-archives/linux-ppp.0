From: Andy <fs@globalnetit.com>
Date: Sun, 21 Mar 2004 19:21:12 +0000
Subject: Re: pppd 2.4.2b3 IPCP converge failure
Message-Id: <1079896872.1131.65.camel@dell.tranquilitynj.net>
List-Id: <linux-ppp.vger.kernel.org>
References: <1079855955.1133.48.camel@dell.tranquilitynj.net>
In-Reply-To: <1079855955.1133.48.camel@dell.tranquilitynj.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Sun, 2004-03-21 at 13:44, James Carlson wrote:

> You've cut off the important part of this log -- the one where the
> peers had initial trouble negotiating IPCP.  You'll need to get that
> part of the log and examine it.
I know. As I mentioned, I only have about 5 minutes of logs, the earlier
stuff got overwritten. There's just not enough space on the device to
store more. This whole event lasted for about an hour.
If it happens again, I may be able to find a way to save more. 

> 
> > I'm wondering about the ConfReq packets, what is the second address
> > field doing there (as in addrs 68.244.143.67 0.0.0.0)
> 
> This is the old, obsolete IP-Addresses option (see RFC 1332, section
> 3.1).  The only time it's used is when the modern IP-Address option
> fails.  And, yes, pppd is rather insistent on trying to use it when
> all else fails.
> 
> It's just a symptom of some other problem, not a cause, and not
> necessarily a problem in itself.
> 
> At a guess, something went terribly wrong in the initial IPCP
> negotiation.  Does that remote peer properly implement the state
> machine from RFC 1661?

No idea - it's an ISP, I don't know what they're using.
However, whether they implement it correctly or not, it seems that pppd
does not - it's pretty clear from rfc1661 that just repeating the same
configure-request over and over, despite getting a configure-reject, is
a protocol violation.

Although it would be useful to know how we got into this state, it's
probably more important to fix the code so this endless loop won't
happen. I'm not familiar enough with the IPCP FSM as implemented in pppd
to be able to do that quickly, I was hoping someone may have done this
work already. If not, I'll try to get into the code myself.




