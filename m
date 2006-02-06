From: James Carlson <carlsonj@workingcode.com>
Date: Mon, 06 Feb 2006 20:27:20 +0000
Subject: Re: PPPoE stuff
Message-Id: <17383.45352.193320.561043@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <op.s4kigj0bblqxiz@jono.amd>
In-Reply-To: <op.s4kigj0bblqxiz@jono.amd>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Ionut Turturica writes:
> Any hints for this?
> I'm trying to connect a XP machine with a rp-pppoe server. I see that XP  
> client keeps requesting CallBack, and we refuse it..

The lack of response to your LCP Configure-Request messages (he should
have sent at least an ack or nak) seems to indicate that this is a
low-level communications problem of some sort.  No packets are getting
through at all, so negotiation is simply impossible.  PPP is running,
but the PPPoE mechanism is failing.

> Feb  6 22:06:42 lfs pptp[31703]: anon log[decaps_gre:pptp_gre.c:407]:  
> buffering packet 1003 (expecting 1000, lost or reordered)
[...]
> Feb  6 22:06:58 lfs pppoe-server[31611]: Sent PADT

That's sort of scary.  Is this PPTP, PPPoE, or what?  Why messages
from both?  (Or are those just unrelated?)

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
