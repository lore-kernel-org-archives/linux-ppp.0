From: "Juan Pablo Romero" <jpablo_romero@hotmail.com>
Date: Sat, 21 Feb 2004 20:16:58 +0000
Subject: Re: Problems with ppp
Message-Id: <BAY15-F65RjbDt3HvoF00001992@hotmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <BAY15-F30oYAPNXRPmc0000689e@hotmail.com>
In-Reply-To: <BAY15-F30oYAPNXRPmc0000689e@hotmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

I added asyncmap a0000 to the config file, but the result is the same :(


    Juan Pablo

Feb 21 14:08:11 localhost pppd[2888]: pppd 2.4.1 started by root, uid 0
Feb 21 14:08:11 localhost pppd[2888]: using channel 3
Feb 21 14:08:11 localhost pppd[2888]: Using interface ppp0
Feb 21 14:08:11 localhost pppd[2888]: Connect: ppp0 <--> /dev/536ep
Feb 21 14:08:11 localhost pppd[2888]: sent [LCP ConfReq id=3D0x1 <asyncmap =

0xa0000> <magic 0x2c29ecbb> <pcomp> <accomp>]
Feb 21 14:08:11 localhost pppd[2888]: rcvd [LCP ConfAck id=3D0x1 <asyncmap =

0xa0000> <magic 0x2c29ecbb> <pcomp> <accomp>]
Feb 21 14:08:13 localhost pppd[2888]: rcvd [LCP ConfReq id=3D0xdb <asyncmap=
=20
0xa0000> <auth pap> <magic 0x6c3e333d> <pcomp> <accomp>]
Feb 21 14:08:13 localhost pppd[2888]: sent [LCP ConfAck id=3D0xdb <asyncmap=
=20
0xa0000> <auth pap> <magic 0x6c3e333d> <pcomp> <accomp>]
Feb 21 14:08:13 localhost pppd[2888]: sent [PAP AuthReq id=3D0x1=20
user=3D"jpabloromero" password=3D<hidden>]
Feb 21 14:08:13 localhost pppd[2888]: rcvd [PAP AuthAck id=3D0x1 ""]
Feb 21 14:08:13 localhost pppd[2888]: sent [IPCP ConfReq id=3D0x1 <addr=20
0.0.0.0> <compress VJ 0f 01> <ms-dns1 0.0.0.0> <ms-dns3 0.0.0.0>]
Feb 21 14:08:13 localhost pppd[2888]: sent [CCP ConfReq id=3D0x1 <deflate 1=
5>=20
<deflate(old#) 15> <bsd v1 15>]
Feb 21 14:08:13 localhost pppd[2888]: rcvd [IPCP ConfReq id=3D0xef <addr=20
200.39.61.2>]
Feb 21 14:08:13 localhost pppd[2888]: sent [IPCP ConfAck id=3D0xef <addr=20
200.39.61.2>]
Feb 21 14:08:15 localhost pppd[2888]: rcvd [IPCP ConfReq id=3D0xf0 <addr=20
200.39.61.2>]
Feb 21 14:08:15 localhost pppd[2888]: sent [IPCP ConfAck id=3D0xf0 <addr=20
200.39.61.2>]
Feb 21 14:08:16 localhost pppd[2888]: sent [IPCP ConfReq id=3D0x1 <addr=20
0.0.0.0> <compress VJ 0f 01> <ms-dns1 0.0.0.0> <ms-dns3 0.0.0.0>]
Feb 21 14:08:16 localhost pppd[2888]: sent [CCP ConfReq id=3D0x1 <deflate 1=
5>=20
<deflate(old#) 15> <bsd v1 15>]
Feb 21 14:08:17 localhost pppd[2888]: rcvd [IPCP ConfReq id=3D0xf1 <addr=20
200.39.61.2>]
Feb 21 14:08:17 localhost pppd[2888]: sent [IPCP ConfAck id=3D0xf1 <addr=20
200.39.61.2>]
Feb 21 14:08:19 localhost pppd[2888]: sent [IPCP ConfReq id=3D0x1 <addr=20
0.0.0.0> <compress VJ 0f 01> <ms-dns1 0.0.0.0> <ms-dns3 0.0.0.0>]
Feb 21 14:08:19 localhost pppd[2888]: sent [CCP ConfReq id=3D0x1 <deflate 1=
5>=20
<deflate(old#) 15> <bsd v1 15>]
Feb 21 14:08:19 localhost pppd[2888]: rcvd [IPCP ConfReq id=3D0xf2 <addr=20
200.39.61.2>]
Feb 21 14:08:19 localhost pppd[2888]: sent [IPCP ConfAck id=3D0xf2 <addr=20
200.39.61.2>]
Feb 21 14:08:21 localhost pppd[2888]: rcvd [IPCP ConfReq id=3D0xf3 <addr=20
200.39.61.2>]
Feb 21 14:08:21 localhost pppd[2888]: sent [IPCP ConfAck id=3D0xf3 <addr=20
200.39.61.2>]
Feb 21 14:08:22 localhost pppd[2888]: sent [IPCP ConfReq id=3D0x1 <addr=20
0.0.0.0> <compress VJ 0f 01> <ms-dns1 0.0.0.0> <ms-dns3 0.0.0.0>]
Feb 21 14:08:22 localhost pppd[2888]: sent [CCP ConfReq id=3D0x1 <deflate 1=
5>=20
<deflate(old#) 15> <bsd v1 15>]
Feb 21 14:08:23 localhost pppd[2888]: rcvd [IPCP ConfReq id=3D0xf4 <addr=20
200.39.61.2>]
Feb 21 14:08:23 localhost pppd[2888]: sent [IPCP ConfAck id=3D0xf4 <addr=20
200.39.61.2>]
Feb 21 14:08:25 localhost pppd[2888]: rcvd [IPCP ConfReq id=3D0xf5 <addr=20
200.39.61.2>]
Feb 21 14:08:25 localhost pppd[2888]: sent [IPCP ConfAck id=3D0xf5 <addr=20
200.39.61.2>]
Feb 21 14:08:25 localhost pppd[2888]: sent [IPCP ConfReq id=3D0x1 <addr=20
0.0.0.0> <compress VJ 0f 01> <ms-dns1 0.0.0.0> <ms-dns3 0.0.0.0>]
Feb 21 14:08:25 localhost pppd[2888]: sent [CCP ConfReq id=3D0x1 <deflate 1=
5>=20
<deflate(old#) 15> <bsd v1 15>]
Feb 21 14:08:27 localhost pppd[2888]: rcvd [IPCP ConfReq id=3D0xf6 <addr=20
200.39.61.2>]
Feb 21 14:08:27 localhost pppd[2888]: sent [IPCP ConfAck id=3D0xf6 <addr=20
200.39.61.2>]
Feb 21 14:08:28 localhost pppd[2888]: sent [IPCP ConfReq id=3D0x1 <addr=20
0.0.0.0> <compress VJ 0f 01> <ms-dns1 0.0.0.0> <ms-dns3 0.0.0.0>]
Feb 21 14:08:28 localhost pppd[2888]: sent [CCP ConfReq id=3D0x1 <deflate 1=
5>=20
<deflate(old#) 15> <bsd v1 15>]
Feb 21 14:08:29 localhost pppd[2888]: rcvd [IPCP ConfReq id=3D0xf7 <addr=20
200.39.61.2>]
Feb 21 14:08:29 localhost pppd[2888]: sent [IPCP ConfAck id=3D0xf7 <addr=20
200.39.61.2>]
Feb 21 14:08:31 localhost pppd[2888]: sent [IPCP ConfReq id=3D0x1 <addr=20
0.0.0.0> <compress VJ 0f 01> <ms-dns1 0.0.0.0> <ms-dns3 0.0.0.0>]
Feb 21 14:08:31 localhost pppd[2888]: sent [CCP ConfReq id=3D0x1 <deflate 1=
5>=20
<deflate(old#) 15> <bsd v1 15>]
Feb 21 14:08:31 localhost pppd[2888]: rcvd [IPCP ConfReq id=3D0xf8 <addr=20
200.39.61.2>]
Feb 21 14:08:31 localhost pppd[2888]: sent [IPCP ConfAck id=3D0xf8 <addr=20
200.39.61.2>]
Feb 21 14:08:34 localhost pppd[2888]: sent [IPCP ConfReq id=3D0x1 <addr=20
0.0.0.0> <compress VJ 0f 01> <ms-dns1 0.0.0.0> <ms-dns3 0.0.0.0>]
Feb 21 14:08:34 localhost pppd[2888]: sent [CCP ConfReq id=3D0x1 <deflate 1=
5>=20
<deflate(old#) 15> <bsd v1 15>]
Feb 21 14:08:37 localhost pppd[2888]: sent [IPCP ConfReq id=3D0x1 <addr=20
0.0.0.0> <compress VJ 0f 01> <ms-dns1 0.0.0.0> <ms-dns3 0.0.0.0>]
Feb 21 14:08:37 localhost pppd[2888]: sent [CCP ConfReq id=3D0x1 <deflate 1=
5>=20
<deflate(old#) 15> <bsd v1 15>]
Feb 21 14:08:40 localhost pppd[2888]: sent [IPCP ConfReq id=3D0x1 <addr=20
0.0.0.0> <compress VJ 0f 01> <ms-dns1 0.0.0.0> <ms-dns3 0.0.0.0>]
Feb 21 14:08:40 localhost pppd[2888]: sent [CCP ConfReq id=3D0x1 <deflate 1=
5>=20
<deflate(old#) 15> <bsd v1 15>]
Feb 21 14:08:43 localhost pppd[2888]: sent [LCP TermReq id=3D0x2 "No networ=
k=20
protocols running"]
Feb 21 14:08:46 localhost pppd[2888]: sent [LCP TermReq id=3D0x3 "No networ=
k=20
protocols running"]
Feb 21 14:08:49 localhost pppd[2888]: Connection terminated.
Feb 21 14:08:49 localhost pppd[2888]: Exit.





>From: James Carlson <carlson@workingcode.com>
>To: "Juan Pablo Romero" <jpablo_romero@hotmail.com>
>CC: linux-ppp@vger.kernel.org
>Subject: Re: Problems with ppp
>Date: Sat, 21 Feb 2004 14:41:12 -0500 (EST)
>
>Juan Pablo Romero writes:
> > Feb 21 12:33:58 localhost pppd[2995]: sent [LCP ConfReq id=3D0x1 <async=
map
> > 0x0> <magic 0x90c4467f> <pcomp> <accomp>]
> > Feb 21 12:33:58 localhost pppd[2995]: rcvd [LCP ConfAck id=3D0x1 <async=
map
> > 0x0> <magic 0x90c4467f> <pcomp> <accomp>]
> > Feb 21 12:34:00 localhost pppd[2995]: rcvd [LCP ConfReq id=3D0x44=20
><asyncmap
> > 0xa0000> <auth pap> <magic 0x409e2ccc> <pcomp> <accomp>]
>
>The peer is asking for asyncmap 0xa0000.  Since many systems that do
>that tend to have bugs in ACCM handling, and these bugs could lead to
>connection drops, I recommend adding "asyncmap a0000" to your pppd
>configuration.
>
> > Feb 21 12:34:03 localhost pppd[2995]: sent [IPCP ConfReq id=3D0x1 <addr
> > 0.0.0.0> <compress VJ 0f 01> <ms-dns1 0.0.0.0> <ms-dns3 0.0.0.0>]
>
>The peer is behaving as though it can't hear you once LCP is done
>negotiating.  That's a common symptom when there's an ACCM problem.
>
> > It seems as if my ISP didn't understand the compress/deflate command.
>
>No ... I don't think it can hear you past the LCP exchange at all.  I
>see no evidence there that it was doing anything other than blindly
>sending you packets.  This means there's a low-level communications
>problem.  Such problems can result from ACCM trouble, bad flow
>control, or configuration problems with the modem.  The simplest thing
>to do is to correct the ACCM first.
>
>--
>James Carlson                                  <carlson@workingcode.com>
>-
>To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html

_________________________________________________________________
MSN Fotos: la forma m=E1s f=E1cil de compartir e imprimir fotos. =20
http://photos.msn.es/support/worldwide.aspx

