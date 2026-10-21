Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792574657;
	b=OVnpflIUEMtrKysmbVKAIcVX6duWnpU93suZMudEspcyxg4hHkJPtvJKbXYuPWYEwgcq
	 0fVeLgfrExnlRJg7cruXr9rOZ1M6d48IQ6EFxGiJBFrs+Zve0xurZhN08eC1aSnjZzceM
	 LHeWzDWq15BckTM3tFdzyIswoQ0p85WV1+fLT5Pi3APK230Vwwopg9QO998MC33K5f4+a
	 HMTHO+KrhBossv717njiWYZJjmTIwBSfENEtwlM3tThu7gS4YA9T8r7cXx019HBLSceUh
	 3QUuUFhDWxIH5HPRYmzNw115MNxLHV6exdV1tQrzbBDvRgJ8fQ9fV8IyaNvDTUtHXaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792574657;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Mh3+aFhREYt9T2kLtzJpCkgtISqLMbfW3ivDXH4ur8A=;
	b=Mj9rjXcp4mVu5Bjs8MJQFcctlM5EQVY3laYTFefoz6vsvZCAOp4Rx91SRUiA3uFpS6Bh
	 9I5nVED/gNx3jTq2G7U850XMWNwq0dMday3ea9UzkR0TderSG7klHF/9ZmLoQ9GjuvO4N
	 g/lZI4lnj0lj3iRH3Ou2FobjpF9tBy69siI8+q96P9NpS7Qk95rafu/T8svpA0iO100Sl
	 vPEnxPAG/WnNVoHu2VZGCT1NzhDDQd5XpP9cc4hOYCJK9VyXNXxtdp1ip0ZkW1rmv2bD4
	 Rlyk22JX8n3+oqs+NF4dFsTdvJYHO2aH/8JoDOrl6B0Flb+0kcTUx5p7nSB7TEeOyDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HXpLVE0R;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA493606A325
	for <linux-ppp@vger.kernel.org>; Wed, 21 Oct 2026 09:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HXpLVE0R
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 947421F000C9
	for <linux-ppp@vger.kernel.org>; Wed, 21 Oct 2026 09:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792574655;
	bh=Mh3+aFhREYt9T2kLtzJpCkgtISqLMbfW3ivDXH4ur8A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=HXpLVE0Rx+SXfW7TbsM4AdN/G8jC40nxpQ+kWXJj7aVpTmIKZaGo+5C70O1uVy+jS
	 5DuqToxNlPLxUyJ4qz7N9bMcXzkk1xI5rdWWpqHOK+uP4rM4baFXxIInj6R00WpQKl
	 Nx1dmkjwnDHH2iMGrrbxVupLPFSgqpbcf53IwKMBVAeWH+Vhp5pIc8RIWa0sMokcpy
	 DNMvThBGHDLxjAGm7HAbHxSBuYbDKLXFDkp9sJVlqBwzlfib7+DL0sOL0kod7wQPXf
	 eTvBZA1K9ZtlZkba8QErj4V8nnEdAQr+DQgZvhl+WCiRuX8rrlmEEOSlXX8hYiwl9j
	 +K1jvgJFHr/wA==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3a20f06cce6so5191391fa.1
        for <linux-ppp@vger.kernel.org>; Wed, 21 Oct 2026 02:24:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzsKOy8QbNBRwJBd36ZwPMFRK/W6xk52yzPqPhhuXlCzuZBbVYNrg+g8SkBUNYmg4P2mkoIR18niO0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKzp5MizkXXeDnK588FYJn2UFzWGVn5egqqrFkRZyTVrjxI6E05
	7E4iMKXCFYETfHY95jbMNZQ+iRTlANwefsjIuKuB/kJxXr1mxTx8+dhZfa2K9BH9omNYm5aQKzF
	DtcIXjt1HKiMvBM/PzGh6Y6Sk1CZTU9g=
