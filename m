From: md@Linux.IT (Marco d'Itri)
Date: Sat, 25 Mar 2006 10:53:18 +0000
Subject: Re: killing a pptp tunnel with a single ping
Message-Id: <20060325105318.GA5841@wonderland.linux.it>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="CE+1k2dSO48ffgeK"
List-Id: <linux-ppp.vger.kernel.org>
References: <20060324232128.GA23810@wonderland.linux.it>
In-Reply-To: <20060324232128.GA23810@wonderland.linux.it>
To: linux-ppp@vger.kernel.org


--CE+1k2dSO48ffgeK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mar 25, Marco d'Itri <md@Linux.IT> wrote:

> This is the reason for me not initially setting the tunnel MTU, I
> did not want to compute the overhead myself. I think that a section
> in your PPTP FAQ explaining how to do this would be very useful.
I tried setting "mtu 1456" on the cisco side and now large pings do not
kill the tunnel anymore even with MPPE enabled, but I do not understand
why pppd on the other side sets the tunnel uses 1452 as the link MTU.
Only the MRU is negotiated:

rcvd [LCP ConfReq id=3D0x1 <mru 1456> <auth chap MS-v2> <magic 0xbf448cfd>]
sent [LCP ConfAck id=3D0x1 <mru 1456> <auth chap MS-v2> <magic 0xbf448cfd>]

How can I fix this without forcing the MTU on the Linux side?

--=20
ciao,
Marco

--CE+1k2dSO48ffgeK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQFEJSEeFGfw2OHuP7ERAp1PAJ9Zffe2l+2ywI1gGQlZM0IurTBDuQCeNYqW
WGdfX5eWQvTEV70IeX1SWh0=
=Kxj8
-----END PGP SIGNATURE-----

--CE+1k2dSO48ffgeK--
