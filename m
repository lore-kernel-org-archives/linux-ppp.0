From: Matt Domsch <Matt_Domsch@dell.com>
Date: Tue, 12 Oct 2004 22:05:28 +0000
Subject: ppp_mppe status for 2.6.x kernels
Message-Id: <20041012220528.GA7876@lists.us.dell.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Quick update on the state of ppp_mppe in kernel 2.6.x.  Works for me,
but more testers are needed, please test and post your results to
these lists.

Paul, I belive this addresses your concern about something being able
to send an unencrypted (uncompressed) packet after encryption has been
enabled.  This was done by adding a new field to struct compressor
called must_compress, and testing for it here:

        /* try to do packet compression */
        if ((ppp->xstate & SC_COMP_RUN) && ppp->xc_state != 0
            && proto != PPP_LCP && proto != PPP_CCP) {
+               if (!(ppp->flags & SC_CCP_UP) && ppp->xcomp->must_compress) {
+                       printk(KERN_ERR "ppp: compression required but down - pkt dropped.\n");
                        goto drop;
                }


The code is here:

BK:
http://mdomsch.bkbits.net/linux-2.6-mppe

Patches:
http://domsch.com/linux/pptp/2.6.9-rc4/linux-2.6.9-rc4-ppp_mppe.patch
http://domsch.com/linux/pptp/2.6.9-rc4/linux-2.6.9-rc4-ppp_mppe.patch.sign

 drivers/net/Kconfig       |    6
 drivers/net/Makefile      |    1
 drivers/net/ppp_generic.c |   76 +++-
 drivers/net/ppp_mppe.c    |  721 ++++++++++++++++++++++++++++++++++++++++++++++
 drivers/net/ppp_mppe.h    |   87 +++++
 include/linux/ppp-comp.h  |   14
 6 files changed, 882 insertions, 23 deletions

through these ChangeSets:

<Matt_Domsch@dell.com> (04/10/12 1.2166)
   ppp_mppe: make SHA pad bytes once per driver rather than per-connection.

<Matt_Domsch@dell.com> (04/08/30 1.1803.16.4)
   ppp_mppe: use setup_sg() in get_hew_key_from_sha(), bump version

<mole@quadra.ru> (04/08/30 1.1803.16.3)
   ppp_mppe and ppp_generic.c: bug fixes
   
   From: Oleg Makarenko [mole@quadra.ru]
   Sent: Friday, July 30, 2004 2:33 PM
   
                                                                                                       
   1. setup_sg(). Do you really need to split the data this way? The
   documentation on crypto api and scatterlists is not very helpful so I
   could be wrong here but in my reading  of crypto/digest.c/update() (for
   ex)  you may just have a single sg[0] even if the data doesn't fit into
   a single page.  All pages just need to be contiguous. It probably
   doesn't hirt but is it really needed?  I have removed this split from
   your patch just to test it. Seems to work fine.
                                                                                                       
   2.  For some reason you can not use non GFP_KERNEL memory and scatter
   lists or at least mix them in crypto_digest().  That is why sha_pad is
   now in struct state {}.
                                                                                                       
   3.  In get_new_key_from_sha() the code like
                                                                                                       
      crypto_digest_update(state->sha1, sg, state->keylen)
                                                                                                       
   looks suspicious as the last parameter (in my reading of digest.c)
   should be the number of elements in sg[] array not the data length. That
   seems to be the reason for my kernel panics. With your setup_sg() the
   last parameter should be 1 or 2. Or may be you could replace all four
   digest_update calls with a single call with properly initilaized sg[4]
   (to make some use from scatterlist) . See the modified patch for details.
   
                                                                                                       
   4. in ppp_generic.c/pad_compress_skb() the following code:
                                                                                                       
          } else if (len = 0) {
                  /* didn't compress, or CCP not up yet */
                  kfree_skb(new_skb);
                  new_skb = NULL;
                  ...
           return new_skb;
                                                                                                       
   also looks suspicious as later I read
                                                                                                       
                  skb = pad_compress_skb(ppp, skb);
                  if (!skb)
                          goto drop;
                                                                                                       
   I think you don't want to drop packets with len = 0.  At least the
   previous mppe enabled ppp_generic.c code don't do that.  I've changed
   new_skb = NULL above to new_skb = skb, see the patch. IPCP can not be
   established without this modification.
   

<Matt_Domsch@dell.com> (04/07/20 1.1803.16.2)
   PPP: Add drivers/net/ppp_mppe.c, Makefile and Kconfig entries
   
   Microsoft Point-to-Point Tunnelling Protocol support
   utilizes ppp_generic and kernel crypto routines.

<Matt_Domsch@dell.com> (04/07/20 1.1803.16.1)
   PPP: add fields to struct compressor, use them in ppp-generic.c
   
   Add fields to struct compressor to allocate extra skb space
   for compression/decompression, and a flag to drop packets
   if CCP is down but required by the compression (encryption) alg.



I'd like to see this included after 2.6.9 is released, if possible,
but want to be sure everyone's concerns have been addressed.

Thanks,
Matt

-- 
Matt Domsch
Sr. Software Engineer, Lead Engineer
Dell Linux Solutions linux.dell.com & www.dell.com/linux
Linux on Dell mailing lists @ http://lists.us.dell.com
