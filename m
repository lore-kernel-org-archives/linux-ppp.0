From: Paul Mackerras <paulus@samba.org>
Date: Thu, 14 Oct 2004 04:39:23 +0000
Subject: Re: ppp_mppe status for 2.6.x kernels
Message-Id: <16750.763.270119.39926@cargo.ozlabs.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20041012220528.GA7876@lists.us.dell.com>
In-Reply-To: <20041012220528.GA7876@lists.us.dell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Matt Domsch writes:

> Paul, I belive this addresses your concern about something being able
> to send an unencrypted (uncompressed) packet after encryption has been
> enabled.  This was done by adding a new field to struct compressor
> called must_compress, and testing for it here:
> 
>         /* try to do packet compression */
>         if ((ppp->xstate & SC_COMP_RUN) && ppp->xc_state != 0
>             && proto != PPP_LCP && proto != PPP_CCP) {
> +               if (!(ppp->flags & SC_CCP_UP) && ppp->xcomp->must_compress) {
> +                       printk(KERN_ERR "ppp: compression required but down - pkt dropped.\n");
>                         goto drop;
>                 }

That still only does anything while SC_COMP_RUN is set in
ppp->xstate.  If CCP goes down, SC_COMP_RUN gets cleared and we are no
better off than before.  The flag needs to be in ppp->flags and needs
to be set by pppd before we start negotiating.

Paul.
