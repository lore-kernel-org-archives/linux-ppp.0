Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BEC2D97B7
	for <linux-ppp@vger.kernel.org>; Sat, 19 Sep 2026 21:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789854759; cv=none; b=CFgTCYyCMIzQ1QREjw+bYjLuka4pkeEcLG9tC3HU/AoLjnbH3zlnYGFWjYTcCRizu2nqo4WtrdgETYjrDUKt6/0dn6Zn+85nYJtDN2Gucy0/FdNzihkSgGdOK6xyXnejajfOw8gss0wyjXJyyoyMCh0qnV4gK2IY/ZC6mFoa/M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789854759; c=relaxed/simple;
	bh=VQ9Ha0Kv35OQUZIpcPbivRupE8x247MSqdoR4m67+Ho=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mbyUe/DZK/d5HQv8WVbrIYDHD27oqm+jw276e48+pH0Kr26V2CYmyqLDrtex+l3CqLPazHKcOi/QqySoViAYjKnoBsEYO70n/mUEIgxWagjaQ3pqC7KictGMlal0Nly2zOb7r2TmAH637J6G380r/VkPX0qY+2UrW8sT8EPSQGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X9A5fMSf; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X9A5fMSf"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-398b3b189e0so1603750a91.2
        for <linux-ppp@vger.kernel.org>; Sat, 19 Sep 2026 14:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789854755; x=1790459555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9aJFCfj2LQ5guspfVFESmNOnFBxFScArLrkp4w4HDqo=;
        b=X9A5fMSf6Ey7j1lhELdG149NMTlNwd1aYMVzCjjErg3oC//sGLBGsDNxovof9rXB0j
         fj1PiEp4qtAYSJn1+7C/FsjFgPDEmRkj2rHt0t/PcvtWdLfpmQny7OanLzpePEK4Cy8L
         YQzIFNL2MR0hn9ekLlOK5qAmfMF8RAFqLYQyn6YfJdCeq03S44En+3wnAxVsiOaparZr
         D61+UX/X2UNXJIJWTKFMgeNq9D+b+RVkLjp4z2MYlw+kRMwtEaxD77Vhf92R+Vqqoba9
         /Yd3vfwWaEMqrGw1+Mt84JM/DnCJpFa2CQoW9ugv37CVgHDkgVCjCmeUWpFZITQ+9i2L
         8aRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789854755; x=1790459555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9aJFCfj2LQ5guspfVFESmNOnFBxFScArLrkp4w4HDqo=;
        b=DnE5mmojcUMNvTUEEhQ0uPczaoqiBE4zxFwOUMnCYJ1bEwrhJBZcK5WZylm0ktJGIu
         rHDkc/kJu0DlUlbN8gZguDH6WRBcFtW2LSj6FD8ET2mChA1Gcf4nyzjliDRrfNeTp1YK
         G912UyGT9vGVetzgFewqWdHZuFbxRMYwPa737c/WvKLKFrSacR3kIE19zC8ssiiSFIkU
         EMgome9E9aC94WEhwbnsXmRiTf7Ov3xvpaRLGw8NqTnZ9g4Wjwd24DnG3hN6KTcXUioC
         1tDhbGUr/AURDmGhFDwf05QXP22ogq4vseKquKNjcwCPJOkGcN0PtIchxcLcjagG84cU
         h0qA==
X-Gm-Message-State: AFuF++lhm0B2mvH3wyn28Z6dc2+4e6fHE2ZOXJZj/004KjWPJpmeh+tm
	pWe+JOR4NV+mFQHsj/Q6PhUQzlw+Io2SQXr/1EfrxdV+wpoQ9kYeC8uM
