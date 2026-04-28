Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF3722173D
	for <linux-ppp@vger.kernel.org>; Tue, 28 Apr 2026 01:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777339743; cv=none; b=KQRpNWcWVOxaY7e5I4FXH/mxjaJrTJ91k+iubFVUvLj61KEnuAN0iQcFSxcH0ily/n8VhZNUSWk/J3Mj93kgs8E0w3rH2wZnHJKHNd0AJe29BBYMkNZUrn8skrm5erp6T2lvyj+XY92bAKl72kSqq0JvTGX45IXVsGxK5xkI9yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777339743; c=relaxed/simple;
	bh=CG71CsRHLCkwEEZkEDxaa0YLMcXA5g/1hjDu7SvoInY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QfYy1QPeMDwtvxcO33J0oJj/3v4GQeGDsqo4bWtotzknzu7ElbT7tUwpPh1XH4i5iJyZPH3oHhkxA/AXF5cs6KQArRDCPQqCOO3mkPuZr7akOa2MpAUn/0MH1PTNNRDGQCFxTLZVZw1fQ1NSCCcbXHILVYFQ9TMBZO1IZqDrmWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=mcZ8K/1+; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="mcZ8K/1+"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777339738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Be0uEQixrUXyeMbYy+bU6XYNI/yDZs05dC8kB+vODrk=;
	b=mcZ8K/1+mCpckg0dvFzgrLLx/Vn+LhIYwsPNRe58thaQFUsIKngYJrNBBnB7zONzWZJQw/
	Qe/+V8GoudIqkDe0i12B08IPirlNjMcHREIKEPyCFZIX004zqRkTZWzx4FLL5FVHWxjhR5
	Ww6oJ5ZDrWduyC+o5zbdedrgnN4Qo18=
From: Qingfang Deng <qingfang.deng@linux.dev>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Qingfang Deng <qingfang.deng@linux.dev>,
	Julian Braha <julianbraha@gmail.com>,
	Eric Biggers <ebiggers@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linux-ppp@vger.kernel.org
Subject: [PATCH net-next] ppp: add PPPOX symbol
Date: Tue, 28 Apr 2026 09:28:26 +0800
Message-ID: <20260428012830.3069-1-qingfang.deng@linux.dev>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Add a dedicated CONFIG_PPPOX symbol to handle the PPPoX generic module,
avoiding redundant pppox.o definitions in the Makefile.

Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
---
 drivers/net/ppp/Kconfig  | 6 ++++++
 drivers/net/ppp/Makefile | 6 +++---
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ppp/Kconfig b/drivers/net/ppp/Kconfig
index 753354b4e36c..c592648ebd41 100644
--- a/drivers/net/ppp/Kconfig
+++ b/drivers/net/ppp/Kconfig
@@ -110,8 +110,12 @@ config PPPOATM
 	  which can lead to bad results if the ATM peer loses state and
 	  changes its encapsulation unilaterally.
 
+config PPPOX
+	tristate
+
 config PPPOE
 	tristate "PPP over Ethernet"
+	select PPPOX
 	help
 	  Support for PPP over Ethernet.
 
@@ -157,6 +161,7 @@ config PPPOE_HASH_BITS
 config PPTP
 	tristate "PPP over IPv4 (PPTP)"
 	depends on NET_IPGRE_DEMUX
+	select PPPOX
 	help
 	  Support for PPP over IPv4.(Point-to-Point Tunneling Protocol)
 
@@ -168,6 +173,7 @@ config PPTP
 config PPPOL2TP
 	tristate "PPP over L2TP"
 	depends on L2TP
+	select PPPOX
 	help
 	  Support for PPP-over-L2TP socket family. L2TP is a protocol
 	  used by ISPs and enterprises to tunnel PPP traffic over UDP
diff --git a/drivers/net/ppp/Makefile b/drivers/net/ppp/Makefile
index 16c457d6b324..a815e1497179 100644
--- a/drivers/net/ppp/Makefile
+++ b/drivers/net/ppp/Makefile
@@ -9,6 +9,6 @@ obj-$(CONFIG_PPP_BSDCOMP) += bsd_comp.o
 obj-$(CONFIG_PPP_DEFLATE) += ppp_deflate.o
 obj-$(CONFIG_PPP_MPPE) += ppp_mppe.o
 obj-$(CONFIG_PPP_SYNC_TTY) += ppp_synctty.o
-obj-$(CONFIG_PPPOE) += pppox.o pppoe.o
-obj-$(CONFIG_PPPOL2TP) += pppox.o
-obj-$(CONFIG_PPTP) += pppox.o pptp.o
+obj-$(CONFIG_PPPOX) += pppox.o
+obj-$(CONFIG_PPPOE) += pppoe.o
+obj-$(CONFIG_PPTP) += pptp.o
-- 
2.43.0

