From: md@Linux.IT (Marco d'Itri)
Date: Tue, 09 Jun 2009 14:55:30 +0000
Subject: Re: [PATCH] Accept ms-wins settings provided by server
Message-Id: <20090609145530.GA11241@bongo.bofh.it>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="7AUc2qLy4jB3hD7Z"
List-Id: <linux-ppp.vger.kernel.org>
References: <1241641599-32361-1-git-send-email-marcus@better.se>
In-Reply-To: <1241641599-32361-1-git-send-email-marcus@better.se>
To: linux-ppp@vger.kernel.org


--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On May 20, Marco d'Itri <md@Linux.IT> wrote:

> > # cease if modem is not attached to network yet
> > ABORT '+CGATT: 0'
> > '' AT+CGATT?
> FYI, with my Nokia E51 I always get back 0.
Because it was connected to a 3G network, this only works for GPRS.

--=20
ciao,
Marco

--7AUc2qLy4jB3hD7Z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkoud+IACgkQFGfw2OHuP7H7LQCffmSG1+OTcXG5vYBMjOhTyBRE
TgkAmwVXIaT/MWJvypg66P+qxnd2WVer
=tLVR
-----END PGP SIGNATURE-----

--7AUc2qLy4jB3hD7Z--
