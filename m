From: James Carlson <carlson@workingcode.com>
Date: Tue, 30 Dec 2003 16:07:16 +0000
Subject: RE: LCP packet priority
Message-Id: <16369.41652.742553.584895@h006008986325.ne.client2.attbi.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <AD59566A9D83864F871AE2E52503064001663CE9@aimail.aiinet.priv>
In-Reply-To: <AD59566A9D83864F871AE2E52503064001663CE9@aimail.aiinet.priv>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Eble, Dan writes:
> > Perhaps the implementation could be tweaked to check the input idle
> > time before declaring the link dead due to lack of LCP Echo-Response.
> 
> Wouldn't that fail to detect a failure of the transmit path?

Yes; it's not perfect.

Note that for the "priority" scheme to work, you'd need to have the
same control-over-data priority treatment at the peer end, otherwise,
the loss of the LCP Echo-Response would give you the same behavior as
the loss of the LCP Echo-Request.

On thinking about it more, I guess I do like the priority scheme.
After all, the same issues affect CCP Reset-Request, and more deeply
so.  (For CCP algorithms that use in-band signaling, such as STAC mode
4, we'd need to prioritize some data containing magic signaling bits.
This implies a design where something other than just the PPP Protocol
field is used to signal the priority.)

>  Well, I
> suppose in that case, the peer would stop receiving packets and terminate
> the connection.

Only if the peer is also doing the LCP Echo-Request/Response dance.
(That's what I was assuming when I wrote that, but you've pointed out
that it's not the best assumption.)

-- 
James Carlson                                  <carlson@workingcode.com>
