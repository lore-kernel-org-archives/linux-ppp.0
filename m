From: Matt Domsch <Matt_Domsch@dell.com>
Date: Wed, 13 Oct 2004 16:41:35 +0000
Subject: Re: [pptp-devel] Re: ppp_mppe status for 2.6.x kernels
Message-Id: <20041013164135.GA29936@lists.us.dell.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20041012220528.GA7876@lists.us.dell.com>
In-Reply-To: <20041012220528.GA7876@lists.us.dell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Wed, Oct 13, 2004 at 02:47:16PM +0400, Michael Tokarev wrote:
> >+                       printk(KERN_ERR "ppp: compression required but 
> >down - pkt dropped.\n");
>
> Please don't do that -- don't flood syslog.  See how similar
> things are done in other net/ code (eg, using net_ratelimit()).

Good point.  I've added net_ratelimit()s to the printks that my patch
touches.  There are a few others in ppp_generic.c which might benefit
from the same treatment, but I'd rather not do those in conjunction
with the changes necessary for ppp_mppe inclusion.

How's this look?

-- 
Matt Domsch
Sr. Software Engineer, Lead Engineer
Dell Linux Solutions linux.dell.com & www.dell.com/linux
Linux on Dell mailing lists @ http://lists.us.dell.com

=== drivers/net/ppp_generic.c 1.50 vs edited ==--- 1.50/drivers/net/ppp_generic.c	2004-10-12 11:10:48 -05:00
+++ edited/drivers/net/ppp_generic.c	2004-10-13 09:36:22 -05:00
@@ -1017,7 +1017,8 @@
 	int compressor_skb_size = ppp->dev->mtu + ppp->xcomp->comp_skb_extra_space + PPP_HDRLEN;
 	new_skb = alloc_skb(new_skb_size, GFP_ATOMIC);
 	if (!new_skb) {
-		printk(KERN_ERR "PPP: no memory (comp pkt)\n");
+		if (net_ratelimit())
+			printk(KERN_ERR "PPP: no memory (comp pkt)\n");
 		return NULL;
 	}
 	if (ppp->dev->hard_header_len > PPP_HDRLEN)
@@ -1046,7 +1047,8 @@
 		 * the compress_proto because MPPE and MPPC share
 		 * the same number.
 		 */
-		printk(KERN_ERR "ppp: compressor dropped pkt\n");
+		if (net_ratelimit())
+			printk(KERN_ERR "ppp: compressor dropped pkt\n");
 		kfree_skb(new_skb);
 		new_skb = NULL;
 	}
@@ -1140,7 +1142,8 @@
 	if ((ppp->xstate & SC_COMP_RUN) && ppp->xc_state != 0
 	    && proto != PPP_LCP && proto != PPP_CCP) {
 		if (!(ppp->flags & SC_CCP_UP) && ppp->xcomp->must_compress) {
-			printk(KERN_ERR "ppp: compression required but down - pkt dropped.\n");
+			if (net_ratelimit())
+				printk(KERN_ERR "ppp: compression required but down - pkt dropped.\n");
 			goto drop;
 		}
 		skb = pad_compress_skb(ppp, skb);
