From: Pasi =?iso-8859-1?Q?K=E4rkk=E4inen?= <pasik@iki.fi>
Date: Sat, 17 Jan 2004 10:45:18 +0000
Subject: Re: ppp-2.4.2 released
Message-Id: <20040117104518.GO1254@edu.joroinen.fi>
List-Id: <linux-ppp.vger.kernel.org>
References: <16391.33929.908463.444449@cargo.ozlabs.ibm.com>
In-Reply-To: <16391.33929.908463.444449@cargo.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

On Sat, Jan 17, 2004 at 10:18:24AM +1100, Paul Mackerras wrote:
> Pasi K=E4rkk=E4inen writes:
>=20
> > There's still the MTU bug (with MPPE) left..
>=20
> Well, somehow we have to allow for the extra 4 bytes that MPPE adds -
> and it is reasonable and valid to have the network interface MTU be
> smaller than the PPP mtu/mru values.  Arguably the code that reduces
> the MTU isn't expressed as well as it could be, but I'm not yet
> convinced it's actually wrong.
>=20

Hmm.. I'm not very familiar with MPPE internals, but anyway this seems to
cause problems in PMTUD with many web sites.. blocking access to them
entirely.

Are there any other opensource ppp/mppe packages that could be used to check
how this in handled in them..

> Frank, what is your opinion?
>=20
> Paul.
>=20

-- Pasi K=E4rkk=E4inen
      =20
                                   ^
                                .     .
                                 Linux
                              /    -    \
                             Choice.of.the
                           .Next.Generation.
