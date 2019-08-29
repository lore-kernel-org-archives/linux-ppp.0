From: syzbot <syzbot+d9c8bf24e56416d7ce2c@syzkaller.appspotmail.com>
Date: Thu, 29 Aug 2019 15:32:07 +0000
Subject: Re: memory leak in ppp_write
Message-Id: <000000000000594c700591433550@google.com>
List-Id: <linux-ppp.vger.kernel.org>
In-Reply-To: <000000000000edc1d5058f5dfa5f@google.com>
References: <000000000000edc1d5058f5dfa5f@google.com>
In-Reply-To: <000000000000edc1d5058f5dfa5f@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: ast@kernel.org, bpf@vger.kernel.org, daniel@iogearbox.net, davem@davemloft.net, kafai@fb.com, linux-kernel@vger.kernel.org, linux-ppp@vger.kernel.org, netdev@vger.kernel.org, paulus@samba.org, songliubraving@fb.com, syzkaller-bugs@googlegroups.com, yhs@fb.com

syzbot has found a reproducer for the following crash on:

HEAD commit:    6525771f Merge tag 'arc-5.3-rc7' of git://git.kernel.org/p..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16dc12a2600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=E6131eafb9408877
dashboard link: https://syzkaller.appspot.com/bug?extid=D9c8bf24e56416d7ce2c
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=116942de600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1179c582600000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+d9c8bf24e56416d7ce2c@syzkaller.appspotmail.com

executing program
executing program
executing program
executing program
BUG: memory leak
unreferenced object 0xffff88812a17bc00 (size 224):
   comm "syz-executor673", pid 6952, jiffies 4294942888 (age 13.040s)
   hex dump (first 32 bytes):
     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
   backtrace:
     [<00000000d110fff9>] kmemleak_alloc_recursive =20
include/linux/kmemleak.h:43 [inline]
     [<00000000d110fff9>] slab_post_alloc_hook mm/slab.h:522 [inline]
     [<00000000d110fff9>] slab_alloc_node mm/slab.c:3262 [inline]
     [<00000000d110fff9>] kmem_cache_alloc_node+0x163/0x2f0 mm/slab.c:3574
     [<000000002d616113>] __alloc_skb+0x6e/0x210 net/core/skbuff.c:197
     [<000000000167fc45>] alloc_skb include/linux/skbuff.h:1055 [inline]
     [<000000000167fc45>] ppp_write+0x48/0x120 =20
drivers/net/ppp/ppp_generic.c:502
     [<000000009ab42c0b>] __vfs_write+0x43/0xa0 fs/read_write.c:494
     [<00000000086b2e22>] vfs_write fs/read_write.c:558 [inline]
     [<00000000086b2e22>] vfs_write+0xee/0x210 fs/read_write.c:542
     [<00000000a2b70ef9>] ksys_write+0x7c/0x130 fs/read_write.c:611
     [<00000000ce5e0fdd>] __do_sys_write fs/read_write.c:623 [inline]
     [<00000000ce5e0fdd>] __se_sys_write fs/read_write.c:620 [inline]
     [<00000000ce5e0fdd>] __x64_sys_write+0x1e/0x30 fs/read_write.c:620
     [<00000000d9d7b370>] do_syscall_64+0x76/0x1a0 =20
arch/x86/entry/common.c:296
     [<0000000006e6d506>] entry_SYSCALL_64_after_hwframe+0x44/0xa9

BUG: memory leak
unreferenced object 0xffff888121203900 (size 224):
   comm "syz-executor673", pid 6965, jiffies 4294943430 (age 7.620s)
   hex dump (first 32 bytes):
     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
   backtrace:
     [<00000000d110fff9>] kmemleak_alloc_recursive =20
