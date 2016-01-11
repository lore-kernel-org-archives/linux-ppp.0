From: Alarig Le Lay <alarig@swordarmor.fr>
Date: Mon, 11 Jan 2016 09:51:54 +0000
Subject: Re: Add support for IPv6 RADIUS attributes
Message-Id: <20160111095154.GD9134@drscott.swordarmor.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="2Z2K0IlrPCVsbNpk"
List-Id: <linux-ppp.vger.kernel.org>
References: <20160108142012.GL19014@drscott.swordarmor.fr>
In-Reply-To: <20160108142012.GL19014@drscott.swordarmor.fr>
To: linux-ppp@vger.kernel.org


--2Z2K0IlrPCVsbNpk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun Jan 10 14:03:51 2016, Michael Richardson wrote:
> What is your application? As I read your patches, they just make ppp igno=
re
> the attributes.  Do you intend to do more with the data?

I added the attributes to the radclient dictionary.
The attributes go to /run/radattr.$PPP_IFACE; and from this I parse them
to inject it into the radvd conf.
Without the patch, ppp complains about unknown attributes in the dict.

--=20
Alarig Le Lay

--2Z2K0IlrPCVsbNpk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJWk3s6AAoJEK84SsFrICuIvtkH/R1UrG+g59sKPyOG+EJYq2va
lwETjjWJqRmcwA8C7uZElF2bCUlT/nQlukNnDKBsywxVdQ2m2WGcNUc00GxnGk3X
xN03xl88hQ3ILc7SX9stxzEGKxqbB1yZORHkvOUQCOBEEgscQ/sZQcH6WKuHOxyT
hz+hXpHem5Mhy8knQ8hVQ12H51vRrZWKd5K9SbH0jypNNp4Clo1YgJIcEXkQnV1S
tKLKmMVcGjJpzVVnpToYtLhcTe5vt2c5fxaVra4T9FBfHOsWih197UOcaM6L5V+Q
6rPqfNbLQF79ChD0LFCVqhoNlGOdw9arNrzgtpRzB01KRzElYzya1n7SPr6hIj0=
=NHRs
-----END PGP SIGNATURE-----

--2Z2K0IlrPCVsbNpk--
