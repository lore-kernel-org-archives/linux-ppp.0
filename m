From: Mohan V <mohanv@aftek.com>
Date: Wed, 15 Dec 2004 14:17:32 +0000
Subject: usb-serial and PPP
Message-Id: <41C044AC.2020304@aftek.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

Hello all,

I am using Triton board with linux-2.4.19-rmk7-pxa1. I am using=20
usb-serial driver to get the ppp interface on the board. On the host=20
(Mandrake 10, 2.6.3 kernel), I am using the MPPP client for dialing.

I give the command on the host and I get the following:

mppp -quit 0

Initializing Modem ...mppp.c(2113): Attempt:   1
mppp.c(2144): modbuf=3DATZ
mppp.c(2180): Found what we expected=3DOK
initialized
Dialing 1111111, Speed 9600 ...mppp.c(2113): Attempt:   1
mppp.c(2144): modbuf=3DATX4DT1111111
mppp.c(2144): modbuf=CARRIER
mppp.c(2144): modbufmppp.c(2180): Found what we expected=3DCONNECT
 -done-
Initiating send-expect sequence ... -done-
Negotiating ppp handshake...
mppp.c(1129): smpppd->pppd-args=3Dnoauth nodefaultroute passive debug=20
nocrtscts noccp nomp nocdtrcts -detach
mppp.c(1140): pppd args taken from cfg file
mppp.c(1189): pppd id263
mppp.c(1930): All Happy!!!!!!!!!!!!  -done-

Connected! (Number 1111111) (Baud 9600)
mppp.c(1971): g_quit=3D1
mppp.c(1974): g_quit_time=3D0, exiting in 5 seconds

using channel 1
Using interface ppp0
Connect: ppp0 <--> /dev/usb/acm/0
Looking for secret in /etc/ppp/pap-secrets for client mohan server (null)
Looking for secret in /etc/ppp/chap-secrets for client mohan server (null)
sent [LCP ConfReq id=3D0x1 <asyncmap 0x0> <magic 0xb9a13aff> <pcomp> <accom=
p>]
sent [LCP ConfReq id=3D0x1 <asyncmap 0x0> <magic 0xb9a13aff> <pcomp> <accom=
p>]
sent [LCP ConfReq id=3D0x1 <asyncmap 0x0> <magic 0xb9a13aff> <pcomp> <accom=
p>]
sent [LCP ConfReq id=3D0x1 <asyncmap 0x0> <magic 0xb9a13aff> <pcomp> <accom=
p>]
sent [LCP ConfReq id=3D0x1 <asyncmap 0x0> <magic 0xb9a13aff> <pcomp> <accom=
p>]
sent [LCP ConfReq id=3D0x1 <asyncmap 0x0> <magic 0xb9a13aff> <pcomp> <accom=
p>]
sent [LCP ConfReq id=3D0x1 <asyncmap 0x0> <magic 0xb9a13aff> <pcomp> <accom=
p>]
sent [LCP ConfReq id=3D0x1 <asyncmap 0x0> <magic 0xb9a13aff> <pcomp> <accom=
p>]
sent [LCP ConfReq id=3D0x1 <asyncmap 0x0> <magic 0xb9a13aff> <pcomp> <accom=
p>]
sent [LCP ConfReq id=3D0x1 <asyncmap 0x0> <magic 0xb9a13aff> <pcomp> <accom=
p>]
LCP: timeout sending Config-Requests

On the device side, I am using an application, which on receiving ATDT=20
command starts the pppd with the following options:
pppd /dev/usbser 192.168.100.1: 192.168.100.2 9600 noccp nomp -detach=20
nocrtscts nocdtrcts noauth proxyarp passive debug
I am getting the following messages:

using channel 1
Using interface ppp0
Connect: ppp0 <--> /dev/usbser
sent [LCP ConfReq id=3D0x1 <asyncmap 0x0> <magic 0xca162569> <pcomp> <accom=
p>
sent [LCP ConfReq id=3D0x1 <asyncmap 0x0> <magic 0xca162569> <pcomp> <accom=
p>
sent [LCP ConfReq id=3D0x1 <asyncmap 0x0> <magic 0xca162569> <pcomp> <accom=
p>
sent [LCP ConfReq id=3D0x1 <asyncmap 0x0> <magic 0xca162569> <pcomp> <accom=
p>
sent [LCP ConfReq id=3D0x1 <asyncmap 0x0> <magic 0xca162569> <pcomp> <accom=
p>
sent [LCP ConfReq id=3D0x1 <asyncmap 0x0> <magic 0xca162569> <pcomp> <accom=
p>
sent [LCP ConfReq id=3D0x1 <asyncmap 0x0> <magic 0xca162569> <pcomp> <accom=
p>
sent [LCP ConfReq id=3D0x1 <asyncmap 0x0> <magic 0xca162569> <pcomp> <accom=
p>
sent [LCP ConfReq id=3D0x1 <asyncmap 0x0> <magic 0xca162569> <pcomp> <accom=
p>
sent [LCP ConfReq id=3D0x1 <asyncmap 0x0> <magic 0xca162569> <pcomp> <accom=
p>

LCP: timeout sending Config-Requests

If i do ifconfig I get the ppp0 interface but with no inet and P-to-P=20
address.

Thanks for ur time.

regards,
mohan


