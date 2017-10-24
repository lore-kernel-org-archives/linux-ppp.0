From: Christoph Schulz <develop@kristov.de>
Date: Tue, 24 Oct 2017 14:17:39 +0000
Subject: Re: kernel-mode PPPoE does not seem able to work with MPPE.
Message-Id: <20171024161739.Horde.yzs1FVPhxxSPOZtqb4UG4H8@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=_VqcerF4CsbhfQhylXvny_Fy"
List-Id: <linux-ppp.vger.kernel.org>
References: <158d6529-c9ae-a991-ca47-76e558a1209c@googlemail.com>
In-Reply-To: <158d6529-c9ae-a991-ca47-76e558a1209c@googlemail.com>
To: linux-ppp@vger.kernel.org

This message is in MIME format and has been PGP signed.

--=_VqcerF4CsbhfQhylXvny_Fy
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello!

David Fernandez <david.fernandez.work@googlemail.com> schrieb am Di 24=20=
=20
Okt=202017 10:52:46 CEST:

> Hi there,
>
> I've tried to run MPPE in a PPPoE connection to my LEDE linux=20=20
>=20server. The log is below.
> [...]
> Although it should not be needed, if I use the option require-mppe,=20=20
>=20pppd complains of unrecognized option.

As the sources only define (and understand) the "require-mppe" option=20=20
iff=20the preprocessor symbol MPPE has been defined during compilation,=20=
=20
I=20suspect that your (i.e. LEDE's) pppd has been compiled without MPPE=20=
=20
support.=20You should check this first.


Regards,

Christoph Schulz


--=_VqcerF4CsbhfQhylXvny_Fy
Content-Type: application/pgp-signature
Content-Description: Digitale PGP-Signatur
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF0EABECAB0WIQQJrvSDWpgur5aLezAvXWMKfJDk7AUCWe9LgwAKCRAvXWMKfJDk
7AvhAJ4uc6HutRMIburEpmy1x53iJEag6gCcCpAgVzezjVxJLxNlYBAUsXVWeE8=
=Gprp
-----END PGP SIGNATURE-----

--=_VqcerF4CsbhfQhylXvny_Fy--