X-Received: by 2002:a05:651c:a381:20b0:3a9:e177:b789 with SMTP id
 38308e7fff4ca-3ac4416ce8emr2921851fa.11.1792574654151; Wed, 21 Oct 2026
 02:24:14 -0700 (PDT)
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Post: <mailto:linux-ppp@vger.kernel.org>
List-Help: <mailto:linux-ppp+help@vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-ppp+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021023608.55867-1-qingfang.deng@linux.dev>
 <179255036282.3290.8488375760281728576@kernel.org> <c0f348bf-0e13-4cb1-8014-cd9b7787bfe6@linux.dev>
In-Reply-To: <c0f348bf-0e13-4cb1-8014-cd9b7787bfe6@linux.dev>
From: Eric Dumazet <edumazet@kernel.org>
Date: Wed, 21 Oct 2026 11:24:00 +0200
X-Gmail-Original-Message-ID: <CAL4WiirRPnbSBgcoh8Aiq8zGVzsy34w9uaqAgSKQwpgJ0ht7aA@mail.gmail.com>
X-Gm-Features: AclHuK_lGdq1_T0QqgguBKMaqkJY1FcOab5Q5Bg2FBD_rFprGMTf6qeEI816hlo
Message-ID: <CAL4WiirRPnbSBgcoh8Aiq8zGVzsy34w9uaqAgSKQwpgJ0ht7aA@mail.gmail.com>
Subject: Re: [PATCH net] ppp: linearize bridged packets when required
To: Qingfang Deng <qingfang.deng@linux.dev>
Cc: netdev-bot+sinfo@kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Breno Leitao <leitao@debian.org>, Kees Cook <kees@kernel.org>, Taegu Ha <hataegu0826@gmail.com>, 
	Tom Parkin <tparkin@katalix.com>, linux-ppp@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, James Chapman <jchapman@katalix.com>, 
	Sashiko <sashiko-bot@kernel.org>, Felix Fietkau <nbd@nbd.name>, 
	Pablo Neira Ayuso <pablo@netfilter.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 21 oct. 2026 =C3=A0 05:07, Qingfang Deng <qingfang.deng@linux.dev> =
a =C3=A9crit :
>
> On 2026/10/21 10:39, netdev-bot+sinfo@kernel.org wrote:
> > Hi!
> >
> > This is an automated message. This series looks like a fix, but its
> > commit messages seem to be missing some information:
> >
> >   - Whether the issue was actually triggered, or is only theoretical
> >     (e.g. found by code inspection). If it was triggered please include
> >     the symptoms, like the stack trace or error messages.
>
> This is reproduced in a VM, with a TAP interface bridged to a PTY. When
> IFF_NAPI_FRAGS is set, a non-linear skb is passed to PPPoE and then to
> ppp_async_send() without linearization. The packet sent to the PTY then
> contains garbage data.

OK, but I think GRO/GSO is still in the way (because of 55a5d8fca836
("net: pppoe: implement GRO/GSO support")).
I guess Sashiko will find out.

We should GSO segment first, then linearize the small segments
(instead of 64KB packets)

I was working on the GSO part yesterday, so what about this:

commit 5e8cbf87e1aea072b9bdb52ca5c7a5f523186934
Author: Eric Dumazet <edumazet@kernel.org>
Date:   Wed Oct 21 10:04:45 2026 +0200

    ppp: linearize and segment bridged packets when required

    PPP channel bridging is commonly used for PPPoE relaying or forwarding
    from PPPoE to PPPoL2TP. Both destination channel types handle non-linea=
r
    packets, but other channels, such as PPP Async, require linear packets.

    Ethernet drivers can pass non-linear packets to PPPoE. If one is bridge=
