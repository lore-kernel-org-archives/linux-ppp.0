From: md@Linux.IT (Marco d'Itri)
Date: Tue, 25 Jul 2006 11:31:53 +0000
Subject: Re: ppp 2.4.4 eap-tls patch
Message-Id: <20060725113152.GA14762@wonderland.linux.it>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="BOKacYhQ+x31HxR3"
List-Id: <linux-ppp.vger.kernel.org>
References: <44C5F014.40202@gmail.com>
In-Reply-To: <44C5F014.40202@gmail.com>
To: linux-ppp@vger.kernel.org


--BOKacYhQ+x31HxR3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jul 25, James Cameron <james.cameron@hp.com> wrote:

> You've used OpenSSL, which has a license that is not altogether open,
> specifically clause 6 which requires acknowledgement.  Is there any
> reason why you couldn't use MatrixSSL?
I would hate to see EAP-TLS depend on a niche license.
I do not think I would enable EAP-TLS in the Debian package in this case
since it would require pulling the MatrixSSL package in the base system.

If you do not like the advertisement clause in the OpenSSL license there
is libgnutls which is LGPL'ed and widely used (and has a sane API...).

--=20
ciao,
Marco

--BOKacYhQ+x31HxR3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (GNU/Linux)

iD8DBQFExgEoFGfw2OHuP7ERAki7AJ9oXDq/qNXoM0z8i+pQqg8TwTgO7gCdFLos
hUZ3QDonXvgRK71vcYzPzDQ=
=cKtc
-----END PGP SIGNATURE-----

--BOKacYhQ+x31HxR3--
