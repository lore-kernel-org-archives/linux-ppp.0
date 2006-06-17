From: xeb@mail.ru
Date: Sat, 17 Jun 2006 22:57:39 +0000
Subject: [PATCH] driver for PPTP, second edition
Message-Id: <E1FrjjX-000FTZ-00.xeb-mail-ru@f71.mail.ru>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

Hello.
I have developed the driver for Point-to-Point Tunneling Protocol (PPTP).
This driver works in pair with plugin for pppd.
It is enough to use pppd's plugin for start of the client.
Also there is a server (based on pptpd) which uses this driver.
By results of my testing the speed of transfer has increased on >50% and cp=
u usage has decreased on >50% in comparison with original pptpd and pptpcli=
ent.
I have published the project on http://accel-pptp.sourceforge.net/


diff -uprN linux-2.6.16.orig/drivers/net/Kconfig linux-2.6.16.pptp/drivers/=
net/Kconfig
--- linux-2.6.16.orig/drivers/net/Kconfig	2006-06-18 00:51:35.000000000 +04=
00
+++ linux-2.6.16.pptp/drivers/net/Kconfig	2006-06-18 01:10:19.000000000 +04=
00
@@ -2603,6 +2603,15 @@ config PPPOE
 	  which contains instruction on how to use this driver (under=20
 	  the heading "Kernel mode PPPoE").
=20
+config PPTP
+	tristate "PPTP (Point-to-Point Tunneling Protocol) (EXPERIMENTAL)"
+	depends on EXPERIMENTAL && PPP
+	help
+	  Support for Microsoft Point-to-Point Tunneling Protocol.
+
+	  See http://accel-pptp.sourceforge.net/ for information on=20
+	  configuring PPTP clients and servers to utilize this driver.
+
 config PPPOATM
 	tristate "PPP over ATM"
 	depends on ATM && PPP
diff -uprN linux-2.6.16.orig/drivers/net/Makefile linux-2.6.16.pptp/drivers=
/net/Makefile
--- linux-2.6.16.orig/drivers/net/Makefile	2006-06-18 00:51:34.000000000 +0=
400
+++ linux-2.6.16.pptp/drivers/net/Makefile	2006-06-18 00:57:02.000000000 +0=
400
@@ -118,6 +118,7 @@ obj-$(CONFIG_PPP_DEFLATE) +=3D ppp_deflate
 obj-$(CONFIG_PPP_BSDCOMP) +=3D bsd_comp.o
 obj-$(CONFIG_PPP_MPPE) +=3D ppp_mppe.o
 obj-$(CONFIG_PPPOE) +=3D pppox.o pppoe.o
+obj-$(CONFIG_PPTP) +=3D pppox.o pptp.o
=20
 obj-$(CONFIG_SLIP) +=3D slip.o
 ifeq ($(CONFIG_SLIP_COMPRESSED),y)
