From: Michael Richardson <mcr@sandelman.ca>
Date: Thu, 23 Apr 2020 00:41:37 +0000
Subject: Re: PPPoE Modem hangup after random time - how to debug?
Message-Id: <21061.1587602497@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-=-="
List-Id: <linux-ppp.vger.kernel.org>
References: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
In-Reply-To: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
To: linux-ppp@vger.kernel.org

--=-=-=
Content-Type: text/plain


James Carlson <carlsonj@workingcode.com> wrote:
    > If it isn't, then possibly it's something else.  I think that the last
    > time I looked at the PPPoE implementation on Linux it was a bit hokey --
    > it ran PPP over a pty pair and then decoded the framing in user space
    > and wrote it back out over Ethernet using PPPoE.  I hope it's not still
    > like that, as I haven't looked at it in years, but it may well be.  An
    > internal error in that logic could also cause a "hangup" message,
    > although hopefully along with some kind of system log about a core file
    > as well.

No, that's not how PPPoE has worked for at least 15 years.
There is a PPPoE socket and the IP packets do not leave the kernel.
I have built BMS systems that handle thousands of sessions on 8-core
systems.

We had to move to 64-bit kernels because we needed such a lot of control
structures that we'd run out 32-bit kernel memory long before we ran out of
CPU.  (this was for oversubscribed rather slow last miles, not VDSL2)

--
]               Never tell me the odds!                 | ipv6 mesh networks [
]   Michael Richardson, Sandelman Software Works        |    IoT architect   [
]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails    [




--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEbsyLEzg/qUTA43uogItw+93Q3WUFAl6g5EAACgkQgItw+93Q
3WVulAf7B+CL2RPgi3d4UyD/tZvpPvMeI/GLtN4NK6P12edRmWnY66D6PXD0sIPO
KDiLs435Hn23TOw5mCdlUkyUFB4HtgqPhgB8tQRwSN6bKEZniQMvmgpe9el03bgz
vU22ZwFt449Wj+BP6W0IxmutUzocB42PIuRx50kBwk2rKO3G1HZbg8LAz60ArOaS
gdwn6my7dG1amm1zPyU0QrYAkKmxJaZSE73DKSolXTd4Nnad4ihkPJVkfs9w6QtY
u4t8tnXuqHxmq7XFrKQmKpYnyyHPCMg1W5d7Pvl3IIBs7D7s8UFxeqzErnuquYgY
sdRwKnCzkx85A61a1WviDezvurGKYg==
=acYZ
-----END PGP SIGNATURE-----
--=-=-=--
