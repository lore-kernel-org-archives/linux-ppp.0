From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 05 Dec 2019 09:07:37 +0000
Subject: Re: [PATCH] ppp: fix out-of-bounds access in bpf_prog_create()
Message-Id: <CAK8P3a2Fka2tuCnYAsSM8DHVzV9Zpvj_J7rkGg6zgWLEsU3KAw@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20191205052220.GC1158@sol.localdomain> <20191205055419.13435-1-ebiggers@kernel.org>
In-Reply-To: <20191205055419.13435-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Biggers <ebiggers@kernel.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Paul Mackerras <paulus@samba.org>, bpf@vger.kernel.org, Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>, linux-ppp@vger.kernel.org, Networking <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, syzbot <syzbot+eb853b51b10f1befa0b7@syzkaller.appspotmail.com>, syzkaller-bugs <syzkaller-bugs@googlegroups.com>

On Thu, Dec 5, 2019 at 6:55 AM Eric Biggers <ebiggers@kernel.org> wrote:
>
> From: Eric Biggers <ebiggers@google.com>
>
> sock_fprog_kern::len is in units of struct sock_filter, not bytes.
>
> Fixes: 3e859adf3643 ("compat_ioctl: unify copy-in of ppp filters")
> Reported-by: syzbot+eb853b51b10f1befa0b7@syzkaller.appspotmail.com
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

Thanks for fixing the bug I introduced!
