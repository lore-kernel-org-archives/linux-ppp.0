From: Pasi =?iso-8859-1?Q?K=E4rkk=E4inen?= <pasik@iki.fi>
Date: Mon, 02 Feb 2004 10:56:52 +0000
Subject: Re: ppp-2.4.2 released
Message-Id: <20040202105652.GI1254@edu.joroinen.fi>
List-Id: <linux-ppp.vger.kernel.org>
References: <16391.33929.908463.444449@cargo.ozlabs.ibm.com>
In-Reply-To: <16391.33929.908463.444449@cargo.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

On Mon, Feb 02, 2004 at 01:27:03AM -0800, Frank Cusack wrote:
> On Sat, Jan 17, 2004 at 12:45:18PM +0200, Pasi K?rkk?inen wrote:
> > On Sat, Jan 17, 2004 at 10:18:24AM +1100, Paul Mackerras wrote:
> > > Pasi K=E4rkk=E4inen writes:
> > >=20
> > > > There's still the MTU bug (with MPPE) left..
>=20
> What bug is that?
>=20

I've sent couple of mails about this.. I'll explain it below.


> > > Well, somehow we have to allow for the extra 4 bytes that MPPE adds -
> > > and it is reasonable and valid to have the network interface MTU be
> > > smaller than the PPP mtu/mru values.  Arguably the code that reduces
> > > the MTU isn't expressed as well as it could be, but I'm not yet
> > > convinced it's actually wrong.
> > >=20
> >=20
> > Hmm.. I'm not very familiar with MPPE internals, but anyway this seems =
to
> > cause problems in PMTUD with many web sites.. blocking access to them
> > entirely.
> >=20
> > Are there any other opensource ppp/mppe packages that could be used to =
check
> > how this in handled in them..
>=20
> Everyone else ignores MTU and requires the user to manually set it.  If
> the user does not set it, the peer sends frames which are too large, and
> just expects that the receiver will handle it.
>=20
> > > Frank, what is your opinion?
>=20
> One choice would be to require MPP and send frags when we PPP frame
> would be too large.  Reducing the interface MTU seems better.
>=20
> How does this create a PMTU-D problem?
>=20

Check http://nrg.joroinen.fi/yle.log

It's a tcpdump log from pptp server (running pppd 2.4.2).

The pptp-client tries to load www.yle.fi in the web browser, but the
pptp-server _rejects_ all the packets coming from www.yle.fi web server.

why? Because the pptp-server ppp-interface MTU is set to x-4, when
pptp-client ppp-interface mtu is set to x.=20
x is the value that is defined in the ppp-server config file.

Basicly the pptp-server tells to web-server (all the time) that the
web-server needs to fragment the packets, because they cannot fit to the=20
ppp-tunnel (and the packets have Dont Fragment-bit set). This is part of the
PMTUD.

Now, the problem is, that the web-server is already sending packets which
have *right* size (the size client told), but the pptp-server rejects them
because of the ppp-interface MTU is too low (in the pptp server).=20

pppd/ccp.c near line 1192:

mtu =3D netif_get_mtu(f->unit);
if (mtu)
    netif_set_mtu(f->unit, mtu - MPPE_PAD);
else
    newret =3D CONFREJ;

MPPE_PAD is defined as 4.


The pptp client sets the MTU to x (for example 1400), and the pptp server s=
ets=20
the MTU to x-4 (1396). This obviously happens only when using MPPE.

The pptp-client is not able to load the web page at all, because the client
doesn't receive any data from the web server! the pptp-server rejects the
incoming (http) packets.

This does not happen with all web sites.

-- Pasi K=E4rkk=E4inen=20
      =20
                                   ^
                                .     .
                                 Linux
                              /    -    \
                             Choice.of.the
                           .Next.Generation.
