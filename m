From: Tom Parkin <tparkin@katalix.com>
Date: Mon, 15 Mar 2021 16:58:07 +0000
Subject: Re: Re: [BUG] net/ppp: A use after free in ppp_unregister_channe
Message-Id: <20210315165807.GB4219@katalix.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="U+BazGySraz5kW0T"
List-Id: <linux-ppp.vger.kernel.org>
References: <6057386d.ca12.1782148389e.Coremail.lyl2019@mail.ustc.edu.cn>
 <20210312101258.GA4951@katalix.com>
 <2ad7aaa2.fcad.17826e87afb.Coremail.lyl2019@mail.ustc.edu.cn>
 <20210315121824.GC4296@linux.home>
In-Reply-To: <20210315121824.GC4296@linux.home>
To: Guillaume Nault <gnault@redhat.com>
Cc: lyl2019@mail.ustc.edu.cn, paulus@samba.org, davem@davemloft.net, linux-ppp@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org


--U+BazGySraz5kW0T
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On  Mon, Mar 15, 2021 at 13:18:24 +0100, Guillaume Nault wrote:
> On Fri, Mar 12, 2021 at 10:47:53PM +0800, lyl2019@mail.ustc.edu.cn wrote:
> >=20
> >=20
> >=20
> > > -----=E5=8E=9F=E5=A7=8B=E9=82=AE=E4=BB=B6-----
> > > =E5=8F=91=E4=BB=B6=E4=BA=BA: "Tom Parkin" <tparkin@katalix.com>
> > > =E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4: 2021-03-12 18:12:58 (=E6=98=9F=
=E6=9C=9F=E4=BA=94)
> > > =E6=94=B6=E4=BB=B6=E4=BA=BA: lyl2019@mail.ustc.edu.cn
> > > =E6=8A=84=E9=80=81: paulus@samba.org, davem@davemloft.net, linux-ppp@=
vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
> > > =E4=B8=BB=E9=A2=98: Re: [BUG] net/ppp: A use after free in ppp_unregi=
ster_channe
> > >=20
> > > Thanks for the report!
> > >=20
> > > On  Thu, Mar 11, 2021 at 20:34:44 +0800, lyl2019@mail.ustc.edu.cn wro=
te:
> > > > File: drivers/net/ppp/ppp_generic.c
> > > >=20
> > > > In ppp_unregister_channel, pch could be freed in ppp_unbridge_chann=
els()
> > > > but after that pch is still in use. Inside the function ppp_unbridg=
e_channels,
> > > > if "pchbb =3D=3D pch" is true and then pch will be freed.
> > >=20
> > > Do you have a way to reproduce a use-after-free scenario?
> > >=20
> > > From static analysis I'm not sure how pch would be freed in
> > > ppp_unbridge_channels when called via. ppp_unregister_channel.
> > >=20
> > > In theory (at least!) the caller of ppp_register_net_channel holds=20
> > > a reference on struct channel which ppp_unregister_channel drops.
> > >=20
> > > Each channel in a bridged pair holds a reference on the other.
> > >=20
> > > Hence on return from ppp_unbridge_channels, the channel should not ha=
ve
> > > been freed (in this code path) because the ppp_register_net_channel
> > > reference has not yet been dropped.
> > >=20
> > > Maybe there is an issue with the reference counting or a race of some
> > > sort?
> > >=20
> > > > I checked the commit history and found that this problem is introdu=
ced from
> > > > 4cf476ced45d7 ("ppp: add PPPIOCBRIDGECHAN and PPPIOCUNBRIDGECHAN io=
ctls").
> > > >=20
> > > > I have no idea about how to generate a suitable patch, sorry.
> >=20
> > This issue was reported by a path-sensitive static analyzer developed b=
y our Lab,
> > thus i have not a crash or bug log.
> >=20
> > As the return type of ppp_unbridge_channels() is a int, can we return a=
 value to
> > inform caller that the channel is freed?
>=20
> I don't think this is going to improve anything, as
> ppp_unregister_channel() couldn't take any corrective action anyway.

I agree with you to be honest.

I think the best ppp_unregister_channel could to is to not access pch
again.

--U+BazGySraz5kW0T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEsUkgyDzMwrj81nq0lIwGZQq6i9AFAmBPkhoACgkQlIwGZQq6
i9C9gAf+NWk49iQsQ4+pfR9zG6KjemYbHwxc/Xw1DEFIoDAeAXaSPeYjtR7aG56c
rdLaRF4upKo+EegZhgZk7rD6P/MuHHqM2xilJ/BX+QL+ZgDxGg+JtLLGC0wFb1fC
GoJJmA1NeIeglKbYjZhLb6wI+znka5TDK81FzKVAFwaweAgpsQ1oIpsSO5NbKSlF
XZDsKd5t8V1NEIcqrdZpeKApvITAA8LgGk/vUTj8f+BaLnwM+4sBf9El0L4kCP8m
SXkFizdQcmfVhhPmE0pJ1ODRWV+3nVVQBjUM7UCQjkmRcDi9KGywiaVCXihUkMv4
sPfGVHRzYDW32aGqq2j+u0shTMXHqA==
=Vwa0
-----END PGP SIGNATURE-----

--U+BazGySraz5kW0T--
