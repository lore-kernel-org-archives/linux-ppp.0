From: Christoph Schulz <develop@kristov.de>
Date: Tue, 13 Jan 2015 20:57:26 +0000
Subject: Re: ppp_async: ioctl to set MTU needed
Message-Id: <20150113215726.54736f8tqxabg33q@berry.schulz.ip-v6.eu>
List-Id: <linux-ppp.vger.kernel.org>
References: <54B556D0.5090204@mirix.org>
In-Reply-To: <54B556D0.5090204@mirix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hello!

Matthias-Christian Ott schrieb am Tue, 13 Jan 2015 18:33:04 +0100:

> The MTU of a channel of a Multilink PPP link is set from the MRU of a
> Configure-Ack LCP packet. However, just because the is able to receive
> packets of a certain size it doesn't mean that the link or the sender
> are able to transmit packets of that size, so the received MTU of the
> channel should not be set to the MRU of the peer.

Well, this seems to be not so easy. I just studied the Kernel source  
code, the pppd source code and the PPP RFCs, so I feel rather  
well-informed in a way ;-)

What does the "mtu" option really do? In a word: (almost) nothing! It  
only restricts the MTU of the underlying network interface that is  
finally created after LCP negotation has completed successfully. You  
can see that the MTU value is stored in lcp_allowoptions[0].mru:

     { "mtu", o_int, &lcp_allowoptions[0].mru,
       "Set our MTU", OPT_LIMITS, NULL, MAXMRU, MINMRU },

(lcp.c, lines 132-133), and it is only used when setting the MTU of  
the network interface. The non-multilink case:

     /*
      * Set our MTU to the smaller of the MTU we wanted and
      * the MRU our peer wanted.  If we negotiated an MRU,
      * set our MRU to the larger of value we wanted and
      * the value we got in the negotiation.
      * Note on the MTU: the link MTU can be the MRU the peer wanted,
      * the interface MTU is set to the lowest of that, the
      * MTU we want to use, and our link MRU.
      */
     mtu = ho->neg_mru? ho->mru: PPP_MRU;
     mru = go->neg_mru? MAX(wo->mru, go->mru): PPP_MRU;
#ifdef HAVE_MULTILINK
     if (!(multilink && go->neg_mrru && ho->neg_mrru))
#endif /* HAVE_MULTILINK */
	netif_set_mtu(f->unit, MIN(MIN(mtu, mru), ao->mru));
                                ^^^                ^^^^^^^

(lcp.c, lines 1911-1925) and

		/* not doing multilink */
		if (go->neg_mrru)
			notice("oops, multilink negotiated only for receive");
		mtu = ho->neg_mru? ho->mru: PPP_MRU;
--->		if (mtu > ao->mru)
--->			mtu = ao->mru;

(multilink.c, lines 128-133). The multilink case:

	mtu = MIN(ho->mrru, ao->mru);
               ^^^           ^^^^^^^
	[...]
	netif_set_mtu(0, mtu);

(multilink.c, lines 184 and 234). So ao->mru (or the "mtu" value)  
effectively caps the MTU (due to the various MIN(...) macro  
invocations), but this does NOT mean that a larger peer MRU cannot be  
successfully negotiated! You see this in the lcp_reqci() function  
where CONFREQs are ACKed NAKed or REJected:

	case CI_MRU:
	    if (!ao->neg_mru ||		/* Allow option? */
		cilen != CILEN_SHORT) {	/* Check CI length */
		orc = CONFREJ;		/* Reject CI */
		break;
	    }
	    GETSHORT(cishort, p);	/* Parse MRU */

	    /*
	     * He must be able to receive at least our minimum.
	     * No need to check a maximum.  If he sends a large number,
	     * we'll just ignore it.
	     */
	    if (cishort < MINMRU) {
		orc = CONFNAK;		/* Nak CI */
		PUTCHAR(CI_MRU, nakp);
		PUTCHAR(CILEN_SHORT, nakp);
		PUTSHORT(MINMRU, nakp);	/* Give him a hint */
		break;
	    }
	    ho->neg_mru = 1;		/* Remember he sent MRU */
	    ho->mru = cishort;		/* And remember value */

(lcp.c, lines 1556-1577). So the "mtu" value does not have any  
consequences for the negotiated peer MRU. And, consequently, it does  
not influence the value the kernel uses for the channel MTU either, as  
the kernel uses the ACKed value:

	/* process the options in the confack */
	data += 4;
	dlen -= 4;
	/* data[0] is code, data[1] is length */
	while (dlen >= 2 && dlen >= data[1] && data[1] >= 2) {
		switch (data[0]) {
		case LCP_MRU:
			val = get_unaligned_be16(data + 2);
			if (inbound)
				ap->mru = val;
			else
				ap->chan.mtu = val;
			break;

(Kernel 3.17.8, ppp_async.c, lines 995-1007).

Where are we now? I think your problem lies in this comment in lcp_reqci():

	    /*
	     * He must be able to receive at least our minimum.
	     * No need to check a maximum.  If he sends a large number,
---> !!	     * we'll just ignore it.
	     */

You think each PPP implementation has to NAK when a MRU being larger  
than our MTU is REQuested by the peer. Obviously this isn't handled  
this way, at least not by pppd. However, I think your problem is  
twofold. You did not write how big your desired MTU (at the side of  
peer B) really is. I bet that it is smaller than 1500, as you write it  
is smaller than "link MTU minus maximum IP header length minus  
GRE/L2TP header length". However, RFC 1661 requires that each  
implementation MUST accept packets that are 1500 bytes long:

6.1.  Maximum-Receive-Unit (MRU)
[...]
       The default value is 1500 octets.  If smaller packets are
       requested, an implementation MUST still be able to receive the
       full 1500 octet information field in case link synchronization is
       lost.

So each attempt to force peer A to request a MRU < 1500 is formally  
wrong as it might be ignored -- even if the peer ACKs this MRU.


Regards,

Christoph Schulz

