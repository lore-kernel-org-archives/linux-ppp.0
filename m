Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792785194;
	b=wguqDQB6dl9h7UhF6n42yWEUBDk+Tzm0kgT8SNpbWSL7E9SnJEN0m8XnmJEjzO2ozSHC
	 rU9T8J8t/d0lIqMrg/vXXFlKjSTrnBdbRT9+zmEWNyJpI1Ks/6Obca1bmrDwDhWbdh5vl
	 xJUOO9qRFpOnWPCcHSa0nAEhTDvZK6Nd7Ni9/qrG/S9MSC0WDTY1FOIoXtB7C78rIk7cX
	 OEGGDEek+Txgirw9fg81p/NxaaCbsu7NDEgYPg98PlxKRKJk34kP8kXYT5/QHBoFfgJ2I
	 /kOEaAvdAMA+VOeRUakqRe8B3oiAz27JdiBllMmIooYBiMLZrfptRPnkL/pBME/Ej7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792785194;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MYMvGahXwl+NkKbqUxWpkDAanrsDHqw5aIx8j0gxjPs=;
	b=ksGbhhqVqCgN9Y9TVl2NLSgklUu8RDjZCjcXdQ9Sc5YipNq6I8NcRhOgEzBLiVHcMrFA
	 VRF4+aGir3PZPmOHhqGJzedI4qF25hvN+Ge/f8NDltU1fTaeAv3PZWCgYXfYjGBjLp5w0
	 yeD81bn3tD4FOCbs5L8YMbcruh//nNOVjm/9vsBiIIaFuZ+m9aBC7UqjZuIP95YeHnuli
	 CEFyPKoEd5oIwGDPwAg8YQi/oikamvHwX2cfz3OLwzIfXMhf2zc2zahlCS9PVp/fcsb3+
	 RlunYrvgP8K72m0v+O53Hhou6BcCbAc3cCtgJ1UrC2o9s0/TQLlaxytt72Lwe8h4oZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SNymd6a1;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99AE606A31E
	for <linux-ppp@vger.kernel.org>; Fri, 23 Oct 2026 19:53:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B99AE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SNymd6a1
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e00eee27dso824222f8f.0
        for <linux-ppp@vger.kernel.org>; Fri, 23 Oct 2026 12:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792785192; x=1793389992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MYMvGahXwl+NkKbqUxWpkDAanrsDHqw5aIx8j0gxjPs=;
        b=SNymd6a1wWN4/3R20ghV9hJHANXsMHNZSjpLs7ikUYUtr6b9oz82iVM8+eYTK/D3vU
         IGsAk8eCbL0wRGWa2VkqZqGYenDcQblbEh7NY5P5CnCrzU0GVQJd8GQdSa9LiNUopKf4
         H+smT8EN7qxVHmRrLBcf8NQKwog626n7OpXx7vMBHc3nJNf4Ek+rT6LmoMS5Z1OSQAkX
         /vhr8qGpafrpNzpFK/lC3P8bxKvBmvsJGKTJoKns+JWDQ7uGfMcy3Ble1kF/ytdKyupE
         4LNMEbbDLPq2dsN94uKUpxZoySsaQkttM4MnXwwrNGH90oR3nHt597WX+Ij+22CRbRl2
         pKdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792785192; x=1793389992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MYMvGahXwl+NkKbqUxWpkDAanrsDHqw5aIx8j0gxjPs=;
        b=LgvAIb2rq/0vZsCKwEU+FD8D4wOywg8KiJn7OCoxdG6cqjppTRot2ikazU2R2HCpnT
         i9DIDvrc/vMRGN69b4O1WNtzrw1WRRwhoS1zyqcBUQJZM+yraZxVJJ+ndrHV3QPwhhqc
         w9ptGSPe1c3ZVl8B8Yk6go8XqwHA/K6gYtWpYN42hl7T84YusX2PeaEMmR8BypCeCcvq
         BtPbva4H3R0A4fpHLLXcnv/wImubOAHzc/gKu62YiufNJ3hbU2RNEpevf+UrMzXJh4zL
         VMdLFEKrMxMhdazwPL5yMrYfgWuxqeXH3hGGzkt1uMXkpknmjHlDCSyVZubrqIHTcisN
         UgjQ==
