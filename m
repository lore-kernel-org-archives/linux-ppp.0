From: ierdnah <ierdnah@go.ro>
Date: Sat, 08 Jan 2005 12:47:54 +0000
Subject: kernel oops
Message-Id: <1105188474.12545.5.camel@ierdnac>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org


Jan  3 14:22:00 warsheep Unable to handle kernel NULL pointer
dereference at virtual address 00000000
Jan  3 14:22:00 warsheep printing eip:
Jan  3 14:22:00 warsheep 00000000
Jan  3 14:22:00 warsheep *pde =3D 00000000
Jan  3 14:22:00 warsheep Oops: 0000 [#1]
Jan  3 14:22:00 warsheep PREEMPT SMP
Jan  3 14:22:00 warsheep Modules linked in:
Jan  3 14:22:00 warsheep CPU:    0
Jan  3 14:22:00 warsheep EIP:    0060:[<00000000>]    Not tainted
Jan  3 14:22:00 warsheep EFLAGS: 00010282
(2.6.7-hardened-r18-warsheep43-p4-ht-mod)
Jan  3 14:22:00 warsheep EIP is at 0x0
Jan  3 14:22:00 warsheep eax: cbd82000   ebx: cb501000   ecx: c0374e1a
edx: dfe24a54
Jan  3 14:22:00 warsheep esi: cb501000   edi: 00000000   ebp: cb8dde80
esp: cbbaee9c
Jan  3 14:22:00 warsheep ds: 007b   es: 007b   ss: 0068
Jan  3 14:22:00 warsheep Process pptpctrl (pid: 20340,
threadinfo=CBbae000 task=CF8e32e0)
Jan  3 14:22:00 warsheep Stack: c0378896 cbd82000 00000000 c0377891
cb501000 00628d67 c0491ec1 cb501000
Jan  3 14:22:00 warsheep cb50100c cb8dde80 00000000 c0372f45 cb501000
cb8dde80 00000000 c03f538f
Jan  3 14:22:00 warsheep cb8dde80 00000010 00000004 00000004 c029740e
cb8dde80 00000000 00000000
Jan  3 14:22:00 warsheep Call Trace:
Jan  3 14:22:00 warsheep [<c0378896>] pty_chars_in_buffer+0x2c/0x49
Jan  3 14:22:00 warsheep [<c0377891>] normal_poll+0xed/0x150
Jan  3 14:22:00 warsheep [<c0491ec1>] schedule_timeout+0x75/0xbf
Jan  3 14:22:00 warsheep [<c0372f45>] tty_poll+0xa0/0xb0
Jan  3 14:22:00 warsheep [<c03f538f>] sock_poll+0x29/0x31
Jan  3 14:22:00 warsheep [<c029740e>] do_select+0x27b/0x2fa
Jan  3 14:22:00 warsheep [<c0296fed>] __pollwait+0x0/0xc7
Jan  3 14:22:00 warsheep [<c0297765>] sys_select+0x2b3/0x4b0
Jan  3 14:22:00 warsheep [<c02838f1>] vfs_write+0xc9/0x119
Jan  3 14:22:00 warsheep [<c0231069>] sysenter_past_esp+0x52/0x79
Jan  3 14:22:00 warsheep
Jan  3 14:22:00 warsheep Code:  Bad EIP value.

Jan  3 12:23:38 warsheep Unable to handle kernel NULL pointer
dereference at virtual address 00000000
Jan  3 12:23:38 warsheep printing eip:
Jan  3 12:23:38 warsheep 00000000
Jan  3 12:23:38 warsheep *pde =3D 00000000
Jan  3 12:23:38 warsheep Oops: 0000 [#1]
Jan  3 12:23:38 warsheep PREEMPT SMP
Jan  3 12:23:38 warsheep Modules linked in: w83627hf i2c_sensor i2c_isa
i2c_dev i2c_i801 i2c_core
Jan  3 12:23:38 warsheep CPU:    0
Jan  3 12:23:38 warsheep EIP:    0060:[<00000000>]    Not tainted
Jan  3 12:23:38 warsheep EFLAGS: 00010282
(2.6.7-hardened-r18-warsheep43-p4-ht-mod)
Jan  3 12:23:38 warsheep EIP is at 0x0
Jan  3 12:23:38 warsheep eax: c8c94000   ebx: ceb49000   ecx: c0374e1a
edx: dfe23b54
Jan  3 12:23:38 warsheep esi: ceb49000   edi: 00000000   ebp: d976a680
esp: ca071e9c
Jan  3 12:23:38 warsheep ds: 007b   es: 007b   ss: 0068
Jan  3 12:23:38 warsheep Process pptpctrl (pid: 21554,
threadinfo=CA071000 task=D4d1a230)
Jan  3 12:23:38 warsheep Stack: c0378896 c8c94000 00000000 c0377891
ceb49000 09ff62d5 c0491ec1 ceb49000
Jan  3 12:23:38 warsheep ceb4900c d976a680 00000000 c0372f45 ceb49000
d976a680 00000000 c03f538f
Jan  3 12:23:38 warsheep d976a680 00000010 00000004 00000004 c029740e
d976a680 00000000 00000000
Jan  3 12:23:38 warsheep Call Trace:
Jan  3 12:23:38 warsheep [<c0378896>] pty_chars_in_buffer+0x2c/0x49
Jan  3 12:23:38 warsheep [<c0377891>] normal_poll+0xed/0x150
Jan  3 12:23:38 warsheep [<c0491ec1>] schedule_timeout+0x75/0xbf
Jan  3 12:23:38 warsheep [<c0372f45>] tty_poll+0xa0/0xb0
Jan  3 12:23:38 warsheep [<c03f538f>] sock_poll+0x29/0x31
Jan  3 12:23:38 warsheep [<c029740e>] do_select+0x27b/0x2fa
Jan  3 12:23:38 warsheep [<c0296fed>] __pollwait+0x0/0xc7
Jan  3 12:23:38 warsheep [<c0297765>] sys_select+0x2b3/0x4b0
Jan  3 12:23:38 warsheep [<c02838f1>] vfs_write+0xc9/0x119
Jan  3 12:23:38 warsheep [<c0231069>] sysenter_past_esp+0x52/0x79
Jan  3 12:23:38 warsheep
Jan  3 12:23:38 warsheep Code:  Bad EIP value.


i've compiled a non PREEMPT kernel, and the oops still appears
i'am using kernel 2.6.7
a have a VPN server with pppd and pptpd(poptop) and and average of 130
simultanious connections, the oops doesn't occur at a particular number
of simulationus VPN connection

--=20
ierdnah <ierdnah@go.ro>

