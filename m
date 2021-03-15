From: Tom Parkin <tparkin@katalix.com>
Date: Mon, 15 Mar 2021 09:57:54 +0000
Subject: Re: Re: [BUG] net/ppp: A use after free in ppp_unregister_channe
Message-Id: <20210315095754.GA4219@katalix.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="/9DWx/yDrRhgMJTb"
List-Id: <linux-ppp.vger.kernel.org>
References: <6057386d.ca12.1782148389e.Coremail.lyl2019@mail.ustc.edu.cn>
 <20210312101258.GA4951@katalix.com>
 <2ad7aaa2.fcad.17826e87afb.Coremail.lyl2019@mail.ustc.edu.cn>
In-Reply-To: <2ad7aaa2.fcad.17826e87afb.Coremail.lyl2019@mail.ustc.edu.cn>
To: lyl2019@mail.ustc.edu.cn
Cc: paulus@samba.org, davem@davemloft.net, linux-ppp@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org


--/9DWx/yDrRhgMJTb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On  Fri, Mar 12, 2021 at 22:47:53 +0800, lyl2019@mail.ustc.edu.cn wrote:
>=20
>=20
>=20
> > -----=E5=8E=9F=E5=A7=8B=E9=82=AE=E4=BB=B6-----
> > =E5=8F=91=E4=BB=B6=E4=BA=BA: "Tom Parkin" <tparkin@katalix.com>
> > =E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4: 2021-03-12 18:12:58 (=E6=98=9F=E6=
=9C=9F=E4=BA=94)
> > =E6=94=B6=E4=BB=B6=E4=BA=BA: lyl2019@mail.ustc.edu.cn
> > =E6=8A=84=E9=80=81: paulus@samba.org, davem@davemloft.net, linux-ppp@vg=
er.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
> > =E4=B8=BB=E9=A2=98: Re: [BUG] net/ppp: A use after free in ppp_unregist=
er_channe
> >=20
> > Thanks for the report!
> >=20
> > On  Thu, Mar 11, 2021 at 20:34:44 +0800, lyl2019@mail.ustc.edu.cn wrote:
> > > File: drivers/net/ppp/ppp_generic.c
> > >=20
> > > In ppp_unregister_channel, pch could be freed in ppp_unbridge_channel=
s()
> > > but after that pch is still in use. Inside the function ppp_unbridge_=
channels,
> > > if "pchbb =3D=3D pch" is true and then pch will be freed.
> >=20
> > Do you have a way to reproduce a use-after-free scenario?
> >=20
> > From static analysis I'm not sure how pch would be freed in
> > ppp_unbridge_channels when called via. ppp_unregister_channel.
> >=20
> > In theory (at least!) the caller of ppp_register_net_channel holds=20
> > a reference on struct channel which ppp_unregister_channel drops.
> >=20
> > Each channel in a bridged pair holds a reference on the other.
> >=20
> > Hence on return from ppp_unbridge_channels, the channel should not have
> > been freed (in this code path) because the ppp_register_net_channel
> > reference has not yet been dropped.
> >=20
> > Maybe there is an issue with the reference counting or a race of some
> > sort?
> >=20
> > > I checked the commit history and found that this problem is introduce=
d from
> > > 4cf476ced45d7 ("ppp: add PPPIOCBRIDGECHAN and PPPIOCUNBRIDGECHAN ioct=
ls").
> > >=20
> > > I have no idea about how to generate a suitable patch, sorry.
>=20
> This issue was reported by a path-sensitive static analyzer developed by =
our Lab,
> thus i have not a crash or bug log.

Does the analyzer report the sequence of events that lead to a
possible use-after-free?   Is it starting from the assumption that
ppp_unbridge_channels is called with pch->file.refcnt =3D=3D 1?

> As the return type of ppp_unbridge_channels() is a int, can we return a v=
alue to
> inform caller that the channel is freed?

If ppp_unbridge_channels frees the channel in the
ppp_unregister_channel call path, that implies that
ppp_unregister_channel is called when only the bridge is keeping the
channel alive.  So the caller is attempting to drop a reference it
doesn't in fact have.

It might be preferable to defensively code against that possibility of
course.

--/9DWx/yDrRhgMJTb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEsUkgyDzMwrj81nq0lIwGZQq6i9AFAmBPL54ACgkQlIwGZQq6
i9AyuggAr4h5Rb/mILMnt6v4Gc3RZ9yannFHesdENxrWQxNjeEvMT7av2t77lqQJ
DR+DBxMluf+gcEmEIPHgwx0OeiNCY8CB9tE1HXLG/r8pVnjqJyL4GjQO8BdaSRPt
s0odEAJXhlxcwrBBVXYwkWdILbDIF6cZRyjc3lX1WNsNNSumhMl2XSZ8rxYz03Gi
DnDoM8ODo6zhKMMNSaAJv8p7WhFEUpdM3KcUJZbRmZaf8fodSeTok45L2lItSMp8
l2FSVWW8Laexx/wjX5HTru5SffQze6je3qJY5fG+BTMvpW97/PHou9Rn+HrAc7RM
Is5uP7fllO/TSXSiHxAb9MJKkGDiJw==
=GwFI
-----END PGP SIGNATURE-----

--/9DWx/yDrRhgMJTb--