d
    to PPP Async, ppp_async_encode() accesses the entire packet through
    skb->data, assuming that it is linear. This can read beyond the linear
    buffer and transmit unrelated memory over the serial interface.

    Since commit 55a5d8fca836 ("net: pppoe: implement GRO/GSO support"),
    these packets can also be GSO packets. Packets can also be in
    CHECKSUM_PARTIAL state, for instance when injected by a tap device or
    a packet socket using a virtio_net_hdr. The regular transmit path never
    sees such packets, because the ppp device does not advertise GSO or
    checksum offload features. Most PPP channels are not prepared for them:

    - PPP Async and PPP Sync send a GSO packet as a single frame, up to
      64KB, far above the peer MRU. They also send CHECKSUM_PARTIAL packets
      with an unfinished L4 checksum.
    - PPTP pushes GRE and IP headers in front of a TCP GSO packet, which
      gre_gso_segment() refuses because skb->encapsulation is not set. It
      also sets CHECKSUM_NONE without finishing a pending checksum.
    - L2TP pushes UDP and L2TP headers in front of a TCP GSO packet, which
      udp4_ufo_fragment() refuses. A TSO capable device could also be
      handed a TCP GSO packet whose transport header is a UDP header.

    Only PPPoE handles them correctly, as pppoe_xmit() uses
    dev_queue_xmit(), which can segment GSO packets with
    pppoe_gso_segment() and finish checksums, or offload them to the
    device.

    Add a xmit_offload flag to struct ppp_channel, telling that the channel
    accepts GSO and CHECKSUM_PARTIAL packets, and set it for PPPoE.

    For other bridged channels, segment GSO packets in software. The PPP
    protocol field in front of the IP header is used as the L2 header, and
    is replicated in front of each segment. Then finish CHECKSUM_PARTIAL
    checksums with skb_checksum_help(). For channels without direct_xmit,
    also linearize each packet, as ppp_push() does for the regular transmit
    path. Packets are dropped if any of these steps fails.

    The bridge path still has no transmit queue, so a channel that is
    busy (for example a full tty) drops the segments it refuses, as it
    already did for regular packets.

    Non-linear packets were reproduced in a VM, with a TAP interface using
    IFF_NAPI_FRAGS feeding PPPoE, bridged to PPP Async on a PTY: the
    packets sent to the PTY contained garbage data.

    GSO and CHECKSUM_PARTIAL packets were reproduced by bridging a PPPoE
    channel on a veth device to PPP Async on a PTY. With GRO enabled, a
    burst of 8 TCP segments was sent as a single 8040 byte frame with a
    bad TCP checksum, and is now sent as 8 valid frames, for both IPv4 and
    IPv6. A CHECKSUM_PARTIAL packet sent through a packet socket with
    PACKET_VNET_HDR was sent with a bad TCP checksum, and now has a valid
    one. When bridging to a second PPPoE channel, GSO packets are passed
    unchanged to the PPPoE device, and are correctly segmented by
    pppoe_gso_segment() when the device does not offload them.

    Fixes: 4cf476ced45d ("ppp: add PPPIOCBRIDGECHAN and
PPPIOCUNBRIDGECHAN ioctls")
    Fixes: 55a5d8fca836 ("net: pppoe: implement GRO/GSO support")
    Reported-by: Sashiko <sashiko-bot@kernel.org>
    Closes: https://sashiko.dev/#/patchset/20260908072135.877364-1-qingfang=
.deng@linux.dev
    Co-developed-by: Qingfang Deng <qingfang.deng@linux.dev>
    Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
    Signed-off-by: Eric Dumazet <edumazet@kernel.org>
    Cc: Felix Fietkau <nbd@nbd.name>
    Cc: Pablo Neira Ayuso <pablo@netfilter.org>

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index 1a610a18893ba94b5ff3f69f8e25dcd944ef01a8..2b27ec36c8cef829e3bc9238036=
c68967aceea1e
100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -45,6 +45,7 @@
 #include <linux/slab.h>
 #include <linux/file.h>
 #include <linux/unaligned.h>
+#include <net/gso.h>
 #include <net/netdev_lock.h>
 #include <net/slhc_vj.h>
 #include <linux/atomic.h>
@@ -2278,6 +2279,58 @@ static bool ppp_decompress_proto(struct sk_buff *skb=
)
        return pskb_may_pull(skb, 2);
 }