diff -uprN linux-2.6.16.orig/drivers/net/pptp.c linux-2.6.16.pptp/drivers/n=
et/pptp.c
--- linux-2.6.16.orig/drivers/net/pptp.c	1970-01-01 03:00:00.000000000 +0300
+++ linux-2.6.16.pptp/drivers/net/pptp.c	2006-06-18 01:30:40.000000000 +0400
@@ -0,0 +1,928 @@
+/*
+ *  Point-to-Point Tunneling Protocol for Linux
+ *
+ *	Authors: Kozlov D. (xeb@mail.ru)
+ *
+ *	This program is free software; you can redistribute it and/or
+ *	modify it under the terms of the GNU General Public License
+ *	as published by the Free Software Foundation; either version
+ *	2 of the License, or (at your option) any later version.
+ *
+ */
+
+#include <linux/string.h>
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/errno.h>
+#include <linux/netdevice.h>
+#include <linux/net.h>
+#include <linux/skbuff.h>
+#include <linux/init.h>
+#include <linux/ppp_channel.h>
+#include <linux/ppp_defs.h>
+#include <linux/if_ppp.h>
+#include <linux/if_pppox.h>
+#include <linux/notifier.h>
+#include <linux/file.h>
+#include <linux/proc_fs.h>
+#include <linux/in.h>
+#include <linux/ip.h>
+#include <linux/netfilter.h>
+#include <linux/netfilter_ipv4.h>
+#include <linux/workqueue.h>
+#include <linux/version.h>
+
+#include <net/sock.h>
+#include <net/protocol.h>
+#include <net/ip.h>
+#include <net/icmp.h>
+#include <net/route.h>
+
+#include <asm/uaccess.h>
+
+#define PPTP_DRIVER_VERSION "0.7"
+
+MODULE_DESCRIPTION("Point-to-Point Tunneling Protocol for Linux");
+MODULE_AUTHOR("Kozlov D. (xeb@mail.ru)");
+MODULE_LICENSE("GPL");
+
+static int log_level=3D0;
+static int min_window=3D5;
+static int max_window=100;
+module_param(min_window,int,5);
+MODULE_PARM_DESC(min_window,"Minimum sliding window size (default=3D3)");
+module_param(max_window,int,100);
+MODULE_PARM_DESC(max_window,"Maximum sliding window size (default=100)");
+module_param(log_level,int,0);
+
+static struct proc_dir_entry* proc_dir;
+
+#define HASH_SIZE  16
+#define HASH(addr) ((addr^(addr>>4))&0xF)
+static DEFINE_RWLOCK(chan_lock);
+static struct pppox_sock *chans[HASH_SIZE];
+
+static int pptp_xmit(struct ppp_channel *chan, struct sk_buff *skb);
+static int read_proc(char *page, char **start, off_t off,int count,
+                     int *eof, void *data);
+static int __pptp_rcv(struct pppox_sock *po,struct sk_buff *skb,int new);
+
+static struct ppp_channel_ops pptp_chan_ops=3D {
+	.start_xmit =3D pptp_xmit,
+};
+
+/* gre header structure: -------------------------------------------- */
+
+#define PPTP_GRE_PROTO  0x880B
+#define PPTP_GRE_VER    0x1
+
+#define PPTP_GRE_FLAG_C	0x80
+#define PPTP_GRE_FLAG_R	0x40
+#define PPTP_GRE_FLAG_K	0x20
+#define PPTP_GRE_FLAG_S	0x10
+#define PPTP_GRE_FLAG_A	0x80
+
+#define PPTP_GRE_IS_C(f) ((f)&PPTP_GRE_FLAG_C)
+#define PPTP_GRE_IS_R(f) ((f)&PPTP_GRE_FLAG_R)
+#define PPTP_GRE_IS_K(f) ((f)&PPTP_GRE_FLAG_K)
+#define PPTP_GRE_IS_S(f) ((f)&PPTP_GRE_FLAG_S)
+#define PPTP_GRE_IS_A(f) ((f)&PPTP_GRE_FLAG_A)
+
+struct pptp_gre_header {
+  u_int8_t flags;		/* bitfield */
+  u_int8_t ver;			/* should be PPTP_GRE_VER (enhanced GRE) */
+  u_int16_t protocol;		/* should be PPTP_GRE_PROTO (ppp-encaps) */
+  u_int16_t payload_len;	/* size of ppp payload, not inc. gre header */
+  u_int16_t call_id;		/* peer's call_id for this session */
+  u_int32_t seq;		/* sequence number.  Present if S=3D1 */
+  u_int32_t ack;		/* seq number of highest packet recieved by */
+  				/*  sender in this session */
+};
+
+struct gre_statistics {
+  /* statistics for GRE receive */
+  unsigned int rx_accepted;  // data packet accepted
+  unsigned int rx_lost;      // data packet did not arrive before timeout
+  unsigned int rx_underwin;  // data packet was under window (arrived too =
late
+                             // or duplicate packet)
+  unsigned int rx_buffered;  // data packet arrived earlier than expected,
+                             // packet(s) before it were lost or reordered
+  unsigned int rx_errors;    // OS error on receive
+  unsigned int rx_truncated; // truncated packet
+  unsigned int rx_invalid;   // wrong protocol or invalid flags
+  unsigned int rx_acks;      // acknowledgement only
+
+  /* statistics for GRE transmit */
+  unsigned int tx_sent;      // data packet sent
+  unsigned int tx_failed;    //
+  unsigned int tx_acks;      // sent packet with just ACK
+
+  __u32 pt_seq;
+  struct timeval pt_time;
+  unsigned int rtt;
+};
+
+static struct pppox_sock * lookup_chan(__u16 call_id)
+{
+	struct pppox_sock *po;
+	read_lock_bh(&chan_lock);
+	for(po=3Dchans[HASH(call_id)]; po; po=3Dpo->next)
+		if (po->proto.pptp.src_addr.call_id=3Dcall_id)
+			break;
+	read_unlock_bh(&chan_lock);
+	return po;
+}
+
+static void add_chan(struct pppox_sock *po)
+{
+	write_lock_bh(&chan_lock);
+	po->next=3Dchans[HASH(po->proto.pptp.src_addr.call_id)];
+	chans[HASH(po->proto.pptp.src_addr.call_id)]=3Dpo;
+	write_unlock_bh(&chan_lock);
+}
+
+static void add_free_chan(struct pppox_sock *po)
+{
+	__u16 call_id=3D1;
+	struct pppox_sock *p;
+
+	write_lock_bh(&chan_lock);
+	for(call_id=3D1; call_id<65535; call_id++) {
+		for(p=3Dchans[HASH(call_id)]; p; p=3Dp->next)
+			if (p->proto.pptp.src_addr.call_id=3Dcall_id)
+				break;
+		if (!p){
+			po->proto.pptp.src_addr.call_id=CAll_id;
+			po->next=3Dchans[HASH(call_id)];
+			chans[HASH(call_id)]=3Dpo;
+			break;
+		}
+	}
+	write_unlock_bh(&chan_lock);
+}
+
+static void del_chan(struct pppox_sock *po)
+{
+	struct pppox_sock *p1,*p2;
+	write_lock_bh(&chan_lock);
+	for(p2=3DNULL,p1=3Dchans[HASH(po->proto.pptp.src_addr.call_id)]; p1 && p1=
!=3Dpo;
+				p2=3Dp1,p1=3Dp1->next);
+	if (p2) p2->next=3Dp1->next;
+	else chans[HASH(po->proto.pptp.src_addr.call_id)]=3Dp1->next;
+	write_unlock_bh(&chan_lock);
+}
+
+static int pptp_xmit(struct ppp_channel *chan, struct sk_buff *skb)
+{
+	struct sock *sk =3D (struct sock *) chan->private;
+	struct pppox_sock *po =3D pppox_sk(sk);
+	struct pptp_opt *opt=3D&po->proto.pptp;
+	struct pptp_gre_header *hdr;
+	unsigned int header_len=3Dsizeof(*hdr);
+	int len=3Dskb?skb->len:0;
+	int err=3D0;
+
+	struct rtable *rt;     			/* Route to the other host */
+	struct net_device *tdev;			/* Device to other host */
+	struct iphdr  *iph;			/* Our new IP header */
+	int    max_headroom;			/* The extra header space needed */
+
+
+	if (skb && opt->seq_sent-opt->ack_recv>opt->window){
+		opt->pause=3D1;
+		return 0;
+	}
+
+	{
+		struct flowi fl =3D { .oif =3D 0,
+				    .nl_u =3D { .ip4_u +					      { .daddr =3D opt->dst_addr.sin_addr=
.s_addr,
+						.saddr =3D opt->src_addr.sin_addr.s_addr,
+						.tos =3D RT_TOS(0) } },
+				    .proto =3D IPPROTO_GRE };
+		if ((err=3Dip_route_output_key(&rt, &fl))) {
+			goto tx_error;
+		}
+	}
+	tdev =3D rt->u.dst.dev;
+
+	max_headroom =3D LL_RESERVED_SPACE(tdev) + sizeof(*iph)+sizeof(*hdr)+2;
+
+	if (!skb){
+		skb=DEv_alloc_skb(max_headroom);
+		skb_reserve(skb,max_headroom-skb_headroom(skb));
+	}else if (skb_headroom(skb) < max_headroom ||
+						skb_cloned(skb) || skb_shared(skb)) {
+		struct sk_buff *new_skb =3D skb_realloc_headroom(skb, max_headroom);
+		if (!new_skb) {
+			ip_rt_put(rt);
+			goto tx_error;
+		}
+		if (skb->sk)
+			skb_set_owner_w(new_skb, skb->sk);
+		dev_kfree_skb(skb);
+		skb =3D new_skb;
+	}
+
+	if (skb->len){
+		int islcp;
+		unsigned char *data=3Dskb->data;
+		islcp=3D((data[0] << 8) + data[1])=3D PPP_LCP && 1 <=3D data[2] && data[=
2] <=3D 7;
+		if (islcp) {
+			data=3Dskb_push(skb,2);
+			data[0]=3D0xff;
+			data[1]=3D0x03;
+		}
+	}
+	len=3Dskb->len;
+
+	if (len=3D0) header_len-=3Dsizeof(hdr->seq);
+	if (opt->ack_sent =3D opt->seq_recv) header_len-=3Dsizeof(hdr->ack);
+
+	skb->nh.raw =3D skb_push(skb, sizeof(*iph)+header_len);
+	memset(&(IPCB(skb)->opt), 0, sizeof(IPCB(skb)->opt));
+	IPCB(skb)->flags &=3D ~(IPSKB_XFRM_TUNNEL_SIZE | IPSKB_XFRM_TRANSFORMED |
+			      IPSKB_REROUTED);
+	dst_release(skb->dst);
+	skb->dst =3D &rt->u.dst;
+
+	/*
+	 *	Push down and install the IP header.
+	 */
+
+	iph 			=3D	skb->nh.iph;
+	iph->version		=3D	4;
+	iph->ihl		=3D	sizeof(struct iphdr) >> 2;
+	iph->frag_off		=3D	0;//df;
+	iph->protocol		=3D	IPPROTO_GRE;
+	iph->tos		=3D	0;
+	iph->daddr		=3D	rt->rt_dst;
+	iph->saddr		=3D	rt->rt_src;
+	iph->ttl =3D dst_metric(&rt->u.dst, RTAX_HOPLIMIT);
+
+	hdr=3D(struct pptp_gre_header *)(iph+1);
+	skb->h.raw =3D (char*)hdr;
+
+	hdr->flags       =3D PPTP_GRE_FLAG_K;
+	hdr->ver         =3D PPTP_GRE_VER;
+	hdr->protocol    =3D htons(PPTP_GRE_PROTO);
+	hdr->call_id     =3D htons(opt->dst_addr.call_id);
+
+	if (!len){
+		hdr->payload_len =3D 0;
+		hdr->ver |=3D PPTP_GRE_FLAG_A;
+		/* ack is in odd place because S =3D 0 */
+		hdr->seq =3D htonl(opt->seq_recv);
+		opt->ack_sent =3D opt->seq_recv;
+		opt->stat->tx_acks++;
+	}else {
+		if (!opt->seq_sent){
+			char unit[10];
+			sprintf(unit,"ppp%i",ppp_unit_number(&po->chan));
+			create_proc_read_entry(unit,0,proc_dir,read_proc,po);
+		}
+
+		hdr->flags |=3D PPTP_GRE_FLAG_S;
+		hdr->seq    =3D htonl(opt->seq_sent++);
+		if (log_level>=3D2)
+			printk("PPTP: send packet: seq=3D%i",opt->seq_sent);
+		if (opt->ack_sent !=3D opt->seq_recv)	{
+		/* send ack with this message */
+			hdr->ver |=3D PPTP_GRE_FLAG_A;
+			hdr->ack  =3D htonl(opt->seq_recv);
+			opt->ack_sent =3D opt->seq_recv;
+			if (log_level>=3D2)
+				printk(" ack=3D%i",opt->seq_recv);
+		}
+		hdr->payload_len =3D htons(len);
+		if (log_level>=3D2)
+			printk("\n");
+	}
+
+	nf_reset(skb);
+
+	skb->ip_summed =3D CHECKSUM_NONE;
+	iph->tot_len =3D htons(skb->len);
+	ip_select_ident(iph, &rt->u.dst, NULL);
+	ip_send_check(iph);
+
+	err =3D NF_HOOK(PF_INET, NF_IP_LOCAL_OUT, skb, NULL, rt->u.dst.dev, dst_o=
utput);
+	if (err =3D NET_XMIT_SUCCESS || err =3D NET_XMIT_CN) {
+		opt->stat->tx_sent++;
+		if (!opt->stat->pt_seq){
+			opt->stat->pt_seq  =3D opt->seq_sent;
+			do_gettimeofday(&opt->stat->pt_time);
+		}
+	}else goto tx_error;
+
+	return 1;
+
+tx_error:
+	opt->stat->tx_failed++;
+	if (!len) dev_kfree_skb(skb);
+	return 1;
+}
+
+static void ack_work(struct pppox_sock *po)
+{
+	struct pptp_opt *opt=3D&po->proto.pptp;
+	if (opt->ack_sent !=3D opt->seq_recv)
+		pptp_xmit(&po->chan,0);
+}
+
+static int get_seq(struct sk_buff *skb)
+{
+	struct iphdr *iph;
+	u8 *payload;
+	struct pptp_gre_header *header;
+
+	iph =3D (struct iphdr*)skb->data;
+	payload =3D skb->data + (iph->ihl << 2);
+	header =3D (struct pptp_gre_header *)(payload);
+
+	return ntohl(header->seq);
+}
+static void buf_work(struct pppox_sock *po)
+{
+	struct timeval tv1,tv2;
+	struct sk_buff *skb;
+	struct pptp_opt *opt=3D&po->proto.pptp;
+	unsigned int t;
+
+	do_gettimeofday(&tv1);
+	spin_lock_bh(&opt->skb_buf_lock);
+	while((skb=3Dskb_dequeue(&opt->skb_buf))){
+		if (!__pptp_rcv(po,skb,0)){
+			skb_get_timestamp(skb,&tv2);
+			t=3D(tv1.tv_sec-tv2.tv_sec)*1000000+(tv1.tv_usec-tv2.tv_usec);
+			if (t<opt->stat->rtt){
+				skb_queue_head(&opt->skb_buf,skb);
+				schedule_delayed_work(&opt->buf_work,t/100*HZ/10000);
+				goto exit;
+			}
+			t=3Dget_seq(skb)-1;
+			opt->stat->rx_lost+=3Dt-opt->seq_recv;
+			opt->seq_recv=3Dt;
+			__pptp_rcv(po,skb,0);
+		}
+	}
+exit:
+	spin_unlock_bh(&opt->skb_buf_lock);
+}
+
+
+#define MISSING_WINDOW 20
+#define WRAPPED( curseq, lastseq) \
+    ((((curseq) & 0xffffff00) =3D 0) && \
+     (((lastseq) & 0xffffff00 ) =3D 0xffffff00))
+static int __pptp_rcv(struct pppox_sock *po,struct sk_buff *skb,int new)
+{
+	struct pptp_opt *opt=3D&po->proto.pptp;
+	int headersize,payload_len,seq;
+	__u8 *payload;
+	struct pptp_gre_header *header;
+
+	header =3D (struct pptp_gre_header *)(skb->data);
+
+	if (new){
+		/* test if acknowledgement present */
+		if (PPTP_GRE_IS_A(header->ver)){
+				__u32 ack =3D (PPTP_GRE_IS_S(header->flags))?
+						header->ack:header->seq; /* ack in different place if S =3D 0 */
+				ack =3D ntohl( ack);
+				if (ack > opt->ack_recv) opt->ack_recv =3D ack;
+				/* also handle sequence number wrap-around  */
+				if (WRAPPED(ack,opt->ack_recv)) opt->ack_recv =3D ack;
+				if (opt->stat->pt_seq && opt->ack_recv > opt->stat->pt_seq){
+					struct timeval tv;
+					unsigned int rtt;
+					do_gettimeofday(&tv);
+					rtt =3D (tv.tv_sec - opt->stat->pt_time.tv_sec)*1000000+
+						tv.tv_usec-opt->stat->pt_time.tv_usec;
+					opt->stat->rtt =3D (opt->stat->rtt + rtt) / 2;
+					if (opt->stat->rtt>opt->timeout) opt->stat->rtt=3Dopt->timeout;
+					opt->stat->pt_seq=3D0;
+				}
+				if (opt->pause){
+					opt->pause=3D0;
+					ppp_output_wakeup(&po->chan);
+				}
+		}
+
+		/* test if payload present */
+		if (!PPTP_GRE_IS_S(header->flags)){
+			opt->stat->rx_acks++;
+			goto drop;
+		}
+	}
+
+	headersize  =3D sizeof(*header);
+	payload_len =3D ntohs(header->payload_len);
+	seq         =3D ntohl(header->seq);
+
+	/* no ack present? */
+	if (!PPTP_GRE_IS_A(header->ver)) headersize -=3D sizeof(header->ack);
+	/* check for incomplete packet (length smaller than expected) */
+	if (skb->len- headersize < payload_len){
+		if (log_level>=3D1)
+			printk("PPTP: discarding truncated packet (expected %d, got %d bytes)\n=
",
+						payload_len, skb->len- headersize);
+		opt->stat->rx_truncated++;
+		goto drop;
+	}
+
+	payload=3Dskb->data+headersize;
+	/* check for expected sequence number */
+	if ((seq =3D opt->seq_recv + 1) || (!opt->timeout &&
+			(seq > opt->seq_recv + 1 || WRAPPED(seq, opt->seq_recv)))){
+		if ( log_level >=3D 2 )
+			printk("PPTP: accepting packet %d size=3D%i (%02x %02x %02x %02x %02x %=
02x)\n", seq,payload_len,
+				*(payload +0),
+				*(payload +1),
+				*(payload +2),
+				*(payload +3),
+				*(payload +4),
+				*(payload +5));
+		opt->stat->rx_accepted++;
+		opt->stat->rx_lost+=3Dseq-(opt->seq_recv + 1);
+		opt->seq_recv =3D seq;
+		schedule_work(&opt->ack_work);
+
+		skb_pull(skb,headersize);
+
+		if (payload[0] =3D PPP_ALLSTATIONS && payload[1] =3D PPP_UI){
+			/* chop off address/control */
+			if (skb->len < 3)
+				goto drop;
+			skb_pull(skb,2);
+		}
+
+		if ((*skb->data) & 1){
+			/* protocol is compressed */
+			skb_push(skb, 1)[0] =3D 0;
+		}
+
+		ppp_input(&po->chan,skb);
+
+		return 1;
+	/* out of order, check if the number is too low and discard the packet.
+	* (handle sequence number wrap-around, and try to do it right) */
+	}else if ( seq < opt->seq_recv + 1 || WRAPPED(opt->seq_recv, seq) ){
+		if ( log_level >=3D 1)
+			printk("PPTP: discarding duplicate or old packet %d (expecting %d)\n",
+							seq, opt->seq_recv + 1);
+		opt->stat->rx_underwin++;
+	/* sequence number too high, is it reasonably close? */
+	}else if ( seq < opt->seq_recv + MISSING_WINDOW ||
+						 WRAPPED(seq, opt->seq_recv + MISSING_WINDOW) ){
+		opt->stat->rx_buffered++;
+		if ( log_level >=3D 1 && new )
+				printk("PPTP: buffering packet %d (expecting %d, lost or reordered)\n",
+						seq, opt->seq_recv+1);
+		return 0;
+	/* no, packet must be discarded */
+	}else{
+		if ( log_level >=3D 1 )
+			printk("PPTP: discarding bogus packet %d (expecting %d)\n",
+							seq, opt->seq_recv + 1);
+	}
+drop:
+	kfree_skb(skb);
+	return -1;
+}
+
+
+static int pptp_rcv(struct sk_buff *skb)
+{
+	struct pptp_gre_header *header;
+	struct pppox_sock *po;
+	struct pptp_opt *opt;
+
+	if (!pskb_may_pull(skb, 12))
+		goto drop;
+
+	header =3D (struct pptp_gre_header *)skb->data;
+
+	if (    /* version should be 1 */
+					((header->ver & 0x7F) !=3D PPTP_GRE_VER) ||
+					/* PPTP-GRE protocol for PPTP */
+					(ntohs(header->protocol) !=3D PPTP_GRE_PROTO)||
+					/* flag C should be clear   */
+					PPTP_GRE_IS_C(header->flags) ||
+					/* flag R should be clear   */
+					PPTP_GRE_IS_R(header->flags) ||
+					/* flag K should be set     */
+					(!PPTP_GRE_IS_K(header->flags)) ||
+					/* routing and recursion ctrl =3D 0  */
+					((header->flags&0xF) !=3D 0)){
+			/* if invalid, discard this packet */
+		if (log_level>=3D1)
+			printk("PPTP: Discarding GRE: %X %X %X %X %X %X\n",
+							header->ver&0x7F, ntohs(header->protocol),
+							PPTP_GRE_IS_C(header->flags),
+							PPTP_GRE_IS_R(header->flags),
+							PPTP_GRE_IS_K(header->flags),
+							header->flags & 0xF);
+		goto drop;
+	}
+
+	dst_release(skb->dst);
+	skb->dst =3D NULL;
+	nf_reset(skb);
+
+	if ((po=3Dlookup_chan(htons(header->call_id)))) {
+		if (!(sk_pppox(po)->sk_state&PPPOX_BOUND))
+			goto drop;
+		if (__pptp_rcv(po,skb,1))
+			buf_work(po);
+		else{
+			struct timeval tv;
+			do_gettimeofday(&tv);
+			skb_set_timestamp(skb,&tv);
+			opt=3D&po->proto.pptp;
+			spin_lock(&opt->skb_buf_lock);
+			skb_queue_tail(&opt->skb_buf, skb);
+			spin_unlock(&opt->skb_buf_lock);
+			schedule_delayed_work(&opt->buf_work,opt->stat->rtt/100*HZ/10000);
+		}
+		goto out;
+	}else icmp_send(skb, ICMP_DEST_UNREACH, ICMP_PROT_UNREACH, 0);
+
+drop:
+	kfree_skb(skb);
+out:
+	return 0;
+}
+
+
+
+static int proc_output (struct pppox_sock *po,char *buf)
+{
+	struct gre_statistics *stat=3Dpo->proto.pptp.stat;
+	char *p=3Dbuf;
+	p+=3Dsprintf(p,"rx accepted  =3D %d\n",stat->rx_accepted);
+	p+=3Dsprintf(p,"rx lost      =3D %d\n",stat->rx_lost);
+	p+=3Dsprintf(p,"rx under win =3D %d\n",stat->rx_underwin);
+	p+=3Dsprintf(p,"rx buffered  =3D %d\n",stat->rx_buffered);
+	p+=3Dsprintf(p,"rx invalid   =3D %d\n",stat->rx_invalid);
+	p+=3Dsprintf(p,"rx acks      =3D %d\n",stat->rx_acks);
+	p+=3Dsprintf(p,"tx sent      =3D %d\n",stat->tx_sent);
+	p+=3Dsprintf(p,"tx failed    =3D %d\n",stat->tx_failed);
+	p+=3Dsprintf(p,"tx acks      =3D %d\n",stat->tx_acks);
+
+	return p-buf;
+}
+static int read_proc(char *page, char **start, off_t off,int count, int *e=
of, void *data)
+{
+	struct pppox_sock *po =3D data;
+	int len =3D proc_output (po,page);
+	if (len <=3D off+count) *eof =3D 1;
+	*start =3D page + off;
+	len -=3D off;
+	if (len>count) len =3D count;
+	if (len<0) len =3D 0;
+	return len;
+}
+
+static int pptp_bind(struct socket *sock,struct sockaddr *uservaddr,int so=
ckaddr_len)
+{
+	struct sock *sk =3D sock->sk;
+	struct sockaddr_pppox *sp =3D (struct sockaddr_pppox *) uservaddr;
+	struct pppox_sock *po =3D pppox_sk(sk);
+	struct pptp_opt *opt=3D&po->proto.pptp;
+	int error=3D0;
+
+	if (log_level>=3D1)
+		printk("PPTP: bind: addr=3D%X call_id=3D%i\n",sp->sa_addr.pptp.sin_addr.=
s_addr,
+						sp->sa_addr.pptp.call_id);
+	lock_sock(sk);
+
+	opt->src_addr=3Dsp->sa_addr.pptp;
+	if (sp->sa_addr.pptp.call_id){
+		if (lookup_chan(sp->sa_addr.pptp.call_id)){
+			error=3D-EBUSY;
+			goto end;
+		}
+		add_chan(po);
+	}else{
+		add_free_chan(po);
+		if (!opt->src_addr.call_id)
+			error=3D-EBUSY;
+		if (log_level>=3D1)
+			printk("PPTP: using call_id %i\n",opt->src_addr.call_id);
+	}
+
+ end:
+	release_sock(sk);
+	return error;
+}
+
+static int pptp_connect(struct socket *sock, struct sockaddr *uservaddr,
+		  int sockaddr_len, int flags)
+{
+	struct sock *sk =3D sock->sk;
+	struct sockaddr_pppox *sp =3D (struct sockaddr_pppox *) uservaddr;
+	struct pppox_sock *po =3D pppox_sk(sk);
+	struct pptp_opt *opt=3D&po->proto.pptp;
+	int error=3D0;
+
+	if (log_level>=3D1)
+		printk("PPTP: connect: addr=3D%X call_id=3D%i\n",
+						sp->sa_addr.pptp.sin_addr.s_addr,sp->sa_addr.pptp.call_id);
+
+	lock_sock(sk);
+
+	if (sp->sa_protocol !=3D PX_PROTO_PPTP){
+		error =3D -EINVAL;
+		goto end;
+	}
+
+	/* Check for already bound sockets */
+	if (sk->sk_state & PPPOX_CONNECTED){
+		error =3D -EBUSY;
+		goto end;
+	}
+
+	/* Check for already disconnected sockets, on attempts to disconnect */
+	if (sk->sk_state & PPPOX_DEAD){
+		error =3D -EALREADY;
+		goto end;
+	}
+
+	if (!opt->src_addr.sin_addr.s_addr || !sp->sa_addr.pptp.sin_addr.s_addr){
+		error =3D -EINVAL;
+		goto end;
+	}
+
+	po->chan.private=3Dsk;
+	po->chan.ops=3D&pptp_chan_ops;
+	po->chan.mtu=3DPPP_MTU;
+	po->chan.hdrlen=3D2+sizeof(struct pptp_gre_header);
+	error =3D ppp_register_channel(&po->chan);
+	if (error){
+		printk(KERN_ERR "PPTP: failed to register PPP channel (%d)\n",error);
+		goto end;
+	}
+
+	opt->dst_addr=3Dsp->sa_addr.pptp;
+	sk->sk_state =3D PPPOX_CONNECTED;
+
+ end:
+	release_sock(sk);
+	return error;
+}
+
+static int pptp_getname(struct socket *sock, struct sockaddr *uaddr,
+		  int *usockaddr_len, int peer)
+{
+	int len =3D sizeof(struct sockaddr_pppox);
+	struct sockaddr_pppox sp;
+
+	sp.sa_family	=3D AF_PPPOX;
+	sp.sa_protocol	=3D PX_PROTO_PPTP;
+	sp.sa_addr.pptp=3Dpppox_sk(sock->sk)->proto.pptp.src_addr;
+
+	memcpy(uaddr, &sp, len);
+
+	*usockaddr_len =3D len;
+
+	return 0;
+}
+
+static int pptp_setsockopt(struct socket *sock, int level, int optname,
+	char* optval, int optlen)
+{
+	struct sock *sk =3D sock->sk;
+	struct pppox_sock *po =3D pppox_sk(sk);
+	struct pptp_opt *opt=3D&po->proto.pptp;
+	int val;
+
+	if (optlen!=3Dsizeof(int))
+		return -EINVAL;
+
+	if (get_user(val,(int __user*)optval))
+		return -EFAULT;
+
+	switch(optname) {
+		case PPTP_SO_TIMEOUT:
+			opt->timeout=3Dval;
+			break;
+		case PPTP_SO_WINDOW:
+			opt->window=3Dval;
+			break;
+		default:
+				return -ENOPROTOOPT;
+	}
+
+	return 0;
+}
+
+static int pptp_getsockopt(struct socket *sock, int level, int optname,
+	char* optval, int *optlen)
+{
+	struct sock *sk =3D sock->sk;
+	struct pppox_sock *po =3D pppox_sk(sk);
+	struct pptp_opt *opt=3D&po->proto.pptp;
+	int len,val;
+
+	if (get_user(len,(int __user*)optlen))
+		return -EFAULT;
+
+	if (len<sizeof(int))
+		return -EINVAL;
+
+	switch(optname) {
+		case PPTP_SO_TIMEOUT:
+			val=3Dopt->timeout;
+			break;
+		case PPTP_SO_WINDOW:
+			val=3Dopt->window;
+			break;
+		default:
+				return -ENOPROTOOPT;
+	}
+
+	if (put_user(sizeof(int),(int __user*)optlen))
+		return -EFAULT;
+
+	if (put_user(val,(int __user*)optval))
+		return -EFAULT;
+
+	return 0;
+}
+
+static int pptp_release(struct socket *sock)
+{
+	struct sock *sk =3D sock->sk;
+	struct pppox_sock *po;
+	struct pptp_opt *opt;
+	int error =3D 0;
+
+	if (!sk)
+		return 0;
+
+	if (sock_flag(sk, SOCK_DEAD))
+		return -EBADF;
+
+	po =3D pppox_sk(sk);
+	opt=3D&po->proto.pptp;
+	if (opt->src_addr.sin_addr.s_addr) {
+		cancel_delayed_work(&opt->buf_work);
+		flush_scheduled_work();
+		del_chan(po);
+		skb_queue_purge(&opt->skb_buf);
+
+		if (opt->seq_sent){
+			char unit[10];
+			sprintf(unit,"ppp%i",ppp_unit_number(&po->chan));
+			remove_proc_entry(unit,proc_dir);
+		}
+	}
+
+	pppox_unbind_sock(sk);
+
+	kfree(opt->stat);
+
+	/* Signal the death of the socket. */
+	sk->sk_state =3D PPPOX_DEAD;
+
+	sock_orphan(sk);
+	sock->sk =3D NULL;
+
+	skb_queue_purge(&sk->sk_receive_queue);
+	sock_put(sk);
+
+	return error;
+}
+
+
+static struct proto pptp_sk_proto =3D {
+	.name	  =3D "PPTP",
+	.owner	  =3D THIS_MODULE,
+	.obj_size =3D sizeof(struct pppox_sock),
+};
+
+static const struct proto_ops pptp_ops =3D {
+    .family		=3D AF_PPPOX,
+    .owner		=3D THIS_MODULE,
+    .release		=3D pptp_release,
+    .bind		=3D  pptp_bind,
+    .connect		=3D pptp_connect,
+    .socketpair		=3D sock_no_socketpair,
+    .accept		=3D sock_no_accept,
+    .getname		=3D pptp_getname,
+    .poll		=3D sock_no_poll,
+    .listen		=3D sock_no_listen,
+    .shutdown		=3D sock_no_shutdown,
+    .setsockopt		=3D pptp_setsockopt,
+    .getsockopt		=3D pptp_getsockopt,
+    .sendmsg		=3D sock_no_sendmsg,
+    .recvmsg		=3D sock_no_recvmsg,
+    .mmap		=3D sock_no_mmap,
+    .ioctl		=3D pppox_ioctl,
+};
+
+static int pptp_create(struct socket *sock)
+{
+	int error =3D -ENOMEM;
+	struct sock *sk;
+	struct pppox_sock *po;
+	struct pptp_opt *opt;
+
+	sk =3D sk_alloc(PF_PPPOX, GFP_KERNEL, &pptp_sk_proto, 1);
+	if (!sk)
+		goto out;
+
+	sock_init_data(sock, sk);
+
+	sock->state =3D SS_UNCONNECTED;
+	sock->ops   =3D &pptp_ops;
+
+	//sk->sk_backlog_rcv =3D pppoe_rcv_core;
+	sk->sk_state	   =3D PPPOX_NONE;
+	sk->sk_type	   =3D SOCK_STREAM;
+	sk->sk_family	   =3D PF_PPPOX;
+	sk->sk_protocol	   =3D PX_PROTO_PPTP;
+
+	po =3D pppox_sk(sk);
+	opt=3D&po->proto.pptp;
+
+	opt->window=3Dmin_window;
+	opt->timeout=3D0;
+	opt->seq_sent=3D0; opt->seq_recv=3D-1;
+	opt->ack_recv=3D0; opt->ack_sent=3D-1;
+	skb_queue_head_init(&opt->skb_buf);
+	opt->skb_buf_lock=3DSPIN_LOCK_UNLOCKED;
+	INIT_WORK(&opt->ack_work,(void(*)(void*))ack_work,sk);
+	INIT_WORK(&opt->buf_work,(void(*)(void*))buf_work,sk);
+	opt->stat=3Dkzalloc(sizeof(*opt->stat),GFP_KERNEL);
+
+	error =3D 0;
+out:
+	return error;
+}
+
+
+static struct pppox_proto pppox_pptp_proto =3D {
+    .create	=3D pptp_create,
+    //.ioctl	=3D pptp_ioctl,
+    .owner	=3D THIS_MODULE,
+};
+
+static struct net_protocol net_pptp_protocol =3D {
+	.handler	=3D pptp_rcv,
+	//.err_handler	=3D	ipgre_err,
+};
+
+
+static int pptp_init_module(void)
+{
+	int err=3D0;
+	printk(KERN_INFO "PPTP driver version " PPTP_DRIVER_VERSION "\n");
+
+	if (inet_add_protocol(&net_pptp_protocol, IPPROTO_GRE) < 0) {
+		printk(KERN_INFO "PPTP: can't add protocol\n");
+		goto out;
+	}
+
+	err =3D proto_register(&pptp_sk_proto, 0);
+	if (err){
+		printk(KERN_INFO "PPTP: can't register sk_proto\n");
+		goto out_inet_del_protocol;
+	}
+
+ 	err =3D register_pppox_proto(PX_PROTO_PPTP, &pppox_pptp_proto);
+	if (err){
+		printk(KERN_INFO "PPTP: can't register pppox_proto\n");
+		goto out_unregister_sk_proto;
+	}
+
+	proc_dir=3Dproc_mkdir("pptp",NULL);
+	if (!proc_dir){
+		printk(KERN_ERR "PPTP: failed to create proc dir\n");
+	}
+	//console_verbose();
+
+out:
+	return err;
+out_unregister_sk_proto:
+	proto_unregister(&pptp_sk_proto);
+out_inet_del_protocol:
+	inet_del_protocol(&net_pptp_protocol, IPPROTO_GRE);
+	goto out;
+}
+
+static void pptp_exit_module(void)
+{
+	unregister_pppox_proto(PX_PROTO_PPTP);
+	proto_unregister(&pptp_sk_proto);
+	inet_del_protocol(&net_pptp_protocol, IPPROTO_GRE);
+
+	if (proc_dir)
+		remove_proc_entry("pptp",NULL);
+}
+
+
+module_init(pptp_init_module);
+module_exit(pptp_exit_module);
diff -uprN linux-2.6.16.orig/include/linux/if_pppox.h linux-2.6.16.pptp/inc=
lude/linux/if_pppox.h
--- linux-2.6.16.orig/include/linux/if_pppox.h	2006-06-18 00:52:01.00000000=
0 +0400
+++ linux-2.6.16.pptp/include/linux/if_pppox.h	2006-06-17 23:45:05.00000000=
0 +0400
@@ -1,6 +1,6 @@
 /*************************************************************************=
**
  * Linux PPP over X - Generic PPP transport layer sockets
- * Linux PPP over Ethernet (PPPoE) Socket Implementation (RFC 2516)=20
+ * Linux PPP over Ethernet (PPPoE) Socket Implementation (RFC 2516)
  *
  * This file supplies definitions required by the PPP over Ethernet driver
  * (pppox.c).  All version information wrt this file is located in pppox.c
@@ -19,6 +19,7 @@
=20
 #include <asm/types.h>
 #include <asm/byteorder.h>
+#include <linux/in.h>
=20
 #ifdef  __KERNEL__
 #include <linux/if_ether.h>
@@ -36,29 +37,35 @@
 #define PF_PPPOX	AF_PPPOX
 #endif /* !(AF_PPPOX) */
