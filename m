From: Takeshi Misawa <jeliantsurux@gmail.com>
Date: Thu, 12 Sep 2019 13:34:02 +0000
Subject: Re: memory leak in ppp_write
Message-Id: <CAKK_rchVQCYmjPSxk9MszV9BtF8y04-j2dpjV0Jg3c+nrRNEWQ@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="6WlEvdN9Dv0WHSBl"
List-Id: <linux-ppp.vger.kernel.org>
References: <000000000000edc1d5058f5dfa5f@google.com>
 <000000000000594c700591433550@google.com>
In-Reply-To: <000000000000594c700591433550@google.com>
To: syzbot <syzbot+d9c8bf24e56416d7ce2c@syzkaller.appspotmail.com>
Cc: ast@kernel.org, bpf@vger.kernel.org, daniel@iogearbox.net, davem@davemloft.net, kafai@fb.com, linux-kernel@vger.kernel.org, linux-ppp@vger.kernel.org, netdev@vger.kernel.org, paulus@samba.org, songliubraving@fb.com, syzkaller-bugs@googlegroups.com, yhs@fb.com


--6WlEvdN9Dv0WHSBl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

#syz test: https://github.com/google/kasan.git 6525771f


--6WlEvdN9Dv0WHSBl
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="0001-ppp-Fix-memory-leak-in-ppp_write.patch"

From e4ff0d04a4b8dd6da3dfb9135235ae5360ce86e6 Mon Sep 17 00:00:00 2001
From: Takeshi Misawa <jeliantsurux@gmail.com>
Date: Wed, 11 Sep 2019 22:18:43 +0900
Subject: [PATCH] ppp: Fix memory leak in ppp_write

When ppp is closing, __ppp_xmit_process() failed to enqueue skb
and skb allocated in ppp_write() is leaked.

syzbot reported :
BUG: memory leak
unreferenced object 0xffff88812a17bc00 (size 224):
  comm "syz-executor673", pid 6952, jiffies 4294942888 (age 13.040s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<00000000d110fff9>] kmemleak_alloc_recursive include/linux/kmemleak.h:43 [inline]
    [<00000000d110fff9>] slab_post_alloc_hook mm/slab.h:522 [inline]
    [<00000000d110fff9>] slab_alloc_node mm/slab.c:3262 [inline]
    [<00000000d110fff9>] kmem_cache_alloc_node+0x163/0x2f0 mm/slab.c:3574
    [<000000002d616113>] __alloc_skb+0x6e/0x210 net/core/skbuff.c:197
    [<000000000167fc45>] alloc_skb include/linux/skbuff.h:1055 [inline]
    [<000000000167fc45>] ppp_write+0x48/0x120 drivers/net/ppp/ppp_generic.c:502
    [<000000009ab42c0b>] __vfs_write+0x43/0xa0 fs/read_write.c:494
    [<00000000086b2e22>] vfs_write fs/read_write.c:558 [inline]
    [<00000000086b2e22>] vfs_write+0xee/0x210 fs/read_write.c:542
    [<00000000a2b70ef9>] ksys_write+0x7c/0x130 fs/read_write.c:611
    [<00000000ce5e0fdd>] __do_sys_write fs/read_write.c:623 [inline]
    [<00000000ce5e0fdd>] __se_sys_write fs/read_write.c:620 [inline]
    [<00000000ce5e0fdd>] __x64_sys_write+0x1e/0x30 fs/read_write.c:620
    [<00000000d9d7b370>] do_syscall_64+0x76/0x1a0 arch/x86/entry/common.c:296
    [<0000000006e6d506>] entry_SYSCALL_64_after_hwframe+0x44/0xa9

Fix this by freeing skb, if ppp is closing.

Reported-by: syzbot+d9c8bf24e56416d7ce2c@syzkaller.appspotmail.com
Signed-off-by: Takeshi Misawa <jeliantsurux@gmail.com>
---
 drivers/net/ppp/ppp_generic.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index a30e41a56085..9a1b006904a7 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -1415,6 +1415,8 @@ static void __ppp_xmit_process(struct ppp *ppp, struct sk_buff *skb)
 			netif_wake_queue(ppp->dev);
 		else
 			netif_stop_queue(ppp->dev);
+	} else {
+		kfree_skb(skb);
 	}
 	ppp_xmit_unlock(ppp);
 }
-- 
2.17.1


--6WlEvdN9Dv0WHSBl--
