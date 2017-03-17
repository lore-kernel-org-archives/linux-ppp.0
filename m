From: Michael Richardson <mcr@sandelman.ca>
Date: Fri, 17 Mar 2017 15:13:33 +0000
Subject: Re: Setup pppd over rs-485 point-to-point
Message-Id: <19708.1489763613@obiwan.sandelman.ca>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-=-="
List-Id: <linux-ppp.vger.kernel.org>
References: <2d19b2f1-bb0f-9a09-6d40-f05388c66af5@gmail.com>
In-Reply-To: <2d19b2f1-bb0f-9a09-6d40-f05388c66af5@gmail.com>
To: linux-ppp@vger.kernel.org

--=-=-=
Content-Type: text/plain


Woody Wu <narkewoody@gmail.com> wrote:
    > I want to setup pppd to connect a Linux laptop to an embedded Linux
    > device. The Linux box connected to a rs-232 to rs485 converter, then
    > the convert connected via a two-wire rs-485 cable to the embedded Linux
    > device's rs-485 port.

Depending upon what you really want to do (is it run ppp? Or is it, get IP
connectivity?), you may want to look at:

               https://datatracker.ietf.org/doc/draft-ietf-6lo-6lobac/

There is some userspace code out there from Carsten I think.

--
]               Never tell me the odds!                 | ipv6 mesh networks [
]   Michael Richardson, Sandelman Software Works        | network architect  [
]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails    [


--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEbsyLEzg/qUTA43uogItw+93Q3WUFAljL/R0ACgkQgItw+93Q
3WV6+Af9Gk6MO3hjcNo3f3GpvJJNkECSZIiboc7b5p5AfEiNlKQugnqpvxDRRAPe
nvE6u3DG0u5jA3NY0CF61cRXy7S/YQii2N2++eNR1mOG+BgB9hruy12CaIJeEocO
i5Of/R025km7kcg/0vTQ0a5chZCWK5BoRV3eYwL5F/P3nzw0szIne8sRP6axG/j4
i72zKkG5iwSuEk7zx26QhovxsRYLqQzn4zb8SJw1qKX5YrD2/Ykvlp+JMH8zRTbH
42Tr0nOKbKgfT4P8AVS6QwrXjHPOiPHeKws6z/NberDVM8ro71fCDDNn9CK2LnD3
WOO2jk49V3wXtG4eCZzFDiwgAWdVjw==
=AZBg
-----END PGP SIGNATURE-----
--=-=-=--
