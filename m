From: walter harms <wharms@bfs.de>
Date: Tue, 12 Oct 2010 14:31:21 +0000
Subject: Re: Using PPPD pty option and script: controlling stdin buffer size?
Message-Id: <4CB47139.60200@bfs.de>
List-Id: <linux-ppp.vger.kernel.org>
References: <291B2C7721AC7B49AD11449A2883992E2E0DF561DB@SINTEFEXMBX01.sintef.no>
In-Reply-To: <291B2C7721AC7B49AD11449A2883992E2E0DF561DB@SINTEFEXMBX01.sintef.no>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

I am not sure if i understand you correctly,
but can change the bufferhandling of stdio by setting the buffer size
using setbuf() (man 3 setbuf)

re,
 wh


Arne Lie schrieb:
> Hi,
>=20
> We have a HW/SW set-up using Linux PPP over slow links, and have recently=
 abandoned a solution with a dedicated kernel module driver for our specifi=
c hardware, and are now trying a pure user-mode solution using the pty opti=
on in pppd. Most if its performance is quite OK, but we see that we do not =
have complete control of the buffering along the packet signal path. From t=
he PPPD MAN page it says that pty script starts a pseudo-tty instance, and =
that our script shall read data from it as it was from stdin using read(0,.=
..). THIS WORKS. HOWEVER, since our link is slow we have implemented flow c=
ontrol, and in periods we do not read from stdio. In that period data build=
s up in stdio, but we see no sigh of data being dropped in the ppp0 interfa=
ce queue (which is set to 3 packets as is the default value).=20
>=20
> Question: It seems that the stdin interface has a large buffer, much larg=
er than we appreciate. Is there any way we can configure its size, making i=
t smaller?
>=20
> Best regards,
>=20
>=20
> Arne Lie
> SINTEF ICT, Dept. of Communication Systems
> NO-7465 Trondheim, NORWAY
> Dir. phone +47 73 59 27 03 - mobile +47 450 20 040
> e-mail: arne.lie@sintef.no=20
>=20
> N=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BDr=EF=BF=BD=EF=BF=BDy=EF=BF=
=BD=EF=BF=BD=EF=BF=BDb=EF=BF=BDX=EF=BF=BD=EF=BF=BD=C7=A7v=EF=BF=BD^=EF=BF=
=BD)=DE=BA{.n=EF=BF=BD+=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD{=EF=BF=BD=EF=BF=
=BD=EF=BF=BDb=EF=BF=BD=EF=BF=BD^n=EF=BF=BDr=EF=BF=BD=EF=BF=BDz=EF=BF=BD=1A=
=EF=BF=BD=EF=BF=BDh=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD&=EF=BF=BD=EF=BF=BD=
=1E=EF=BF=BDG=EF=BF=BD=EF=BF=BD=EF=BF=BDh=EF=BF=BD=03(=EF=BF=BD=E9=9A=8E=EF=
=BF=BD=DD=A2j"=EF=BF=BD=EF=BF=BD=1A=EF=BF=BD=1Bm=EF=BF=BD=EF=BF=BD=EF=BF=BD=
=EF=BF=BD=EF=BF=BDz=EF=BF=BD=DE=96=EF=BF=BD=EF=BF=BD=EF=BF=BDf=EF=BF=BD=EF=
=BF=BD=EF=BF=BDh=EF=BF=BD=EF=BF=BD=EF=BF=BD~=EF=BF=BDmml=3D
