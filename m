From: "Eble, Dan" <DanE@aiinet.com>
Date: Fri, 02 Jan 2004 16:57:33 +0000
Subject: RE: LCP packet priority
Message-Id: <AD59566A9D83864F871AE2E52503064001663CF0@aimail.aiinet.priv>
List-Id: <linux-ppp.vger.kernel.org>
References: <AD59566A9D83864F871AE2E52503064001663CE9@aimail.aiinet.priv>
In-Reply-To: <AD59566A9D83864F871AE2E52503064001663CE9@aimail.aiinet.priv>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Paul Mackerras writes,
> However, when a data packet comes along we try to give it to the
> channel even if there are packets in the channel queue already.  I
> think we should hold off trying to send a data packet if there are
> packets waiting in the channel queue.  The patch below should do that.

Thanks Paul.  Your patch was beneficial, but it didn't completely hide the
problems in our serial driver. ;-)  I will use your patch *and* change our
serial driver.

Thank you also for answering my question about ppp_write() being the place
to set skb->priority for control packets.  If ppp_write() handles traffic
from the daemon only, it seems resonable to set TC_PRIO_CONTROL for
everything passing through it.

-- 
Dan Eble <dane@aiinet.com>  _____  .
                           |  _  |/|
Applied Innovation Inc.    | |_| | |    "All Protocols MUST be odd"
http://www.aiinet.com/     |__/|_|_|      -- RFC 1661 (PPP)
