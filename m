From: James Cameron <james.cameron@hp.com>
Date: Wed, 22 Mar 2006 03:10:53 +0000
Subject: Re: Maximum simultaneous interfaces ppp
Message-Id: <20060322031053.GR3974@hp.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="LyciRD1jyfeSSjG0"
List-Id: <linux-ppp.vger.kernel.org>
References: <441E83BB.1030302@knet.es>
In-Reply-To: <441E83BB.1030302@knet.es>
To: linux-ppp@vger.kernel.org


--LyciRD1jyfeSSjG0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 22, 2006 at 01:50:00PM +1100, Paul Mackerras wrote:
> Julio Rodanes - KNET writes:
> > How many interfaces ppp is possible create with ppp-2.4.2 and kernel
> > 2.4.22 ? Is 100 interfaces ppp the max limit??
>=20
> There is no hard limit, you can create as many as you like within the
> constraints of the amount of memory your machine has.

Are you sure about that, Paul?

2.4.22 net/core/dev.c has a limit of 100 on dev_alloc_name().
2.6.15 net/core/dev.c has a limit of 8*8*PAGE_SIZE.

--=20
James Cameron
http://ftp.hp.com.au/sigs/jc/

--LyciRD1jyfeSSjG0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQFEIMA9IiWKUhK+Mj4RAsO3AJ9N1rgHXqHtO7XDwv+1PIXxoMrl9gCgieRt
p67cmAd83LG8xUwffhkcK+0=
=nZMa
-----END PGP SIGNATURE-----

--LyciRD1jyfeSSjG0--
