From: Pasi =?iso-8859-1?Q?K=E4rkk=E4inen?= <pasik@iki.fi>
Date: Wed, 03 Mar 2004 09:09:58 +0000
Subject: Re: ppp-2.4.2 released
Message-Id: <20040303090958.GD16266@edu.joroinen.fi>
List-Id: <linux-ppp.vger.kernel.org>
References: <16391.33929.908463.444449@cargo.ozlabs.ibm.com>
In-Reply-To: <16391.33929.908463.444449@cargo.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

On Wed, Mar 03, 2004 at 07:13:08AM +0800, Bernard Blackham wrote:
> A while ago, Pasi wrote:
> > > > > > There's still the MTU bug (with MPPE) left..
>=20
> > > What bug is that?
>=20
> > I've sent couple of mails about this.. I'll explain it below.
>=20
> > Now, the problem is, that the web-server is already sending packets whi=
ch
> > have *right* size (the size client told), but the pptp-server rejects t=
hem
> > because of the ppp-interface MTU is too low (in the pptp server).=20
> >=20
> > pppd/ccp.c near line 1192:
> >=20
> > mtu =3D netif_get_mtu(f->unit);
> > if (mtu)
> >     netif_set_mtu(f->unit, mtu - MPPE_PAD);
> > else
> >     newret =3D CONFREJ;
> >=20
> > MPPE_PAD is defined as 4.
> >=20
> >=20
> > The pptp client sets the MTU to x (for example 1400), and the pptp serv=
er sets=20
> > the MTU to x-4 (1396). This obviously happens only when using MPPE.
> >=20
> > The pptp-client is not able to load the web page at all, because the cl=
ient
> > doesn't receive any data from the web server! the pptp-server rejects t=
he
> > incoming (http) packets.
> >=20
> > This does not happen with all web sites.
>=20
> Just a metoo message - I've been experiencing the exact same
> problems here. We have a poptop server serving over 100 concurrent
> connections and many users have noted that they weren't able to
> access the campus website.
>=20
> The campus website is behind a Cisco load balancer, so this may be a
> suspect in breaking PMTU. Disabling the above lines of code also
> solved the problem here though and we've had few complaints since.
>=20

Good to hear.=20

Even if this is not a pppd bug, I think we should create some kind of
workaround (option?) for this?

Other ppp-servers don't seem to have this same problem.. so it makes you
feel that pppd is broken :)

-- Pasi K=E4rkk=E4inen
      =20
                                   ^
                                .     .
                                 Linux
                              /    -    \
                             Choice.of.the
                           .Next.Generation.
