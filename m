From: Pasi =?iso-8859-1?Q?K=E4rkk=E4inen?= <pasik@iki.fi>
Date: Wed, 04 Feb 2004 13:01:55 +0000
Subject: Re: ppp-2.4.2 released
Message-Id: <20040204130155.GQ1254@edu.joroinen.fi>
List-Id: <linux-ppp.vger.kernel.org>
References: <16391.33929.908463.444449@cargo.ozlabs.ibm.com>
In-Reply-To: <16391.33929.908463.444449@cargo.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

On Wed, Feb 04, 2004 at 09:11:05AM +1100, James Cameron wrote:
> On Tue, Feb 03, 2004 at 01:24:27PM +0200, Pasi K?rkk?inen wrote:
> > The reason why www.yle.fi is not reducing the size, is that the size al=
ready
> > is what the client told (mss+headers). I think so..
>=20
> No, I disagree.  I'll repeat a critical aspect; the client CANNOT know
> the right MTU for the path as a whole.  Sure, it knows the MTU of the
> link next to it, and it will start a connection with an MSS that is
> compatible with that ... but the client has no knowledge of the network
> between the router (the pptp-server) and www.yle.fi.
>=20
> e.g.
>=20
>     www.yle.fi =3D router =3D router .. router =3D pptp-server -- client
>=20
>     =3D is a link with MTU of 1500
>     -- is a link with MTU of 1400
>     .. is a link with MTU of  600
>=20
> (I know this is not the case, I'm using it as an illustration of
> principle).
>=20
> Path MTU discovery overrides MSS in a TCP connection.  It must do, or
> else a link somewhere else along the way with a small MTU would never be
> handled properly.
>=20

Good diagram. That clarified the whole thing.=20

> Have you proved ICMP fragmentation needed packets have arrived at
> www.yle.fi?  A packet trace at that host would be the proof.
>=20

I'll ask them..=20

> > I think so too. but www.yle.fi web server doesn't want to go below
> > mss (told by the client) + headers.
>=20
> Just repeating myself; www.yle.fi MUST go below the client's MSS if
> PMTUD results in a lower value.  As Frank said, the MTU might be
> assymetric.  As I say, it might be that there's another restricted link.
> The evidence you present leads me to suspect ICMP filtering.
>=20

Yep. This is obvious now. Maybe it's broken icmp handling in the
loadbalancer..

-- Pasi K=E4rkk=E4inen
      =20
                                   ^
                                .     .
                                 Linux
                              /    -    \
                             Choice.of.the
                           .Next.Generation.
