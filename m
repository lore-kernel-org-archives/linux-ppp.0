From: Michael Richardson <mcr@sandelman.ca>
Date: Sun, 26 Apr 2020 01:38:35 +0000
Subject: Re: PPPoE Modem hangup after random time - how to debug?
Message-Id: <29906.1587865115@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-=-="
List-Id: <linux-ppp.vger.kernel.org>
References: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
In-Reply-To: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
To: linux-ppp@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


David Bala=C5=BEic <xerces9@gmail.com> wrote:
    >> OK, more data:
    >> I started tcpdump with the -e option as suggested on openwrt forum:
    >> tcpdump -e -v -i eth1.3902 pppoed
    >>
    >> on disconnect, this was logged (times are UTC):
    >>
    >>
    >> tcpdump: listening on eth1.3902, link-type EN10MB (Ethernet), capture
    >> size 262144 bytes
    >> 18:23:09.204991 a4:7b:2c:9e:c7:44 (oui Unknown) > 44:4e:6d:fd:c7:39
    >> (oui Unknown), ethertype PPPoE D (0x8863), length 97: PPPoE PADO
    >> [Service-Name] [AC-Name "SIMB_TABOR_BNG1"] [Host-Uniq
    >> 0x44************long_number******************************AA]
    >> [AC-Cookie ".5b************v"]

    > Isnt this strange? The dst addr is not my router or any other known.
    > Also the Host-Uniq value is different.
    > As if is traffic meant for someone else.

oh, I understand.
thank you for noting this.
So, it's as if you are getting a PPPoE message for someone else, and when
that happens, the interface is dying.
Is it always the same ethernet address?

Do you have ebtables?  Could you arrange to filter out packets like that?
That would point to there being some kernel bug.

Clearly, your ISP has some other bug that they are sending stuff down the
wrong pipe, but that could just be hash collisions that they assume are
"harmless".

=2D-
]               Never tell me the odds!                 | ipv6 mesh network=
s [
]   Michael Richardson, Sandelman Software Works        |    IoT architect =
  [
]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails  =
  [




--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEbsyLEzg/qUTA43uogItw+93Q3WUFAl6k5hsACgkQgItw+93Q
3WV5FggAvnEIBKIhJC3Cl1igLcJICFlQJ8U/cJhoIGjiOaBlUo5ZY91DOyaVrtBM
sv8BG4t7Tev2Zi55NRZHHyaDYYnVtkelUidq+152PYZyA0sLNGJw9fjzU7SIIyfe
/wfvhUxf3jmmLn5gJtLLM1DvswnLWWS/vp3+d64IdNsg8opiR9NZql3vM+x2DGcA
kdpx9ueu12YuNUCEMBELd4PaPCwGzyrQivWs1vcEuaVeIRHP5HXI8uEKFk+iuO5K
w66X/WT5DwSv+cvDV0yPyBvgMOO5cJ0wH4aPVw5EFIjpocGb8FxSzGQi7yfo6eAb
eV41cigtbSGOYBUAZdo7y8H/xe/Y0Q==
=q1HO
-----END PGP SIGNATURE-----
--=-=-=--
