From: Guillaume Nault <gnault@redhat.com>
Date: Tue, 17 Sep 2019 22:40:12 +0000
Subject: Re: [PATCH] ppp: Fix memory leak in ppp_write
Message-Id: <20190917224012.GA10899@linux.home>
List-Id: <linux-ppp.vger.kernel.org>
References: <20190914040958.GA2363@DESKTOP>
In-Reply-To: <20190914040958.GA2363@DESKTOP>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Sat, Sep 14, 2019 at 01:09:58PM +0900, Takeshi Misawa wrote:
> When ppp is closing, __ppp_xmit_process() failed to enqueue skb
> and skb allocated in ppp_write() is leaked.
> 
> syzbot reported :
> BUG: memory leak
> unreferenced object 0xffff88812a17bc00 (size 224):
>   comm "syz-executor673", pid 6952, jiffies 4294942888 (age 13.040s)
>   hex dump (first 32 bytes):
>     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>   backtrace:
>     [<00000000d110fff9>] kmemleak_alloc_recursive include/linux/kmemleak.h:43 [inline]
>     [<00000000d110fff9>] slab_post_alloc_hook mm/slab.h:522 [inline]
>     [<00000000d110fff9>] slab_alloc_node mm/slab.c:3262 [inline]
>     [<00000000d110fff9>] kmem_cache_alloc_node+0x163/0x2f0 mm/slab.c:3574
>     [<000000002d616113>] __alloc_skb+0x6e/0x210 net/core/skbuff.c:197
>     [<000000000167fc45>] alloc_skb include/linux/skbuff.h:1055 [inline]
>     [<000000000167fc45>] ppp_write+0x48/0x120 drivers/net/ppp/ppp_generic.c:502
>     [<000000009ab42c0b>] __vfs_write+0x43/0xa0 fs/read_write.c:494
>     [<00000000086b2e22>] vfs_write fs/read_write.c:558 [inline]
>     [<00000000086b2e22>] vfs_write+0xee/0x210 fs/read_write.c:542
>     [<00000000a2b70ef9>] ksys_write+0x7c/0x130 fs/read_write.c:611
>     [<00000000ce5e0fdd>] __do_sys_write fs/read_write.c:623 [inline]
>     [<00000000ce5e0fdd>] __se_sys_write fs/read_write.c:620 [inline]
>     [<00000000ce5e0fdd>] __x64_sys_write+0x1e/0x30 fs/read_write.c:620
>     [<00000000d9d7b370>] do_syscall_64+0x76/0x1a0 arch/x86/entry/common.c:296
>     [<0000000006e6d506>] entry_SYSCALL_64_after_hwframe+0x44/0xa9
> 
> Fix this by freeing skb, if ppp is closing.
> 
> Reported-and-tested-by: syzbot+d9c8bf24e56416d7ce2c@syzkaller.appspotmail.com
> Signed-off-by: Takeshi Misawa <jeliantsurux@gmail.com>
> ---
> Dear Paul Mackerras
> 
> syzbot reported memory leak in net/ppp.
> [TITLE] memory leak in ppp_write
> 
> I send a patch that passed syzbot reproducer test. 
> Please consider this memory leak and patch.
> 
Hi Takeshi,

Kernel networking patches are reviewed on netdev ML. Your patch looks
good but the description misses a Fixes tag:

Fixes: 6d066734e9f0 ("ppp: avoid loop in xmit recursion detection code")

Can you please send this patch formally to netdev? Don't forget to
indicate which tree you're tagetting in the subject. In this case, it
should be [PATCH net] (see Documentation/networking/netdev-FAQ.rst for
details).

Thanks for fixing my bug :)

Guillaume