+/* Segment a GSO packet (built by PPPoE GRO) before sending it to a
+ * bridged channel that does not accept GSO packets.
+ * skb->data points to the PPP protocol field, which is replicated
+ * in front of each segment.
+ * Returns a list of segments, or NULL if the packet was dropped.
+ */
+static struct sk_buff *ppp_bridge_gso_segment(struct sk_buff *skb)
+{
+       struct sk_buff *segs;
+
+       if (!pskb_may_pull(skb, PPP_PROTO_LEN))
+               goto drop;
+
+       switch (get_unaligned_be16(skb->data)) {
+       case PPP_IP:
+               skb->protocol =3D htons(ETH_P_IP);
+               break;
+       case PPP_IPV6:
+               skb->protocol =3D htons(ETH_P_IPV6);
+               break;
+       default:
+               goto drop;
+       }
+       skb_set_network_header(skb, PPP_PROTO_LEN);
+
+       segs =3D skb_gso_segment(skb, 0);
+       if (IS_ERR_OR_NULL(segs))
+               goto drop;
+
+       consume_skb(skb);
+       return segs;
+
+drop:
+       kfree_skb(skb);
+       return NULL;
+}
+
+static void ppp_bridge_xmit(struct ppp_channel *chan, struct sk_buff *skb)
+{
+       if (!chan->direct_xmit && skb_linearize(skb))
+               goto drop;
+
+       if (!chan->xmit_offload && skb->ip_summed =3D=3D CHECKSUM_PARTIAL &=
&
+           skb_checksum_help(skb))
+               goto drop;
+
+       if (chan->ops->start_xmit(chan, skb))
+               return;
+drop:
+       kfree_skb(skb);
+}
+
 /* Attempt to handle a frame via. a bridged channel, if one exists.
  * If the channel is bridged, the frame is consumed by the bridge.
  * If not, the caller must handle the frame by normal recv mechanisms.
@@ -2285,6 +2338,8 @@ static bool ppp_decompress_proto(struct sk_buff *skb)
  */
 static bool ppp_channel_bridge_input(struct channel *pch, struct sk_buff *=
skb)
 {
+       struct sk_buff *segs, *next;
+       struct ppp_channel *chan;
        struct channel *pchb;

        rcu_read_lock();
@@ -2300,8 +2355,17 @@ static bool ppp_channel_bridge_input(struct
channel *pch, struct sk_buff *skb)
        }

        skb_scrub_packet(skb, !net_eq(pch->chan_net, pchb->chan_net));
-       if (!pchb->chan->ops->start_xmit(pchb->chan, skb))
-               kfree_skb(skb);
+
+       chan =3D pchb->chan;
+       if (!chan->xmit_offload && skb_is_gso(skb)) {
+               segs =3D ppp_bridge_gso_segment(skb);
+               skb_list_walk_safe(segs, skb, next) {
+                       skb_mark_not_on_list(skb);
+                       ppp_bridge_xmit(chan, skb);
+               }
+       } else {
+               ppp_bridge_xmit(chan, skb);
+       }

 outl:
        spin_unlock_bh(&pchb->downl);
diff --git a/drivers/net/ppp/pppoe.c b/drivers/net/ppp/pppoe.c
index bf7414b46a26068d1773ec79055167956dde7183..f22087d76874ce524f66003ae00=
d1528a0e0b898
100644
--- a/drivers/net/ppp/pppoe.c
+++ b/drivers/net/ppp/pppoe.c
@@ -669,6 +669,7 @@ static int pppoe_connect(struct socket *sock,
struct sockaddr_unsized *uservaddr
                po->chan.private =3D sk;
                po->chan.ops =3D &pppoe_chan_ops;
                po->chan.direct_xmit =3D true;
+               po->chan.xmit_offload =3D true;

                error =3D ppp_register_net_channel(dev_net(dev), &po->chan)=
;
                if (error) {
diff --git a/include/linux/ppp_channel.h b/include/linux/ppp_channel.h
index 2f63e9a6cc88984c075792dcbd6c832ff45acd51..15bc3aa4f1715c265a5808fcc1c=
c2b93cc44c519
100644
--- a/include/linux/ppp_channel.h
+++ b/include/linux/ppp_channel.h
@@ -43,6 +43,7 @@ struct ppp_channel {
        void            *ppp;           /* opaque to channel */
        int             speed;          /* transfer rate (bytes/second) */
        bool            direct_xmit;    /* no qdisc, xmit directly */
+       bool            xmit_offload;   /* accepts GSO and
CHECKSUM_PARTIAL skbs */
 };

 #ifdef __KERNEL__
