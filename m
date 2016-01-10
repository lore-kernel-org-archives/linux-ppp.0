From: Michael Richardson <mcr@sandelman.ca>
Date: Sun, 10 Jan 2016 19:03:51 +0000
Subject: Re: Add support for IPv6 RADIUS attributes
Message-Id: <21899.1452452631@obiwan.sandelman.ca>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-=-="
List-Id: <linux-ppp.vger.kernel.org>
References: <20160108142012.GL19014@drscott.swordarmor.fr>
In-Reply-To: <20160108142012.GL19014@drscott.swordarmor.fr>
To: linux-ppp@vger.kernel.org

--=-=-=
Content-Type: text/plain


I also have patches to the radius module to use the latest (and maintained)
radcli client library at:  https://github.com/nmav/radcli

What is your application? As I read your patches, they just make ppp ignore
the attributes.  Do you intend to do more with the data?

I have patches on both radcli and pppd sides, which haven't all settled yet,
so I haven't pushed them anywhere yet.

I'm not sure what the ultimate point of your patches are though.
Non-LL IPv6 addresses are not assigned through IP6CP, but rather through RA
and/or DHCPv6.   I have a daemon, called rfc6204d, which does this at scale,
but it is not yet sufficiently field tested to release.

--
]               Never tell me the odds!                 | ipv6 mesh networks [
]   Michael Richardson, Sandelman Software Works        | network architect  [
]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails    [


--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEVAwUBVpKrE4CLcPvd0N1lAQLV9wf/Ttb4ynkGlGP/sCO2NhnceqyLsDiaD0ie
i6hsEpzZTeRXDoKYUH/4UygCIMwaW/G5fq6eAC1N8HXFsdhkKfV16hZY7De7Z5qp
1YikqSAZ09pJnuOeWPJN71Lxp2Pgq9njwPhuWuzy3g8bq5LsA9K7QWUib8nr1S7q
stydGJ2Ie/i9KHqUgYjjnDYJP955Xsm1Uls/1/iaJSHZsqGWEYZxaCRCqEWWMZJm
Ih1LTW0aeWZkv4tj8EVjKMea+QTed88M+wD8+oKX6GQWFtapKXYxulUA4yWz3+6J
VnUU0qVV/wnAvcQDLjGJuK49vasxaAByaXBP3PWcTp//QBAUOsuRNw==
=YGPp
-----END PGP SIGNATURE-----
--=-=-=--
