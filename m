From: Michal Ostrowski <mostrows@earthlink.net>
Date: Tue, 19 Oct 2004 10:30:29 +0000
Subject: Re: Kernel-mode PPPoE server.
Message-Id: <1098181830.25095.199.camel@brick.watson.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-WFJ0PnN1MIy6k8E8xEDl"
List-Id: <linux-ppp.vger.kernel.org>
References: <200410181453.16399.cpwp@w3z.co.uk>
In-Reply-To: <200410181453.16399.cpwp@w3z.co.uk>
To: linux-ppp@vger.kernel.org


--=-WFJ0PnN1MIy6k8E8xEDl
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Try using the binary from the system that works on the new system.  I'm
not seeing there being any sort of pppoe specific problem.  It appears
to be an issue of pppd not sending the first LCP packet.

Perhaps somebody else can comment on this...


On Tue, 2004-10-19 at 10:09 +0100, Charles Price wrote:
> On Monday 18 October 2004 23:39, Michal Ostrowski wrote:
> > I think one can attribute this to a pppd behavior change.  There are
> > some options to pppd that control this behavior (silent?).  I'd check t=
o
> > see if one of those options is sneaking in somewhere.  (Try using the
> > dryrun option to check?)
> >
> The configuration options that pppd printed to syslog are listed below.  =
Note=20
> that I am using PAP this time, because I will be using RADIUS but the=20
> concentrator does not send the first packet if I replace require-pap with=
=20
> require-chap.
>=20
> debug   # (from /etc/ppp/pppoe-server-options)
> nodetach   # (from command line)
> idle 43200   # (from /etc/ppp/options)
> dryrun   # (from /etc/ppp/pppoe-server-options)
> plugin /etc/ppp/plugins/rp-pppoe.so   # (from /etc/ppp/pppoe-server-optio=
ns)
> plugin /etc/ppp/plugins/radius.so   # (from /etc/ppp/pppoe-server-options=
)
> plugin /etc/ppp/plugins/radattr.so   # (from /etc/ppp/pppoe-server-option=
s)
> require-pap   # (from /etc/ppp/pppoe-server-options)
> login   # (from /etc/ppp/pppoe-server-options)
> eth1   # (from command line)
> rp_pppoe_service   # (from command line)
> rp_pppoe_sess 234:00:03:47:92:cf:e1   # (from command line)
> eth1   # (from command line)
> rp_pppoe_service   # (from command line)
> rp_pppoe_sess 234:00:03:47:92:cf:e1   # (from command line)
> noaccomp   # (from command line)
> default-asyncmap   # (from command line)
> mru 1492   # (from /etc/ppp/options)
> mtu 1492   # (from /etc/ppp/options)
> nopcomp   # (from command line)
> lcp-echo-failure 5   # (from /etc/ppp/pppoe-server-options)
> lcp-echo-interval 60   # (from /etc/ppp/pppoe-server-options)
> novj   # (from command line)
> novjccomp   # (from command line)
> ms-dns xxx # [don't know how to print value]   # (from /etc/ppp/options)
> proxyarp   # (from /etc/ppp/options)
> 80.168.87.200:10.67.15.234   # (from command line)
> nobsdcomp   # (from command line)
> nodeflate   # (from command line)
> noipx   # (from /etc/ppp/options)
>=20
>=20
> Any ideas on my next call of action? Would 'lsof' of pppoe-server and ppp=
d=20
> processes on working and non-working configurations be of any use?
>=20
> I have tried replacing my kernel with the 2.4.20 from the working SuSE=20
> configuration, to no avail - should I start downgrading pppd or rp-pppoe =
?
>=20
> Regards,
>=20
> Charlie Price
--=20
Michal Ostrowski <mostrows@earthlink.net>

--=-WFJ0PnN1MIy6k8E8xEDl
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBBdOzFkWf6oW3k3O0RAvJ1AJ0R2XxDNlov1AB8j159zzvKejRo7wCggvCb
HuqGw059VxvEde3Y0Yu7ogI=
=r0qz
-----END PGP SIGNATURE-----

--=-WFJ0PnN1MIy6k8E8xEDl--

