Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.40
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793260189;
	b=nnT3QqxkqqR35QG3ClSyW6c1y3vKZSujAydRRMyWgZm/njrhG3IsAhvTON+AlWvDB4oY
	 z9D6hwarzu5Wj6w4NKQc1/xd9sJKSG8lS4SHlC7QrrzUiFloBdm+zW++1SPnRxPlFzzap
	 kU1d5Fsu8BBuFREipLoYfCDgnbXnPeFlBZlJostTE6VAB5p+ebxovSQtNMaOyOiR1ovcA
	 sSt+VgegNwiY0NwXDA9p68OnZ/Jkk4E9kFOFtv7l9jI6R/6Pjns6aR/+PVcv8qzkkpoY0
	 k3IfseQz9N5whOAMdwhvYcdruOhKsRfc2NwDVYS3M3fpCU9XJpISpI6Dnm9R5LW17tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793260189;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=wKcwn6Rk5lPeD1ZYuSyC9nozBY4N1b3MpNfJc6pFicQ=;
	b=ENYULlEdT766UsdKYYCBywNiOAuS2Faqvm5PCdm+F0NLn/a8QvmBq9bgb3DPiVUQKq/Q
	 Ht1EuGmbAM5bKRFHdv38IgbehT5awrrA+xSy10qls6Gk/HXXAmXKimVmfAoLS5NIbGGjV
	 37L0cljpDTcq/KMv1TTtobEChZle6tpBTlnQDF8TxebrBVhlA1+/4U/Big9opred47plA
	 Q5TvPg6CbNg6LSff9hDgDUtHurnUqGZlaGOvR3ZYKH+jBkHkq+UQmJd7hhp1WJHvENhsD
	 /ls4r1COHbxvb12mqiPNK7nA32/N5FS3CJnB5LdglRVLlYcujSoBvGX1tVNTdLtc95w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RhRW6ieF;
	arc=none smtp.remote-ip=91.218.175.40
Received: from mta0.migadu.com (out-40.mta0.migadu.com [91.218.175.40])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1AB5606A31E
	for <linux-ppp@vger.kernel.org>; Thu, 29 Oct 2026 07:49:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1AB5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RhRW6ieF
X-Envelope-To: linux-ppp@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ofXpdaB/7nB74dbgxFWLaiAeMu+4yAIU416lNX3BA6g=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793260187; v=1; x=1793864987;
 b=RhRW6ieFUhwanXiIwNzvNSvdlHLq86/Pe3hIR26dkWUsnwB1e1mPrfCUsTkOBGPdYQhB0YwK
 /Y4t4pdH24c0pze0wlVGDAfIinoFqUajKCelW6FHmqc8T3rHGaVFSv+ScnJSBb5c0ZrSq7MjHAK
 utQaD2gZeCJL3ZOzzuPPltjY=
X-Envelope-To: linux-ppp@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f7790a20ed431206;
	Thu, 29 Oct 2026 07:49:46 +0000
X-Mizu-Trace-ID: f7790a20ed431206
X-Migadu-Flow: FLOW_OUT
From: Qingfang Deng <qingfang.deng@linux.dev>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Qingfang Deng <qingfang.deng@linux.dev>,
	Breno Leitao <leitao@debian.org>,
	Norbert Szetei <norbert@doyensec.com>,
	Taegu Ha <hataegu0826@gmail.com>,
	Paul Mackerras <paulus@ozlabs.org>,
	Brice Goglin <Brice.Goglin@ens-lyon.org>,
	Andrew Morton <akpm@osdl.org>,
	Matt Domsch <Matt_Domsch@dell.com>,
	linux-ppp@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] ppp: remove SC_MUST_COMP
Date: Thu, 29 Oct 2026 15:49:32 +0800
Message-ID: <20261029074935.40509-1-qingfang.deng@linux.dev>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Post: <mailto:linux-ppp@vger.kernel.org>
List-Help: <mailto:linux-ppp+help@vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-ppp+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SC_MUST_COMP accidentally shares the same value with SC_DC_ERROR.
PPPIOCGFLAGS combines configuration flags with transmit and receive
state, so a userspace cannot distinguish them, and a read-modify-write
sequence can promote a decompression error into SC_MUST_COMP.

