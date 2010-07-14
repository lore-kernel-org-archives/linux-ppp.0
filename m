From: Ben McKeegan <ben@netservers.co.uk>
Date: Wed, 14 Jul 2010 08:36:56 +0000
Subject: Re: Multilink packet loss 2.6.32 - would like to resolve and have
Message-Id: <4C3D7728.8030500@netservers.co.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------040406090100080202000104"
List-Id: <linux-ppp.vger.kernel.org>
References: <15659855.171.1279078950097.JavaMail.root@zimbra.caneris.com>
In-Reply-To: <15659855.171.1279078950097.JavaMail.root@zimbra.caneris.com>
To: linux-ppp@vger.kernel.org

This is a multi-part message in MIME format.
--------------040406090100080202000104
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Erik L wrote:
> 
> I also tried another patch [3] to the default 2.6.32+ behaviour, but this didn't resolve the problem. There is still some packet loss, though it's a bit better than before.
> 
> [3] http://marc.info/?l=linux-ppp&m=127555649304387&w=2

Due to other time pressures I've still not had time to do any real 
testing of the rest of the patches in this series but if you want to try 
them yourself please see attachments.

Regards,
Ben.

-- 
Ben McKeegan
Netservers Limited
01223 446000 ext 8103


--------------040406090100080202000104
Content-Type: text/x-diff;
 name="0001-ppp_generic-fix-multilink-fragment-sizes.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="0001-ppp_generic-fix-multilink-fragment-sizes.patch"

From ee7beb261ec1a505e86819369c70dc4bf17897b8 Mon Sep 17 00:00:00 2001
From: Ben McKeegan <ben@netservers.co.uk>
Date: Thu, 3 Jun 2010 10:11:53 +0100
Subject: [PATCH] ppp_generic: fix multilink fragment sizes

Fix bug in multilink fragment size calculation introduced by
commit 9c705260feea6ae329bc6b6d5f6d2ef0227eda0a
"ppp: ppp_mp_explode() redesign"

Signed-off-by: Ben McKeegan <ben@netservers.co.uk>
---
 drivers/net/ppp_generic.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/net/ppp_generic.c b/drivers/net/ppp_generic.c
