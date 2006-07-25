From: James Cameron <james.cameron@hp.com>
Date: Tue, 25 Jul 2006 23:03:08 +0000
Subject: Re: ppp 2.4.4 eap-tls patch
Message-Id: <20060725230308.GA5193@hp.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="EVF5PPMfhYS0aIcm"
List-Id: <linux-ppp.vger.kernel.org>
References: <44C5F014.40202@gmail.com>
In-Reply-To: <44C5F014.40202@gmail.com>
To: linux-ppp@vger.kernel.org


--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 25, 2006 at 01:31:53PM +0200, Marco d'Itri wrote:
> On Jul 25, James Cameron <james.cameron@hp.com> wrote:
> > Is there any reason why you couldn't use MatrixSSL?
>
> I would hate to see EAP-TLS depend on a niche license.

MatrixSSL is dual licensed, and last I checked the GPL is quite common
rather than being niche.  It is unfortunate that it isn't LGPL, and
maybe that will stop the idea.

> I do not think I would enable EAP-TLS in the Debian package in this case
> since it would require pulling the MatrixSSL package in the base system.

Oh, certainly.  Debian already has OpenSSL.  Hopefully it would be a
build option to choose the appropriate dependency, and so the Debian
packaging would use the OpenSSL.

On Tue, Jul 25, 2006 at 05:17:33PM +0200, Jan Just Keijser wrote:
> - openwrt already provides support for openvpn, which in turn uses=20
> openssl so why is there a need to switch to matrixssl ?

OpenWrt is used on embedded systems with very low memory, and the
OpenVPN package occasionally cannot be used because of the dependency on
OpenSSL (415183 bytes).  MatrixSSL is much smaller (41411 bytes), and is
already included in the base system for use by dropbear, the SSH
implementation.

> conclusion: for now, I won't be bothered to migrate my patch from=20
> openssl to gnutls or matrixssl any time soon. Others are most welcome to=
=20
> try , of course, and I am willing to test any patches that others provide.

No worries, I'll ponder it.

(I'm sensitive to the OpenSSL license because of the problems we had
getting an MPPE implementation accepted into the kernel.  An early
implementation used source fragments from OpenSSL.  The current
implementation does not use source from OpenSSL, but instead uses the
in-kernel crypto.)

--=20
James Cameron                         http://quozl.netrek.org/
HP Open Source, Volunteer             http://opensource.hp.com/
PPTP Client Project, Release Engineer http://pptpclient.sourceforge.net/

--EVF5PPMfhYS0aIcm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (GNU/Linux)

iD8DBQFExqMsIiWKUhK+Mj4RAnTDAJ9pwrtuXi0iRZrbF98AhRWKJiLRlQCdFpoF
8mUXpPRB3YAXyhvt3MiKdtY=
=wbkY
-----END PGP SIGNATURE-----

--EVF5PPMfhYS0aIcm--
