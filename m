From: Stephen Hemminger <shemminger@linux-foundation.org>
Date: Sat, 18 Aug 2007 01:33:53 +0000
Subject: [PATCH] ppp: get rid of sparse warnings.
Message-Id: <20070817183353.20109ab7@freepuppy.rosehill.hemminger.net>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


Eliminate places where 0 is used directly as a pointer
causing sparse warnings. Also, make a couple of functions
static that sparse found.

Signed-off-by: Stephen Hemminger <shemminger@linux-foundation.org>

--- a/drivers/net/ppp_async.c	2007-08-17 13:36:10.000000000 -0400
+++ b/drivers/net/ppp_async.c	2007-08-17 14:53:13.000000000 -0400
@@ -160,7 +160,7 @@ ppp_asynctty_open(struct tty_struct *tty
 
 	err = -ENOMEM;
 	ap = kzalloc(sizeof(*ap), GFP_KERNEL);
-	if (ap = 0)
+	if (!ap)
 		goto out;
 
 	/* initialize the asyncppp structure */
@@ -215,7 +215,7 @@ ppp_asynctty_close(struct tty_struct *tt
 	ap = tty->disc_data;
 	tty->disc_data = NULL;
 	write_unlock_irq(&disc_data_lock);
-	if (ap = 0)
+	if (!ap)
 		return;
 
 	/*
@@ -230,10 +230,10 @@ ppp_asynctty_close(struct tty_struct *tt
 	tasklet_kill(&ap->tsk);
 
 	ppp_unregister_channel(&ap->chan);
-	if (ap->rpkt != 0)
+	if (ap->rpkt)
 		kfree_skb(ap->rpkt);
 	skb_queue_purge(&ap->rqueue);
-	if (ap->tpkt != 0)
+	if (ap->tpkt)
 		kfree_skb(ap->tpkt);
 	kfree(ap);
 }
@@ -285,13 +285,13 @@ ppp_asynctty_ioctl(struct tty_struct *tt
 	int err, val;
 	int __user *p = (int __user *)arg;
 
-	if (ap = 0)
+	if (!ap)
 		return -ENXIO;
 	err = -EFAULT;
 	switch (cmd) {
 	case PPPIOCGCHAN:
 		err = -ENXIO;
-		if (ap = 0)
+		if (!ap)
 			break;
 		err = -EFAULT;
 		if (put_user(ppp_channel_index(&ap->chan), p))
@@ -301,7 +301,7 @@ ppp_asynctty_ioctl(struct tty_struct *tt
 
 	case PPPIOCGUNIT:
 		err = -ENXIO;
-		if (ap = 0)
+		if (!ap)
 			break;
 		err = -EFAULT;
 		if (put_user(ppp_unit_number(&ap->chan), p))
@@ -354,7 +354,7 @@ ppp_asynctty_receive(struct tty_struct *
 	struct asyncppp *ap = ap_get(tty);
 	unsigned long flags;
 
-	if (ap = 0)
+	if (!ap)
 		return;
 	spin_lock_irqsave(&ap->recv_lock, flags);
 	ppp_async_input(ap, buf, cflags, count);
@@ -373,7 +373,7 @@ ppp_asynctty_wakeup(struct tty_struct *t
 	struct asyncppp *ap = ap_get(tty);
 
 	clear_bit(TTY_DO_WRITE_WAKEUP, &tty->flags);
-	if (ap = 0)
+	if (!ap)
 		return;
 	set_bit(XMIT_WAKEUP, &ap->xmit_flags);
 	tasklet_schedule(&ap->tsk);
@@ -688,7 +688,7 @@ ppp_async_push(struct asyncppp *ap)
 				tty_stuffed = 1;
 			continue;
 		}
-		if (ap->optr >= ap->olim && ap->tpkt != 0) {
+		if (ap->optr >= ap->olim && ap->tpkt != NULL) {
 			if (ppp_async_encode(ap)) {
 				/* finished processing ap->tpkt */
 				clear_bit(XMIT_FULL, &ap->xmit_flags);
@@ -708,7 +708,7 @@ ppp_async_push(struct asyncppp *ap)
 		clear_bit(XMIT_BUSY, &ap->xmit_flags);
 		/* any more work to do? if not, exit the loop */
 		if (!(test_bit(XMIT_WAKEUP, &ap->xmit_flags)
-		      || (!tty_stuffed && ap->tpkt != 0)))
+		      || (!tty_stuffed && ap->tpkt != NULL)))
 			break;
 		/* more work to do, see if we can do it now */
 		if (test_and_set_bit(XMIT_BUSY, &ap->xmit_flags))
