From: Michal Ostrowski <mostrows@earthlink.net>
Date: Mon, 18 Oct 2004 17:21:07 +0000
Subject: Re: Kernel-mode PPPoE server.
Message-Id: <1098120068.25095.163.camel@brick.watson.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-foNTFv8azi1cRu1xgktB"
List-Id: <linux-ppp.vger.kernel.org>
References: <200410181453.16399.cpwp@w3z.co.uk>
In-Reply-To: <200410181453.16399.cpwp@w3z.co.uk>
To: linux-ppp@vger.kernel.org


--=-foNTFv8azi1cRu1xgktB
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

=46rom rom what I can tell the problem is on the other end of the connection.

It looks like the other end has terminated your connection.

PPP/PPPoE on this end appears to be behaving correctly.

--=20
Michal Ostrowski <mostrows@earthlink.net>

On Mon, 2004-10-18 at 16:09 +0100, Charles Price wrote:
> Thanks, for the quick response, Michal...
>=20
> > Try running an "strace" on the pppoe-server to see what system call
> > fails.
> >
> I have posted the output of 'strace -f pppoe-server' to=20
> http://hognaston.com/strace.txt - I thought it might have been bad netiqu=
ette=20
> to post something of that length to a mailing list ;-)
>=20
> There seem to be a number of entries in there that look like error messag=
es in=20
> the output, but since I've not used strace before a second opinion would =
be=20
> appreciated.
>=20
> > Also, a tcpdump log of the packets going back and forth would be useful=
.
> >
> pppoe2 root # tcpdump -i eth1 -n
> tcpdump: WARNING: eth1: no IPv4 address assigned
> tcpdump: verbose output suppressed, use -v or -vv for full protocol decod=
e
> listening on eth1, link-type EN10MB (Ethernet), capture size 68 bytes
> 16:03:45.626913 PPPoE PADI [Service-Name] [Host-Uniq 0x1D180000] [EOL]
> 16:03:45.627118 PPPoE PADO [AC-Name "W3Z-2"] [Service-Name "W3Z"] [AC-Coo=
kie=20
> 0x7880E92E058E66DFBCE211A52AACD52592280000] [Host-Uniq 0x1D180000]
> 16:03:45.627242 PPPoE PADR [Service-Name] [Host-Uniq 0x1D180000] [AC-Cook=
ie=20
> 0x7880E92E058E66DFBCE211A52AACD52592280000]
> 16:03:45.627766 PPPoE PADS [ses 0x2] [Service-Name "W3Z"] [Host-Uniq=20
> 0x1D180000]
> 16:03:46.627238 PPPoE  [ses 0x2] LCP, Conf-Request (0x01), id 1, MRU  149=
2,=20
> Magic-Num  0xf9397f65, length 14
> 16:03:49.627791 PPPoE  [ses 0x2] LCP, Conf-Request (0x01), id 1, MRU  149=
2,=20
> Magic-Num  0xf9397f65, length 14
> 16:03:52.628551 PPPoE  [ses 0x2] LCP, Conf-Request (0x01), id 1, MRU  149=
2,=20
> Magic-Num  0xf9397f65, length 14
> 16:03:55.629318 PPPoE  [ses 0x2] LCP, Conf-Request (0x01), id 1, MRU  149=
2,=20
> Magic-Num  0xf9397f65, length 14
> 16:03:58.630084 PPPoE  [ses 0x2] LCP, Conf-Request (0x01), id 1, MRU  149=
2,=20
> Magic-Num  0xf9397f65, length 14
> 16:04:01.630851 PPPoE  [ses 0x2] LCP, Conf-Request (0x01), id 1, MRU  149=
2,=20
> Magic-Num  0xf9397f65, length 14
> 16:04:04.631645 PPPoE  [ses 0x2] LCP, Conf-Request (0x01), id 1, MRU  149=
2,=20
> Magic-Num  0xf9397f65, length 14
> 16:04:07.632412 PPPoE  [ses 0x2] LCP, Conf-Request (0x01), id 1, MRU  149=
2,=20
> Magic-Num  0xf9397f65, length 14
> 16:04:10.633178 PPPoE  [ses 0x2] LCP, Conf-Request (0x01), id 1, MRU  149=
2,=20
> Magic-Num  0xf9397f65, length 14
> 16:04:13.633944 PPPoE  [ses 0x2] LCP, Conf-Request (0x01), id 1, MRU  149=
2,=20
> Magic-Num  0xf9397f65, length 14
> 16:04:16.641160 PPPoE PADT [ses 0x2] [Host-Uniq 0x1D180000] [Generic-Erro=
r=20
> "RP-PPPoE: System call error: Input/o..........."]
> 16:04:16.641313 PPPoE PADT [ses 0x2] [Generic-Error "Received PADT"]
>=20
> 16 packets captured
> 16 packets received by filter
> 0 packets dropped by kernel
>=20
> Regards,
>=20
> Charlie Price


--=-foNTFv8azi1cRu1xgktB
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBBc/uDkWf6oW3k3O0RAqsDAKCG9ola+PyFOTfcDB/fJ7uaOGWSxACcCwJE
W9GP+EZuwW7NrUX05TLW3BI=
=b3np
-----END PGP SIGNATURE-----

--=-foNTFv8azi1cRu1xgktB--