X-Forwarded-Encrypted: i=1; AKwUvBxY3XKclQYc5MadWbjWPrFqd5z4d53zOYGyOVcJ9odb52tSwxuPaIRZNjevgBdsylTGbienyRerh/c=@vger.kernel.org
X-Gm-Message-State: AFq9FYKSjhLO4YpiAqxnHcg/rwvdXKlgKVoaeGetj5RojLRTcnlhOPRF
	lEarDk3ZCdHSSByv+IBWNAc/4loaOgCK3VThOu2O9Vv8mgy6aPK04ig=
X-Gm-Gg: AYBFou3r04bUIxobRThPmo/WDUfIO9Rrou6Wz+aeZpoSaZd5UxtWFnezRYoFNU6XEg7
	LUXAuIT0IEXi6OGHgM+IbA98s41oScYuxgCtOB6GUJchqIH1rZ7KGpz213WKtWT/OB7e5JVitrF
	YTBOXu/J9I87i4zbRRBb85z/eBPgwRCKRuIsozr97ARrPPUxnRBBDYnV/jimmFAqP7Z7fQCb6gJ
	8hP5eFrHS6gkSUslUkgrO62HblVBnr2MWwmu1mOEIe98dsOqC/ZDtmRCW6FMNnS81KVeIxIOHr1
	9ftkdxBmiKJEt7AXsP6iRRMqbLDEhyqBhVoJJEA3czZiblBkmKZoAlrvOYkZ7kfaUB1iOsYCcuE
	LW3gQqXjgBnbr+k53/2epoPi/RNSRxE6DUQo/XmS39LURIeNE9UK2COVHJXdEc7uIw8WqhGSGQL
	HFQuH3x5nJBle2lMiYXFVX98CTgY5GP3SFMTw4fAH+ixba2MwWQwy6itmSKvlS8W9sPt8hC0mX8
	HlMPCDJMcck+hmkrZc+YHUwDQ==
X-Received: by 2002:a05:600c:19d4:b0:4a3:5a42:b29c with SMTP id 5b1f17b1804b1-4a35a42b345mr2557955e9.26.1792785192118;
        Fri, 23 Oct 2026 12:53:12 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359fc1207sm4434875e9.1.2026.10.23.12.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 12:53:11 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Qingfang Deng <qingfang.deng@linux.dev>,
	linux-ppp@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH net] ppp: fix stale pointer access after pskb_may_pull in ppp_ccp_peek
Date: Fri, 23 Oct 2026 19:53:09 +0000
Message-ID: <20261023195309.3527129-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
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

From: Tristan Madani <tristan@talencesecurity.com>

ppp_ccp_peek() caches a pointer to skb->data in dp after the first
pskb_may_pull(), then uses dp after a second pskb_may_pull(skb, len + 2)
in the CCP_CONFACK handler. If the second pull triggers
pskb_expand_head() due to a cloned skb or frag linearization,
skb->head is freed and reallocated, leaving dp stale.

The stale dp is subsequently used in CCP_OPT_LENGTH() and passed to
decomp_init()/comp_init() which read from the freed memory.

Re-derive dp from skb->data after the second pskb_may_pull.

Fixes: 1da177e4c3f41 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/net/ppp/ppp_generic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index 1a610a18893ba..3998ce4332f42 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -3157,6 +3157,7 @@ ppp_ccp_peek(struct ppp *ppp, struct sk_buff *skb, int inbound)
 		len = CCP_LENGTH(dp);
 		if (!pskb_may_pull(skb, len + 2))
 			return;		/* too short */
+		dp = skb->data + 2;
 		dp += CCP_HDRLEN;
 		len -= CCP_HDRLEN;
 		if (len < CCP_OPT_MINLEN || len < CCP_OPT_LENGTH(dp))
-- 
2.47.3

