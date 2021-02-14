From: Michael Richardson <mcr@sandelman.ca>
Date: Sun, 14 Feb 2021 01:57:35 +0000
Subject: Re: Configuring pppd to accept link-local IPv6 interface id from remote peer
Message-Id: <15154.1613267855@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-=-="
List-Id: <linux-ppp.vger.kernel.org>
References: <d529e496-ac5f-9498-0e3d-1fa1ec2c4750@aelius.com>
In-Reply-To: <d529e496-ac5f-9498-0e3d-1fa1ec2c4750@aelius.com>
To: linux-ppp@vger.kernel.org

--=-=-=
Content-Type: text/plain


Nicholas Humfrey <njh@aelius.com> wrote:
    > I have two pppd (v2.4.7) instances running, talking to each over over a
    > serial port link. But I can't work out how to get the 'client' pppd to
    > accept the link-local IPv6 interface identifier provided by the
    > 'server' pppd. I am trying to use static addresses so I know the
    > link-local IP address of the remote peer.

So, basically you want to have ppp running with unnumbered links, and then
maybe you do routing over that?

I am not surprised that this hasn't been tested, and that there are bugs.
Mostly, IP6CP assigns random IPv6-LL.

If your goal is routing over unnumbered links, you don't really need the
destination IPv6-LL to route to, it's enough to "dev ppp0" or whatever.

If you just want a stable identifier at each end, then put it on lo a /128
alias, and put a route to it.

--
]               Never tell me the odds!                 | ipv6 mesh networks [
]   Michael Richardson, Sandelman Software Works        |    IoT architect   [
]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails    [


--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEbsyLEzg/qUTA43uogItw+93Q3WUFAmAog48ACgkQgItw+93Q
3WXelwgAjJUBanvsiWaBqccF6wyaiV+yHJtiEQufFeALbkvTfgKfAiRHuNvKuvkm
mXQ53mvSXgVLbZSEJg37sdVKBobNEZTx5ITWy6V7o8pacJQ+rAomBAF9aBiM/Mdm
KExM3KSaTCJBMNBZg7x6gAwj/4TKXsZm/FNoXkQhAZnipd9iu6hncJSceaSAE281
dyBOIOEViKrXLtahH4JpzDtXU080136TrAnM5qUNRHCYSUqdQ15w1qk4m9+nMF4M
BkWi8UvAhOKu1oumdFyn1HKHrIGpU5vssmJNPTM2QTHFxLdLZXVmJUkGrx6T/07N
3ATuAsVXiW8PE9zk5QHRYhw7Rpv3ew==
=2P7t
-----END PGP SIGNATURE-----
--=-=-=--
