From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 05 Dec 2019 09:08:45 +0000
Subject: Re: KASAN: slab-out-of-bounds Read in bpf_prog_create
Message-Id: <CAK8P3a3XLzm+zGmADUR3VYi4NziY-Aox7a8QG6VcGYQcAJiGnQ@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <000000000000cacc7e0592c42ce3@google.com> <20190928031510.GD1079@sol.localdomain>
 <20191205052220.GC1158@sol.localdomain>
In-Reply-To: <20191205052220.GC1158@sol.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Biggers <ebiggers@kernel.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>, syzbot <syzbot+eb853b51b10f1befa0b7@syzkaller.appspotmail.com>, Alexei Starovoitov <ast@kernel.org>, bpf@vger.kernel.org, Daniel Borkmann <daniel@iogearbox.net>, David Miller <davem@davemloft.net>, Jesper Dangaard Brouer <hawk@kernel.org>, Jakub Kicinski <jakub.kicinski@netronome.com>, John Fastabend <john.fastabend@gmail.com>, Martin KaFai Lau <kafai@fb.com>, Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-ppp@vger.kernel.org, Networking <netdev@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, Song Liu <songliubraving@fb.com>, syzkaller-bugs <syzkaller-bugs@googlegroups.com>, Yonghong Song <yhs@fb.com>

On Thu, Dec 5, 2019 at 6:22 AM Eric Biggers <ebiggers@kernel.org> wrote:

> >
>
> Why did you ignore this and merge the buggy commit to mainline anyway?
> I even told you how to fix it...

I'm sorry about this, I completely missed the email about it originally.

      Arnd
