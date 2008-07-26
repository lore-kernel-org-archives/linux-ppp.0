From: md@Linux.IT (Marco d'Itri)
Date: Sat, 26 Jul 2008 12:32:00 +0000
Subject: Re: PPP source now in git
Message-Id: <20080726123200.GA30716@bongo.bofh.it>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="5vNYLRcllDrimb99"
List-Id: <linux-ppp.vger.kernel.org>
References: <18568.30079.527811.175235@cargo.ozlabs.ibm.com>
In-Reply-To: <18568.30079.527811.175235@cargo.ozlabs.ibm.com>
To: linux-ppp@vger.kernel.org


--5vNYLRcllDrimb99
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jul 24, Paul Mackerras <paulus@samba.org> wrote:

> I finally got sick of using CVS for the PPP source code, so I
> converted the repository to a git repository instead.  Thus, if you
Like CVS, the GIT tree too does not contain the same files of the
official tarball releases.
Can you delete them from the repository head?

BTW, some files in include/linux/ have diverged from the kernel
versions, if they cannot be kept in sync maybe then they should be
removed as well.

This is the rsync filter I use to generate snapshots for the Debian
package:

=2Ecvsignore
/TODO
/ppp.texi
/aix4/
/freebsd-2.0/
/freebsd-2.2.8/
/freebsd-3.0/
/netbsd-1.1/
/netbsd-1.2/
/NeXT/
/osf1/
/sunos4/
/svr4/
/ultrix/
*.aix4
*.bsd
*.netbsd-1.2
*.NeXT
*.osf
*.sunos4
*.svr4
*.ultrix
/pppd/sys-aix4.c
/pppd/sys-bsd.c
/pppd/sys-NeXT.c
/pppd/sys-osf.c
/pppd/sys-sunos4.c
/pppd/sys-svr4.c
/pppd/sys-ultrix.c
+ /linux/Makefile.top
/linux/*
# these files are in tarballs but missing from GIT
/include/linux/if_ether.h
/contrib/

--=20
ciao,
Marco

--5vNYLRcllDrimb99
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiLGUAACgkQFGfw2OHuP7GloACffWY4mpAo9yGpuYnqmVVmBQ2M
/boAn3ab8LIxudr3dtBNzMA6tpDscC16
=rOHP
-----END PGP SIGNATURE-----

--5vNYLRcllDrimb99--
