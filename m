From: Bill Unruh <unruh@physics.ubc.ca>
Date: Sat, 21 Feb 2004 22:45:05 +0000
Subject: Re: Problems with ppp
Message-Id: <Pine.LNX.4.50.0402211441450.30102-100000@string.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <BAY15-F30oYAPNXRPmc0000689e@hotmail.com>
In-Reply-To: <BAY15-F30oYAPNXRPmc0000689e@hotmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

On Sat, 21 Feb 2004, Juan Pablo Romero wrote:

> Hi,
>=20
> I recently upgraded my system to mandrake 9.2. Before that, I had no=20
> problems  with my modem (mdk 9.1). But now I can't connect.  Also, Window=
s=20
> XP can connect fine in the same machne.
>=20
> Here is a fragment from /var/log/daemons/info:
>=20
>=20
> Feb 21 12:34:00 localhost pppd[2995]: sent [IPCP ConfReq id=3D0x1 <addr=20
> 0.0.0.0> <compress VJ 0f 01> <ms-dns1 0.0.0.0> <ms-dns3 0.0.0.0>]
> Feb 21 12:34:00 localhost pppd[2995]: sent [CCP ConfReq id=3D0x1 <deflate=
 15>=20
> <deflate(old#) 15> <bsd v1 15>]
> Feb 21 12:34:00 localhost pppd[2995]: rcvd [IPCP ConfReq id=3D0x24 <addr =

> 148.246.32.6>]
> Feb 21 12:34:00 localhost pppd[2995]: sent [IPCP ConfAck id=3D0x24 <addr =

> 148.246.32.6>]

Many repetitions of the above.

>=20
>=20
> It seems as if my ISP didn't understand the compress/deflate command.

Almost certainly he does not. The only systems that understand it are
other Linux systems.=20
Put in the option noccp and see if that helps.=20

Otherwise the far side is sick. It seems to have gotten stuck. It never
responds to your address request, and keeps repeating his own address
request. He is broken.=20

But it may be that your ccp request drove him mad, and started him
babbling. So try not making that request.=20
echo noccp >>/etc/ppp/options


>=20
> My setup:
> mandrake 9.2
> Modem: Intel 536EP
>=20
> Thanks in advance.
>=20
>=20
>    Juan Pablo
>=20
> _________________________________________________________________
> MSN Fotos: la forma m=E1s f=E1cil de compartir e imprimir fotos. =20
> http://photos.msn.es/support/worldwide.aspx
>=20
> -
> To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20

--=20
William G. Unruh   |  Canadian Institute for|     Tel: +1(604)822-3273
Physics&Astronomy  |     Advanced Research  |     Fax: +1(604)822-5324
UBC, Vancouver,BC  |   Program in Cosmology |     unruh@physics.ubc.ca
Canada V6T 1Z1     |      and Gravity       |  www.theory.physics.ubc.ca/
