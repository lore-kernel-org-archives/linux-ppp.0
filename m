From: James Carlson <carlsonj@workingcode.com>
Date: Fri, 30 Jul 2021 17:15:39 +0000
Subject: Re: [bug report] ppp: fix 'ppp_mp_reconstruct bad seq' errors
Message-Id: <6c6f81af-db62-6644-117a-3bf0a1d62087@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20210729141617.GC1267@kili>
In-Reply-To: <20210729141617.GC1267@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 7/30/21 4:48 AM, Dan Carpenter wrote:
>>     2755 		/* Got a complete packet yet? */
>>     2756 		if (lost = 0 && (PPP_MP_CB(p)->BEbits & E) &&
>>     2757 		    (PPP_MP_CB(head)->BEbits & B)) {
>>     2758 			if (len > ppp->mrru + 2) {
>>     2759 				++ppp->dev->stats.rx_length_errors;
>>     2760 				netdev_printk(KERN_DEBUG, ppp->dev,
>>     2761 					      "PPP: reconstructed packet"
>>     2762 					      " is too long (%d)\n", len);
>>     2763 			} else {
>>     2764 				tail = p;
>>                                         ^^^^^^^^
>> tail is set to p.
> 
> At this point Smatch understands that "tail" and "p" are non-NULL.

Yep.  And 'head' is non-NULL and points to the first buf of the
reassembled packet, 'tail' is non-NULL and points to the last buf of the
reassembled packet.  And head may be equal to tail if it's packet
consisting of a single MP fragment.  And because 'lost' is zero, we know
that we have all of the intermediate fragments chained as well.  It's a
complete message.

>>     2793 	/* If we have a complete packet, copy it all into one skb. */
>>     2794 	if (tail != NULL) {
> 
> This condition means "tail = p"

True at this point.  (Not real meaningful, as we'll see in a bit, but
true nonetheless.)

>>     2795 		/* If we have discarded any fragments,
>>     2796 		   signal a receive error. */
>>     2797 		if (PPP_MP_CB(head)->sequence != ppp->nextseq) {
> 
> Smatch is supposed to "understand" condtions, but this one is quite
> complicated and the only thing that Smatch understands is just the
> basic meaning that these two are not equal.

That's ok; it's a worthwhile branch to explore, so we can assume it's true.

>>     2798 			skb_queue_walk_safe(list, p, tmp) {
>>     2799 				if (p = head)
> 
> One of the weak points of Smatch is how it parses lists...  Also it
> doesn't have any implications for this if (p = head) condition.

This is where things break down.  That queue walker macro on line 2798
re-assigns 'p'.  The code marches over the list and says "anything that
still exists up to (but not including) the head for this completed
packet is trash."  Note that *NOTHING* here is harming 'head' or
anything in the list that follows that buffer -- which includes 'tail.'

>>     2800 					break;

That break protects us from hurting 'tail'.

>>     2801 				if (ppp->debug & 1)
>>     2802 					netdev_printk(KERN_DEBUG, ppp->dev,
>>     2803 						      "discarding frag %u\n",
>>     2804 						      PPP_MP_CB(p)->sequence);
>>     2805 				__skb_unlink(p, list);
>>     2806 				kfree_skb(p);
> 
> We know that p = tail going in to the start of this list so this is
> going to free tail.  Of course kfree_skb() is refcounted and the free
> only happens when the last reference is dropped.

Not so.  p != tail here.  It cannot possibly be tail, because we (A)
reassigned 'p' at the top of the loop and (B) broke out of the loop on
hitting 'head'.

>>     2836 		} else {
>>     2837 			__skb_unlink(skb, list);
>>     2838 		}
>>     2839 
>> --> 2840 		ppp->nextseq = PPP_MP_CB(tail)->sequence + 1;
>>                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
> Here is where Smatch complains.

If that's Smatch's analysis of the situation, then Smatch is wrong.
It's a bogus warning.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
