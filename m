From: Pasi =?iso-8859-1?Q?K=E4rkk=E4inen?= <pasik@iki.fi>
Date: Wed, 26 Jan 2005 11:30:09 +0000
Subject: Re: [PATCH] pppd 2.4.3 support for DNS and WINS from Radius
Message-Id: <20050126113009.GZ16286@edu.joroinen.fi>
List-Id: <linux-ppp.vger.kernel.org>
References: <20050125144906.GX16286@edu.joroinen.fi>
In-Reply-To: <20050125144906.GX16286@edu.joroinen.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

On Tue, Jan 25, 2005 at 04:49:06PM +0200, Pasi K=E4rkk=E4inen wrote:
> Hi again!
>=20
> http://nrg.joroinen.fi/ppp/pppd-2.4.3-radius-dns-wins-1.diff
>=20
> Patch updated for pppd 2.4.3. It should have no effect to the normal
> behaviour if Radius server does not return DNS and/or WINS addresses
> for the user.
>=20
> Could you please apply this to the cvs?
>=20

Maybe little more description about this patch..=20

When using pppd with radius plugin, with this patch you can assign=20
DNS- and WINS-server addresses for the ppp/pptp client from Radius.=20
This allows you to assign different DNS/WINS addresses based on the group=20
of the user, or based on some other criteria.

If Radius server returns DNS/WINS addresses for the user, those addresses
are forced to the client. If Radius server does not return DNS/WINS
addresses for the user, the default values from pppd config file are used.

Please consider applying to the cvs.

-- Pasi K=E4rkk=E4inen
      =20
                                   ^
                                .     .
                                 Linux
                              /    -    \
                             Choice.of.the
                           .Next.Generation.
