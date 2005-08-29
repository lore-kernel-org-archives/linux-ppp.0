From: James Cameron <james.cameron@hp.com>
Date: Mon, 29 Aug 2005 04:19:02 +0000
Subject: Re: ppp-2.4.4b1 released
Message-Id: <20050829041902.GB15594@hp.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="jRHKVT23PllUwdXP"
List-Id: <linux-ppp.vger.kernel.org>
References: <17170.31900.251643.605643@cargo.ozlabs.ibm.com>
In-Reply-To: <17170.31900.251643.605643@cargo.ozlabs.ibm.com>
To: linux-ppp@vger.kernel.org


--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Successful test.  Seemed snappier during initial negotiation, but didn't
try to find out why.  Test configuration was two i686 lab boxes running
Linux 2.6.12.5 with Matt Domsch's current MPPE patch, connection via
pptp 1.5.0 and pptpd 1.3.0.

My test /etc/ppp/ip-pre-up script was executed.

--=20
James Cameron                         http://quozl.netrek.org/
HP Open Source, Volunteer             http://opensource.hp.com/
PPTP Client Project, Release Engineer http://pptpclient.sourceforge.net/

--jRHKVT23PllUwdXP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFDEoy2IiWKUhK+Mj4RAvRqAJwKnblHw/rCQr/VnO3wyMrZ13n1SACdEzPu
QdxSQyQkNTTpDHaRMEnwaVs=
=3URB
-----END PGP SIGNATURE-----

--jRHKVT23PllUwdXP--
