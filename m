From: mferrato@ogm-techno.org
Date: Tue, 21 Sep 2004 13:33:46 +0000
Subject: pppd 2.4.2  with SMP -- crash --
Message-Id: <32820.213.41.172.145.1095773626.squirrel@panel.lost-oasis.net>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

Hi,

Sorry for my bad english language ;(
But I want signaled a bug with pppd and SMP.

I can't use adsl with a SMP kernel.

I use slackware 10.0 with 2 kernels compiled 2.4.26
My machine is a Proliant Server ML370, Biprocesseur Pentium III
Coppermine, with Raid Array, 768Mo ram.

The original ppp version in slackaware, is release 2.4.2, but i have
downloaded 2.4.0, compiled, tested, with the same result bug.

The result is same with ppp  kernel static, or ppp module..
the example above is with ppp resident kernel

compiled kernels is same, only difference is
first compiled without SMP
second compiled with SMP.

After a little research about my failing connexion adsl, I have found this.

When i start a simple pppd command with kernel no-smp i see in log files
----------------------------------------------------------------------
#pppd

/var/log/messages
Sep 21 12:53:54 moskito pppd[2899]: pppd 2.4.0 started by root, uid 0 Sep
21 12:53:54 moskito pppd[2899]: Using interface ppp0
Sep 21 12:53:54 moskito pppd[2899]: Connect: ppp0 <--> /dev/tty1
Sep 21 12:54:24 moskito pppd[2899]: Connection terminated.
Sep 21 12:54:24 moskito pppd[2899]: Exit.

/var/log/syslog
Sep 21 12:54:24 moskito pppd[2899]: LCP: timeout sending Config-Requests

When i start a simple pppd command with kernel smp
-------------------------------------------------------------
root@moskito:~# pppd
Unable to handle kernel NULL pointer dereference at virtual address
00000000 *pde =3D 00000000
Oops: 0000
CPU:    0
EIP:    0010:[<c011a1c3>]    Not tainted
EFLAGS: 00010087
eax: ef53a77c   ebx: ef53a77c   ecx: 00000000   edx: ef53a77b
esi: ef53a780   edi: ef53a77c   ebp: ecb17eb4   esp: ecb17e94
ds: 0018   es: 0018   ss: 0018
Process pppd (pid: 165, stackpage=ECb17000)
Stack: c01c5bf7 ef6f8000 00000001 00000282 00000001 ef53a760 c03c1b88
00000000
       00000000 f0a94d55 efdd1a00 ef6f8100 f0a981c8 efdd1a78 ef6f80c0
c01bfb19
       ef6f8000 00000000 ecc30214 00000000 0808519c c03b19e0 ef842aa0
eccbd180
Call Trace:    [<c01c5bf7>] [<f0a94d55>] [<f0a981c8>] [<c01bfb19>]
[<c0118f08>]
  [<c01c5bf7>] [<f0a99858>] [<f0a980a0>] [<f0a98190>] [<f0a98230>]
[<f0a98240>]
  [<f0a98250>] [<f0a983d0>] [<f0a983f0>] [<f0a983e0>] [<f0a98470>]
[<c0153bb5>]
  [<c010922b>]

--------------------
the console system stalls, but i can use other terminals ( or distant
access by LAN)

the log files are:
/var/log/messages
Sep 21 14:09:45 moskito syslogd 1.4.1: restart.
Sep 21 14:09:51 moskito pppd[165]: pppd 2.4.0 started by root, uid 0 Sep
21 14:09:51 moskito kernel: CSLIP: code copyright 1989 Regents of the
University of California
Sep 21 14:09:51 moskito kernel: PPP generic driver version 2.4.2

root@moskito:~# less /var/log/syslog
Sep 21 14:09:51 moskito kernel: failed to register PPP device (-16) Sep 21
14:09:51 moskito pppd[165]: Couldn't attach to channel 1: No such device
or address
Sep 21 14:09:51 moskito kernel: Unable to handle kernel NULL pointer
dereference at virtual address 00000000
Sep 21 14:09:51 moskito kernel:  printing eip:
Sep 21 14:09:51 moskito kernel: c011a1c3
Sep 21 14:09:51 moskito kernel: *pde =3D 00000000
Sep 21 14:09:51 moskito kernel: Oops: 0000
Sep 21 14:09:51 moskito kernel: CPU:    0
Sep 21 14:09:51 moskito kernel: EIP:    0010:[<c011a1c3>]    Not tainted
Sep 21 14:09:51 moskito kernel: EFLAGS: 00010087
Sep 21 14:09:51 moskito kernel: eax: ef53a77c   ebx: ef53a77c   ecx:
00000000   edx: ef53a77b
Sep 21 14:09:51 moskito kernel: esi: ef53a780   edi: ef53a77c   ebp:
ecb17eb4   esp: ecb17e94
Sep 21 14:09:51 moskito kernel: ds: 0018   es: 0018   ss: 0018
Sep 21 14:09:51 moskito kernel: Process pppd (pid: 165,
stackpage=ECb17000)
Sep 21 14:09:51 moskito kernel: Stack: c01c5bf7 ef6f8000 00000001 00000282
00000001 ef53a760 c03c1b88 00000000
Sep 21 14:09:51 moskito kernel:        00000000 f0a94d55 efdd1a00 ef6f8100
f0a981c8 efdd1a78 ef6f80c0 c01bfb19
Sep 21 14:09:51 moskito kernel:        ef6f8000 00000000 ecc30214 00000000
0808519c c03b19e0 ef842aa0 eccbd180
Sep 21 14:09:51 moskito kernel: Call Trace:    [<c01c5bf7>] [<f0a94d55>]
[<f0a981c8>] [<c01bfb19>] [<c0118f08>]
Sep 21 14:09:51 moskito kernel:   [<c01c5bf7>] [<f0a99858>] [<f0a980a0>]
[<f0a98190>] [<f0a98230>] [<f0a98240>]
Sep 21 14:09:51 moskito kernel:   [<f0a98250>] [<f0a983d0>] [<f0a983f0>]
[<f0a983e0>] [<f0a98470>] [<c0153bb5>]
Sep 21 14:09:51 moskito kernel:   [<c010922b>]
Sep 21 14:09:51 moskito kernel:
Sep 21 14:09:51 moskito kernel: Code: 8b 01 85 45 f0 75 1c 8b 02 89 d3 89
c2 0f 18 00 39 f3 75 e9
-------------------------------------------------------------
if i start twice, the entire system stalls, and i do use poweroff buttom,
it is the effect when a start adsl-start ;P


Please, do you know some patch for this problem ?  what  i do make for
more pertinent informations ?

Best regards

Marc Ferraton, Marseille, France





