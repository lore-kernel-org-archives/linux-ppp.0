From: =?iso-8859-1?Q?J=F6rg?= Sommer <joerg@alea.gnuu.de>
Date: Sun, 23 Dec 2007 21:27:52 +0000
Subject: Kernel panic
Message-Id: <20071223212752.GA22636@alea.gnuu.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="3V7upXqbjpZ4EhLz"
List-Id: <linux-ppp.vger.kernel.org>
To: linux-ppp@vger.kernel.org


--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Please send me a copy of replies. I'm not subscribed.]

Hi,

[ 6421.398151] skb_under_panic: text:c01d7954 len:1504 put:2 head:cb786000 =
data:cb785fff tail:cb7865df end:cb7>
[ 6421.431624] ------------[ cut here ]------------
[ 6421.445405] Kernel BUG at [verbose debug info unavailable]
[ 6421.461783] invalid opcode: 0000 [#1]
[ 6421.472725] Modules linked in: lp
[ 6421.482755] CPU:    0
[ 6421.482784] EIP:    0060:[<c020c257>]    Not tainted VLI
[ 6421.482835] EFLAGS: 00010286   (2.6.18 #1)
[ 6421.517937] EIP is at skb_under_panic+0x37/0x50
[ 6421.531492] eax: 00000082   ebx: 000005e0   ecx: 00000073   edx: 00000000
[ 6421.551776] esi: cac4ee40   edi: c12e43a0   ebp: cac4ee40   esp: c11d3f40
[ 6421.572054] ds: 007b   es: 007b   ss: 0068
[ 6421.584312] Process ksoftirqd/0 (pid: 2, ti=3Dc11d2000 task=3Dc11cc540 t=
ask.ti=3Dc11d2000)
[ 6421.606902] Stack: c028dd44 c01d7954 000005e0 00000002 cb786000 cb785fff=
 cb7865df cb786600
[ 6421.632236]        c0280ab7 00000000 c01d7960 c12e43a0 c30a0620 cac4ee40=
 c12e43a0 c78ad000
[ 6421.657572]        c01d80e6 21000246 cac4ee40 cbedc298 cbedc200 cbedc264=
 c01d9e5f 00000000
[ 6421.682906] Call Trace:
[ 6421.690790]  [<c01d7954>] ppp_receive_frame+0x604/0x6e0
[ 6421.706518]  [<c01d7960>] ppp_receive_frame+0x610/0x6e0
[ 6421.722216]  [<c01d80e6>] ppp_input+0x86/0x100
[ 6421.735542]  [<c01d9e5f>] ppp_async_process+0x1f/0x70
[ 6421.750725]  [<c0112793>] tasklet_action+0x33/0x60
[ 6421.765159]  [<c01126d0>] __do_softirq+0x50/0xa0
[ 6421.779028]  [<c01129c0>] ksoftirqd+0x0/0xc0
[ 6421.791860]  [<c0112755>] do_softirq+0x35/0x40
[ 6421.805211]  [<c0112a35>] ksoftirqd+0x75/0xc0
[ 6421.818303]  [<c011ea04>] kthread+0xd4/0xe0
[ 6421.830883]  [<c011e930>] kthread+0x0/0xe0
[ 6421.843198]  [<c0100c65>] kernel_thread_helper+0x5/0x10
[ 6421.858870] Code: 90 a0 00 00 00 52 8b 90 9c 00 00 00 52 8b 90 98 00 00 =
00 52 8b 90 94 00 00 00 52 53 8b 58
[ 6421.918345] EIP: [<c020c257>] skb_under_panic+0x37/0x50 SS:ESP 0068:c11d=
3f40
[ 6421.939512]  <0>Kernel panic - not syncing: Fatal exception in interrupt

% uname -a
Linux alea 2.6.18 #1 Thu Dec 20 15:16:05 CET 2007 i586 GNU/Linux

The panic happens when I have a heavy disk access. I can't reproduce it
directly, but reading much data from disk and using pppd with a 56k modem
line triggers the panic.

Ask if you need more infos.

Bye, J=F6rg.
--=20
Der Pessimist ist jemand, der vorzeitig die Wahrheit erz=E4hlt.
    	      	  	      		    	(Cyrano de Bergerac)

--3V7upXqbjpZ4EhLz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFHbtLYwe0mZwH1VIARAqarAJ9Cv6Y+rCRAl2RBXegIhrVqqXwY1ACggT4Q
tEgc2jzY2jf+L5xAkMzH9yU=
=sSEX
-----END PGP SIGNATURE-----

--3V7upXqbjpZ4EhLz--