@@ -719,7 +719,7 @@ ppp_async_push(struct asyncppp *ap)
 
 flush:
 	clear_bit(XMIT_BUSY, &ap->xmit_flags);
-	if (ap->tpkt != 0) {
+	if (ap->tpkt) {
 		kfree_skb(ap->tpkt);
 		ap->tpkt = NULL;
 		clear_bit(XMIT_FULL, &ap->xmit_flags);
@@ -852,7 +852,7 @@ ppp_async_input(struct asyncppp *ap, con
 		s = 0;
 		for (i = 0; i < count; ++i) {
 			c = buf[i];
-			if (flags != 0 && flags[i] != 0)
+			if (flags != NULL && flags[i] != 0)
 				continue;
 			s |= (c & 0x80)? SC_RCV_B7_1: SC_RCV_B7_0;
 			c = ((c >> 4) ^ c) & 0xf;
@@ -869,7 +869,7 @@ ppp_async_input(struct asyncppp *ap, con
 			n = scan_ordinary(ap, buf, count);
 
 		f = 0;
-		if (flags != 0 && (ap->state & SC_TOSS) = 0) {
+		if (flags != NULL && (ap->state & SC_TOSS) = 0) {
 			/* check the flags to see if any char had an error */
 			for (j = 0; j < n; ++j)
 				if ((f = flags[j]) != 0)
@@ -882,9 +882,9 @@ ppp_async_input(struct asyncppp *ap, con
 		} else if (n > 0 && (ap->state & SC_TOSS) = 0) {
 			/* stuff the chars in the skb */
 			skb = ap->rpkt;
-			if (skb = 0) {
+			if (!skb) {
 				skb = dev_alloc_skb(ap->mru + PPP_HDRLEN + 2);
-				if (skb = 0)
+				if (!skb)
 					goto nomem;
  				ap->rpkt = skb;
  			}
@@ -931,7 +931,7 @@ ppp_async_input(struct asyncppp *ap, con
 		++n;
 
 		buf += n;
-		if (flags != 0)
+		if (flags != NULL)
 			flags += n;
 		count -= n;
 	}
--- a/drivers/net/ppp_generic.c	2007-08-17 13:36:10.000000000 -0400
+++ b/drivers/net/ppp_generic.c	2007-08-17 14:53:13.000000000 -0400
@@ -367,7 +367,7 @@ static int ppp_release(struct inode *ino
 	struct ppp_file *pf = file->private_data;
 	struct ppp *ppp;
 
-	if (pf != 0) {
+	if (pf) {
 		file->private_data = NULL;
 		if (pf->kind = INTERFACE) {
 			ppp = PF_TO_PPP(pf);
@@ -398,7 +398,7 @@ static ssize_t ppp_read(struct file *fil
 
 	ret = count;
 
-	if (pf = 0)
+	if (!pf)
 		return -ENXIO;
 	add_wait_queue(&pf->rwait, &wait);
 	for (;;) {
@@ -431,7 +431,7 @@ static ssize_t ppp_read(struct file *fil
 	set_current_state(TASK_RUNNING);
 	remove_wait_queue(&pf->rwait, &wait);
 
-	if (skb = 0)
+	if (!skb)
 		goto out;
 
 	ret = -EOVERFLOW;
@@ -455,11 +455,11 @@ static ssize_t ppp_write(struct file *fi
 	struct sk_buff *skb;
 	ssize_t ret;
 
-	if (pf = 0)
+	if (!pf)
 		return -ENXIO;
 	ret = -ENOMEM;
 	skb = alloc_skb(count + pf->hdrlen, GFP_KERNEL);
-	if (skb = 0)
+	if (!skb)
 		goto out;
 	skb_reserve(skb, pf->hdrlen);
 	ret = -EFAULT;
@@ -491,11 +491,11 @@ static unsigned int ppp_poll(struct file
 	struct ppp_file *pf = file->private_data;
 	unsigned int mask;
 
-	if (pf = 0)
+	if (!pf)
 		return 0;
 	poll_wait(file, &pf->rwait, wait);
 	mask = POLLOUT | POLLWRNORM;
-	if (skb_peek(&pf->rq) != 0)
+	if (skb_peek(&pf->rq))
 		mask |= POLLIN | POLLRDNORM;
 	if (pf->dead)
 		mask |= POLLHUP;
@@ -559,7 +559,7 @@ static int ppp_ioctl(struct inode *inode
 	void __user *argp = (void __user *)arg;
 	int __user *p = argp;
 
-	if (pf = 0)
+	if (!pf)
 		return ppp_unattached_ioctl(pf, file, cmd, arg);
 
 	if (cmd = PPPIOCDETACH) {
@@ -689,13 +689,13 @@ static int ppp_ioctl(struct inode *inode
 			val &= 0xffff;
 		}
 		vj = slhc_init(val2+1, val+1);
-		if (vj = 0) {
+		if (!vj) {
 			printk(KERN_ERR "PPP: no memory (VJ compressor)\n");
 			err = -ENOMEM;
 			break;
 		}
 		ppp_lock(ppp);
-		if (ppp->vj != 0)
+		if (ppp->vj)
 			slhc_free(ppp->vj);
 		ppp->vj = vj;
 		ppp_unlock(ppp);
@@ -786,7 +786,7 @@ static int ppp_unattached_ioctl(struct p
 		if (get_user(unit, p))
 			break;
 		ppp = ppp_create_interface(unit, &err);
-		if (ppp = 0)
+		if (!ppp)
 			break;
 		file->private_data = &ppp->file;
 		ppp->owner = file;
@@ -803,7 +803,7 @@ static int ppp_unattached_ioctl(struct p
 		mutex_lock(&all_ppp_mutex);
 		err = -ENXIO;
 		ppp = ppp_find_unit(unit);
-		if (ppp != 0) {
+		if (ppp) {
 			atomic_inc(&ppp->file.refcnt);
 			file->private_data = &ppp->file;
 			err = 0;
@@ -817,7 +817,7 @@ static int ppp_unattached_ioctl(struct p
 		spin_lock_bh(&all_channels_lock);
 		err = -ENXIO;
 		chan = ppp_find_channel(unit);
-		if (chan != 0) {
+		if (chan) {
 			atomic_inc(&chan->file.refcnt);
 			file->private_data = &chan->file;
 			err = 0;
@@ -903,7 +903,7 @@ ppp_start_xmit(struct sk_buff *skb, stru
 		struct sk_buff *ns;
 
 		ns = alloc_skb(skb->len + dev->hard_header_len, GFP_ATOMIC);
-		if (ns = 0)
+		if (!ns)
 			goto outf;
 		skb_reserve(ns, dev->hard_header_len);
 		skb_copy_bits(skb, 0, skb_put(ns, skb->len), skb->len);
@@ -954,9 +954,9 @@ ppp_net_ioctl(struct net_device *dev, st
 
 	case SIOCGPPPCSTATS:
 		memset(&cstats, 0, sizeof(cstats));
-		if (ppp->xc_state != 0)
+		if (ppp->xc_state)
 			ppp->xcomp->comp_stat(ppp->xc_state, &cstats.c);
-		if (ppp->rc_state != 0)
+		if (ppp->rc_state)
 			ppp->rcomp->decomp_stat(ppp->rc_state, &cstats.d);
 		if (copy_to_user(addr, &cstats, sizeof(cstats)))
 			break;
@@ -1001,14 +1001,14 @@ ppp_xmit_process(struct ppp *ppp)
 	struct sk_buff *skb;
 
 	ppp_xmit_lock(ppp);
-	if (ppp->dev != 0) {
+	if (ppp->dev) {
 		ppp_push(ppp);
-		while (ppp->xmit_pending = 0
-		       && (skb = skb_dequeue(&ppp->file.xq)) != 0)
+		while (ppp->xmit_pending = NULL
+		       && (skb = skb_dequeue(&ppp->file.xq)) != NULL)
 			ppp_send_frame(ppp, skb);
 		/* If there's no work left to do, tell the core net
 		   code that we can accept some more. */
-		if (ppp->xmit_pending = 0 && skb_peek(&ppp->file.xq) = 0)
+		if (ppp->xmit_pending = NULL && skb_peek(&ppp->file.xq) = NULL)
 			netif_wake_queue(ppp->dev);
 	}
 	ppp_xmit_unlock(ppp);
@@ -1108,12 +1108,12 @@ ppp_send_frame(struct ppp *ppp, struct s
 
 	switch (proto) {
 	case PPP_IP:
-		if (ppp->vj = 0 || (ppp->flags & SC_COMP_TCP) = 0)
+		if (!ppp->vj || (ppp->flags & SC_COMP_TCP) = 0)
 			break;
 		/* try to do VJ TCP header compression */
 		new_skb = alloc_skb(skb->len + ppp->dev->hard_header_len - 2,
 				    GFP_ATOMIC);
-		if (new_skb = 0) {
+		if (!new_skb) {
 			printk(KERN_ERR "PPP: no memory (VJ comp pkt)\n");
 			goto drop;
 		}
@@ -1148,7 +1148,7 @@ ppp_send_frame(struct ppp *ppp, struct s
 	}
 
 	/* try to do packet compression */
-	if ((ppp->xstate & SC_COMP_RUN) && ppp->xc_state != 0
+	if ((ppp->xstate & SC_COMP_RUN) && ppp->xc_state
 	    && proto != PPP_LCP && proto != PPP_CCP) {
 		if (!(ppp->flags & SC_CCP_UP) && (ppp->flags & SC_MUST_COMP)) {
 			if (net_ratelimit())
@@ -1193,7 +1193,7 @@ ppp_push(struct ppp *ppp)
 	struct channel *pch;
 	struct sk_buff *skb = ppp->xmit_pending;
 
-	if (skb = 0)
+	if (!skb)
 		return;
 
 	list = &ppp->channels;
@@ -1363,7 +1363,7 @@ static int ppp_mp_explode(struct ppp *pp
 		if (flen = len && nfree = 0)
 			bits |= E;
 		frag = alloc_skb(flen + hdrlen + (flen = 0), GFP_ATOMIC);
-		if (frag = 0)
+		if (!frag)
 			goto noskb;
 		q = skb_put(frag, flen + hdrlen);
 
@@ -1433,7 +1433,7 @@ ppp_channel_push(struct channel *pch)
 	struct ppp *ppp;
 
 	spin_lock_bh(&pch->downl);
-	if (pch->chan != 0) {
+	if (pch->chan) {
 		while (!skb_queue_empty(&pch->file.xq)) {
 			skb = skb_dequeue(&pch->file.xq);
 			if (!pch->chan->ops->start_xmit(pch->chan, skb)) {
@@ -1451,7 +1451,7 @@ ppp_channel_push(struct channel *pch)
 	if (skb_queue_empty(&pch->file.xq)) {
 		read_lock_bh(&pch->upl);
 		ppp = pch->ppp;
-		if (ppp != 0)
+		if (ppp)
 			ppp_xmit_process(ppp);
 		read_unlock_bh(&pch->upl);
 	}
@@ -1470,7 +1470,7 @@ ppp_do_recv(struct ppp *ppp, struct sk_b
 {
 	ppp_recv_lock(ppp);
 	/* ppp->dev = 0 means interface is closing down */
-	if (ppp->dev != 0)
+	if (ppp->dev)
 		ppp_receive_frame(ppp, skb, pch);
 	else
 		kfree_skb(skb);
@@ -1483,19 +1483,19 @@ ppp_input(struct ppp_channel *chan, stru
 	struct channel *pch = chan->ppp;
 	int proto;
 
-	if (pch = 0 || skb->len = 0) {
+	if (!pch || skb->len = 0) {
 		kfree_skb(skb);
 		return;
 	}
 
 	proto = PPP_PROTO(skb);
 	read_lock_bh(&pch->upl);
-	if (pch->ppp = 0 || proto >= 0xc000 || proto = PPP_CCPFRAG) {
+	if (pch->ppp = NULL || proto >= 0xc000 || proto = PPP_CCPFRAG) {
 		/* put it on the channel queue */
 		skb_queue_tail(&pch->file.rq, skb);
 		/* drop old frames if queue too long */
 		while (pch->file.rq.qlen > PPP_MAX_RQLEN
-		       && (skb = skb_dequeue(&pch->file.rq)) != 0)
+		       && (skb = skb_dequeue(&pch->file.rq)) != NULL)
 			kfree_skb(skb);
 		wake_up_interruptible(&pch->file.rwait);
 	} else {
@@ -1511,13 +1511,13 @@ ppp_input_error(struct ppp_channel *chan
 	struct channel *pch = chan->ppp;
 	struct sk_buff *skb;
 
-	if (pch = 0)
+	if (!pch)
 		return;
 
 	read_lock_bh(&pch->upl);
-	if (pch->ppp != 0) {
+	if (pch->ppp) {
 		skb = alloc_skb(0, GFP_ATOMIC);
-		if (skb != 0) {
+		if (skb) {
 			skb->len = 0;		/* probably unnecessary */
 			skb->cb[0] = code;
 			ppp_do_recv(pch->ppp, skb, pch);
@@ -1556,7 +1556,7 @@ static void
 ppp_receive_error(struct ppp *ppp)
 {
 	++ppp->stats.rx_errors;
-	if (ppp->vj != 0)
+	if (ppp->vj)
 		slhc_toss(ppp->vj);
 }
 
@@ -1571,7 +1571,7 @@ ppp_receive_nonmp_frame(struct ppp *ppp,
 	 * Note that some decompressors need to see uncompressed frames
 	 * that come in as well as compressed frames.
 	 */
-	if (ppp->rc_state != 0 && (ppp->rstate & SC_DECOMP_RUN)
+	if (ppp->rc_state != NULL && (ppp->rstate & SC_DECOMP_RUN)
 	    && (ppp->rstate & (SC_DC_FERROR | SC_DC_ERROR)) = 0)
 		skb = ppp_decompress_frame(ppp, skb);
 
@@ -1582,13 +1582,13 @@ ppp_receive_nonmp_frame(struct ppp *ppp,
 	switch (proto) {
 	case PPP_VJC_COMP:
 		/* decompress VJ compressed packets */
-		if (ppp->vj = 0 || (ppp->flags & SC_REJ_COMP_TCP))
+		if (!ppp->vj || (ppp->flags & SC_REJ_COMP_TCP))
 			goto err;
 
 		if (skb_tailroom(skb) < 124) {
 			/* copy to a new sk_buff with more tailroom */
 			ns = dev_alloc_skb(skb->len + 128);
-			if (ns = 0) {
+			if (!ns) {
 				printk(KERN_ERR"PPP: no memory (VJ decomp)\n");
 				goto err;
 			}
@@ -1614,7 +1614,7 @@ ppp_receive_nonmp_frame(struct ppp *ppp,
 		break;
 
 	case PPP_VJC_UNCOMP:
-		if (ppp->vj = 0 || (ppp->flags & SC_REJ_COMP_TCP))
+		if (!ppp->vj || (ppp->flags & SC_REJ_COMP_TCP))
 			goto err;
 
 		/* Until we fix the decompressor need to make sure
@@ -1644,7 +1644,7 @@ ppp_receive_nonmp_frame(struct ppp *ppp,
 		skb_queue_tail(&ppp->file.rq, skb);
 		/* limit queue length by dropping old frames */
 		while (ppp->file.rq.qlen > PPP_MAX_RQLEN
-		       && (skb = skb_dequeue(&ppp->file.rq)) != 0)
+		       && (skb = skb_dequeue(&ppp->file.rq)) != NULL)
 			kfree_skb(skb);
 		/* wake up any process polling or blocking on read */
 		wake_up_interruptible(&ppp->file.rwait);
@@ -1720,7 +1720,7 @@ ppp_decompress_frame(struct ppp *ppp, st
 		}
 
 		ns = dev_alloc_skb(obuff_size);
-		if (ns = 0) {
+		if (!ns) {
 			printk(KERN_ERR "ppp_decompress_frame: no memory\n");
 			goto err;
 		}
@@ -1838,7 +1838,7 @@ ppp_receive_mp_frame(struct ppp *ppp, st
 		ppp->minseq = ppp->mrq.next->sequence;
 
 	/* Pull completed packets off the queue and receive them. */
-	while ((skb = ppp_mp_reconstruct(ppp)) != 0)
+	while ((skb = ppp_mp_reconstruct(ppp)) != NULL)
 		ppp_receive_nonmp_frame(ppp, skb);
 
 	return;
@@ -1873,8 +1873,7 @@ ppp_mp_insert(struct ppp *ppp, struct sk
  * complete packet, or we get to the sequence number for a fragment
  * which hasn't arrived but might still do so.
  */
-struct sk_buff *
-ppp_mp_reconstruct(struct ppp *ppp)
+static struct sk_buff *ppp_mp_reconstruct(struct ppp *ppp)
 {
 	u32 seq = ppp->nextseq;
 	u32 minseq = ppp->minseq;
@@ -2004,7 +2003,7 @@ ppp_register_channel(struct ppp_channel 
 	struct channel *pch;
 
 	pch = kzalloc(sizeof(struct channel), GFP_KERNEL);
-	if (pch = 0)
+	if (!pch)
 		return -ENOMEM;
 	pch->ppp = NULL;
 	pch->chan = chan;
@@ -2032,7 +2031,7 @@ int ppp_channel_index(struct ppp_channel
 {
 	struct channel *pch = chan->ppp;
 
-	if (pch != 0)
+	if (pch)
 		return pch->file.index;
 	return -1;
 }
@@ -2045,9 +2044,9 @@ int ppp_unit_number(struct ppp_channel *
 	struct channel *pch = chan->ppp;
 	int unit = -1;
 
-	if (pch != 0) {
+	if (pch) {
 		read_lock_bh(&pch->upl);
-		if (pch->ppp != 0)
+		if (pch->ppp)
 			unit = pch->ppp->file.index;
 		read_unlock_bh(&pch->upl);
 	}
@@ -2063,7 +2062,7 @@ ppp_unregister_channel(struct ppp_channe
 {
 	struct channel *pch = chan->ppp;
 
-	if (pch = 0)
+	if (!pch)
 		return;		/* should never happen */
 	chan->ppp = NULL;
 
@@ -2095,7 +2094,7 @@ ppp_output_wakeup(struct ppp_channel *ch
 {
 	struct channel *pch = chan->ppp;
 
-	if (pch = 0)
+	if (!pch)
 		return;
 	ppp_channel_push(pch);
 }
@@ -2126,18 +2125,18 @@ ppp_set_compress(struct ppp *ppp, unsign
 
 	cp = find_compressor(ccp_option[0]);
 #ifdef CONFIG_KMOD
-	if (cp = 0) {
+	if (!cp) {
 		request_module("ppp-compress-%d", ccp_option[0]);
 		cp = find_compressor(ccp_option[0]);
 	}
 #endif /* CONFIG_KMOD */
-	if (cp = 0)
+	if (!cp)
 		goto out;
 
 	err = -ENOBUFS;
 	if (data.transmit) {
 		state = cp->comp_alloc(ccp_option, data.length);
-		if (state != 0) {
+		if (state) {
 			ppp_xmit_lock(ppp);
 			ppp->xstate &= ~SC_COMP_RUN;
 			ocomp = ppp->xcomp;
@@ -2145,7 +2144,7 @@ ppp_set_compress(struct ppp *ppp, unsign
 			ppp->xcomp = cp;
 			ppp->xc_state = state;
 			ppp_xmit_unlock(ppp);
-			if (ostate != 0) {
+			if (ostate) {
 				ocomp->comp_free(ostate);
 				module_put(ocomp->owner);
 			}
@@ -2155,7 +2154,7 @@ ppp_set_compress(struct ppp *ppp, unsign
 
 	} else {
 		state = cp->decomp_alloc(ccp_option, data.length);
-		if (state != 0) {
+		if (state) {
 			ppp_recv_lock(ppp);
 			ppp->rstate &= ~SC_DECOMP_RUN;
 			ocomp = ppp->rcomp;
@@ -2163,7 +2162,7 @@ ppp_set_compress(struct ppp *ppp, unsign
 			ppp->rcomp = cp;
 			ppp->rc_state = state;
 			ppp_recv_unlock(ppp);
-			if (ostate != 0) {
+			if (ostate) {
 				ocomp->decomp_free(ostate);
 				module_put(ocomp->owner);
 			}
@@ -2230,7 +2229,7 @@ ppp_ccp_peek(struct ppp *ppp, struct sk_
 			break;
 		if (inbound) {
 			/* we will start receiving compressed packets */
-			if (ppp->rc_state = 0)
+			if (!ppp->rc_state)
 				break;
 			if (ppp->rcomp->decomp_init(ppp->rc_state, dp, len,
 					ppp->file.index, 0, ppp->mru, ppp->debug)) {
@@ -2239,7 +2238,7 @@ ppp_ccp_peek(struct ppp *ppp, struct sk_
 			}
 		} else {
 			/* we will soon start sending compressed packets */
-			if (ppp->xc_state = 0)
+			if (!ppp->xc_state)
 				break;
 			if (ppp->xcomp->comp_init(ppp->xc_state, dp, len,
 					ppp->file.index, 0, ppp->debug))
@@ -2322,11 +2321,11 @@ ppp_register_compressor(struct compresso
 	int ret;
 	spin_lock(&compressor_list_lock);
 	ret = -EEXIST;
-	if (find_comp_entry(cp->compress_proto) != 0)
+	if (find_comp_entry(cp->compress_proto))
 		goto out;
 	ret = -ENOMEM;
 	ce = kmalloc(sizeof(struct compressor_entry), GFP_ATOMIC);
-	if (ce = 0)
+	if (!ce)
 		goto out;
 	ret = 0;
 	ce->comp = cp;
@@ -2344,7 +2343,7 @@ ppp_unregister_compressor(struct compres
 
 	spin_lock(&compressor_list_lock);
 	ce = find_comp_entry(cp->compress_proto);
-	if (ce != 0 && ce->comp = cp) {
+	if (ce && ce->comp = cp) {
 		list_del(&ce->list);
 		kfree(ce);
 	}
@@ -2360,7 +2359,7 @@ find_compressor(int type)
 
 	spin_lock(&compressor_list_lock);
 	ce = find_comp_entry(type);
-	if (ce != 0) {
+	if (ce) {
 		cp = ce->comp;
 		if (!try_module_get(cp->owner))
 			cp = NULL;
@@ -2385,7 +2384,7 @@ ppp_get_stats(struct ppp *ppp, struct pp
 	st->p.ppp_opackets = ppp->stats.tx_packets;
 	st->p.ppp_oerrors = ppp->stats.tx_errors;
 	st->p.ppp_obytes = ppp->stats.tx_bytes;
-	if (vj = 0)
+	if (!vj)
 		return;
 	st->vj.vjs_packets = vj->sls_o_compressed + vj->sls_o_uncompressed;
 	st->vj.vjs_compressed = vj->sls_o_compressed;
@@ -2606,11 +2605,11 @@ ppp_connect_channel(struct channel *pch,
 
 	mutex_lock(&all_ppp_mutex);
 	ppp = ppp_find_unit(unit);
-	if (ppp = 0)
+	if (!ppp)
 		goto out;
 	write_lock_bh(&pch->upl);
 	ret = -EINVAL;
-	if (pch->ppp != 0)
+	if (pch->ppp)
 		goto outl;
 
 	ppp_lock(ppp);
@@ -2646,7 +2645,7 @@ ppp_disconnect_channel(struct channel *p
 	ppp = pch->ppp;
 	pch->ppp = NULL;
 	write_unlock_bh(&pch->upl);
-	if (ppp != 0) {
+	if (ppp) {
 		/* remove it from the ppp unit's list */
 		ppp_lock(ppp);
 		list_del(&pch->clist);
--- a/drivers/net/ppp_synctty.c	2007-08-17 13:36:10.000000000 -0400
+++ b/drivers/net/ppp_synctty.c	2007-08-17 14:53:13.000000000 -0400
@@ -209,7 +209,7 @@ ppp_sync_open(struct tty_struct *tty)
 
 	ap = kzalloc(sizeof(*ap), GFP_KERNEL);
 	err = -ENOMEM;
-	if (ap = 0)
+	if (!ap)
 		goto out;
 
 	/* initialize the syncppp structure */
@@ -262,7 +262,7 @@ ppp_sync_close(struct tty_struct *tty)
 	ap = tty->disc_data;
 	tty->disc_data = NULL;
 	write_unlock_irq(&disc_data_lock);
-	if (ap = 0)
+	if (!ap)
 		return;
 
 	/*
@@ -278,7 +278,7 @@ ppp_sync_close(struct tty_struct *tty)
 
 	ppp_unregister_channel(&ap->chan);
 	skb_queue_purge(&ap->rqueue);
-	if (ap->tpkt != 0)
+	if (ap->tpkt)
 		kfree_skb(ap->tpkt);
 	kfree(ap);
 }
@@ -325,13 +325,13 @@ ppp_synctty_ioctl(struct tty_struct *tty
 	int __user *p = (int __user *)arg;
 	int err, val;
 
-	if (ap = 0)
+	if (!ap)
 		return -ENXIO;
 	err = -EFAULT;
 	switch (cmd) {
 	case PPPIOCGCHAN:
 		err = -ENXIO;
-		if (ap = 0)
+		if (!ap)
 			break;
 		err = -EFAULT;
 		if (put_user(ppp_channel_index(&ap->chan), p))
@@ -341,7 +341,7 @@ ppp_synctty_ioctl(struct tty_struct *tty
 
 	case PPPIOCGUNIT:
 		err = -ENXIO;
-		if (ap = 0)
+		if (!ap)
 			break;
 		err = -EFAULT;
 		if (put_user(ppp_unit_number(&ap->chan), p))
@@ -394,7 +394,7 @@ ppp_sync_receive(struct tty_struct *tty,
 	struct syncppp *ap = sp_get(tty);
 	unsigned long flags;
 
-	if (ap = 0)
+	if (!ap)
 		return;
 	spin_lock_irqsave(&ap->recv_lock, flags);
 	ppp_sync_input(ap, buf, cflags, count);
@@ -413,7 +413,7 @@ ppp_sync_wakeup(struct tty_struct *tty)
 	struct syncppp *ap = sp_get(tty);
 
 	clear_bit(TTY_DO_WRITE_WAKEUP, &tty->flags);
-	if (ap = 0)
+	if (!ap)
 		return;
 	set_bit(XMIT_WAKEUP, &ap->xmit_flags);
 	tasklet_schedule(&ap->tsk);
@@ -564,7 +564,7 @@ static void ppp_sync_process(unsigned lo
  * Procedures for encapsulation and framing.
  */
 
-struct sk_buff*
+static struct sk_buff *
 ppp_sync_txmunge(struct syncppp *ap, struct sk_buff *skb)
 {
 	int proto;
@@ -655,7 +655,7 @@ ppp_sync_push(struct syncppp *ap)
 	for (;;) {
 		if (test_and_clear_bit(XMIT_WAKEUP, &ap->xmit_flags))
 			tty_stuffed = 0;
-		if (!tty_stuffed && ap->tpkt != 0) {
+		if (!tty_stuffed && ap->tpkt != NULL) {
 			set_bit(TTY_DO_WRITE_WAKEUP, &tty->flags);
 			sent = tty->driver->write(tty, ap->tpkt->data, ap->tpkt->len);
 			if (sent < 0)
@@ -673,7 +673,7 @@ ppp_sync_push(struct syncppp *ap)
 		/* haven't made any progress */
 		spin_unlock_bh(&ap->xmit_lock);
 		if (!(test_bit(XMIT_WAKEUP, &ap->xmit_flags)
-		      || (!tty_stuffed && ap->tpkt != 0)))
+		      || (!tty_stuffed && ap->tpkt != NULL)))
 			break;
 		if (!spin_trylock_bh(&ap->xmit_lock))
 			break;
@@ -681,7 +681,7 @@ ppp_sync_push(struct syncppp *ap)
 	return done;
 
 flush:
-	if (ap->tpkt != 0) {
+	if (ap->tpkt) {
 		kfree_skb(ap->tpkt);
 		ap->tpkt = NULL;
 		clear_bit(XMIT_FULL, &ap->xmit_flags);
@@ -736,7 +736,7 @@ ppp_sync_input(struct syncppp *ap, const
 		ppp_print_buffer ("receive buffer", buf, count);
 
 	/* stuff the chars in the skb */
-	if ((skb = dev_alloc_skb(ap->mru + PPP_HDRLEN + 2)) = 0) {
+	if ((skb = dev_alloc_skb(ap->mru + PPP_HDRLEN + 2)) = NULL) {
 		printk(KERN_ERR "PPPsync: no memory (input pkt)\n");
 		goto err;
 	}
@@ -744,7 +744,7 @@ ppp_sync_input(struct syncppp *ap, const
 	if (buf[0] != PPP_ALLSTATIONS)
 		skb_reserve(skb, 2 + (buf[0] & 1));
 
-	if (flags != 0 && *flags) {
+	if (flags && *flags) {
 		/* error flag set, ignore frame */
 		goto err;
 	} else if (count > skb_tailroom(skb)) {
--- a/drivers/net/pppoe.c	2007-08-06 04:25:46.000000000 -0400
+++ b/drivers/net/pppoe.c	2007-08-17 14:54:18.000000000 -0400
@@ -438,7 +438,7 @@ static int pppoe_disc_rcv(struct sk_buff
 		 * one socket family type, we cannot (easily) distinguish
 		 * what kind of SKB it is during backlog rcv.
 		 */
-		if (sock_owned_by_user(sk) = 0) {
+		if (!sock_owned_by_user(sk)) {
 			/* We're no longer connect at the PPPOE layer,
 			 * and must wait for ppp channel to disconnect us.
 			 */
