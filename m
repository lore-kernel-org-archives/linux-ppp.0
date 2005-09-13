From: Pasi =?iso-8859-1?Q?K=E4rkk=E4inen?= <pasik@iki.fi>
Date: Tue, 13 Sep 2005 10:24:37 +0000
Subject: Re: ppp-2.4.4b1 released
Message-Id: <20050913102437.GU12310@edu.joroinen.fi>
List-Id: <linux-ppp.vger.kernel.org>
References: <17170.31900.251643.605643@cargo.ozlabs.ibm.com>
In-Reply-To: <17170.31900.251643.605643@cargo.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

On Mon, Aug 29, 2005 at 01:10:20PM +1000, Paul Mackerras wrote:
> I have just put ppp-2.4.4b1.tar.gz on the samba.org ftp server at:
>=20
> ftp://ftp.samba.org/pub/ppp/ppp-2.4.4b1.tar.gz
>=20
> This is mostly a bug-fix release, with many bugs fixed to do with
> persist mode and demand dialling.  The one new feature is that pppd
> now runs an /etc/ppp/ip-pre-up script after creating the ppp interface
> and putting the negotiated IP addresses on it but before marking it
> up.  Since pppd waits for this script to finish, it must run quickly.
>=20
> Please test.  If there are no problems with it, I will re-release it
> as ppp-2.4.4 final.
>

Hi!

Could you please add this patch to pppd?

http://nrg.joroinen.fi/ppp/pppd-2.4.3-radius-dns-wins-1.diff

It adds support for fetching dns- and wins-server information from radius..
If radius server does not reply with dns/wins information, the values from
the pppd configuration file are used.

Or if there's something in this patch you'd like to be changed, please tell=
 me.

Thanks!

-- Pasi K=E4rkk=E4inen
=20
      =20
                                   ^
                                .     .
                                 Linux
                              /    -    \
                             Choice.of.the
                           .Next.Generation.
