From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 29 Jul 2021 14:16:17 +0000
Subject: [bug report] ppp: fix 'ppp_mp_reconstruct bad seq' errors
Message-Id: <20210729141617.GC1267@kili>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

[ This is ancient code, but the warning seems somewhat reasonable and
  hopefully not too complicated to review? - dan ]

Hello PPP devs,

The patch 8a49ad6e89fe: "ppp: fix 'ppp_mp_reconstruct bad seq'
errors" from Feb 24, 2012, leads to the following static checker
warning:

	drivers/net/ppp/ppp_generic.c:2840 ppp_mp_reconstruct()
	error: dereferencing freed memory 'tail'

drivers/net/ppp/ppp_generic.c
    2692 static struct sk_buff *
    2693 ppp_mp_reconstruct(struct ppp *ppp)
    2694 {
    2695 	u32 seq = ppp->nextseq;
    2696 	u32 minseq = ppp->minseq;
    2697 	struct sk_buff_head *list = &ppp->mrq;
    2698 	struct sk_buff *p, *tmp;
    2699 	struct sk_buff *head, *tail;
    2700 	struct sk_buff *skb = NULL;
    2701 	int lost = 0, len = 0;
    2702 
    2703 	if (ppp->mrru = 0)	/* do nothing until mrru is set */
    2704 		return NULL;
    2705 	head = __skb_peek(list);
    2706 	tail = NULL;
    2707 	skb_queue_walk_safe(list, p, tmp) {
    2708 	again:
    2709 		if (seq_before(PPP_MP_CB(p)->sequence, seq)) {
    2710 			/* this can't happen, anyway ignore the skb */
    2711 			netdev_err(ppp->dev, "ppp_mp_reconstruct bad "
    2712 				   "seq %u < %u\n",
    2713 				   PPP_MP_CB(p)->sequence, seq);
    2714 			__skb_unlink(p, list);
    2715 			kfree_skb(p);
    2716 			continue;
    2717 		}
    2718 		if (PPP_MP_CB(p)->sequence != seq) {
    2719 			u32 oldseq;
    2720 			/* Fragment `seq' is missing.  If it is after
    2721 			   minseq, it might arrive later, so stop here. */
    2722 			if (seq_after(seq, minseq))
    2723 				break;
    2724 			/* Fragment `seq' is lost, keep going. */
    2725 			lost = 1;
    2726 			oldseq = seq;
    2727 			seq = seq_before(minseq, PPP_MP_CB(p)->sequence)?
    2728 				minseq + 1: PPP_MP_CB(p)->sequence;
    2729 
    2730 			if (ppp->debug & 1)
    2731 				netdev_printk(KERN_DEBUG, ppp->dev,
    2732 					      "lost frag %u..%u\n",
    2733 					      oldseq, seq-1);
    2734 
    2735 			goto again;
    2736 		}
    2737 
    2738 		/*
    2739 		 * At this point we know that all the fragments from
    2740 		 * ppp->nextseq to seq are either present or lost.
    2741 		 * Also, there are no complete packets in the queue
    2742 		 * that have no missing fragments and end before this
    2743 		 * fragment.
    2744 		 */
    2745 
    2746 		/* B bit set indicates this fragment starts a packet */
    2747 		if (PPP_MP_CB(p)->BEbits & B) {
    2748 			head = p;
    2749 			lost = 0;
    2750 			len = 0;
    2751 		}
    2752 
    2753 		len += p->len;
    2754 
    2755 		/* Got a complete packet yet? */
    2756 		if (lost = 0 && (PPP_MP_CB(p)->BEbits & E) &&
    2757 		    (PPP_MP_CB(head)->BEbits & B)) {
    2758 			if (len > ppp->mrru + 2) {
    2759 				++ppp->dev->stats.rx_length_errors;
    2760 				netdev_printk(KERN_DEBUG, ppp->dev,
    2761 					      "PPP: reconstructed packet"
    2762 					      " is too long (%d)\n", len);
    2763 			} else {
    2764 				tail = p;
                                        ^^^^^^^^
tail is set to p.

    2765 				break;
    2766 			}
    2767 			ppp->nextseq = seq + 1;
    2768 		}
    2769 
    2770 		/*
    2771 		 * If this is the ending fragment of a packet,
    2772 		 * and we haven't found a complete valid packet yet,
    2773 		 * we can discard up to and including this fragment.
    2774 		 */
    2775 		if (PPP_MP_CB(p)->BEbits & E) {
                            ^^^^^^^^^^^^^^^^^^^^^^^^

If "tail" is set, can this condition be true?

    2776 			struct sk_buff *tmp2;
    2777 
    2778 			skb_queue_reverse_walk_from_safe(list, p, tmp2) {
    2779 				if (ppp->debug & 1)
    2780 					netdev_printk(KERN_DEBUG, ppp->dev,
    2781 						      "discarding frag %u\n",
    2782 						      PPP_MP_CB(p)->sequence);
    2783 				__skb_unlink(p, list);
    2784 				kfree_skb(p);
                                        ^^^^^^^^^^^^
On the first iteration through the loop then "p" is still set to "tail"
so this will free "tail", leading to problems down the line.

    2785 			}
    2786 			head = skb_peek(list);
    2787 			if (!head)
    2788 				break;
    2789 		}
    2790 		++seq;
    2791 	}
    2792 
    2793 	/* If we have a complete packet, copy it all into one skb. */
    2794 	if (tail != NULL) {
    2795 		/* If we have discarded any fragments,
    2796 		   signal a receive error. */
    2797 		if (PPP_MP_CB(head)->sequence != ppp->nextseq) {
    2798 			skb_queue_walk_safe(list, p, tmp) {
    2799 				if (p = head)
    2800 					break;
    2801 				if (ppp->debug & 1)
    2802 					netdev_printk(KERN_DEBUG, ppp->dev,
    2803 						      "discarding frag %u\n",
    2804 						      PPP_MP_CB(p)->sequence);
    2805 				__skb_unlink(p, list);
    2806 				kfree_skb(p);
    2807 			}
    2808 
    2809 			if (ppp->debug & 1)
    2810 				netdev_printk(KERN_DEBUG, ppp->dev,
    2811 					      "  missed pkts %u..%u\n",
    2812 					      ppp->nextseq,
    2813 					      PPP_MP_CB(head)->sequence-1);
    2814 			++ppp->dev->stats.rx_dropped;
    2815 			ppp_receive_error(ppp);
    2816 		}
    2817 
    2818 		skb = head;
    2819 		if (head != tail) {
    2820 			struct sk_buff **fragpp = &skb_shinfo(skb)->frag_list;
    2821 			p = skb_queue_next(list, head);
    2822 			__skb_unlink(skb, list);
    2823 			skb_queue_walk_from_safe(list, p, tmp) {
    2824 				__skb_unlink(p, list);
    2825 				*fragpp = p;
    2826 				p->next = NULL;
    2827 				fragpp = &p->next;
    2828 
    2829 				skb->len += p->len;
    2830 				skb->data_len += p->len;
    2831 				skb->truesize += p->truesize;
    2832 
    2833 				if (p = tail)
    2834 					break;
    2835 			}
    2836 		} else {
    2837 			__skb_unlink(skb, list);
    2838 		}
    2839 
--> 2840 		ppp->nextseq = PPP_MP_CB(tail)->sequence + 1;
                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    2841 	}
    2842 
    2843 	return skb;
    2844 }

regards,
dan carpenter
