Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.243.164.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794832109;
	b=eOO8CTtuMbeB4dEb/CCSrCkQQhBHLTXFVRfFdnFkpE+pZfEeGr74w+L6nsWuIcvFCBDL
	 KfaZc7w9QpWgaOGFh3dXcxg4Jx3PVGax72XHjeKv4ziM/dZHgs8vbvEoRz8pzDlsbVlQu
	 lLRG/V1SkfHUC2Nn6VAK0BmoYosYenIVulJ1SN95mDOajVj7hFfFiClm96IuGktz11fC5
	 aJQsUWggb+ftypV+oOwUOwofXhS6klaITerioTN1z7fkQvzVqETN2pGiKP35uWKMj2dmk
	 PFZiTpeyfR1GpNWWs6UeS6VbyUFCeHG4IgXsnp36Wn9hoYB0ChjxQfKZVfd8C6+fLRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794832109;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=koB5cD8jkiHwg/gaCDPGLOgCwu+vMsptg2p8K3IP/zk=;
	b=DVRtE1V9Wf6kR38C7QOKsLUrmSUCe7/QNZsj9fSvSSo/n7uIESpM48RLGTT+gy4HrnZn
	 XygzRbsrKqu4gbjOQUC4LKZt8ZEAXmhMqneWDm+/urMwDXQUpIDidxDNbu08J/1begv6x
	 9FXN49Ki7dTrb5ibD3prYZP3CbXa1hZ9Y4fi3HtgOHfnmwsmCJzYaE4wKhLUPQdQavyyg
	 NKNRdE29O7thswPUCtqITcOIeDbafKVdtIkhxU3F4j5MFwtTsw9jUW2M1T1xMc0td7FYj
	 2mCM31PQBKgjjSm0gCbAqEYmNliclXCow6EN0W79NW5Th6nRv3hbiUyFPaqt7VGrqIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=stu.xidian.edu.cn;
	spf=pass smtp.mailfrom=stu.xidian.edu.cn;
	arc=none smtp.remote-ip=162.243.164.118
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06FB3606A31C;
	Mon, 16 Nov 2026 12:28:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06FB3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=stu.xidian.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stu.xidian.edu.cn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=stu.xidian.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=koB5cD8jkiHwg/gaCDPGLOgCwu+vMsptg2p8K3IP/zk=; b=sDchc54b5/Hhu
	jQgJQso7kRC8U4MZdOTa3543GtiHmcpfFVON9+K/gwmqSdPvwz3kWWlEt0DCn0Y6
	XPzoDYg1s9JGperNFt6v2GxgLUe2lxJZpqxL7NnNiuofnFNWunmFYjvaiW/UWDf/
	BaTTXGOaaqoiYzJFI4Tt0H0gZKtQc4=
Received: from LAPTOP-FRMFRHCN.localdomain (unknown [240e:454:8411:e49:29:34e0:92e:39c2])
	by hzbj-edu-front-3.icoremail.net (Coremail) with UTF8SMTPA id BbQMCkC2vP_J9vpqLoS3AQ--.35856S2;
	Mon, 16 Nov 2026 20:27:54 +0800 (CST)
From: Haoli Zhang <26031212468@stu.xidian.edu.cn>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: linux-ppp@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+6b18da3ef22e33061add@syzkaller.appspotmail.com,
	qingfang.deng@linux.dev,
	25031212117@stu.xidian.edu.cn,
	byu@xidian.edu.cn,
	Haoli Zhang <26031212468@stu.xidian.edu.cn>
Subject: [PATCH net] ppp: serialize channel connect with unregister
Date: Mon, 16 Nov 2026 20:27:50 +0800
Message-Id: <20261116122750.23294-1-26031212468@stu.xidian.edu.cn>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Post: <mailto:linux-ppp@vger.kernel.org>
List-Help: <mailto:linux-ppp+help@vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-ppp+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:BbQMCkC2vP_J9vpqLoS3AQ--.35856S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXF47Gw15XFWktr48Cry5CFg_yoW5XF1UpF
	Z0k392vryDtFsYga1kGa1UWr17Z3ZxJayjvryqqwn5Zr95GFs3CrsYqayY9F15urs7CFWj
	yF4FqrZxWa4UX3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPF14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
	1j6rxdM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
	Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJV
	W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI2
	0VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxkIecxEwV
	CI4VW5JwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjfU19NV
	UUUUU
X-CM-SenderInfo: yswqjiasrskluy6v33wo0lvxldqovvfxof0/1tbiAgUTEWr5zUjRewABs4

ppp_unregister_channel() disconnects a channel before clearing pch->chan.
During that interval, a concurrent PPPIOCCONNECT can observe pch->ppp as
NULL while pch->chan is still valid. It can reconnect the channel and add
its clist to a PPP unit, after which unregistering releases the channel
without removing the new list entry.

Serialize PPPIOCCONNECT with channel unregistering using chan_sem. Take
the mutex before disconnecting the channel and hold it until pch->chan
is cleared. A connect already in progress completes before unregistering
disconnects the channel; a later connect waits until pch->chan is NULL and
is rejected by the existing check in ppp_connect_channel().

This preserves the disconnect-before-null ordering needed by the transmit
path. The change adds no locking to the packet fast path.

Fixes: 6a196e83a1a7 ("ppp: disconnect channel before nullifying pch->chan")
Reported-by: syzbot+6b18da3ef22e33061add@syzkaller.appspotmail.com
Closes: https://syzbot.org/bug?extid=6b18da3ef22e33061add
Co-developed-by: Jinning Zhang <25031212117@stu.xidian.edu.cn>
Signed-off-by: Jinning Zhang <25031212117@stu.xidian.edu.cn>
Co-developed-by: Bin Yu <byu@xidian.edu.cn>
Signed-off-by: Bin Yu <byu@xidian.edu.cn>
Signed-off-by: Haoli Zhang <26031212468@stu.xidian.edu.cn>

---

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -175,7 +175,7 @@
 	struct ppp_file	file;		/* stuff for read/write/poll */
 	struct list_head list;		/* link in all/new_channels list */
 	struct ppp_channel *chan;	/* public channel data structure */
-	struct mutex chan_sem;		/* protects `chan' during chan ioctl */
+	struct mutex chan_sem;		/* protects chan ioctl; serializes connect/unregister */
 	spinlock_t	downl;		/* protects `chan', file.xq dequeue */
 	struct ppp __rcu *ppp;		/* ppp unit we're connected to */
 	struct net	*chan_net;	/* the net channel belongs to */
@@ -755,7 +755,9 @@
 		case PPPIOCCONNECT:
 			if (get_user(unit, p))
 				break;
+			mutex_lock(&pch->chan_sem);
 			err = ppp_connect_channel(pch, unit);
+			mutex_unlock(&pch->chan_sem);
 			break;
 
 		case PPPIOCDISCONN:
@@ -3093,11 +3095,14 @@
 	chan->ppp = NULL;
 
 	/*
+	 * Prevent PPPIOCCONNECT from reattaching the channel during removal.
+	 */
+	mutex_lock(&pch->chan_sem);
+	/*
 	 * This ensures that we have returned from any calls into
 	 * the channel's start_xmit or ioctl routine before we proceed.
 	 */
 	ppp_disconnect_channel(pch);
-	mutex_lock(&pch->chan_sem);
 	spin_lock_bh(&pch->downl);
 	pch->chan = NULL;
 	spin_unlock_bh(&pch->downl);

