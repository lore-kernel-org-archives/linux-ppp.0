From: James Carlson <carlsonj@workingcode.com>
Date: Thu, 29 Jul 2021 21:08:55 +0000
Subject: Re: [bug report] ppp: fix 'ppp_mp_reconstruct bad seq' errors
Message-Id: <4cf9ad78-538a-3043-6651-eb5d0f0b6800@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20210729141617.GC1267@kili>
In-Reply-To: <20210729141617.GC1267@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On 7/29/21 10:16 AM, Dan Carpenter wrote:
> The patch 8a49ad6e89fe: "ppp: fix 'ppp_mp_reconstruct bad seq'
> errors" from Feb 24, 2012, leads to the following static checker
> warning:
>
> 	drivers/net/ppp/ppp_generic.c:2840 ppp_mp_reconstruct()
> 	error: dereferencing freed memory 'tail'

What's the static checker, and does it provide any deeper analysis of
the code path and branch assumptions involved?

>     2755 		/* Got a complete packet yet? */
>     2756 		if (lost = 0 && (PPP_MP_CB(p)->BEbits & E) &&
>     2757 		    (PPP_MP_CB(head)->BEbits & B)) {
>     2758 			if (len > ppp->mrru + 2) {
>     2759 				++ppp->dev->stats.rx_length_errors;
>     2760 				netdev_printk(KERN_DEBUG, ppp->dev,
>     2761 					      "PPP: reconstructed packet"
>     2762 					      " is too long (%d)\n", len);
>     2763 			} else {
>     2764 				tail = p;
>                                         ^^^^^^^^
> tail is set to p.
> 
>     2765 				break;
>     2766 			}
>     2767 			ppp->nextseq = seq + 1;
>     2768 		}
>     2769 
>     2770 		/*
>     2771 		 * If this is the ending fragment of a packet,
>     2772 		 * and we haven't found a complete valid packet yet,
>     2773 		 * we can discard up to and including this fragment.
>     2774 		 */
>     2775 		if (PPP_MP_CB(p)->BEbits & E) {
>                             ^^^^^^^^^^^^^^^^^^^^^^^^
> 
> If "tail" is set, can this condition be true?

No.  You can't get here at all if tail is set.  Note the break at line
2765, which takes us out of the "skb_queue_walk_safe" iteration.  That
takes us all the way down to line 2793.

>     2776 			struct sk_buff *tmp2;
>     2777 
>     2778 			skb_queue_reverse_walk_from_safe(list, p, tmp2) {
>     2779 				if (ppp->debug & 1)
>     2780 					netdev_printk(KERN_DEBUG, ppp->dev,
>     2781 						      "discarding frag %u\n",
>     2782 						      PPP_MP_CB(p)->sequence);
>     2783 				__skb_unlink(p, list);
>     2784 				kfree_skb(p);
>                                         ^^^^^^^^^^^^
> On the first iteration through the loop then "p" is still set to "tail"
> so this will free "tail", leading to problems down the line.

tail must be NULL here.  Otherwise, we would have broken out of the loop
at line 2765.

Other than that the code is a bit hard to read, I don't see a problem here.

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
