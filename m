From: Frank Cusack <fcusack@fcusack.com>
Date: Tue, 03 Feb 2004 15:13:39 +0000
Subject: Re: ppp-2.4.2 released
Message-Id: <20040203071339.A12278@google.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <16391.33929.908463.444449@cargo.ozlabs.ibm.com>
In-Reply-To: <16391.33929.908463.444449@cargo.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Tue, Feb 03, 2004 at 06:33:23AM -0800, Frank Cusack wrote:
> When doing PMTU-D, one must not clamp the segment size to the MSS.

Excuse me.  Of course, one must always clamp segment size to MSS.  What
I meant was that during the course of an existing session, the stack
must be able to REDUCE the segment size below the MSS.

> > So either pppd is broken, or www.yle.fi tcp/ip stack is broken..
> 
> The latter.

Even more -- if it's receiving the frag-needed messages and not caching
them, it sounds broken.  ie, even if it is "ignoring" or mishandling them
for the current session, it should be caching the result and for the next
connection within some reasonable time window -- certainly within the amount
of time a user would hit 'reload' -- use a smaller MSS.

Is www.yle.fi behind a load balancer?  The worst problems I've seen with
MSS is when load balancers are involved.

(I have spent a lot of time debugging PMTU-D in the past. ;))

/fc
