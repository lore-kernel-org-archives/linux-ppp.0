From: Pasi =?iso-8859-1?Q?K=E4rkk=E4inen?= <pasik@iki.fi>
Date: Mon, 02 Feb 2004 10:43:29 +0000
Subject: Re: RFC: PPP MPPE merge into kernel 2.6
Message-Id: <20040202104328.GH1254@edu.joroinen.fi>
List-Id: <linux-ppp.vger.kernel.org>
References: <20040130040026.GI2306@hp.com>
In-Reply-To: <20040130040026.GI2306@hp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

On Fri, Jan 30, 2004 at 10:32:59AM +0000, Chris Wilson wrote:
> Hi James,
>=20
> > I'd like to open a discussion on the merge of the PPP MPPE support with
> > kernel 2.6.  What can be done to achieve it?  What is hindering it?
> > What can we do to remove the roadblocks?
>=20
> Sounds like an excellent idea, but it may be too late to have anything=20
> other than bug fixes merged into 2.6. 2.7/2.8 should be possible, though.
>=20
> I think there is a strong argument for the support being in the kernel,
> given the number of other devices that have to support it, the obvious
> end-user demand (witness pptpclient and poptop :-) and the hassle for
> users of finding the right patch and patching their kernels (given the
> patch confusion which exists). Some users are having problems with
> patching due to failed hunks, and Joe Bloggs shouldn't have to worry abou=
t=20
> that.
>=20
> Let's go for it :-) What do we have to lose?
>=20

Should the MPPC support (by Jan Dubiec) be included as well?
http://www.polbox.com/h/hs001/

It also contains some additions to the MPPE support.

-- Pasi K=E4rkk=E4inen
      =20
                                   ^
                                .     .
                                 Linux
                              /    -    \
                             Choice.of.the
                           .Next.Generation.
