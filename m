From: syzbot <syzbot+0d083911ab18b710da71@syzkaller.appspotmail.com>
Date: Tue, 29 Oct 2019 04:46:01 +0000
Subject: Re: INFO: trying to register non-static key in bond_3ad_update_lacp_rate
Message-Id: <0000000000000987900596054b0f@google.com>
List-Id: <linux-ppp.vger.kernel.org>
In-Reply-To: <000000000000fc25a1059602460a@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: a@unstable.cc, alex.aring@gmail.com, allison@lohutok.net, andrew@lunn.ch, andy@greyhouse.net, ap420073@gmail.com, aroulin@cumulusnetworks.com, ast@domdv.de, b.a.t.m.a.n@lists.open-mesh.org, bridge@lists.linux-foundation.org, cleech@redhat.com, daniel@iogearbox.net, davem@davemloft.net, dcaratti@redhat.com, dsa@cumulusnetworks.com, edumazet@google.com, f.fainelli@gmail.com, fw@strlen.de, gregkh@linuxfoundation.org, gustavo@embeddedor.com, gvaradar@cisco.com, haiyangz@microsoft.com, idosch@mellanox.com, info@metux.net, ivan.khoronzhuk@linaro.org, j.vosburgh@gmail.com, j@w1.fi, jakub.kicinski@netronome.com, jhs@mojatatu.com, jiri@mellanox.com, jiri@resnulli.us, johan.hedberg@gmail.com, johannes.berg@intel.com, john.hurley@netronome.com, jwi@linux.ibm.com, kstewart@linuxfoundation.org, kvalo@codeaurora.org, kys@microsoft.com, lariel@mellanox.com, linmiaohe@huawei.com, linux-bluetooth@vger.kernel.org, linux-hams@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org, linux-ppp@vger.kernel.org, linux-wireless@vger.kernel.org, linux-wpan@vger.kernel.org, liuhangbin@gmail.com, marcel@holtmann.org, mareklindner@neomailbox.ch

syzbot has bisected this bug to:

commit ab92d68fc22f9afab480153bd82a20f6e2533769
Author: Taehee Yoo <ap420073@gmail.com>
Date:   Mon Oct 21 18:47:51 2019 +0000

     net: core: add generic lockdep keys

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1467f674e00000
start commit:   60c1769a Add linux-next specific files for 20191028
git tree:       linux-next
final crash:    https://syzkaller.appspot.com/x/report.txt?x=1667f674e00000
console output: https://syzkaller.appspot.com/x/log.txt?x=1267f674e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=CB86688f30db053d
dashboard link: https://syzkaller.appspot.com/bug?extid
083911ab18b710da71
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15381ee0e00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11571570e00000

Reported-by: syzbot+0d083911ab18b710da71@syzkaller.appspotmail.com
Fixes: ab92d68fc22f ("net: core: add generic lockdep keys")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
