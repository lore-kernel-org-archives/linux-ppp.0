From: Paul Mackerras <paulus@samba.org>
Date: Wed, 31 Dec 2003 23:05:35 +0000
Subject: Re: LCP packet priority
Message-Id: <16371.22079.72333.752486@cargo.ozlabs.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <AD59566A9D83864F871AE2E52503064001663CE9@aimail.aiinet.priv>
In-Reply-To: <AD59566A9D83864F871AE2E52503064001663CE9@aimail.aiinet.priv>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Eble, Dan writes:

> Given a choice, I'd rather have the driver drop network protocol packets
> than control packets.  I scanned ppp_generic.c and I did not notice any
> priority treatment of LCP packets.  Did I overlook it, or is it not
> implemented?

Interesting question.  Looking at ppp_generic.c, assuming you are not
doing multilink, there is a kind of partial implementation of a
priority scheme in that we have two queues - one for the channel and
one (actually just a pointer to a single pending packet) for the ppp
unit.  Thus when we get an output_wakeup call from the channel, the
control packets (queued up by pppd on the channel queue via ppp_write)
will get sent before a pending data packet in ppp->xmit_pending.
However, when a data packet comes along we try to give it to the
channel even if there are packets in the channel queue already.  I
think we should hold off trying to send a data packet if there are
packets waiting in the channel queue.  The patch below should do that.

Regards,
Paul.

diff -urN linux-2.5/drivers/net/ppp_generic.c pmac-2.5/drivers/net/ppp_generic.c
--- linux-2.5/drivers/net/ppp_generic.c	2003-09-11 07:35:23.000000000 +1000
+++ pmac-2.5/drivers/net/ppp_generic.c	2004-01-01 10:03:21.153479568 +1100
@@ -1120,7 +1120,8 @@
 
 		spin_lock_bh(&pch->downl);
 		if (pch->chan) {
-			if (pch->chan->ops->start_xmit(pch->chan, skb))
+			if (skb_queue_len(&pch->file.xq) = 0
+			    && pch->chan->ops->start_xmit(pch->chan, skb))
 				ppp->xmit_pending = 0;
 		} else {
 			/* channel got unregistered */
