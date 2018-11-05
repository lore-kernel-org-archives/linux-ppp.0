From: Guillaume Nault <g.nault@alphalink.fr>
Date: Mon, 05 Nov 2018 16:31:18 +0000
Subject: Re: UBSAN: Undefined behaviour in drivers/net/ppp/ppp_generic.c
Message-Id: <20181105163118.GA1476@alphalink.fr>
List-Id: <linux-ppp.vger.kernel.org>
References: <CAEAjamurFhLE7QOq596Kue8oy-MXeju_68bwn7_Byqi6r2yoUA@mail.gmail.com>
In-Reply-To: <CAEAjamurFhLE7QOq596Kue8oy-MXeju_68bwn7_Byqi6r2yoUA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kyungtae Kim <kt0755@gmail.com>
Cc: paulus@samba.org, davem@davemloft.net, Byoungyoung Lee <lifeasageek@gmail.com>, DaeRyong Jeong <threeearcat@gmail.com>, syzkaller@googlegroups.com, netdev@vger.kernel.org, linux-ppp@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Oct 31, 2018 at 06:46:16AM -0400, Kyungtae Kim wrote:
> We report a crash in v4.19-rc2 (and the latest kernel as well):
> 
> kernel config: https://kt0755.github.io/etc/config_v2-4.19
> repro: https://kt0755.github.io/etc/repro.1e3e9.c
> 
> unit_set() lacks the bounds checking for an integer variable n,
> which causes integer overflow when it is equal to INT_MAX.
> 
idr_alloc() does revert the overflowed n+1 to INT_MAX, so everything
works as expected in practive. But sure, the code, as it is, looks
wrong.

> ===========================> UBSAN: Undefined behaviour in drivers/net/ppp/ppp_generic.c:3246:9
> signed integer overflow:
> 2147483647 + 1 cannot be represented in type 'int'
> CPU: 0 PID: 7676 Comm: syz-executor4 Not tainted 4.19.0-rc2 #1
> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS Bochs 01/01/2011
> Call Trace:
>  __dump_stack lib/dump_stack.c:77 [inline]
>  dump_stack+0xd2/0x148 lib/dump_stack.c:113
>  ubsan_epilogue+0x12/0x94 lib/ubsan.c:159
>  handle_overflow+0x1cf/0x21a lib/ubsan.c:190
>  __ubsan_handle_add_overflow+0x2a/0x31 lib/ubsan.c:198
>  unit_set drivers/net/ppp/ppp_generic.c:3246 [inline]
>  ppp_unit_register drivers/net/ppp/ppp_generic.c:979 [inline]
>  ppp_dev_configure+0xbd8/0xd50 drivers/net/ppp/ppp_generic.c:1049
>  ppp_create_interface drivers/net/ppp/ppp_generic.c:3013 [inline]
>  ppp_unattached_ioctl drivers/net/ppp/ppp_generic.c:848 [inline]
>  ppp_ioctl+0x1652/0x27f0 drivers/net/ppp/ppp_generic.c:601
>  vfs_ioctl fs/ioctl.c:46 [inline]
>  do_vfs_ioctl+0x1c0/0x1150 fs/ioctl.c:687
>  ksys_ioctl+0x9e/0xb0 fs/ioctl.c:702
>  __do_sys_ioctl fs/ioctl.c:709 [inline]
>  __se_sys_ioctl fs/ioctl.c:707 [inline]
>  __x64_sys_ioctl+0x7e/0xc0 fs/ioctl.c:707
>  do_syscall_64+0xc4/0x510 arch/x86/entry/common.c:290
>  entry_SYSCALL_64_after_hwframe+0x49/0xbe
> RIP: 0033:0x4497b9
> Code: e8 8c 9f 02 00 48 83 c4 18 c3 0f 1f 80 00 00 00 00 48 89 f8 48
> 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d
> 01 f0 ff ff 0f 83 9b 6b fc ff c3 66 2e 0f 1f 84 00 00 00 00
> RSP: 002b:00007f67b6f92c68 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> RAX: ffffffffffffffda RBX: 00007f67b6f936cc RCX: 00000000004497b9
> RDX: 0000000020000080 RSI: 00000000c004743e RDI: 0000000000000013
> RBP: 000000000071bea0 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 00000000ffffffff
> R13: 0000000000005598 R14: 00000000006ed638 R15: 00007f67b6f93700
> ===========================
> 
> A simple patch below is provided.
> Note that in this control flow, negative n is already
> filtered out (drivers/net/ppp/ppp_generic.c:965).
> 
> --- a/drivers/net/ppp/ppp_generic.c
> +++ b/drivers/net/ppp/ppp_generic.c
> @@ -3243,6 +3243,9 @@ static int unit_set(struct idr *p, void *ptr, int n)
>  {
>         int unit;
> 
> +  if (n = INT_MAX)
> +               return -EINVAL;
> +
>         unit = idr_alloc(p, ptr, n, n + 1, GFP_KERNEL);
>         if (unit = -ENOSPC)
>                 unit = -EINVAL;
> 
What about using idr_alloc_u32() instead? This way we could safely
continue to accept INT_MAX, without relying on idr_alloc() internal
safeguards.
