From: md@Linux.IT (Marco d'Itri)
Date: Thu, 16 Jun 2005 12:57:40 +0000
Subject: Re: Help - Auto PPPoA and PPPoE detection in ADSL line
Message-Id: <20050616125740.GC13128@wonderland.linux.it>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="7AUc2qLy4jB3hD7Z"
List-Id: <linux-ppp.vger.kernel.org>
References: <61CBBC5FF0C80E4286E28E959D967F5A01FC9E60@SGEXCHG.aztech.com>
In-Reply-To: <61CBBC5FF0C80E4286E28E959D967F5A01FC9E60@SGEXCHG.aztech.com>
To: linux-ppp@vger.kernel.org


--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jun 16, Arvin Schnell <arvin@suse.de> wrote:

> Detecting of PPPoE is easy: Send a PADI and see if you receive a
> PADO.
This is not enough, you also need to account for the presence (or not)
of LLC/SNAP encapsulation.

--=20
ciao,
Marco

--7AUc2qLy4jB3hD7Z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFCsXdEFGfw2OHuP7ERAsIoAJ97movGIfFojqcWHXUOgpGrLNZfcQCaAk/6
f0YtIz5WDH9nLAB5NYnUIz8=
=0bry
-----END PGP SIGNATURE-----

--7AUc2qLy4jB3hD7Z--
