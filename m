From: Christoph Schulz <develop@kristov.de>
Date: Tue, 24 Oct 2017 20:00:56 +0000
Subject: Re: kernel-mode PPPoE does not seem able to work with MPPE.
Message-Id: <20171024220056.Horde.hyk4CSemrbcZ3HoaR9er_RR@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=_Q9icNvnKzte4KvKdO6wZ5iL"
List-Id: <linux-ppp.vger.kernel.org>
References: <158d6529-c9ae-a991-ca47-76e558a1209c@googlemail.com>
In-Reply-To: <158d6529-c9ae-a991-ca47-76e558a1209c@googlemail.com>
To: linux-ppp@vger.kernel.org

This message is in MIME format and has been PGP signed.

--=_Q9icNvnKzte4KvKdO6wZ5iL
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello!

David Fernandez <david.fernandez.work@googlemail.com> schrieb am Di 24=20=
=20
Okt=202017 17:13:32 CEST:

> Hi Christoph,
>
> The MPPE is defined, as I see code conditionally compiled with=20=20
>=20#ifdef MPPE putting things in the log, like:
> Feb  2 12:05:22 LEDE pppd[1580]: MPPE 128-bit stateful compression enable=
d

Yes, you are right. I looked a bit around and found that LEDE uses=20=20
201-mppe_mppc_1.1.patch=20(which I didn't know about) from OpenWRT which=20=
=20
changes=20the way MPPE is configured for pppd. Sorry for the noise.


Regards,

Christoph Schulz


--=_Q9icNvnKzte4KvKdO6wZ5iL
Content-Type: application/pgp-signature
Content-Description: Digitale PGP-Signatur
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF0EABECAB0WIQQJrvSDWpgur5aLezAvXWMKfJDk7AUCWe+b9wAKCRAvXWMKfJDk
7B/MAJ93wvIYOXlW0vLlqiC+ltg0TVAjQQCfYZUOpatgH5g93YFpmc8aTTcybxc=
=Cqod
-----END PGP SIGNATURE-----

--=_Q9icNvnKzte4KvKdO6wZ5iL--
