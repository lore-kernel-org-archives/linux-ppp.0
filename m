From: James Cameron <james.cameron@hp.com>
Date: Fri, 30 Jan 2004 04:00:26 +0000
Subject: RFC: PPP MPPE merge into kernel 2.6
Message-Id: <20040130040026.GI2306@hp.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="jRHKVT23PllUwdXP"
List-Id: <linux-ppp.vger.kernel.org>
To: linux-ppp@vger.kernel.org


--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I'd like to open a discussion on the merge of the PPP MPPE support with
kernel 2.6.  What can be done to achieve it?  What is hindering it?
What can we do to remove the roadblocks?

MPPE is Microsoft's encryption scheme for PPP links.

The Linux MPPE support consists of five new source files, and patches to
ppp.c, ppp_generic.c and ppp-comp.h, and can be found in the CVS
repository for the PPP project in linux/mppe.  The patches are relative
to 2.2 and 2.4.  See http://samba.org/ftp/unpacked/ppp/linux/mppe/

The author is Frank Cusack <frank@google.com>, and the code is covered
by the "BSD without advertisement clause" license.  Frank released this
around March 2002.  See http://samba.org/ftp/unpacked/ppp/README.MPPE

MPPE support is used by PPTP.  People who wish to use PPTP on their
system often have to modify their kernel to add MPPE support.  PPTP is
not a particularly good tunnelling protocol, but many people are
required to use it as a condition of employment.  In particular, MPPE
is not applied to non-data packets in the PPP stream, apparently by
design.

Many distributions do not ship MPPE support (e.g. Red Hat).  Some
distributions have shipped an older version of MPPE support covered by
the OpenSSL license, which is incompatible with the kernel license (e.g.
SuSE, Mandrake).  Some provide a patch (e.g. Debian).

The PPTP projects have adapted to the lack of MPPE support in the
upstream kernel by providing custom kernels, version specific patches,
module build scripts, and even binary modules. =20

Since the release of 2.6.0, two or three people have provided me with
patches relative to 2.6.

The OpenSSL licensed MPPE support was a separate implementation, and was
provided as a patch to 2.4.1.  This was adopted by SuSE and Mandrake for
their kernels, but is incompatible with the MPPE support in the newly
released PPP 2.4.2.

It would be good to unify this situation and remove some of the pain.

Some effort has also been put into MPPC support, but as MPPC is covered
by a patent I'm not proposing that.

I'm the PPTP client project leader.

--
James Cameron                         http://quozl.netrek.org/
HP Open Source, Volunteer             http://opensource.hp.com/
PPTP Client Project, Release Engineer http://pptpclient.sourceforge.net/

--jRHKVT23PllUwdXP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAGdbaIiWKUhK+Mj4RAv10AJ9B+DYjpxhX4jc26XjpbClBzTP3vgCeOxEk
RmLSOGh/3JwwsCYQB/S/Ygk=
=XDgb
-----END PGP SIGNATURE-----

--jRHKVT23PllUwdXP--
