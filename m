Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.243.164.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795077845;
	b=bCfzAUb/VMUPyTlI8zdTbdu90N3PR66gDwuyLHweg1o+a1/uVQdxDS7HV67pp3QDay/Z
	 1vSQOSL50K29784V50WYO/qpzeXqLQN7Q030TflVeYnrDgJAVwzBgby4dM4jg3dOczA9V
	 0qrZDXuWSOPWvR1H7hjjqpEsdKYKrNc6szvOZKmk2UnuKTNFTyK/77lF7Rkk8keZhLBhY
	 VOuEnEegCfaEfgP+wrTJL9p/jhzGCHx/KqKKWDYve6t9lTCq/eh32iUfswl8YDscny+Df
	 jqC2tNUcoBMpjOWpHQx2NI22wvAlXU7m2oT8kqHXmgyeKDjGs1CCGkJHeyJxZalK52Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795077845;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=pzztXHndeQHLiVkmdK1//Tm9Egu7ImCBXiOVNLsJo1g=;
	b=SxbFTjeM9LKbzY013rhq4F0fwO2B1n8IikMf6j75MM6gqd+wN1er8yeH9gJe9f1AXokM
	 Nbq1W7m6pkmfV/QGpYad4X/HZLfAyeaVmWnaxbvXIj/yNfV1Nv5yqLYLdODhPfaV1O1zK
	 wbYVsVd9VMPuMUOFLabGsQf8/W2bHO+R6X1UT8mSN9dWL0eISrSR0xvep6ID/N/u3UbB1
	 1nFn9VJg1LlV2KZ86UtjkLyomzNzYQv1A5MXwBbYgD2q9jqiAUGQYUGFUlE6lEa+m/ywj
	 RmKn+HRIOT7iVdzKoWPyabjwaMvcU/1T30VS3FHAyCCLzVDyiGx+qgPIQKPrYJvqtFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=stu.xidian.edu.cn;
	spf=pass smtp.mailfrom=stu.xidian.edu.cn;
	arc=none smtp.remote-ip=162.243.164.118
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 893B8606A320;
	Thu, 19 Nov 2026 08:44:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 893B8606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=stu.xidian.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stu.xidian.edu.cn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=stu.xidian.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-Id:MIME-Version:Content-Transfer-Encoding; bh=pzztXHndeQ
	HLiVkmdK1//Tm9Egu7ImCBXiOVNLsJo1g=; b=PWaeQtNstd6SqWgfVoijRTOivM
	dNwwjcEJJB2xh9bjw7wDbeFOC+pgNUZKIFCPle2+TPn6oDCZQEeJ1k9ZpN19OezO
	yvtPzpXvqW5z0vdBAtdLMVYMcbS8rkGkKdmlvz9mIZvPkh/UuOsLXxaEMb0S5opw
	qKIRoaGzqTtgQA03c=
Received: from LAPTOP-FRMFRHCN.localdomain (unknown [2408:8670:ae1:0:ec52:1f40:2f6a:587a])
	by hzbj-edu-front-3.icoremail.net (Coremail) with UTF8SMTPA id BbQMCkDGy_64tv5qzKbfAQ--.42994S2;
	Thu, 19 Nov 2026 16:43:38 +0800 (CST)
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
	25031212117@stu.xidian.edu.cn,
	byu@xidian.edu.cn
Subject: [PATCH net v2] ppp: serialize channel operations with unregister
Date: Thu, 19 Nov 2026 16:43:33 +0800
Message-Id: <20261119084333.371234-1-26031212468@stu.xidian.edu.cn>
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
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:BbQMCkDGy_64tv5qzKbfAQ--.42994S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Jw4xJw4UZr18AFy5CFWkXrb_yoWxZryDpF
	W5KrWDtrWjqFZYqay8G3WUXrW3AFnrWayjyr98t3sYk348Wrnakr45ta4j9F15C397CrW0
	yw4aqr9xua4UJ3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBa14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
	1j6F4UJwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
	FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr
	0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8v
	x2IErcIFxwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20x
	vY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I
	3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIx
	AIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAI
	cVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2js
	IEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUQvtAUUUUU=
