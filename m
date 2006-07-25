From: James Cameron <james.cameron@hp.com>
Date: Tue, 25 Jul 2006 11:04:46 +0000
Subject: Re: ppp 2.4.4 eap-tls patch
Message-Id: <20060725110445.GC6568@hp.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="DSayHWYpDlRfCAAQ"
List-Id: <linux-ppp.vger.kernel.org>
References: <44C5F014.40202@gmail.com>
In-Reply-To: <44C5F014.40202@gmail.com>
To: linux-ppp@vger.kernel.org


--DSayHWYpDlRfCAAQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Thanks, I've asked the pptp and pptpd mailing lists for test reports,
since there have been some requests for EAP-TLS support.

You've used OpenSSL, which has a license that is not altogether open,
specifically clause 6 which requires acknowledgement.  Is there any
reason why you couldn't use MatrixSSL?

The OpenWrt project already ships MatrixSSL, and I can see this EAP-TLS
support being useful in OpenWrt.

--=20
James Cameron                         http://quozl.netrek.org/
HP Open Source, Volunteer             http://opensource.hp.com/
PPTP Client Project, Release Engineer http://pptpclient.sourceforge.net/

--DSayHWYpDlRfCAAQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (GNU/Linux)

iD8DBQFExfrNIiWKUhK+Mj4RAh89AJ0ZPoQwSEsvYhlKOEiV7pXbwSQ4MACfRSe4
gtnG2NQVoCXI6qD+hbY1Bz0=
=rMvG
-----END PGP SIGNATURE-----

--DSayHWYpDlRfCAAQ--
