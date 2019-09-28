From: Eric Biggers <ebiggers@kernel.org>
Date: Sat, 28 Sep 2019 03:15:10 +0000
Subject: Re: KASAN: slab-out-of-bounds Read in bpf_prog_create
Message-Id: <20190928031510.GD1079@sol.localdomain>
List-Id: <linux-ppp.vger.kernel.org>
References: <000000000000cacc7e0592c42ce3@google.com>
In-Reply-To: <000000000000cacc7e0592c42ce3@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Arnd Bergmann <arnd@arndb.de>, Al Viro <viro@zeniv.linux.org.uk>
Cc: syzbot <syzbot+eb853b51b10f1befa0b7@syzkaller.appspotmail.com>, ast@kernel.org, bpf@vger.kernel.org, daniel@iogearbox.net, davem@davemloft.net, hawk@kernel.org, jakub.kicinski@netronome.com, john.fastabend@gmail.com, kafai@fb.com, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, linux-ppp@vger.kernel.org, netdev@vger.kernel.org, paulus@samba.org, songliubraving@fb.com, syzkaller-bugs@googlegroups.com, yhs@fb.com

Arnd and Al,

On Tue, Sep 17, 2019 at 11:49:06AM -0700, syzbot wrote:
> Hello,
>=20
> syzbot found the following crash on:
>=20
> HEAD commit:    2015a28f Add linux-next specific files for 20190915
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=11880d69600000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=110691c2286b679a
> dashboard link: https://syzkaller.appspot.com/bug?extid=EB853b51b10f1befa=
0b7
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=127c3481600000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1150a70d600000
>=20
> The bug was bisected to:
>=20
> commit 2f4fa2db75e26995709043c8d3de4632ebed5c4b
> Author: Al Viro <viro@zeniv.linux.org.uk>
> Date:   Thu Apr 18 03:48:01 2019 +0000
>=20
>     compat_ioctl: unify copy-in of ppp filters
>=20
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=145eee1d6000=
00
> final crash:    https://syzkaller.appspot.com/x/report.txt?x=165eee1d6000=
00
> console output: https://syzkaller.appspot.com/x/log.txt?x=125eee1d600000
>=20
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+eb853b51b10f1befa0b7@syzkaller.appspotmail.com
> Fixes: 2f4fa2db75e2 ("compat_ioctl: unify copy-in of ppp filters")
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> BUG: KASAN: slab-out-of-bounds in memcpy include/linux/string.h:404 [inli=
ne]
> BUG: KASAN: slab-out-of-bounds in bpf_prog_create+0xe9/0x250
> net/core/filter.c:1351
> Read of size 32768 at addr ffff88809cf74000 by task syz-executor183/8575
>=20
> CPU: 0 PID: 8575 Comm: syz-executor183 Not tainted 5.3.0-rc8-next-20190915
> #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
> Google 01/01/2011
> Call Trace:
>  __dump_stack lib/dump_stack.c:77 [inline]
>  dump_stack+0x172/0x1f0 lib/dump_stack.c:113
>  print_address_description.constprop.0.cold+0xd4/0x30b mm/kasan/report.c:=
374
>  __kasan_report.cold+0x1b/0x41 mm/kasan/report.c:506
>  kasan_report+0x12/0x20 mm/kasan/common.c:634
>  check_memory_region_inline mm/kasan/generic.c:185 [inline]
>  check_memory_region+0x134/0x1a0 mm/kasan/generic.c:192
>  memcpy+0x24/0x50 mm/kasan/common.c:122
>  memcpy include/linux/string.h:404 [inline]
>  bpf_prog_create+0xe9/0x250 net/core/filter.c:1351
>  get_filter.isra.0+0x108/0x1a0 drivers/net/ppp/ppp_generic.c:572
>  ppp_get_filter drivers/net/ppp/ppp_generic.c:584 [inline]
>  ppp_ioctl+0x129d/0x2590 drivers/net/ppp/ppp_generic.c:801

This is a correct bisection.  This commit needs:

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index 267fe2c58087..f55d7937d6c5 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -564,8 +564,9 @@ static struct bpf_prog *get_filter(struct sock_fprog *u=
prog)
 		return NULL;
=20
 	/* uprog->len is unsigned short, so no overflow here */
-	fprog.len =3D uprog->len * sizeof(struct sock_filter);
-	fprog.filter =3D memdup_user(uprog->filter, fprog.len);
+	fprog.len =3D uprog->len;
+	fprog.filter =3D memdup_user(uprog->filter,
+				   uprog->len * sizeof(struct sock_filter));
 	if (IS_ERR(fprog.filter))
 		return ERR_CAST(fprog.filter);
=20
