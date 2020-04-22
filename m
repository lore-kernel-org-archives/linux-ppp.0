From: Michael Richardson <mcr@sandelman.ca>
Date: Wed, 22 Apr 2020 19:51:04 +0000
Subject: Re: PPPoE Modem hangup after random time - how to debug?
Message-Id: <18466.1587585064@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-=-="
List-Id: <linux-ppp.vger.kernel.org>
References: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
In-Reply-To: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
To: linux-ppp@vger.kernel.org

--=-=-=
Content-Type: text/plain


Hi, I found that some PPPoE BMS do not emit IPCP echo responses if there is
also traffic.  Since I have a static IPv4/v6, and there is DNS requests and
script kiddies, there is *ALWAYS* half a megabit/s of traffic, which is
probably atypical for many residential users who get random IPs.
I.e. they have some sort of "lcp-echo-adaptive" going on, but not in a good
way.

I had to force lcp-echo-interval to 0, which was a bit difficult to get right
in the OpenWRT UI.  I had tried to increase echo-failure to 30, but that
didn't help consistently.

The other problem is that Bell Canada only answers PADI's once every five
minutes.  It's total BS.

Modem Hangup would normally be because the DCD signal went down, but on
PPPoE, that can't happen, I think.  I did see that when LCP failed, but I
also had debugging that told me it had failed.  maybe that's just off for
you.

--
]               Never tell me the odds!                 | ipv6 mesh networks [
]   Michael Richardson, Sandelman Software Works        |    IoT architect   [
]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails    [


--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEbsyLEzg/qUTA43uogItw+93Q3WUFAl6goCgACgkQgItw+93Q
3WWdMQf/TzdEgiNnDvlZSBLyg5FnMqzjYNWC2zkVNpYAnhlo4lOdwLa2e/yfD3fT
I80pJQCR6cQFm/jYUPJlm7ZkOwK96M5iH9KO/rkYINIuorDCa+xZ9bizBQ4eyi13
fL7zsds4QNMOwGMyYyEHmeEedkrhDm1XZmbzU7S5AI3rRMTzFBa6LuK1UpxYzTY7
6c2mdQ3rHguSzuWQeYDrIuBMc9M1IpnRzaCVltQmIzn+eyZX1ojU72qRMqoVGoEu
a3zTG7huPcJFY5ntrpmVUb1zgm4GCdRBzYNWWncTClbF3kZ400r+W1gMTQIkqMMZ
UAzdBTEFJ9JAt1GFq/Y7G3mI7dtgvA==
=kPb9
-----END PGP SIGNATURE-----
--=-=-=--