index 0db3894..c980f74 100644
--- a/drivers/net/ppp_generic.c
+++ b/drivers/net/ppp_generic.c
@@ -1416,7 +1416,7 @@ static int ppp_mp_explode(struct ppp *ppp, struct sk_buff *skb)
 		flen = len;
 		if (nfree > 0) {
 			if (pch->speed == 0) {
-				flen = totlen/nfree;
+				flen = len/nfree;
 				if (nbigger > 0) {
 					flen++;
 					nbigger--;
-- 
1.5.6.5


--------------040406090100080202000104
Content-Type: text/x-diff;
 name="0002-ppp-add-support-for-configuring-minimum-sizes-of-mu.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename*0="0002-ppp-add-support-for-configuring-minimum-sizes-of-mu.pat";
 filename*1="ch"

From 03424b002876a5a242229758b9940225f09ec8fc Mon Sep 17 00:00:00 2001
From: Ben McKeegan <ben@netservers.co.uk>
Date: Thu, 3 Jun 2010 18:49:10 +0100
Subject: [PATCH] ppp: add support for configuring minimum sizes of multilink fragments

Add a per bundle parameter for minimum multilink fragment size.  Setting
this parameter to a non-zero value will modify the multilink fragmentation
algorithm such that it no longer fragments every packet accross all free
channels where this would result in fragments below the configured threshold.

Setting any minimum fragment size in excess of the MTU will disable
fragmentation entirely, causing multilink packets to be sent round-robin
over all the free channels.

The minimum fragment size can be configured for each PPP bundle via a new
ioctl PPPIOCSMINFRAG.  The default value for new bundles is taken from the
module parameter 'min_frag_size', which defaults to 0.

Signed-off-by: Ben McKeegan <ben@netservers.co.uk>
---
 drivers/net/ppp_generic.c |   64 +++++++++++++++++++++++++++++++++++++++++---
 include/linux/if_ppp.h    |    1 +
 2 files changed, 60 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ppp_generic.c b/drivers/net/ppp_generic.c
index c980f74..ea477dd 100644
--- a/drivers/net/ppp_generic.c
+++ b/drivers/net/ppp_generic.c
@@ -70,6 +70,12 @@
 #define MPHDRLEN	6	/* multilink protocol header length */
 #define MPHDRLEN_SSN	4	/* ditto with short sequence numbers */
 
+#ifdef CONFIG_PPP_MULTILINK
+static int min_frag_size = 0;
+module_param(min_frag_size, int, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
+MODULE_PARM_DESC(min_frag_size, "Default minimum multilink fragment size");
+#endif /* CONFIG_PPP_MULTILINK */
+
 /*
  * An instance of /dev/ppp can be associated with either a ppp
  * interface unit or a ppp channel.  In both cases, file->private_data
@@ -123,6 +129,7 @@ struct ppp {
 	struct net_device *dev;		/* network interface device a4 */
 	int		closing;	/* is device closing down? a8 */
 #ifdef CONFIG_PPP_MULTILINK
+	int             minfragsize;    /* target minimum size for fragment */
 	int		nxchan;		/* next channel to send something on */
 	u32		nxseq;		/* next sequence number to send */
 	int		mrru;		/* MP: max reconst. receive unit */
@@ -777,6 +784,15 @@ static long ppp_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		ppp_recv_unlock(ppp);
 		err = 0;
 		break;
+
+	case PPPIOCSMINFRAG:
+		if (get_user(val, p))
+			break;
+		ppp_recv_lock(ppp);
+		ppp->minfragsize = val < 0 ? 0 : val;
+		ppp_recv_unlock(ppp);
+		err = 0;
+		break;
 #endif /* CONFIG_PPP_MULTILINK */
 
 	default:
@@ -1298,6 +1314,7 @@ static int ppp_mp_explode(struct ppp *ppp, struct sk_buff *skb)
 	int nbigger;
 	int totspeed;
 	int totfree;
+	int fragsize;
 	unsigned char *p, *q;
 	struct list_head *list;
 	struct channel *pch;
@@ -1311,6 +1328,8 @@ static int ppp_mp_explode(struct ppp *ppp, struct sk_buff *skb)
 	totfree = 0; /*total # of channels available and
 				  *having no queued packets before
 				  *starting the fragmentation*/
+	fragsize = 0; /* size of each smaller fragment if we are
+		       * enforcing a minimum frag size, otherwise 0 */
 
 	hdrlen = (ppp->flags & SC_MP_XSHORTSEQ)? MPHDRLEN_SSN: MPHDRLEN;
 	i = 0;
@@ -1336,10 +1355,11 @@ static int ppp_mp_explode(struct ppp *ppp, struct sk_buff *skb)
 	}
 	/*
 	 * Don't start sending this packet unless at least half of
-	 * the channels are free.  This gives much better TCP
-	 * performance if we have a lot of channels.
+	 * the channels are free or we have a target minimum fragment
+	 * size.  This gives much better TCP performance if we have a
+	 * lot of channels.
 	 */
-	if (nfree == 0 || nfree < navail / 2)
+	if (nfree == 0 || (nfree < navail / 2 && ppp->minfragsize == 0))
 		return 0; /* can't take now, leave it in xmit_pending */
 
 	/* Do protocol field compression (XXX this should be optional) */
@@ -1350,8 +1370,32 @@ static int ppp_mp_explode(struct ppp *ppp, struct sk_buff *skb)
 		--len;
 	}
 
+	/* 
+	 * If we have a target minimum fragment size and we
+	 * cannot meet this average fragment size by proportioning
+	 * the packet across all free channels, work out
+	 * the smallest fragsize >= minfragsize required to split 
+         * evenly over fewers channels.
+	 */
+	if (ppp->minfragsize > 0) {
+		/* number of minfragsize sized fragments we need,
+		   rounded down */
+		int nfrag= len / ppp->minfragsize;
+		if (nfrag <= 1) {
+			fragsize = len; /* single fragment */
+			nbigger = 0;
+		} else if (nfrag < nfree) {
+			/* we need nfrag fragments, of which
+			   (nfrag-nbigger) are sized fragsize, 
+			   and nbigger are sized fragsize+1 */
+			fragsize = len / nfrag;
+			nbigger = len % nfrag;
+		}
+	}
+
 	totlen = len;
-	nbigger = len % nfree;
+	if (fragsize == 0) /* balancing across all free channels */
+		nbigger = len % nfree;
 
 	/* skip to the channel after the one we last used
 	   and start at that one */
@@ -1415,7 +1459,16 @@ static int ppp_mp_explode(struct ppp *ppp, struct sk_buff *skb)
 		*/
 		flen = len;
 		if (nfree > 0) {
-			if (pch->speed == 0) {
+			if (fragsize > 0) {
+				/* if we are enforcing minimum fragment size,
+				   use precalculated fragsize to divide
+				   evenly over fewer channels */
+				flen = fragsize;
+				if (nbigger > 0) {
+					flen++;
+					nbigger--;
+				}
+			} else if (pch->speed == 0) {
 				flen = len/nfree;
 				if (nbigger > 0) {
 					flen++;
@@ -2565,6 +2618,7 @@ ppp_create_interface(struct net *net, int unit, int *retp)
 	spin_lock_init(&ppp->rlock);
 	spin_lock_init(&ppp->wlock);
 #ifdef CONFIG_PPP_MULTILINK
+	ppp->minfragsize = min_frag_size;
 	ppp->minseq = -1;
 	skb_queue_head_init(&ppp->mrq);
 #endif /* CONFIG_PPP_MULTILINK */
diff --git a/include/linux/if_ppp.h b/include/linux/if_ppp.h
index fcef103..da06147 100644
--- a/include/linux/if_ppp.h
+++ b/include/linux/if_ppp.h
@@ -161,6 +161,7 @@ struct pppol2tp_ioc_stats {
 #define PPPIOCATTCHAN	_IOW('t', 56, int)	/* attach to ppp channel */
 #define PPPIOCGCHAN	_IOR('t', 55, int)	/* get ppp channel number */
 #define PPPIOCGL2TPSTATS _IOR('t', 54, struct pppol2tp_ioc_stats)
+#define PPPIOCSMINFRAG  _IOW('t', 53, int)  /* minimum fragment size */
 
 #define SIOCGPPPSTATS   (SIOCDEVPRIVATE + 0)
 #define SIOCGPPPVER     (SIOCDEVPRIVATE + 1)	/* NEVER change this!! */
-- 
1.5.6.5


--------------040406090100080202000104
Content-Type: text/x-diff;
 name="0003-ppp-optionally-omit-multilink-header-when-fragmenta.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename*0="0003-ppp-optionally-omit-multilink-header-when-fragmenta.pat";
 filename*1="ch"

From 9c7c7bc1d011e0ea96211b7423c8f389202fb0ad Mon Sep 17 00:00:00 2001
From: Ben McKeegan <ben@netservers.co.uk>
Date: Fri, 4 Jun 2010 17:55:11 +0100
Subject: [PATCH] ppp: optionally omit multilink header when fragmentation not required

Add an alternative mode to the multilink sending algorithm to avoid
encapsulating packets in a multilink header where otherwise only
a single multilink packet would have been sent.

This mode can be enabled for an existing PPP bundle by setting the
SC_NOT_1_FRAG flag via the PPPIOCSFLAGS ioctl.  It can be enabled
by default for new bundles by setting the module parameter
encaps_fragmented_only=1

Signed-off-by: Ben McKeegan <ben@netservers.co.uk>
---
 drivers/net/ppp_generic.c |   69 +++++++++++++++++++++++++++-----------------
 include/linux/if_ppp.h    |    3 +-
 2 files changed, 44 insertions(+), 28 deletions(-)

diff --git a/drivers/net/ppp_generic.c b/drivers/net/ppp_generic.c
index ea477dd..95a5a30 100644
--- a/drivers/net/ppp_generic.c
+++ b/drivers/net/ppp_generic.c
@@ -74,6 +74,9 @@
 static int min_frag_size = 0;
 module_param(min_frag_size, int, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
 MODULE_PARM_DESC(min_frag_size, "Default minimum multilink fragment size");
+static int encaps_fragmented_only = 0;
+module_param(encaps_fragmented_only, int, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
+MODULE_PARM_DESC(encaps_fragmented_only, "If non-zero, only fragmented packets will be encapsulated in multilink header");
 #endif /* CONFIG_PPP_MULTILINK */
 
 /*
@@ -1505,33 +1508,44 @@ static int ppp_mp_explode(struct ppp *ppp, struct sk_buff *skb)
 			continue;
 		}
 
-		mtu = pch->chan->mtu - hdrlen;
-		if (mtu < 4)
-			mtu = 4;
-		if (flen > mtu)
-			flen = mtu;
-		if (flen == len)
-			bits |= E;
-		frag = alloc_skb(flen + hdrlen + (flen == 0), GFP_ATOMIC);
-		if (!frag)
-			goto noskb;
-		q = skb_put(frag, flen + hdrlen);
-
-		/* make the MP header */
-		q[0] = PPP_MP >> 8;
-		q[1] = PPP_MP;
-		if (ppp->flags & SC_MP_XSHORTSEQ) {
-			q[2] = bits + ((ppp->nxseq >> 8) & 0xf);
-			q[3] = ppp->nxseq;
-		} else {
-			q[2] = bits;
-			q[3] = ppp->nxseq >> 16;
-			q[4] = ppp->nxseq >> 8;
-			q[5] = ppp->nxseq;
-		}
-
-		memcpy(q + hdrlen, p, flen);
+		if (bits & B &&
+		    ppp->flags & SC_NOT_1_FRAG &&
+		    flen == len &&
+		    skb->len <= pch->chan->mtu &&
+		    pch->had_frag)
+			/* only 1 fragment needed, but we have
+			   opted not to encapsulate such packets */
+			frag = skb_get(skb);
+		else {
+				
+			mtu = pch->chan->mtu - hdrlen;
+			if (mtu < 4)
+				mtu = 4;
+			if (flen > mtu)
+				flen = mtu;
+			if (flen == len)
+				bits |= E;
+			frag = alloc_skb(flen + hdrlen + (flen == 0), GFP_ATOMIC);
+			if (!frag)
+				goto noskb;
+			q = skb_put(frag, flen + hdrlen);
+			
+			/* make the MP header */
+			q[0] = PPP_MP >> 8;
+			q[1] = PPP_MP;
+			if (ppp->flags & SC_MP_XSHORTSEQ) {
+				q[2] = bits + ((ppp->nxseq >> 8) & 0xf);
+				q[3] = ppp->nxseq;
+			} else {
+				q[2] = bits;
+				q[3] = ppp->nxseq >> 16;
+				q[4] = ppp->nxseq >> 8;
+				q[5] = ppp->nxseq;
+			}
 
+			memcpy(q + hdrlen, p, flen);
+			++ppp->nxseq;
+		}
 		/* try to send it down the channel */
 		chan = pch->chan;
 		if (!skb_queue_empty(&pch->file.xq) ||
@@ -1540,7 +1554,6 @@ static int ppp_mp_explode(struct ppp *ppp, struct sk_buff *skb)
 		pch->had_frag = 1;
 		p += flen;
 		len -= flen;
-		++ppp->nxseq;
 		bits = 0;
 		spin_unlock_bh(&pch->downl);
 	}
@@ -2620,6 +2633,8 @@ ppp_create_interface(struct net *net, int unit, int *retp)
 #ifdef CONFIG_PPP_MULTILINK
 	ppp->minfragsize = min_frag_size;
 	ppp->minseq = -1;
+	if (encaps_fragmented_only)
+	  ppp->flags |= SC_NOT_1_FRAG;
 	skb_queue_head_init(&ppp->mrq);
 #endif /* CONFIG_PPP_MULTILINK */
 
diff --git a/include/linux/if_ppp.h b/include/linux/if_ppp.h
index da06147..c7aad5a 100644
--- a/include/linux/if_ppp.h
+++ b/include/linux/if_ppp.h
@@ -72,7 +72,8 @@
 #define SC_LOG_FLUSH	0x00100000	/* log all chars flushed */
 #define	SC_SYNC		0x00200000	/* synchronous serial mode */
 #define	SC_MUST_COMP    0x00400000	/* no uncompressed packets may be sent or received */
-#define	SC_MASK		0x0f600fff	/* bits that user can change */
+#define	SC_NOT_1_FRAG	0x80000000	/* don't do multilink encaps for only 1 fragment */
+#define	SC_MASK		0x8f600fff	/* bits that user can change */
 
 /* state bits */
 #define SC_XMIT_BUSY	0x10000000	/* (used by isdn_ppp?) */
-- 
1.5.6.5


--------------040406090100080202000104--
