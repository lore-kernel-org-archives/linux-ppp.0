From: Arkadiusz Miskiewicz <arekm@pld-linux.org>
Date: Thu, 25 Nov 2004 15:44:29 +0000
Subject: Re: some change in ppp 2.4.3: tcflush failed: Bad file descriptor
Message-Id: <200411251644.30220.arekm@pld-linux.org>
List-Id: <linux-ppp.vger.kernel.org>
References: <200411231157.43347.arekm@pld-linux.org>
In-Reply-To: <200411231157.43347.arekm@pld-linux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

On Tuesday 23 of November 2004 17:06, James Carlson wrote:
> Arkadiusz Miskiewicz writes:
> > Nov 18 16:00:25 arm pppd[17641]: Using interface ppp0
> > Nov 18 16:00:25 arm pppd[17641]: Connect: ppp0 <--> /dev/pts/12
> > Nov 18 16:00:56 arm pppd[17641]: LCP terminated by peer
> > Nov 18 16:00:59 arm pppd[17641]: Connection terminated.
>
> Try running with debug enabled.  The 'LCP terminated by peer' message
> indicates that something went wrong when trying to negotiate with the
> peer system.  Perhaps there's an authentication problem.
Nov 24 12:19:10 arm pppd[5447]: Connect: ppp0 <--> /dev/pts/65
Nov 24 12:19:11 arm pppd[5447]: sent [LCP ConfReq id=3D0x3c <asyncmap 0x0> =
<magic 0xf68ca3b4> <pcomp> <accomp>]
Nov 24 12:19:14 arm pppd[5447]: sent [LCP ConfReq id=3D0x3c <asyncmap 0x0> =
<magic 0xf68ca3b4> <pcomp> <accomp>]
Nov 24 12:19:18 arm pppd[5447]: sent [LCP ConfReq id=3D0x3c <asyncmap 0x0> =
<magic 0xf68ca3b4> <pcomp> <accomp>]
Nov 24 12:19:21 arm pppd[5447]: sent [LCP ConfReq id=3D0x3c <asyncmap 0x0> =
<magic 0xf68ca3b4> <pcomp> <accomp>]
Nov 24 12:19:25 arm pppd[5447]: sent [LCP ConfReq id=3D0x3c <asyncmap 0x0> =
<magic 0xf68ca3b4> <pcomp> <accomp>]
Nov 24 12:19:28 arm pppd[5447]: sent [LCP ConfReq id=3D0x3c <asyncmap 0x0> =
<magic 0xf68ca3b4> <pcomp> <accomp>]
Nov 24 12:19:32 arm pppd[5447]: sent [LCP ConfReq id=3D0x3c <asyncmap 0x0> =
<magic 0xf68ca3b4> <pcomp> <accomp>]
Nov 24 12:19:36 arm pppd[5447]: sent [LCP ConfReq id=3D0x3c <asyncmap 0x0> =
<magic 0xf68ca3b4> <pcomp> <accomp>]
Nov 24 12:19:39 arm pppd[5447]: sent [LCP ConfReq id=3D0x3c <asyncmap 0x0> =
<magic 0xf68ca3b4> <pcomp> <accomp>]
Nov 24 12:19:40 arm pppd[5447]: rcvd [LCP ConfReq id=3D0xab <mru 9178> <aut=
h chap MD5> <magic 0x7efec34d>]
Nov 24 12:19:40 arm pppd[5447]: sent [LCP ConfNak id=3D0xab <auth pap>]
Nov 24 12:19:40 arm pppd[5447]: rcvd [LCP ConfAck id=3D0x3c <asyncmap 0x0> =
<magic 0xf68ca3b4> <pcomp> <accomp>]
Nov 24 12:19:40 arm pppd[5447]: rcvd [LCP ConfReq id=3D0xac <mru 9178> <aut=
h chap MD5> <magic 0x7efec34d>]
Nov 24 12:19:40 arm pppd[5447]: sent [LCP ConfNak id=3D0xac <auth pap>]
Nov 24 12:19:40 arm pppd[5447]: rcvd [LCP ConfAck id=3D0x3c <asyncmap 0x0> =
<magic 0xf68ca3b4> <pcomp> <accomp>]
Nov 24 12:19:40 arm pppd[5447]: rcvd [LCP ConfReq id=3D0xad <mru 9178> <aut=
h chap MD5> <magic 0x7efec34d>]
Nov 24 12:19:40 arm pppd[5447]: sent [LCP ConfNak id=3D0xad <auth pap>]
Nov 24 12:19:40 arm pppd[5447]: rcvd [LCP ConfAck id=3D0x3c <asyncmap 0x0> =
<magic 0xf68ca3b4> <pcomp> <accomp>]
Nov 24 12:19:40 arm pppd[5447]: rcvd [LCP ConfReq id=3D0xae <mru 9178> <aut=
h chap MD5> <magic 0x7efec34d>]
Nov 24 12:19:40 arm pppd[5447]: sent [LCP ConfNak id=3D0xae <auth pap>]
Nov 24 12:19:40 arm pppd[5447]: rcvd [LCP ConfAck id=3D0x3c <asyncmap 0x0> =
<magic 0xf68ca3b4> <pcomp> <accomp>]
Nov 24 12:19:40 arm pppd[5447]: rcvd [LCP ConfReq id=3D0xaf <mru 9178> <aut=
h chap MD5> <magic 0x7efec34d>]
Nov 24 12:19:40 arm pppd[5447]: sent [LCP ConfNak id=3D0xaf <auth pap>]
Nov 24 12:19:40 arm pppd[5447]: rcvd [LCP ConfReq id=3D0xb0 <mru 9178> <aut=
h chap MD5> <magic 0x7efec34d>]
Nov 24 12:19:40 arm pppd[5447]: sent [LCP ConfRej id=3D0xb0 <auth chap MD5>]
Nov 24 12:19:40 arm pppd[5447]: rcvd [LCP ConfAck id=3D0x3c <asyncmap 0x0> =
<magic 0xf68ca3b4> <pcomp> <accomp>]
Nov 24 12:19:41 arm pppd[5447]: rcvd [LCP ConfReq id=3D0xb1 <mru 9178> <aut=
h chap MD5> <magic 0x7efec34d>]
Nov 24 12:19:41 arm pppd[5447]: sent [LCP ConfRej id=3D0xb1 <auth chap MD5>]
Nov 24 12:19:41 arm pppd[5447]: rcvd [LCP ConfAck id=3D0x3c <asyncmap 0x0> =
<magic 0xf68ca3b4> <pcomp> <accomp>]
Nov 24 12:19:41 arm pppd[5447]: rcvd [LCP ConfReq id=3D0xb2 <mru 9178> <aut=
h chap MD5> <magic 0x7efec34d>]
Nov 24 12:19:41 arm pppd[5447]: sent [LCP ConfRej id=3D0xb2 <auth chap MD5>]
Nov 24 12:19:41 arm pppd[5447]: rcvd [LCP ConfAck id=3D0x3c <asyncmap 0x0> =
<magic 0xf68ca3b4> <pcomp> <accomp>]
Nov 24 12:19:41 arm pppd[5447]: rcvd [LCP ConfReq id=3D0xb3 <mru 9178> <aut=
h chap MD5> <magic 0x7efec34d>]
Nov 24 12:19:41 arm pppd[5447]: sent [LCP ConfRej id=3D0xb3 <auth chap MD5>]
Nov 24 12:19:41 arm pppd[5447]: rcvd [LCP ConfAck id=3D0x3c <asyncmap 0x0> =
<magic 0xf68ca3b4> <pcomp> <accomp>]
Nov 24 12:19:41 arm pppd[5447]: rcvd [LCP ConfReq id=3D0xb4 <mru 9178> <aut=
h chap MD5> <magic 0x7efec34d>]
Nov 24 12:19:41 arm pppd[5447]: sent [LCP ConfRej id=3D0xb4 <auth chap MD5>]
Nov 24 12:19:41 arm pppd[5447]: rcvd [LCP ConfReq id=3D0xb5 <mru 9178> <mag=
ic 0x7efec34d>]
Nov 24 12:19:41 arm pppd[5447]: sent [LCP ConfAck id=3D0xb5 <mru 9178> <mag=
ic 0x7efec34d>]
Nov 24 12:19:41 arm pppd[5447]: sent [LCP EchoReq id=3D0x0 magic=3D0xf68ca3=
b4]
Nov 24 12:19:41 arm pppd[5447]: sent [CCP ConfReq id=3D0x3c <deflate 15> <d=
eflate(old#) 15> <bsd v1 15>]
Nov 24 12:19:41 arm pppd[5447]: sent [IPCP ConfReq id=3D0x3e <compress VJ 0=
f 01> <addr 83.27.15.78> <ms-dns1 0.0.0.0> <ms-dns3 0.0.0.0>]
Nov 24 12:19:41 arm pppd[5447]: rcvd [LCP TermReq id=3D0xb6]
Nov 24 12:19:41 arm pppd[5447]: LCP terminated by peer
Nov 24 12:19:41 arm pppd[5447]: sent [LCP TermAck id=3D0xb6]
Nov 24 12:19:44 arm pppd[5447]: Connection terminated.
Nov 24 12:19:44 arm pppd[5447]: tcflush failed: Bad file descriptor
Nov 24 12:19:44 arm pppd[5447]: using channel 197
Nov 24 12:19:44 arm pppd[5447]: Using interface ppp0
Nov 24 12:19:45 arm pppd[5447]: Connect: ppp0 <--> /dev/pts/66
Nov 24 12:19:46 arm pppd[5447]: sent [LCP ConfReq id=3D0x3d <asyncmap 0x0> =
<magic 0x688721d3> <pcomp> <accomp>]
Nov 24 12:19:49 arm pppd[5447]: sent [LCP ConfReq id=3D0x3d <asyncmap 0x0> =
<magic 0x688721d3> <pcomp> <accomp>]

> > With 2.4.2 there was no problem with ,,tcflush failed: Bad file
> > descriptor'' on the same kernel.
>
> I've seen it before, but I don't think it's actually harmful.
Well, after such disconnect new pppd runs pppoa -I eth1 multiple times
without killing old one and this causes huge load (it's hard to do anything
on the system then). Old, not killed pppoa processes reports multiple
Nov 25 16:18:15 arm pppoa[6387]: Packet not from driver (mac:  0:60:4c:41:5=
3:74)
Nov 25 16:18:15 arm pppoa[6387]: Packet not from driver (mac:  0:60:4c:41:5=
3:74)
Nov 25 16:18:15 arm pppoa[6328]: Packet not from driver (mac:  0:60:4c:41:5=
3:74)
Nov 25 16:18:15 arm pppoa[6328]: Packet not from driver (mac:  0:60:4c:41:5=
3:74)

Shouldn't pppd kill old pty "command" before running new one?

--=20
Arkadiusz Mi=B6kiewicz                    PLD/Linux Team
http://www.t17.ds.pwr.wroc.pl/~misiek/  http://ftp.pld-linux.org/
