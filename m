From: md@Linux.IT (Marco d'Itri)
Date: Tue, 07 Nov 2017 15:25:48 +0000
Subject: Re: Reset modem while using pppd
Message-Id: <20171107152548.jyox7u457vg5gas3@bongo.bofh.it>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="yonb3kogkhr4bepx"
List-Id: <linux-ppp.vger.kernel.org>
References: <6661f19d-1804-b6e1-bd98-9503bad6b12b@lstronic.com>
In-Reply-To: <6661f19d-1804-b6e1-bd98-9503bad6b12b@lstronic.com>
To: linux-ppp@vger.kernel.org


--yonb3kogkhr4bepx
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 07, L=E9o Serre <leo@lstronic.com> wrote:

>     'OK' 'AT+CFUN=3D1,1'
This means "sending +CFUN after the OK prompt", but there is nothing=20
before that which tells the modem to output the OK prompt.

I think that you can just use +CFUN in the normal connect script, like=20
this one that I wrote for Debian ages ago:
https://anonscm.debian.org/git/collab-maint/pkg-ppp.git/tree/debian/extra/c=
hatscripts/gprs

>  2. Is there an other way to send an AT command while pppd is running (or
> none)?
No.

--=20
ciao,
Marco

--yonb3kogkhr4bepx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGBsIcS5ipP0URKfyK/WlwSLE96QFAloB0HwACgkQK/WlwSLE
96QelQv/aRQXUNabGwdv2eqAhuJSy40WLwAPLUUtw4+jiqZP5S3gpTPJ8oF/nR51
RZJ6S5njE5zkYrnky4dCKb8Ni+S+/b2Iig9cZJt9++IauTpjfwiwfaiXY9GeAatk
00sEMkp7llGwCD6S3oHogCOLhQ1eiJOT8xCesh8OBIkGaoIUf0aY3Em9LjCU3VPh
bx7lOfNc1uOmeKDMWmN7ounSs55GF/xtA4FhNmSOinXC1KF0AjZqAI+p4d3T31rx
KmlAI4zq/g5KWaM+yXQDZ8Je8yBPqbf1heQKWOttTFH9O/HguaHUILTFGsxA+3h8
LtXVqKOI9Fn/53SkmB+mh2KUM7UNcUjZ6HYLnD6GHDp/AcHH8PqSfKJ9ZTfDJKr5
fg4nmD4qMMv9i6xHyudn96Gdlt8XAoGrX4FDXRhHNHwUNWvBjOuoWKi/DWzeVjPI
QNMlKEejr0qjGMc8gEu4FmPZ4zDvENJ8PX4ylqTMQBSatwgxdTBg3In6HUFLO0Cc
LPYoZ4Uf
=xptV
-----END PGP SIGNATURE-----

--yonb3kogkhr4bepx--