X-CM-SenderInfo: yswqjiasrskluy6v33wo0lvxldqovvfxof0/1tbiAgUCEWr9wcm4rwAAsc

The channel unregister path disconnects a channel before clearing
pch->chan. A concurrent PPPIOCCONNECT can observe pch->ppp as NULL while
pch->chan is still valid and attach the channel again. Unregister can
then clear pch->chan and release the channel while its clist remains
linked to a PPP unit.

Serialize PPPIOCCONNECT with unregister using chan_sem. Hold the mutex
from before disconnecting the channel until it has been removed from the
channel list and marked dead. An in-flight connect completes before
unregister disconnects the channel; later connects see the cleared
channel and fail.

PPPIOCDISCONN must use the same mutex. An in-progress PPPIOCDISCONN can
clear pch->ppp before it has removed pch->clist and completed
synchronize_net(). Without the mutex, unregister can see pch->ppp as NULL
and proceed before that disconnect has finished unlinking the channel and
waiting for network readers. Taking chan_sem in both paths makes
unregister wait for the disconnect to finish before clearing pch->chan.

Bridge establishment must also be serialized with unregistering either
endpoint. Hold both channels' chan_sem mutexes in a stable order while
establishing the bridge, and reject channels that have been marked dead.
Unregister holds its channel mutex through unbridging and marking the
channel dead, so bridge establishment cannot pass the teardown step and
leave a new bridge reference behind.

The transmit fast path is unchanged. chan_sem drains channel ioctl
callbacks. ppp_disconnect_channel() removes the channel from the PPP unit
and waits for network readers before unregister clears pch->chan.

