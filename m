From: David Miller <davem@davemloft.net>
Date: Thu, 05 Dec 2019 22:45:40 +0000
Subject: Re: [PATCH] ppp: fix out-of-bounds access in bpf_prog_create()
Message-Id: <20191205.144540.791142390544922677.davem@davemloft.net>
List-Id: <linux-ppp.vger.kernel.org>
References: <20191205052220.GC1158@sol.localdomain>
        <20191205055419.13435-1-ebiggers@kernel.org>
In-Reply-To: <20191205055419.13435-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ebiggers@kernel.org
Cc: arnd@arndb.de, viro@zeniv.linux.org.uk, paulus@samba.org, bpf@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-ppp@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, syzbot+eb853b51b10f1befa0b7@syzkaller.appspotmail.com, syzkaller-bugs@googlegroups.com

From: Eric Biggers <ebiggers@kernel.org>
Date: Wed,  4 Dec 2019 21:54:19 -0800

> From: Eric Biggers <ebiggers@google.com>
> 
> sock_fprog_kern::len is in units of struct sock_filter, not bytes.
> 
> Fixes: 3e859adf3643 ("compat_ioctl: unify copy-in of ppp filters")
> Reported-by: syzbot+eb853b51b10f1befa0b7@syzkaller.appspotmail.com
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Applied, thank you.
