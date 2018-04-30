From: Michael Richardson <mcr@sandelman.ca>
Date: Mon, 30 Apr 2018 15:15:12 +0000
Subject: Re: Namespaces and pppd
Message-Id: <30936.1525101312@obiwan.sandelman.ca>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-=-="
List-Id: <linux-ppp.vger.kernel.org>
References: <CABS5c+EH+tDuaxjJpQ5_66uW1KrdsScFX8e_06GKmc84_3=A+w@mail.gmail.com>
In-Reply-To: <CABS5c+EH+tDuaxjJpQ5_66uW1KrdsScFX8e_06GKmc84_3=A+w@mail.gmail.com>
To: linux-ppp@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Goran <sendmailtogoran@gmail.com> wrote:
    > I've tried something like this

    > ip netns add physical
    > ip link set enp5s0f0 netns physical
    > ip netns exec physical pppd call my-isp

    > pppd starts, I can see it in the process-list, but no ppp0 device is =
created.

    > Is there a solution?

I assume that you read the log and you can see it connect successfully?
I was just thinking if one could test this by creating a ppp device manually
with ip link add, but I thnk we can only create one with an ioctl().

And you looked within that netns for the ppp interface??
(I'd expect it to show up inside)

I also want to do what you just described.

=2D-=20
]               Never tell me the odds!                 | ipv6 mesh network=
s [=20
]   Michael Richardson, Sandelman Software Works        | network architect=
  [=20
]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails  =
  [=20
=09



--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEVAwUBWucy/YCLcPvd0N1lAQLQjggAgXS33rWBmLggrjDu9fHrLHWiKGzjKIld
PQfS5LiFjlElnn7PKZZyBfxQqML0aI0tPBSa6HRadbdSOLwz2Ik0318m5k4BK8eu
81OSuUpYro9aIN8TfnO0IsmvA8Gnt5vMZ9sH6nzIdGjOVUR+qMeKlcxWQAPUMyqX
FEabztVz+wAwrsCMth0VGnv68dChzPlBJGg4D+kIwJX4EVfVVuw4ggG1HIxYSfxK
9wl4i8bvFMEVTtvGXI6AFPNHw1GjyTd/1Oj9bUiACbJJceVWa57NC9VDf1mazR5Z
Du7BxQDA7iWRMsPWbSpqzJsBtTLnlQptmRHNsUtl1LqhLKOYIJi/3g==
=1DLx
-----END PGP SIGNATURE-----
--=-=-=--