include/linux/kmemleak.h:43 [inline]
     [<00000000d110fff9>] slab_post_alloc_hook mm/slab.h:522 [inline]
     [<00000000d110fff9>] slab_alloc_node mm/slab.c:3262 [inline]
     [<00000000d110fff9>] kmem_cache_alloc_node+0x163/0x2f0 mm/slab.c:3574
     [<000000002d616113>] __alloc_skb+0x6e/0x210 net/core/skbuff.c:197
     [<000000000167fc45>] alloc_skb include/linux/skbuff.h:1055 [inline]
     [<000000000167fc45>] ppp_write+0x48/0x120 =20
drivers/net/ppp/ppp_generic.c:502
     [<000000009ab42c0b>] __vfs_write+0x43/0xa0 fs/read_write.c:494
     [<00000000086b2e22>] vfs_write fs/read_write.c:558 [inline]
     [<00000000086b2e22>] vfs_write+0xee/0x210 fs/read_write.c:542
     [<00000000a2b70ef9>] ksys_write+0x7c/0x130 fs/read_write.c:611
     [<00000000ce5e0fdd>] __do_sys_write fs/read_write.c:623 [inline]
     [<00000000ce5e0fdd>] __se_sys_write fs/read_write.c:620 [inline]
     [<00000000ce5e0fdd>] __x64_sys_write+0x1e/0x30 fs/read_write.c:620
     [<00000000d9d7b370>] do_syscall_64+0x76/0x1a0 =20
arch/x86/entry/common.c:296
     [<0000000006e6d506>] entry_SYSCALL_64_after_hwframe+0x44/0xa9

BUG: memory leak
unreferenced object 0xffff88811d0cf800 (size 512):
   comm "syz-executor673", pid 6965, jiffies 4294943430 (age 7.620s)
   hex dump (first 32 bytes):
     06 00 00 00 05 00 00 00 40 00 00 00 00 00 00 00  ........@.......
     40 00 40 00 00 00 00 00 40 00 40 00 00 00 00 00  @.@.....@.@.....
   backtrace:
     [<00000000b9629d4c>] kmemleak_alloc_recursive =20
include/linux/kmemleak.h:43 [inline]
     [<00000000b9629d4c>] slab_post_alloc_hook mm/slab.h:522 [inline]
     [<00000000b9629d4c>] slab_alloc_node mm/slab.c:3262 [inline]
     [<00000000b9629d4c>] kmem_cache_alloc_node_trace+0x161/0x2f0 =20
mm/slab.c:3592
     [<00000000a9b92035>] __do_kmalloc_node mm/slab.c:3614 [inline]
     [<00000000a9b92035>] __kmalloc_node_track_caller+0x38/0x50 =20
mm/slab.c:3629
     [<00000000fad050db>] __kmalloc_reserve.isra.0+0x40/0xb0 =20
net/core/skbuff.c:141
     [<00000000a1025904>] __alloc_skb+0xa0/0x210 net/core/skbuff.c:209
     [<000000000167fc45>] alloc_skb include/linux/skbuff.h:1055 [inline]
     [<000000000167fc45>] ppp_write+0x48/0x120 =20
drivers/net/ppp/ppp_generic.c:502
     [<000000009ab42c0b>] __vfs_write+0x43/0xa0 fs/read_write.c:494
     [<00000000086b2e22>] vfs_write fs/read_write.c:558 [inline]
     [<00000000086b2e22>] vfs_write+0xee/0x210 fs/read_write.c:542
     [<00000000a2b70ef9>] ksys_write+0x7c/0x130 fs/read_write.c:611
     [<00000000ce5e0fdd>] __do_sys_write fs/read_write.c:623 [inline]
     [<00000000ce5e0fdd>] __se_sys_write fs/read_write.c:620 [inline]
     [<00000000ce5e0fdd>] __x64_sys_write+0x1e/0x30 fs/read_write.c:620
     [<00000000d9d7b370>] do_syscall_64+0x76/0x1a0 =20
arch/x86/entry/common.c:296
     [<0000000006e6d506>] entry_SYSCALL_64_after_hwframe+0x44/0xa9

