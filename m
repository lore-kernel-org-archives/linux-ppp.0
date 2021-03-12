From: Tom Parkin <tparkin@katalix.com>
Date: Fri, 12 Mar 2021 10:12:58 +0000
Subject: Re: [BUG] net/ppp: A use after free in ppp_unregister_channe
Message-Id: <20210312101258.GA4951@katalix.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Dxnq1zWXvFF0Q93v"
List-Id: <linux-ppp.vger.kernel.org>
References: <6057386d.ca12.1782148389e.Coremail.lyl2019@mail.ustc.edu.cn>
In-Reply-To: <6057386d.ca12.1782148389e.Coremail.lyl2019@mail.ustc.edu.cn>
To: lyl2019@mail.ustc.edu.cn
Cc: paulus@samba.org, davem@davemloft.net, linux-ppp@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org


--Dxnq1zWXvFF0Q93v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Thanks for the report!

On  Thu, Mar 11, 2021 at 20:34:44 +0800, lyl2019@mail.ustc.edu.cn wrote:
> File: drivers/net/ppp/ppp_generic.c
>=20
> In ppp_unregister_channel, pch could be freed in ppp_unbridge_channels()
> but after that pch is still in use. Inside the function ppp_unbridge_chan=
nels,
> if "pchbb =3D=3D pch" is true and then pch will be freed.

Do you have a way to reproduce a use-after-free scenario?

=46rom static analysis I'm not sure how pch would be freed in
ppp_unbridge_channels when called via. ppp_unregister_channel.

In theory (at least!) the caller of ppp_register_net_channel holds=20
a reference on struct channel which ppp_unregister_channel drops.

Each channel in a bridged pair holds a reference on the other.

Hence on return from ppp_unbridge_channels, the channel should not have
been freed (in this code path) because the ppp_register_net_channel
reference has not yet been dropped.

Maybe there is an issue with the reference counting or a race of some
sort?

> I checked the commit history and found that this problem is introduced fr=
om
> 4cf476ced45d7 ("ppp: add PPPIOCBRIDGECHAN and PPPIOCUNBRIDGECHAN ioctls").
>=20
> I have no idea about how to generate a suitable patch, sorry.

--Dxnq1zWXvFF0Q93v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEsUkgyDzMwrj81nq0lIwGZQq6i9AFAmBLPqIACgkQlIwGZQq6
i9BImgf/VhpowGVVPkfWqgkYkfOsWZfxmDueUkeoSFD2dVhLeTNU/jnOGI400Cc0
Yk+sEFL4fqmjZPjsjIGBlhdpndQJbW+yCKh+G/xmU9ynd9xe+0KrP0WpToJ5Dd3+
1aCU4n1y5h8MhP6i0BuFe4KQ7K0SSIoSqubAyAF56bHp15arsHGaFB5clBQwy/Nj
LBW4St5DNAOQTc9heT+s+rhC6LSzXJgz9URaGkwbPtFuFIYmkloFvTRwqC3YJGCQ
OKF6B3w3uow6gxIX/K3MSRsrDiktsYRNiK1jqOM7l8Jm9qP1EaarbqdCN7W5RhBk
GecNJWitncHg1zyx+SvpFTVJbxjxYA==
=npR2
-----END PGP SIGNATURE-----

--Dxnq1zWXvFF0Q93v--
