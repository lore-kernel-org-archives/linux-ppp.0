From: James Cameron <james.cameron@hp.com>
Date: Wed, 22 Mar 2006 05:44:06 +0000
Subject: Re: Maximum simultaneous interfaces ppp
Message-Id: <20060322054406.GZ3974@hp.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="jy6Sn24JjFx/iggw"
List-Id: <linux-ppp.vger.kernel.org>
References: <441E83BB.1030302@knet.es>
In-Reply-To: <441E83BB.1030302@knet.es>
To: linux-ppp@vger.kernel.org


--jy6Sn24JjFx/iggw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 22, 2006 at 02:39:59PM +1100, Paul Mackerras wrote:
> ppp_generic.c doesn't use dev_alloc_name, it uses its own allocator
> for unit numbers.

Ah, I see, thanks.  Cardmap, neat.

This is great, I can get rid of some old urban legends in the PPTP
projects that claim that dev_alloc_name needs to be fixed.  People still
bring it up, so I'll begin denying the need.

I've certainly tested between 500 and 1000 interfaces on 2.6.15.

--=20
James Cameron
http://ftp.hp.com.au/sigs/jc/

--jy6Sn24JjFx/iggw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQFEIOQmIiWKUhK+Mj4RAg5lAJ0Sxp/WLQ2r4SVke61Glsdn4heU9QCfQHdX
kJcqgtarXQ78YjV5wWu2GAg=
=Bqi9
-----END PGP SIGNATURE-----

--jy6Sn24JjFx/iggw--
