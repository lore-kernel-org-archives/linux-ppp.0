From: Michal Ostrowski <mostrows@earthlink.net>
Date: Mon, 18 Oct 2004 21:04:39 +0000
Subject: Re: Kernel-mode PPPoE server.
Message-Id: <1098133479.25095.175.camel@brick.watson.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-FaDoG8ZriYbXp2ZhiiAe"
List-Id: <linux-ppp.vger.kernel.org>
References: <200410181453.16399.cpwp@w3z.co.uk>
In-Reply-To: <200410181453.16399.cpwp@w3z.co.uk>
To: linux-ppp@vger.kernel.org


--=-FaDoG8ZriYbXp2ZhiiAe
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Try running with the "debug"  option given to pppd.

Also, you mentioned you had this working on another system, can you get
syslogs, tcpdump and configuration for the working system?

On Mon, 2004-10-18 at 21:45 +0100, Charles Price wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> On Monday 18 October 2004 18:21, Michal Ostrowski wrote:
> > From rom what I can tell the problem is on the other end of the connect=
ion.
> >
> > It looks like the other end has terminated your connection.
> >
> > PPP/PPPoE on this end appears to be behaving correctly.
>=20
> I don't think this is the case.

> a) The (WinXP) PPPoE client has been working perfectly on several other=20
> networks.
> b) The tcpdump output shows that the client is sending many LCP ConfReq=20
> packets to my server - which does not respond at all until the client giv=
es=20
> up and sends a PADT. I should have added src/dst MAC addresses to the out=
put=20
> of tcpdump ;-)
>=20

You're correct.


> It looks like pppoe-server spawns pppd okay - I can see the process in 'p=
s ax'=20
> but perhaps the spawned pppd cannot use plugins/rp-pppoe.so correctly - i=
f we=20
> look in the strace output (line 273):
>=20
> 10387 open("/etc/ppp/plugins/rp-pppoe.so", O_RDONLY) =3D 1
>=20
> the plugin has been opened successfully. However, in line 290:
>=20
> 10387 write(1, "Plugin /etc/ppp/plugins/rp-pppoe"..., 43) =3D -1 EBADF (B=
ad file=20
> descriptor)
>=20
> it seems something went wrong. Or perhaps my first attempt at reading str=
ace=20
> output is wrong?
>=20

This is just an output/logging issue.  Not fatal.


--=20
Michal Ostrowski <mostrows@earthlink.net>

--=-FaDoG8ZriYbXp2ZhiiAe
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBBdC/nkWf6oW3k3O0RAsUmAJwIqCd16/wYZbDWANiK+xdHt5zQ4wCeLsA5
y81aWojWK59NNl2Ef/ZZUSw=
=HXYM
-----END PGP SIGNATURE-----

--=-FaDoG8ZriYbXp2ZhiiAe--

