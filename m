From: syzbot <syzbot+d9c8bf24e56416d7ce2c@syzkaller.appspotmail.com>
Date: Thu, 12 Sep 2019 15:17:01 +0000
Subject: Re: memory leak in ppp_write
Message-Id: <0000000000001f3a3a05925ca177@google.com>
List-Id: <linux-ppp.vger.kernel.org>
In-Reply-To: <CAKK_rchVQCYmjPSxk9MszV9BtF8y04-j2dpjV0Jg3c+nrRNEWQ@mail.gmail.com>
References: <000000000000edc1d5058f5dfa5f@google.com>
In-Reply-To: <000000000000edc1d5058f5dfa5f@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: ast@kernel.org, bpf@vger.kernel.org, daniel@iogearbox.net, davem@davemloft.net, jeliantsurux@gmail.com, kafai@fb.com, linux-kernel@vger.kernel.org, linux-ppp@vger.kernel.org, netdev@vger.kernel.org, paulus@samba.org, songliubraving@fb.com, syzkaller-bugs@googlegroups.com, yhs@fb.com

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger =20
crash:

Reported-and-tested-by: =20
syzbot+d9c8bf24e56416d7ce2c@syzkaller.appspotmail.com

Tested on:

commit:         6525771f Merge tag 'arc-5.3-rc7' of git://git.kernel.org/p..
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=E6131eafb9408877
dashboard link: https://syzkaller.appspot.com/bug?extid=D9c8bf24e56416d7ce2c
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=12610ef1600000

Note: testing is done by a robot and is best-effort only.
