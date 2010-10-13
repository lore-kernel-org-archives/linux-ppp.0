From: James Carlson <carlsonj@workingcode.com>
Date: Wed, 13 Oct 2010 12:08:48 +0000
Subject: Re: Using PPPD pty option and script: controlling stdin buffer size?
Message-Id: <4CB5A150.2020908@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <291B2C7721AC7B49AD11449A2883992E2E0DF561DB@SINTEFEXMBX01.sintef.no>
In-Reply-To: <291B2C7721AC7B49AD11449A2883992E2E0DF561DB@SINTEFEXMBX01.sintef.no>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Arne Lie wrote:
> [Arne::] With all the respect, congestion control needs normally packet loss
> due to traffic overload to respond correctly, yes?

No.  You've also got measurable delay, which I think is the key to
solving this problem.

> With the large buffering
> of stdin this do not happen before long... We're dealing with underwater 
> networks with severely slow links and
> large propagation delays. We need relative short buffers to avoid seeing too
> big RTTs. Default PPP interfaces are set up with txqueuelen = 3, which is fine.
> However, when the *effective* queue size is this plus the stdin buffering, which
> we do not know the size of in bytes, but is in order of minutes (!) in RTT for such 
> slow links, then it starts to get an annoyance. 

What would you do if the "excessive" buffering were in some box in the
middle of the network?  For many older systems, transmit queues of 50
packets or more are not at all uncommon.

I expect that an algorithm that tracks both round-trip latency and
throughput (using feedback from the peer) should be able to detect when
increasing the send rate only causes latency to go up and doesn't change
throughput.  That's the optimal rate.

If you feel like hacking your kernel anyway then good luck with that,
but I suspect you'll be back to this problem in the future.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
