From: James Cameron <james.cameron@hp.com>
Date: Tue, 11 Apr 2006 05:51:11 +0000
Subject: Re: PPTP conf help...
Message-Id: <20060411055111.GJ4089@hp.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="0eh6TmSyL6TZE2Uz"
List-Id: <linux-ppp.vger.kernel.org>
References: <20060411053240.25971CA0A4@ws5-11.us4.outblaze.com>
In-Reply-To: <20060411053240.25971CA0A4@ws5-11.us4.outblaze.com>
To: linux-ppp@vger.kernel.org


--0eh6TmSyL6TZE2Uz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 11, 2006 at 01:32:40PM +0800, K.Senthil Kumar wrote:
> i'm new to linux. i want to setup a vpn server in my office.

While pppd is involved in a PPTP VPN, it isn't really inside the scope
of PPP and this mailing list.

You should contact the poptop-server@lists.sourceforge.net mailing list
for the pptpd project.  See http://poptop.org/ and the archives on
http://marc.theaimsgroup.com/?l=3Dpoptop-server

You should contact the pptpclient-devel@lists.sourcerfoge.net mailing
list for the pptp client project.  See http://pptpclient.sourceforge.net/

> i tried to configure pptp server in my pc. in first attempt clients
> can connect with the pptp, in the following attempts it is saying an
> error 800, the server is not reachable. my pc is not directly
> connected to router, but thorugh magnia server as hub.

This does not sound unusual, I've heard of such problems.

> is pppoe needed to establish vpn server?=20

No, not a PPTP VPN server.

> how can i route it to my pc from router?
> can you please give me step by step details.

Don't know.  Contact your router provider.

Try OpenVPN if you haven't already.  It has a few features that increase
the security of the VPN, features that PPTP can never have without
breaking backward compatibility.

--=20
James Cameron                         http://quozl.netrek.org/
HP Open Source, Volunteer             http://opensource.hp.com/
PPTP Client Project, Release Engineer http://pptpclient.sourceforge.net/

--0eh6TmSyL6TZE2Uz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQFEO0PPIiWKUhK+Mj4RAtwOAJ9VO6wKASUDUotYsJjkbvQvZfyG8ACaAigK
rws/FR+CaVs+1NVOEwekSJg=
=CYv+
-----END PGP SIGNATURE-----

--0eh6TmSyL6TZE2Uz--
