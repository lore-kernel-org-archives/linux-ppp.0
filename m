From: syzbot <syzbot+cd0ec5211ac07c18c049@syzkaller.appspotmail.com>
Date: Fri, 15 Nov 2019 19:55:01 +0000
Subject: Re: BUG: MAX_LOCKDEP_ENTRIES too low!
Message-Id: <00000000000029432d059767f930@google.com>
List-Id: <linux-ppp.vger.kernel.org>
In-Reply-To: <000000000000ec7273058b877e1f@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: a@unstable.cc, alex.aring@gmail.com, allison@lohutok.net, andrew@lunn.ch, andy@greyhouse.net, ap420073@gmail.com, ast@domdv.de, b.a.t.m.a.n@lists.open-mesh.org, bridge@lists.linux-foundation.org, cleech@redhat.com, daniel@iogearbox.net, davem@davemloft.net, dev@openvswitch.org, dsa@cumulusnetworks.com, edumazet@google.com, f.fainelli@gmail.com, fw@strlen.de, gbastien@versatic.net, gregkh@linuxfoundation.org, gustavo@embeddedor.com, haiyangz@microsoft.com, idosch@mellanox.com, info@metux.net, j.vosburgh@gmail.com, j@w1.fi, jack@suse.com, jack@suse.cz, jakub.kicinski@netronome.com, jhs@mojatatu.com, jiri@mellanox.com, jiri@resnulli.us, johan.hedberg@gmail.com, johannes.berg@intel.com, john.hurley@netronome.com, jwi@linux.ibm.com, kstewart@linuxfoundation.org, kvalo@codeaurora.org, kys@microsoft.com, linmiaohe@huawei.com, linux-bluetooth@vger.kernel.org, linux-hams@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org, linux-ppp@vger.kernel.org, linux-wireless@vger.kernel.org, linux-wpan@vger.kernel.org, liuhangbin@gmail.com, marcel@holtmann.org, mareklindner@neomailbox.ch, mcroce@redhat.com

syzbot has bisected this bug to:

commit ab92d68fc22f9afab480153bd82a20f6e2533769
Author: Taehee Yoo <ap420073@gmail.com>
Date:   Mon Oct 21 18:47:51 2019 +0000

     net: core: add generic lockdep keys

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1126f5c2e00000
start commit:   0e3f1ad8 Remove VirtualBox guest shared folders filesystem
git tree:       upstream
final crash:    https://syzkaller.appspot.com/x/report.txt?x=1326f5c2e00000
console output: https://syzkaller.appspot.com/x/log.txt?x=1526f5c2e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1Aab6d4187ddf667
dashboard link: https://syzkaller.appspot.com/bug?extid=CD0ec5211ac07c18c049
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1171546ae00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=133ed206e00000

Reported-by: syzbot+cd0ec5211ac07c18c049@syzkaller.appspotmail.com
Fixes: ab92d68fc22f ("net: core: add generic lockdep keys")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
