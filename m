From: Pasi =?iso-8859-1?Q?K=E4rkk=E4inen?= <pasik@iki.fi>
Date: Mon, 19 Sep 2005 12:27:22 +0000
Subject: Re: ppp-2.4.4b1 released
Message-Id: <20050919122721.GA10146@edu.joroinen.fi>
List-Id: <linux-ppp.vger.kernel.org>
References: <17170.31900.251643.605643@cargo.ozlabs.ibm.com>
In-Reply-To: <17170.31900.251643.605643@cargo.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

On Tue, Sep 13, 2005 at 01:24:37PM +0300, Pasi K=E4rkk=E4inen wrote:
> On Mon, Aug 29, 2005 at 01:10:20PM +1000, Paul Mackerras wrote:
> > I have just put ppp-2.4.4b1.tar.gz on the samba.org ftp server at:
> >=20
> > ftp://ftp.samba.org/pub/ppp/ppp-2.4.4b1.tar.gz
> >=20
> > This is mostly a bug-fix release, with many bugs fixed to do with
> > persist mode and demand dialling.  The one new feature is that pppd
> > now runs an /etc/ppp/ip-pre-up script after creating the ppp interface
> > and putting the negotiated IP addresses on it but before marking it
> > up.  Since pppd waits for this script to finish, it must run quickly.
> >=20
> > Please test.  If there are no problems with it, I will re-release it
> > as ppp-2.4.4 final.
> >
>=20
> Hi!
>=20
> Could you please add this patch to pppd?
>

I wonder if I am in some kind of blocklist or so.. please comment about this
patch!

I've asked this many times already, and it would be nice to know if you want
something changed.. or don't like the whole thing. Thanks.

-- Pasi K=E4rkk=E4inen
=20
> http://nrg.joroinen.fi/ppp/pppd-2.4.3-radius-dns-wins-1.diff
>=20
> It adds support for fetching dns- and wins-server information from radius=
..
> If radius server does not reply with dns/wins information, the values from
> the pppd configuration file are used.
>=20
> Or if there's something in this patch you'd like to be changed, please te=
ll me.
>=20
> Thanks!
>=20
> -- Pasi K=E4rkk=E4inen
> =20
