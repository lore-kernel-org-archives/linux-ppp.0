From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Date: Thu, 03 May 2018 05:45:24 +0000
Subject: Re: INFO: rcu detected stall in __schedule
Message-Id: <1356afb7-80cf-d9d9-c282-e4e819807376@I-love.SAKURA.ne.jp>
List-Id: <linux-ppp.vger.kernel.org>
References: <000000000000d2fe62056b3ccca5@google.com>
In-Reply-To: <000000000000d2fe62056b3ccca5@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: syzbot <syzbot+f16b3e3512a1e3c1d1f6@syzkaller.appspotmail.com>, syzkaller-bugs@googlegroups.com, dvyukov@google.com
Cc: linux-kernel@vger.kernel.org, linux-ppp@vger.kernel.org, netdev@vger.kernel.org, paulus@samba.org

I'm not sure whether this is a PPP bug.

As of uptime =3D 484, RCU says that it stalled for 125 seconds.

----------
[  484.407032] INFO: rcu_sched self-detected stall on CPU
[  484.412488] 	0-...!: (125000 ticks this GP) idle=F3e/1/46116860184273879=
06 softirq=112858/112858 fqs=3D0=20
[  484.422300] 	 (t=125000 jiffies ga626 ca625 q=1534)
[  484.427663] rcu_sched kthread starved for 125000 jiffies! g61626 c61625 =
f0x0 RCU_GP_WAIT_FQS(3) ->state=3D0x402 ->cpu=3D0
----------

484 - 125 =3D 359, which was about to start SND related fuzzing in that log.

----------
2033/05/18 03:36:31 executing program 1:
r0 =3D socket(0x40000a, 0x5, 0x7)
setsockopt$inet_int(r0, 0x0, 0x18, &(0x7f0000000000)=3D0x200, 0x4)
bind$inet6(r0, &(0x7f00000000c0)=3D{0xa, 0x0, 0x0, @loopback=3D{0x0, 0x1}},=
 0x1c)
perf_event_open(&(0x7f0000000040)=3D{0x2, 0x70, 0x3e5}, 0x0, 0xffffffffffff=
ffff, 0xffffffffffffffff, 0x0)
timer_create(0x0, &(0x7f00000001c0)=3D{0x0, 0x15, 0x0, @thr=3D{&(0x7f000000=
0440), &(0x7f0000000540)}}, &(0x7f0000000200))
timer_getoverrun(0x0)
perf_event_open(&(0x7f000025c000)=3D{0x2, 0x78, 0x3e3}, 0x0, 0x0, 0xfffffff=
fffffffff, 0x0)
r1 =3D syz_open_dev$sndctrl(&(0x7f0000000200)=3D'/dev/snd/controlC#\x00', 0=
x2, 0x0)
perf_event_open(&(0x7f0000001000)=3D{0x0, 0x70, 0x0, 0x0, 0x0, 0x0, 0x0, 0x=
8ce, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x7, 0x0, =
0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0xfffffffffffffff8, 0x0, =
0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, @perf_bp=3D{&(0x7f0000005000), 0x2}, 0x1=
000000000c}, 0x0, 0x0, 0xffffffffffffffff, 0x0)
ioctl$SNDRV_CTL_IOCTL_SUBSCRIBE_EVENTS(r1, 0xc0045516, &(0x7f00000000c0)=3D=
0x1)
r2 =3D syz_open_dev$sndpcmp(&(0x7f0000000100)=3D'/dev/snd/pcmC#D#p\x00', 0x=
1, 0x4000)
ioctl$SNDRV_SEQ_IOCTL_GET_QUEUE_CLIENT(r2, 0xc04c5349, &(0x7f0000000240)=3D=
{0x200, 0xfffffffffffffcdc, 0x1})
syz_open_dev$tun(&(0x7f00000003c0)=3D'/dev/net/tun\x00', 0x0, 0x20402)
ioctl$SNDRV_CTL_IOCTL_PVERSION(r1, 0xc1105517, &(0x7f0000001000)=3D""/250)
ioctl$SNDRV_CTL_IOCTL_SUBSCRIBE_EVENTS(r1, 0xc0045516, &(0x7f0000000000))

2033/05/18 03:36:31 executing program 4:
syz_emit_ethernet(0x3e, &(0x7f00000000c0)=3D{@broadcast=3D[0xff, 0xff, 0xff=
, 0xff, 0xff, 0xff], @empty=3D[0x0, 0x0, 0xb00000000000000], [], {@ipv4=3D{=
0x800, {{0x5, 0x4, 0x0, 0x0, 0x30, 0x0, 0x0, 0x0, 0x1, 0x0, @remote=3D{0xac=
, 0x14, 0x14, 0xbb}, @dev=3D{0xac, 0x14, 0x14}}, @icmp=3D@parameter_prob=3D=
{0x5, 0x4, 0x0, 0x0, 0x0, 0x0, {0x5, 0x4, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0=
, 0x0, @local=3D{0xac, 0x223, 0x14, 0xaa}, @dev=3D{0xac, 0x14, 0x14}}}}}}},=
 &(0x7f0000000000)=3D{0x0, 0x2, [0x0, 0x2e6]})

2033/05/18 03:36:31 executing program 1:
r0 =3D socket$pppoe(0x18, 0x1, 0x0)
connect$pppoe(r0, &(0x7f00000000c0)=3D{0x18, 0x0, {0x1, @broadcast=3D[0xff,=
 0xff, 0xff, 0xff, 0xff, 0xff], 'ip6_vti0\x00'}}, 0x1e)
r1 =3D socket(0x3, 0xb, 0x80000001)
setsockopt$inet_sctp6_SCTP_ADAPTATION_LAYER(r1, 0x84, 0x7, &(0x7f0000000100=
)=3D{0x2}, 0x4)
ioctl$sock_inet_SIOCGIFADDR(r0, 0x8915, &(0x7f0000000040)=3D{'veth1_to_brid=
ge\x00', {0x2, 0x4e21}})
r2 =3D syz_open_dev$admmidi(&(0x7f0000000000)=3D'/dev/admmidi#\x00', 0x6, 0=
x8000)
setsockopt$SO_VM_SOCKETS_BUFFER_MAX_SIZE(r2, 0x28, 0x2, &(0x7f0000000080)=
=3D0xffffffffffffff00, 0x8)

[  359.306427] snd_virmidi snd_virmidi.0: control 112:0:0:=EF=BF=BD=08:0 is=
 already present
----------
