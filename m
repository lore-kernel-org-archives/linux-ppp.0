From: Michal Ostrowski <mostrows@watson.ibm.com>
Date: Tue, 16 Nov 2004 13:23:23 +0000
Subject: RE: Linux Kernel PPPoE/PPP Interactions
Message-Id: <1100611403.18317.93.camel@brick.watson.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-bDFKWkOCMePUcl9QTJIy"
List-Id: <linux-ppp.vger.kernel.org>
References: <NIBBLPOFOMEFBJKBJLGFKEFACEAA.murugaiyan@banyannetworks.com>
In-Reply-To: <NIBBLPOFOMEFBJKBJLGFKEFACEAA.murugaiyan@banyannetworks.com>
To: linux-ppp@vger.kernel.org


--=-bDFKWkOCMePUcl9QTJIy
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

You send and receive pppoe discovery packets yourself over the
pppoeSessionSock.

The PPIOCGCHAN ioctl is supposed to be used to divert incoming pppoe
session packets from arriving at your socket and diverting them to the
ppp driver instead.

On Thu, 2003-12-25 at 18:14 +0530, Murugaiyan N wrote:
> Is there any thing that needs to be done apart from doing the following.
> ioctls.
>=20
> But by doing this, i am not getting any packets.  How to debug why the
> kernel is not sending the packets up.
> Is that any thing else i miss.
>=20
>=20
>=20
> /* Get the channel index from the pppoe session socket */
>   if (ioctl(pppoeSessionSock, PPPIOCGCHAN, &channelIndex) =3D=3D -1) {
>=20
>=20
>   fd =3D open("/dev/ppp", O_RDWR);
>   (void) fcntl(fd, F_SETFD, FD_CLOEXEC);
>   if (ioctl(fd, PPPIOCATTCHAN, &channelIndex) < 0) {
>=20
>   pppDevFd =3D open("/dev/ppp", O_RDWR);
>   }
>=20
>   flags =3D fcntl(pppDevFd, F_GETFL);
>=20
>   if (flags =3D=3D -1 || fcntl(pppDevFd, F_SETFL, flags | O_NONBLOCK) =3D=
=3D -1) {
>   x =3D ioctl(pppDevFd, PPPIOCNEWUNIT, &ifUnit);
>=20
>   if (ioctl(fd, PPPIOCCONNECT, &ifUnit) < 0) {
>=20
>=20
> Thanks
> Murugaiyan
>=20
>=20
> ---------------------
> Broadband Division
> www.banyannetworks.com
>=20
> -----Original Message-----
> From: linux-ppp-owner@vger.kernel.org
> [mailto:linux-ppp-owner@vger.kernel.org]On Behalf Of Paul Mackerras
> Sent: Tuesday, November 16, 2004 5:15 PM
> To: Murugaiyan N
> Cc: Michal Ostrowski; linux-ppp@vger.kernel.org
> Subject: RE: Linux Kernel PPPoE/PPP Interactions
>=20
>=20
> Murugaiyan N writes:
>=20
> > my understanding is for the set of system calls, the the user space
> program
> > should get the ppp control packets.
> > But it is not happening, please point out the problem.
>=20
> LCP packets (and anything else with protocol >=3D 0xc000) will come in
> on `fd', other control packets (e.g. IPCP) will come in on pppDevFd.
>=20
> Paul.
> -
> To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
>=20
> -
> To unsubscribe from this list: send the line "unsubscribe linux-ppp" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--=20
Michal Ostrowski <mostrows@watson.ibm.com>

--=-bDFKWkOCMePUcl9QTJIy
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBBmf9LDMDCqU5zPMARArt4AKCNl3YsaRqHz9hhLPzhLQN/nLrjfQCfWOIb
Tr3gvYSKCdzhwHElrYNlZos=
=UrJI
-----END PGP SIGNATURE-----

--=-bDFKWkOCMePUcl9QTJIy--
