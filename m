From: Tom Parkin <tparkin@katalix.com>
Date: Tue, 07 May 2019 09:39:33 +0000
Subject: Re: [PATCH pppd v4] pppoe: custom host-uniq tag
Message-Id: <20190507093932.GB3561@jackdaw>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="mojUlQ0s9EVzWg2t"
List-Id: <linux-ppp.vger.kernel.org>
References: <20190504164853.4736-1-mcroce@redhat.com>
 <20190507091034.GA3561@jackdaw>
 <CAGnkfhwVvF4qcqoU6wC8tCb6vrvNipP0UG4MxqAd1--5fLmjQg@mail.gmail.com>
In-Reply-To: <CAGnkfhwVvF4qcqoU6wC8tCb6vrvNipP0UG4MxqAd1--5fLmjQg@mail.gmail.com>
To: Matteo Croce <mcroce@redhat.com>
Cc: linux-ppp@vger.kernel.org, netdev <netdev@vger.kernel.org>, Paul Mackerras <paulus@ozlabs.org>, Jo-Philipp Wich <jo@mein.io>


--mojUlQ0s9EVzWg2t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 07, 2019 at 11:32:27AM +0200, Matteo Croce wrote:
> On Tue, May 7, 2019 at 11:10 AM Tom Parkin <tparkin@katalix.com> wrote:
> >
> > Hi Matteo,
> >
> > On Sat, May 04, 2019 at 06:48:53PM +0200, Matteo Croce wrote:
> > > Add pppoe 'host-uniq' option to set an arbitrary
> > > host-uniq tag instead of the pppd pid.
> > > Some ISPs use such tag to authenticate the CPE,
> > > so it must be set to a proper value to connect.
> > >
> > > Signed-off-by: Matteo Croce <mcroce@redhat.com>
> > > Signed-off-by: Jo-Philipp Wich <jo@mein.io>
> > > ---
> > >  pppd/plugins/rp-pppoe/common.c          | 14 +++----
> > >  pppd/plugins/rp-pppoe/discovery.c       | 52 ++++++++++-------------=
--
> > >  pppd/plugins/rp-pppoe/plugin.c          | 15 ++++++-
> > >  pppd/plugins/rp-pppoe/pppoe-discovery.c | 41 ++++++++++++-------
> > >  pppd/plugins/rp-pppoe/pppoe.h           | 30 +++++++++++++-
> > >  5 files changed, 96 insertions(+), 56 deletions(-)
> > >
>=20
> Hi Tom,
>=20
> this was a known bug of the v3 patch, I've fixed it in the v4.
>=20
> Regards,

Cool, thanks for confirming.

Tom

--mojUlQ0s9EVzWg2t
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJc0VJUAAoJEJSMBmUKuovQk2gH/03M5teO7cAoPudid8IIqTUU
Jo83T7encOHAU49AT2YwzCc90W9ilOHfuNgdXaEwgdL+BhyYHDyzpJ+YqKRCf7kZ
H+UHiI2nIiWPOyz/VeN2Wf/PdmSydx0SE2tsxy6vufWfrgKiMi0n3HZSAk32G8rc
yxdvlZaq6DjPiYg0nvrjtNVKxFT0c4FZYe1tiwplYHcNSNaKF7q82aA+DoXJdW9/
IDnijr2ghsrM7Z1jGX2vZRt5cfoNUgoNnFS/FZbjvDU2Sg/72PdZ0Mcam+/LLHQA
TQd/E4n0YDs4D4LeOg4rccRUZ8d623zvwT+WWP7pnj5UAc84b+mH7cJVD3KMCsE=
=myVL
-----END PGP SIGNATURE-----

--mojUlQ0s9EVzWg2t--
