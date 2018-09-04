From: Michael Richardson <mcr@sandelman.ca>
Date: Tue, 04 Sep 2018 13:06:17 +0000
Subject: Re: RFC: support setting DNS for systemd-resolved via DBus
Message-Id: <7649.1536066377@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-=-="
List-Id: <linux-ppp.vger.kernel.org>
References: <e5fa9fe1-073c-e9c5-c774-21bc5487fe7e@iam.tj>
In-Reply-To: <e5fa9fe1-073c-e9c5-c774-21bc5487fe7e@iam.tj>
To: linux-ppp@vger.kernel.org

--=-=-=
Content-Type: text/plain


Tj <linux@iam.tj> wrote:
    > I've recently been building an embedded device to do (kernel-mode)
    > PPPoE which uses only systemd-networkd + systemd-resolved (PC Engines
    > APU2 with Ubuntu 18.04 - amd64).

...

    > After some experimentation I've put together a small C helper program
    > that reads DNS[12]= from the helper environment and uses DBus calls to
    > set the per-link nameservers.

It seems like if small is your goal that you ought to have the ppp client do
this directly.

    > It build-depends on libdbus but not systemd.

Cool.

    > I'm looking for feedback on whether this would be acceptable as an
    > addition to the ppp project, and if so where in the source tree would
    > be appropriate.

I would add it to ppp, and I'd put it into src/dbusdns.c or some such named
code.

If standalone, then give it a new directory.

--
]               Never tell me the odds!                 | ipv6 mesh networks [
]   Michael Richardson, Sandelman Software Works        | network architect  [
]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails    [


--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEbsyLEzg/qUTA43uogItw+93Q3WUFAluOg0gACgkQgItw+93Q
3WWrwAf+Jn9gdyk5aRN6oKNPpF9RnZvrPOflNv32uOdt69FUDG+/gFsnHk0N4VvY
f1jvW/lcuX75U0033qP2Sx2c3N6frodnbwCwbpdoApuyinDfQumUymhGsmtXWbNd
awjS7QJFxNxVBCjhcV39R0jTiz6vA97SLi43Kiz+JryP9rCv2wEWn/9UuVFAtyql
p1wIuvoLfhMqiBln0LqOx0ha0YQjlGRwPiIoO1zwDi/aXF6eqStzZUuZlRZDBrF1
3j1CUYGZHn5hzLVS9xknDU4s3fSjoIvgJ4s6OIqmh+tOoOusXsOLP97VUJXC2Rxq
BrGl/AyuNKJWOcDhL128sfae0ntP/Q==
=kady
-----END PGP SIGNATURE-----
--=-=-=--