X-Gm-Gg: AYBFou0k+fQGeqAH2aZ+kDbzcVb3NGZ50a38xYVwPHnYhmXzHOk8L31VcfgszmO1RuL
	9phUBPD7qJUs+2lz+XYwGaAVTXUqYJlymOjIV1z/zWft7F28LzfvFqVWQybDO7F73pyiqbzn4Fr
	zrgfEzYtwrGI1breTxZ33OGY1MYL2ShZxxb6VIIFUa9SQnot+hzpmOKSBFUkQELof08Uv/dzhQP
	/+iwfDPbKQ1lk/5zH5udnqcacJq3BwoGJiZO9D78IIhmMdmaGs/+LapQUEsQVMtjjiByBt5AoMu
	0WocdQ90DowoCCnKSj1KSF5nr2cza2GyXlUIV5K1h1gTCul6QGG7/FfvBZTXJCL/u6P7ux/3IKO
	UfeB2MdwUBQYGFS6NqgEBjFV5PD28kAAvqPSN/BKWFMKAkzGG6F8LsQKGhccSu3PNJumSI6cUrZ
	ljPOqGcMuoar0op6A3QL1qriKA8huzyX2K6mfhUbpKQATiMQsMWD9iqOIQWIDjz8SvZbla8zS07
	Qk+XGUo4ckGtM8yttpji5+UJGj4Ss1Pu2e9z+i19ObfGLWWi2sAxTA04tme/u3upXiXf+tbegsT
	Tl2JmT9GbQ==
X-Received: by 2002:a17:90b:5690:b0:398:bee5:61d6 with SMTP id 98e67ed59e1d1-39e54cfabf6mr11253729a91.24.1789854754661;
        Sat, 19 Sep 2026 14:52:34 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0309d5760sm862843a91.4.2026.09.19.14.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 14:52:34 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: linux-ppp@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ppp: fix bsd_decompress() OOB read and ppp_decompress_frame() headroom check
Date: Sat, 19 Sep 2026 21:52:33 +0000
Message-ID: <20260919215233.3470411-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In ppp_decompress_frame(), skb->data - 2 is passed to the decompressor
assuming at least 2 bytes of headroom exist for the PPP Address/Control
fields, and the returned decompressed length is only checked for len < 0
before indexing ns->data[2..3] and calling skb_pull_rcsum(skb, 2).

Ensure 2 bytes of headroom via pskb_expand_head(skb, 2, 0, GFP_ATOMIC),
reject decompressed frames shorter than PPP_HDRLEN (4 bytes), and check
isize >= PPP_HDRLEN + BSD_OVHD in bsd_decompress() before reading the
sequence number and header bytes.

Fixes: 224cf5ad14c0 ("ppp: Move the PPP drivers")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
diff --git a/drivers/net/ppp/bsd_comp.c b/drivers/net/ppp/bsd_comp.c
index 63a6d251c746..03ee4ff4ec1b 100644
--- a/drivers/net/ppp/bsd_comp.c
+++ b/drivers/net/ppp/bsd_comp.c
@@ -847,6 +847,8 @@ static int bsd_decompress (void *state, unsigned char *ibuf, int isize,
     int extra;
 
     db       = (struct bsd_db *) state;
+	if (isize < PPP_HDRLEN + BSD_OVHD)
+		return DECOMP_ERROR;
     max_ent  = db->max_ent;
     accm     = 0;
     bitno    = 32;		/* 1st valid bit in accm */
diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index 1a610a18893b..f7af328b7bf8 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -2552,7 +2552,8 @@ ppp_decompress_frame(struct ppp *ppp, struct sk_buff *skb)
 	/* Until we fix all the decompressor's need to make sure
 	 * data portion is linear.
 	 */
-	if (!pskb_may_pull(skb, skb->len))
+	if (!pskb_may_pull(skb, skb->len) ||
+	    pskb_expand_head(skb, 2, 0, GFP_ATOMIC))
 		goto err;
 
 	if (proto == PPP_COMP) {
@@ -2576,7 +2577,7 @@ ppp_decompress_frame(struct ppp *ppp, struct sk_buff *skb)
 		/* the decompressor still expects the A/C bytes in the hdr */
 		len = ppp->rcomp->decompress(ppp->rc_state, skb->data - 2,
 				skb->len + 2, ns->data, obuff_size);
-		if (len < 0) {
+		if (len < PPP_HDRLEN) {
 			/* Pass the compressed frame to pppd as an
 			   error indication. */
 			if (len == DECOMP_FATALERROR)