The flag entered Linux in 2005 with commit b3f9b92a6ec1 ("[PPP]: add PPP
MPPE encryption module"). The original patch submission [1] said pppd
would set it when CCP came up with MPPE enabled. That intended
integration [2] appears never to have landed upstream.

Remove the broken and unused SC_MUST_COMP from the UAPI, SC_MASK and
SC_FLAG_BITS, and remove its transmit and receive drop checks.
PPPIOCSFLAGS will discard this bit while PPPIOCGFLAGS can still report
it as SC_DC_ERROR.

Fixes: b3f9b92a6ec1 ("[PPP]: add PPP MPPE encryption module")
[1] https://lore.kernel.org/netdev/20050814141046.GB20944@lists.us.dell.com/
[2] https://lore.kernel.org/netdev/20050814190529.GA26802@lists.us.dell.com/
Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
---
Found and reproduced with LLM. Combined with the broken BSD-Compress on
64-bit, it results in a broken link:

1. First BSD failure: the kernel sets both SC_DC_FERROR and SC_DC_ERROR,
   then passes the failed packet to userspace. pppd closes CCP. Traffic
   falls back to uncompressed, but SC_MUST_COMP becomes accidentally
   latched.

2. Re-enable compression: send SIGUSR2 to pppd, to let BSD compression
   renegotiate. This is a documented pppd operation (man 8 pppd). The
   stale flag survives.

3. Second BSD failure: the kernel sets both error flags again. Now the
   receive check fires:

	if (ppp->flags & SC_MUST_COMP && ppp->rstate & SC_DC_FERROR)
	    goto err;

   The kernel drops the failed packet before delivering it to pppd.
   Consequently, pppd does not perform its normal CCP shutdown and
   cleanup.

4. Subsequent incoming IP and CCP packets hit the same drop check,
   preventing normal recovery.
---
 drivers/net/ppp/ppp_generic.c  | 15 ++-------------
 include/uapi/linux/ppp-ioctl.h |  3 +--
 2 files changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index 1a610a18893b..84ca4e93ad9a 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -157,14 +157,13 @@ struct ppp {
 
 /*
  * Bits in flags: SC_NO_TCP_CCID, SC_CCP_OPEN, SC_CCP_UP, SC_LOOP_TRAFFIC,
- * SC_MULTILINK, SC_MP_SHORTSEQ, SC_MP_XSHORTSEQ, SC_COMP_TCP, SC_REJ_COMP_TCP,
- * SC_MUST_COMP
+ * SC_MULTILINK, SC_MP_SHORTSEQ, SC_MP_XSHORTSEQ, SC_COMP_TCP, SC_REJ_COMP_TCP.
  * Bits in rstate: SC_DECOMP_RUN, SC_DC_ERROR, SC_DC_FERROR.
  * Bits in xstate: SC_COMP_RUN
  */
 #define SC_FLAG_BITS	(SC_NO_TCP_CCID|SC_CCP_OPEN|SC_CCP_UP|SC_LOOP_TRAFFIC \
 			 |SC_MULTILINK|SC_MP_SHORTSEQ|SC_MP_XSHORTSEQ \
-			 |SC_COMP_TCP|SC_REJ_COMP_TCP|SC_MUST_COMP)
+			 |SC_COMP_TCP|SC_REJ_COMP_TCP)
 
 /*
  * Private data structure for each channel.
@@ -1862,13 +1861,6 @@ ppp_prepare_tx_skb(struct ppp *ppp, struct sk_buff **pskb)
 	/* try to do packet compression */
 	if ((ppp->xstate & SC_COMP_RUN) && ppp->xc_state &&
 	    proto != PPP_LCP && proto != PPP_CCP) {
-		if (!(ppp->flags & SC_CCP_UP) && (ppp->flags & SC_MUST_COMP)) {
-			if (net_ratelimit())
-				netdev_err(dev,
-					   "ppp: compression required but "
-					   "down - pkt dropped.\n");
-			goto drop;
-		}
 		new_skb = pad_compress_skb(ppp, skb);
 		if (!new_skb)
 			goto drop;
@@ -2416,9 +2408,6 @@ ppp_receive_nonmp_frame(struct ppp *ppp, struct sk_buff *skb)
 	    (ppp->rstate & (SC_DC_FERROR | SC_DC_ERROR)) == 0)
 		skb = ppp_decompress_frame(ppp, skb);
 
-	if (ppp->flags & SC_MUST_COMP && ppp->rstate & SC_DC_FERROR)
-		goto err;
-
 	/* At this point the "Protocol" field MUST be decompressed, either in
 	 * ppp_input(), ppp_decompress_frame() or in ppp_receive_mp_frame().
 	 */
diff --git a/include/uapi/linux/ppp-ioctl.h b/include/uapi/linux/ppp-ioctl.h
index 1cc5ce0ae062..672f7ac11a0b 100644
--- a/include/uapi/linux/ppp-ioctl.h
+++ b/include/uapi/linux/ppp-ioctl.h
@@ -39,8 +39,7 @@
 #define SC_LOG_RAWIN	0x00080000	/* log all chars received */
 #define SC_LOG_FLUSH	0x00100000	/* log all chars flushed */
 #define	SC_SYNC		0x00200000	/* synchronous serial mode */
-#define	SC_MUST_COMP    0x00400000	/* no uncompressed packets may be sent or received */
-#define	SC_MASK		0x0f600fff	/* bits that user can change */
+#define	SC_MASK		0x0f200fff	/* bits that user can change */
 
 /* state bits */
 #define SC_XMIT_BUSY	0x10000000	/* (used by isdn_ppp?) */
-- 
2.43.0

