Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD07038238C
	for <linux-ppp@vger.kernel.org>; Wed, 29 Apr 2026 02:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777430350; cv=none; b=bCi31JDCyV5ftpxW+dRbvpPyITlgIu7BLEOr9DxYK5oGVG6n0QtpgpbGiOcig13h83pw0c87K8UJ0TU+50AetVYp+hc5/Re9qQiljQ82RENoX83yb3ws1+XT2s1ga3pgQ8+PpVSelaVFFq9vC95odvqjra/GbTotSU80LKbIWLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777430350; c=relaxed/simple;
	bh=tBTl0xy/hsAnsGtM9aM9rgIMKM5lR9x96oX01UJaZhw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RUBIylueEj2YWmvzyZT4Iz1/cblkhoZzvho0qyGtZ574g9lRIDsp+hvArVlLF22gS0SGhPJCuapmG5Wl5PvX1LMCas8FbBlzdiouGZGQzp1+BOCPr1ulIODlxFFKZ24bdFzDo4h5DqEJ/J3OwFGT9E4FOKwir+owHtSX1X97eLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ICQbjVnb; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ICQbjVnb"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777430336;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hAPC6BiCdcdMi/R6MIQssFNU/RXbhO7b3nUEqaGcP+A=;
	b=ICQbjVnb0pdUszF0cqjpr0cI6MkztFk2PR+q9Zm8CAWJZwVV1+bthhWYuorT0zptB+Zt36
	dr0fZMT53rl1DX/jSkov98bxY0Olh4WMq9/g1/cOLEvEd8WkSv9jZWLDWAi7yxq0gwLk9Z
	41IYta/RmDxBjXrzkAf7hfDXtWQGUwc=
From: Qingfang Deng <qingfang.deng@linux.dev>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Qingfang Deng <qingfang.deng@linux.dev>,
	Guillaume Nault <gnault@redhat.com>,
	Kees Cook <kees@kernel.org>,
	Eric Woudstra <ericwouds@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linux-ppp@vger.kernel.org
Subject: [PATCH net-next v2] pppoe: optimize hash with word access
Date: Wed, 29 Apr 2026 10:38:46 +0800
Message-ID: <20260429023848.153425-1-qingfang.deng@linux.dev>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Currently, hash_item() processes the 6-byte Ethernet address and the
2-byte session ID byte-wise to compute a hash.

Optimize this by using 16-bit word operations: XOR three 16-bit words
from the Ethernet address and the 16-bit session ID, then fold the
result. This reduces the total number of loads and XORs. The Ethernet
addresses in a skb and struct pppoe_addr are both 2-byte aligned, so the
u16 pointer cast is safe.

Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
---
v2: repost after net-next opens

v1: https://lore.kernel.org/netdev/20260413035212.56566-1-qingfang.deng@linux.dev

 drivers/net/ppp/pppoe.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ppp/pppoe.c b/drivers/net/ppp/pppoe.c
index bdd61c504a1c..ad5bb98c1579 100644
--- a/drivers/net/ppp/pppoe.c
+++ b/drivers/net/ppp/pppoe.c
@@ -136,15 +136,15 @@ static inline int cmp_addr(struct pppoe_addr *a, __be16 sid, char *addr)
 #error 8 must be a multiple of PPPOE_HASH_BITS
 #endif
 
-static int hash_item(__be16 sid, unsigned char *addr)
+static u8 hash_item(__be16 sid, const u8 addr[ETH_ALEN])
 {
-	unsigned char hash = 0;
+	const u16 *addr16 = (const u16 *)addr;
 	unsigned int i;
+	u16 hash16;
+	u8 hash;
 
-	for (i = 0; i < ETH_ALEN; i++)
-		hash ^= addr[i];
-	for (i = 0; i < sizeof(sid_t) * 8; i += 8)
-		hash ^= (__force __u32)sid >> i;
+	hash16 = addr16[0] ^ addr16[1] ^ addr16[2] ^ (__force u16)sid;
+	hash = (hash16 >> 8) ^ hash16;
 	for (i = 8; (i >>= 1) >= PPPOE_HASH_BITS;)
 		hash ^= hash >> i;
 
-- 
2.43.0

