From: "Juan Pablo Romero" <jpablo_romero@hotmail.com>
Date: Sat, 21 Feb 2004 19:35:00 +0000
Subject: Problems with ppp
Message-Id: <BAY15-F30oYAPNXRPmc0000689e@hotmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

Hi,

I recently upgraded my system to mandrake 9.2. Before that, I had no=20
problems  with my modem (mdk 9.1). But now I can't connect.  Also, Windows =

XP can connect fine in the same machne.

Here is a fragment from /var/log/daemons/info:


Feb 21 12:33:58 localhost pppd[2995]: pppd 2.4.1 started by root, uid 0
Feb 21 12:33:58 localhost pppd[2995]: using channel 3
Feb 21 12:33:58 localhost pppd[2995]: Using interface ppp0
Feb 21 12:33:58 localhost pppd[2995]: Connect: ppp0 <--> /dev/536ep
Feb 21 12:33:58 localhost pppd[2995]: sent [LCP ConfReq id=3D0x1 <asyncmap =

0x0> <magic 0x90c4467f> <pcomp> <accomp>]
Feb 21 12:33:58 localhost pppd[2995]: rcvd [LCP ConfAck id=3D0x1 <asyncmap =

0x0> <magic 0x90c4467f> <pcomp> <accomp>]
Feb 21 12:34:00 localhost pppd[2995]: rcvd [LCP ConfReq id=3D0x44 <asyncmap=
=20
0xa0000> <auth pap> <magic 0x409e2ccc> <pcomp> <accomp>]
Feb 21 12:34:00 localhost pppd[2995]: sent [LCP ConfAck id=3D0x44 <asyncmap=
=20
0xa0000> <auth pap> <magic 0x409e2ccc> <pcomp> <accomp>]
Feb 21 12:34:00 localhost pppd[2995]: sent [PAP AuthReq id=3D0x1=20
user=3D"jpabloromero" password=3D<hidden>]
Feb 21 12:34:00 localhost pppd[2995]: rcvd [PAP AuthAck id=3D0x1 ""]
Feb 21 12:34:00 localhost pppd[2995]: sent [IPCP ConfReq id=3D0x1 <addr=20
0.0.0.0> <compress VJ 0f 01> <ms-dns1 0.0.0.0> <ms-dns3 0.0.0.0>]
Feb 21 12:34:00 localhost pppd[2995]: sent [CCP ConfReq id=3D0x1 <deflate 1=
5>=20
<deflate(old#) 15> <bsd v1 15>]
Feb 21 12:34:00 localhost pppd[2995]: rcvd [IPCP ConfReq id=3D0x24 <addr=20
148.246.32.6>]
Feb 21 12:34:00 localhost pppd[2995]: sent [IPCP ConfAck id=3D0x24 <addr=20
148.246.32.6>]
Feb 21 12:34:02 localhost pppd[2995]: rcvd [IPCP ConfReq id=3D0x25 <addr=20
148.246.32.6>]
Feb 21 12:34:02 localhost pppd[2995]: sent [IPCP ConfAck id=3D0x25 <addr=20
148.246.32.6>]
Feb 21 12:34:03 localhost pppd[2995]: sent [IPCP ConfReq id=3D0x1 <addr=20
0.0.0.0> <compress VJ 0f 01> <ms-dns1 0.0.0.0> <ms-dns3 0.0.0.0>]
Feb 21 12:34:03 localhost pppd[2995]: sent [CCP ConfReq id=3D0x1 <deflate 1=
5>=20
<deflate(old#) 15> <bsd v1 15>]
Feb 21 12:34:04 localhost pppd[2995]: rcvd [IPCP ConfReq id=3D0x26 <addr=20
148.246.32.6>]
Feb 21 12:34:04 localhost pppd[2995]: sent [IPCP ConfAck id=3D0x26 <addr=20
148.246.32.6>]
Feb 21 12:34:06 localhost pppd[2995]: sent [IPCP ConfReq id=3D0x1 <addr=20
0.0.0.0> <compress VJ 0f 01> <ms-dns1 0.0.0.0> <ms-dns3 0.0.0.0>]
Feb 21 12:34:06 localhost pppd[2995]: sent [CCP ConfReq id=3D0x1 <deflate 1=
5>=20
<deflate(old#) 15> <bsd v1 15>]
Feb 21 12:34:06 localhost pppd[2995]: rcvd [IPCP ConfReq id=3D0x27 <addr=20
148.246.32.6>]
Feb 21 12:34:06 localhost pppd[2995]: sent [IPCP ConfAck id=3D0x27 <addr=20
148.246.32.6>]
Feb 21 12:34:08 localhost pppd[2995]: rcvd [IPCP ConfReq id=3D0x28 <addr=20
148.246.32.6>]
Feb 21 12:34:08 localhost pppd[2995]: sent [IPCP ConfAck id=3D0x28 <addr=20
148.246.32.6>]
Feb 21 12:34:09 localhost pppd[2995]: sent [IPCP ConfReq id=3D0x1 <addr=20
0.0.0.0> <compress VJ 0f 01> <ms-dns1 0.0.0.0> <ms-dns3 0.0.0.0>]
Feb 21 12:34:09 localhost pppd[2995]: sent [CCP ConfReq id=3D0x1 <deflate 1=
5>=20
<deflate(old#) 15> <bsd v1 15>]
Feb 21 12:34:10 localhost pppd[2995]: rcvd [IPCP ConfReq id=3D0x29 <addr=20
148.246.32.6>]
Feb 21 12:34:10 localhost pppd[2995]: sent [IPCP ConfAck id=3D0x29 <addr=20
148.246.32.6>]
Feb 21 12:34:12 localhost pppd[2995]: sent [IPCP ConfReq id=3D0x1 <addr=20
0.0.0.0> <compress VJ 0f 01> <ms-dns1 0.0.0.0> <ms-dns3 0.0.0.0>]
Feb 21 12:34:12 localhost pppd[2995]: sent [CCP ConfReq id=3D0x1 <deflate 1=
5>=20
<deflate(old#) 15> <bsd v1 15>]
Feb 21 12:34:12 localhost pppd[2995]: rcvd [IPCP ConfReq id=3D0x2a <addr=20
148.246.32.6>]
Feb 21 12:34:12 localhost pppd[2995]: sent [IPCP ConfAck id=3D0x2a <addr=20
148.246.32.6>]
Feb 21 12:34:15 localhost pppd[2995]: rcvd [IPCP ConfReq id=3D0x2b <addr=20
148.246.32.6>]
Feb 21 12:34:15 localhost pppd[2995]: sent [IPCP ConfAck id=3D0x2b <addr=20
148.246.32.6>]
Feb 21 12:34:15 localhost pppd[2995]: sent [IPCP ConfReq id=3D0x1 <addr=20
0.0.0.0> <compress VJ 0f 01> <ms-dns1 0.0.0.0> <ms-dns3 0.0.0.0>]
Feb 21 12:34:15 localhost pppd[2995]: sent [CCP ConfReq id=3D0x1 <deflate 1=
5>=20
<deflate(old#) 15> <bsd v1 15>]
Feb 21 12:34:16 localhost pppd[2995]: rcvd [IPCP ConfReq id=3D0x2c <addr=20
148.246.32.6>]
Feb 21 12:34:16 localhost pppd[2995]: sent [IPCP ConfAck id=3D0x2c <addr=20
148.246.32.6>]
Feb 21 12:34:18 localhost pppd[2995]: sent [IPCP ConfReq id=3D0x1 <addr=20
0.0.0.0> <compress VJ 0f 01> <ms-dns1 0.0.0.0> <ms-dns3 0.0.0.0>]
Feb 21 12:34:18 localhost pppd[2995]: sent [CCP ConfReq id=3D0x1 <deflate 1=
5>=20
<deflate(old#) 15> <bsd v1 15>]
Feb 21 12:34:19 localhost pppd[2995]: rcvd [IPCP ConfReq id=3D0x2d <addr=20
148.246.32.6>]
Feb 21 12:34:19 localhost pppd[2995]: sent [IPCP ConfAck id=3D0x2d <addr=20
148.246.32.6>]
Feb 21 12:34:21 localhost pppd[2995]: sent [IPCP ConfReq id=3D0x1 <addr=20
0.0.0.0> <compress VJ 0f 01> <ms-dns1 0.0.0.0> <ms-dns3 0.0.0.0>]
Feb 21 12:34:21 localhost pppd[2995]: sent [CCP ConfReq id=3D0x1 <deflate 1=
5>=20
<deflate(old#) 15> <bsd v1 15>]
Feb 21 12:34:24 localhost pppd[2995]: sent [IPCP ConfReq id=3D0x1 <addr=20
0.0.0.0> <compress VJ 0f 01> <ms-dns1 0.0.0.0> <ms-dns3 0.0.0.0>]
Feb 21 12:34:24 localhost pppd[2995]: sent [CCP ConfReq id=3D0x1 <deflate 1=
5>=20
<deflate(old#) 15> <bsd v1 15>]
Feb 21 12:34:27 localhost pppd[2995]: sent [IPCP ConfReq id=3D0x1 <addr=20
0.0.0.0> <compress VJ 0f 01> <ms-dns1 0.0.0.0> <ms-dns3 0.0.0.0>]
Feb 21 12:34:27 localhost pppd[2995]: sent [CCP ConfReq id=3D0x1 <deflate 1=
5>=20
<deflate(old#) 15> <bsd v1 15>]
Feb 21 12:34:30 localhost pppd[2995]: sent [LCP TermReq id=3D0x2 "No networ=
k=20
protocols running"]
Feb 21 12:34:33 localhost pppd[2995]: sent [LCP TermReq id=3D0x3 "No networ=
k=20
protocols running"]
Feb 21 12:34:36 localhost pppd[2995]: Connection terminated.
Feb 21 12:34:36 localhost pppd[2995]: Exit.


It seems as if my ISP didn't understand the compress/deflate command.

My setup:
mandrake 9.2
Modem: Intel 536EP

Thanks in advance.


   Juan Pablo

_________________________________________________________________
MSN Fotos: la forma m=E1s f=E1cil de compartir e imprimir fotos. =20
http://photos.msn.es/support/worldwide.aspx

