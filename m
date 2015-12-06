From: James Carlson <carlsonj@workingcode.com>
Date: Sun, 06 Dec 2015 16:53:02 +0000
Subject: Re: Netflix and pppd
Message-Id: <566467EE.2080204@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <566461FE.4090003@seiner.com>
In-Reply-To: <566461FE.4090003@seiner.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 12/6/2015 11:27 AM, Yan Seiner wrote:
> I've been chasing a weird issue with Netflix and pppd.  Basically, the
> Netflix apps in my Roku and Samsung TV will not play reliably when using
> pppoe.  Using tcpdump I can see packets flow, but the app will either
> stop at 25% or 99% and eventually time out with the "We're having
> trouble playing this title right now".
> 
> If I set up my modem to handle the pppoe connection and do double NAT,
> it works fine.  The problem only comes up when I set up the modem to act
> as a dumb modem and use pppd to complete the connection.  The problem
> only happens when I am running pppd to set up the connection.

Based on the terms you're using, I'm guessing that the hardware
configuration looks like this:

  <--wan--> "modem" <--lan1--> Linux <--lan2--> Samsung/Roku

(Is this correct?  Is there a Linux box in here or something else?  Are
there other devices involved?)

In the working case, the "modem" device is configured to terminate
PPPoE, PPP, and to provide NAT functionality, and the Linux device
separately also provides NAT functionality.  So, native TCP/IP is seen
on both lan1 and lan2.  In the non-working case, the raw PPPoE frames
are passed on lan1, and the Linux box is configured for NAT.

Is this much right?

At a guess, it sounds like the "modem" is doing a better job of dealing
with the unbelievable horror show that is PPPoE and NAT, and when the
Linux box steps into that role, it isn't well-configured by default to
deal with it.

What I cannot tell is what you may have tried to do to get this to work.
 Have you read through this documentation?

http://www.tldp.org/HOWTO/IP-Masquerade-HOWTO/mtu-issues.html
http://lartc.org/howto/lartc.cookbook.mtu-mss.html
http://unix.stackexchange.com/questions/56308/problem-with-path-mtu-discovery-over-pppd

In short, I'm not seeing what this problem has to do with PPP itself --
in most cases, PPP just negotiates link parameters and then steps out of
the way -- or the details of the problem you're encountering or what you
might have already tried to do to solve the problem.

(Sure, it's possible there's a PPP problem buried in here somewhere.
Based on the data provided so far, though, I just don't see it.)

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