=20
-/************************************************************************ =

- * PPPoE addressing definition=20
- */=20
-typedef __u16 sid_t;=20
-struct pppoe_addr{=20
-       sid_t           sid;                    /* Session identifier */=20
-       unsigned char   remote[ETH_ALEN];       /* Remote address */=20
-       char            dev[IFNAMSIZ];          /* Local device to use */=20
-};=20
-=20
-/************************************************************************ =

- * Protocols supported by AF_PPPOX=20
- */=20
+/************************************************************************
+ * PPPoE addressing definition
+ */
+typedef __u16 sid_t;
+struct pppoe_addr{
+       sid_t           sid;                    /* Session identifier */
+       unsigned char   remote[ETH_ALEN];       /* Remote address */
+       char            dev[IFNAMSIZ];          /* Local device to use */
+};
+
+struct pptp_addr{
+       __u16           call_id;
+       struct in_addr  sin_addr;
+};
+/************************************************************************
+ * Protocols supported by AF_PPPOX
+ */
 #define PX_PROTO_OE    0 /* Currently just PPPoE */
-#define PX_MAX_PROTO   1=09
-=20
-struct sockaddr_pppox {=20
-       sa_family_t     sa_family;            /* address family, AF_PPPOX *=
/=20
-       unsigned int    sa_protocol;          /* protocol identifier */=20
-       union{=20
-               struct pppoe_addr       pppoe;=20
-       }sa_addr;=20
-}__attribute__ ((packed));=20
+#define PX_PROTO_PPTP  1
+#define PX_MAX_PROTO   2
+
+struct sockaddr_pppox {
+       sa_family_t     sa_family;            /* address family, AF_PPPOX */
+       unsigned int    sa_protocol;          /* protocol identifier */
+       union{
+               struct pppoe_addr       pppoe;
+	       			 struct pptp_addr        pptp;
+       }sa_addr;
+}__attribute__ ((packed));
=20
=20
 /*********************************************************************
@@ -111,6 +118,12 @@ struct pppoe_hdr {
 	struct pppoe_tag tag[0];
 } __attribute__ ((packed));
=20
+
+/* Socket options */
+#define PPTP_SO_TIMEOUT 1
+#define PPTP_SO_WINDOW  2
+
+
 #ifdef __KERNEL__
 struct pppoe_opt {
 	struct net_device      *dev;	  /* device associated with socket*/
@@ -118,6 +131,20 @@ struct pppoe_opt {
 	struct sockaddr_pppox	relay;	  /* what socket data will be
 					     relayed to (PPPoE relaying) */
 };
+struct pptp_opt {
+	struct pptp_addr	src_addr;
+	struct pptp_addr	dst_addr;
+	int timeout;
+	int window;
+	__u32 ack_sent, ack_recv;
+	__u32 seq_sent, seq_recv;
+	int pause;
+	spinlock_t skb_buf_lock;
+	struct sk_buff_head skb_buf;
+	struct work_struct ack_work;  //send ack work
+	struct work_struct buf_work; //check bufferd packets work
+	struct gre_statistics *stat;
+};
=20
 #include <net/sock.h>
=20
@@ -128,6 +155,7 @@ struct pppox_sock {
 	struct pppox_sock	*next;	  /* for hash table */
 	union {
 		struct pppoe_opt pppoe;
+		struct pptp_opt pptp;
 	} proto;
 	unsigned short		num;
 };
diff -uprN linux-2.6.16.orig/MAINTAINERS linux-2.6.16.pptp/MAINTAINERS
--- linux-2.6.16.orig/MAINTAINERS	2006-06-18 00:52:00.000000000 +0400
+++ linux-2.6.16.pptp/MAINTAINERS	2006-06-18 01:26:45.000000000 +0400
@@ -2118,6 +2118,11 @@ P:	Michal Ostrowski
 M:	mostrows@speakeasy.net
 S:	Maintained
=20
+PPTP
+P:      Dmitry Kozlov
+M:      xeb@mail.ru
+S:      Maintained
+
 PREEMPTIBLE KERNEL
 P:	Robert Love
 M:	rml@tech9.net