Fixes: 6a196e83a1a7 ("ppp: disconnect channel before nullifying pch->chan")
Reported-by: syzbot+6b18da3ef22e33061add@syzkaller.appspotmail.com
Closes: https://syzbot.org/bug?extid=6b18da3ef22e33061add
Co-developed-by: Jinning Zhang <25031212117@stu.xidian.edu.cn>
Signed-off-by: Jinning Zhang <25031212117@stu.xidian.edu.cn>
Co-developed-by: Bin Yu <byu@xidian.edu.cn>
Signed-off-by: Bin Yu <byu@xidian.edu.cn>
Signed-off-by: Haoli Zhang <26031212468@stu.xidian.edu.cn>
---
Changes in v2:
- Serialize PPPIOCDISCONN with channel unregister.
- Serialize bridge establishment with unregistering either endpoint.
- Clarify the chan_sem comment and bridge lock ordering.

 drivers/net/ppp/ppp_generic.c | 55 ++++++++++++++++------
 1 file changed, 40 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index 1a610a1..7b0bcac 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -174,7 +174,7 @@ struct channel {
 	struct ppp_file	file;		/* stuff for read/write/poll */
 	struct list_head list;		/* link in all/new_channels list */
 	struct ppp_channel *chan;	/* public channel data structure */
-	struct mutex chan_sem;		/* protects `chan' during chan ioctl */
+	struct mutex chan_sem;		/* protects chan in ioctls; serializes with unregister */
 	spinlock_t	downl;		/* protects `chan', file.xq dequeue */
 	struct ppp __rcu *ppp;		/* ppp unit we're connected to */
 	struct net	*chan_net;	/* the net channel belongs to */
@@ -639,11 +639,30 @@ static struct bpf_prog *compat_ppp_get_filter(struct sock_fprog32 __user *p)
  */
 static int ppp_bridge_channels(struct channel *pch, struct channel *pchb)
 {
+	struct channel *first, *second, *bridge;
+	bool pch_first;
+	int ret = -EALREADY;
+
+	if (pch == pchb)
+		return -EALREADY;
+
+	/* Use a stable order to avoid deadlock with reverse bridge requests. */
+	pch_first = (unsigned long)pch < (unsigned long)pchb;
+	first = pch_first ? pch : pchb;
+	second = pch_first ? pchb : pch;
+	mutex_lock(&first->chan_sem);
+	mutex_lock_nested(&second->chan_sem, SINGLE_DEPTH_NESTING);
+
+	if (first->file.dead || second->file.dead) {
+		ret = -ENODEV;
+		goto out_unlock;
+	}
+
 	spin_lock(&pch->upl);
 	if (rcu_dereference_protected(pch->ppp, lockdep_is_held(&pch->upl)) ||
 	    rcu_dereference_protected(pch->bridge, lockdep_is_held(&pch->upl))) {
 		spin_unlock(&pch->upl);
-		return -EALREADY;
+		goto out_unlock;
 	}
 	refcount_inc(&pchb->file.refcnt);
 	rcu_assign_pointer(pch->bridge, pchb);
@@ -659,20 +678,22 @@ static int ppp_bridge_channels(struct channel *pch, struct channel *pchb)
 	rcu_assign_pointer(pchb->bridge, pch);
 	spin_unlock(&pchb->upl);
 
-	return 0;
-
+	ret = 0;
+	goto out_unlock;
 err_unset:
 	spin_lock(&pch->upl);
-	/* Re-read pch->bridge with upl held in case it was modified concurrently */
-	pchb = rcu_dereference_protected(pch->bridge, lockdep_is_held(&pch->upl));
+	bridge = rcu_dereference_protected(pch->bridge,
+					   lockdep_is_held(&pch->upl));
 	RCU_INIT_POINTER(pch->bridge, NULL);
 	spin_unlock(&pch->upl);
 	synchronize_rcu();
 
-	if (pchb)
-		ppp_release_channel(pchb);
-
-	return -EALREADY;
+	if (bridge)
+		ppp_release_channel(bridge);
+out_unlock:
+	mutex_unlock(&second->chan_sem);
+	mutex_unlock(&first->chan_sem);
+	return ret;
 }
 
 static int ppp_unbridge_channels(struct channel *pch)
@@ -754,11 +775,15 @@ static long ppp_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		case PPPIOCCONNECT:
 			if (get_user(unit, p))
 				break;
+			mutex_lock(&pch->chan_sem);
 			err = ppp_connect_channel(pch, unit);
+			mutex_unlock(&pch->chan_sem);
 			break;
 
 		case PPPIOCDISCONN:
+			mutex_lock(&pch->chan_sem);
 			err = ppp_disconnect_channel(pch);
+			mutex_unlock(&pch->chan_sem);
 			break;
 
 		case PPPIOCBRIDGECHAN:
@@ -782,7 +807,9 @@ static long ppp_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 			break;
 
 		case PPPIOCUNBRIDGECHAN:
+			mutex_lock(&pch->chan_sem);
 			err = ppp_unbridge_channels(pch);
+			mutex_unlock(&pch->chan_sem);
 			break;
 
 		default:
@@ -3000,17 +3027,15 @@ ppp_unregister_channel(struct ppp_channel *chan)
 		return;		/* should never happen */
 
 	chan->ppp = NULL;
-
+	mutex_lock(&pch->chan_sem);
 	/*
-	 * This ensures that we have returned from any calls into
-	 * the channel's start_xmit or ioctl routine before we proceed.
+	 * chan_sem waits for channel ioctl callbacks. Disconnect first;
+	 * ppp_disconnect_channel() waits for network readers after unlinking.
 	 */
 	ppp_disconnect_channel(pch);
-	mutex_lock(&pch->chan_sem);
 	spin_lock_bh(&pch->downl);
 	pch->chan = NULL;
 	spin_unlock_bh(&pch->downl);
-	mutex_unlock(&pch->chan_sem);
 
 	pn = ppp_pernet(pch->chan_net);
 	spin_lock_bh(&pn->all_channels_lock);
@@ -3021,6 +3046,7 @@ ppp_unregister_channel(struct ppp_channel *chan)
 
 	pch->file.dead = 1;
 	wake_up_interruptible(&pch->file.rwait);
+	mutex_unlock(&pch->chan_sem);
 
 	ppp_release_channel(pch);
 }

