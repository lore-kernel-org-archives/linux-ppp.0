From: Guohua Xia <xiaguohua3@gmail.com>
Date: Wed, 27 Jan 2016 05:56:28 +0000
Subject: A deadlock in ppp_generic kernel 3.3, can anybody help me?
Message-Id: <CAFsYF7oMOA2vxSA8QhMfuy4yxaDCspFK3JG0BCnOi2oOeFw+TQ@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

Hello,

When i use the pptp client to dial to remote=EF=BC=8C plug and pull the
interface at sometimes, this may occur. My kernel is 3.3(openwrt).
Later, when i use
the vlan interface to do the pppoe dialing, it occurs again.

Can anyone help me?
Think you!

[ 1548.018990] BUG: soft lockup - CPU#0 stuck for 41s! [pppd:21042]

[ 1548.018990]
[ 1548.018990] Pid: 21042, comm: pppd Tainted: G O 3.3.8 #5
[ 1548.018990] EIP: 0060:[<c14c4a9e>] EFLAGS: 00000297 CPU: 0
[ 1548.018990] EIP is at _raw_spin_lock_bh+0x1e/0x30
[ 1548.018990] EAX: 00000013 EBX: f51a4e5c ECX: f57b39c0 EDX: 00000014
[ 1548.018990] ESI: f52f33c0 EDI: f51a4e5c EBP: 00000038 ESP: f4493da0
[ 1548.018990] DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[ 1548.018990] Process pppd (pid: 21042, ti=F4492000 task=F505b960
task.ti=F4492000)
[ 1548.018990] Stack:
[ 1548.018990] f51a4e68 f8bc9cca f8bee948 00000032 00000000 00000000
0000c020 f521682a
[ 1548.018990] 00000032 f7f092c2 0000082a f57b39c0 00000000 00000000
f7f0e102 00000246
[ 1548.018990] 00000038 00000246 0001250d 00000246 0004eb4e f8bca560
f52f33c0 f57b39c0
[ 1548.018990] Call Trace:
[ 1548.018990] [<f8bc9cca>] ? ppp_unregister_channel+0x100a/0x1c10 [ppp_gen=
eric]
[ 1548.018990] [<f8bee948>] ? 0xf8bee947
[ 1548.018990] [<f8bca560>] ? ppp_unregister_channel+0x18a0/0x1c10 [ppp_gen=
eric]
[ 1548.018990] [<f8bca605>] ? ppp_unregister_channel+0x1945/0x1c10 [ppp_gen=
eric]
[ 1548.018990] [<f8bca805>] ? ppp_unregister_channel+0x1b45/0x1c10 [ppp_gen=
eric]
[ 1548.018990] [<c1402c5d>] ? dev_hard_start_xmit+0x3ed/0x4f0
[ 1548.018990] [<c1428e20>] ? ip_flush_pending_frames.isra.47+0x60/0x60
[ 1548.018990] [<c1414737>] ? sch_direct_xmit+0x57/0x170
[ 1548.018990] [<c1428e20>] ? ip_flush_pending_frames.isra.47+0x60/0x60
[ 1548.018990] [<c1403029>] ? dev_queue_xmit+0x2c9/0x480
[ 1548.018990] [<c1429082>] ? ip_finish_output+0x262/0x2b0
[ 1548.018990] [<c1429188>] ? ip_local_out+0x18/0x20
[ 1548.018990] [<f8d1d681>] ? 0xf8d1d680
[ 1548.018990] [<f8bca863>] ? ppp_unregister_channel+0x1ba3/0x1c10 [ppp_gen=
eric]
[ 1548.018990] [<f8bca99e>] ? ppp_output_wakeup+0xce/0xe40 [ppp_generic]
[ 1548.573040] BUG: scheduling while atomic: pppd/21042/0x00010800
