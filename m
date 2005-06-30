From: James Carlson <carlsonj@workingcode.com>
Date: Thu, 30 Jun 2005 15:36:29 +0000
Subject: Re: PPP Encapsulated in GRE with IP Precedence headers
Message-Id: <17092.4477.875971.589942@gargle.gargle.HOWL>
List-Id: <linux-ppp.vger.kernel.org>
References: <20050630051424.GA13477@digitalpath.net>
In-Reply-To: <20050630051424.GA13477@digitalpath.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Ray Van Dolson writes:
> > If it's just plain IP over PPP, and you're not negotiating any of MP,
> > ECP, CCP, VJ Header Compression, or Robust Header Compression, then
> > you should be able to get away with this.  The above protocols,
> > though, generally assume strict ordering (it is point-to-point,
> > right?) and will fall apart if that's compromised.
> 
> Unfortunately we are using MPPE, so perhaps this solution is not as viable as
> I thought it would be.  Thanks for the clarification.

I did say "generally."

If the actual compressor/encryptor is able to deal with multiple
session states for the separate flows that can be scheduled
independently, then this could still work.

But I don't see that MPPE (in particular) can do that.  It has just
one 'coherency count' field, and doesn't seem to maintain multiple
histories.  Unless there's buffering and reordering done at the
receiver (which would pretty much nullify any goodness you might hope
to get from priority queuing), I think you're sunk.

An alternate path that might do the job would be to set up multiple
parallel PPP sessions (one for each distinct ordering class), and
direct the traffic on entry from IP into PPP based on DSCP.  Though it
looks feasible from the protocol level, that might take some doing
depending on the implementations involved.

(In practice, I haven't been any too impressed with prioritization
schemes that do more than just make sure that network control traffic
has highest priority.  And even then there are some interesting
failure modes ...)

-- 
James Carlson                                 <carlsonj@workingcode.com>
