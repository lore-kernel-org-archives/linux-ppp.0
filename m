From: David Ananian-Cooper <davidac17@yahoo.com>
Date: Wed, 29 Sep 2004 06:16:32 +0000
Subject: Re: counters overflow
Message-Id: <200409291604.50034.davidac17@yahoo.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="nextPart1682294.7psFZYP9Ge"
List-Id: <linux-ppp.vger.kernel.org>
References: <262655318.20040929092029@rsl.ru>
In-Reply-To: <262655318.20040929092029@rsl.ru>
To: linux-ppp@vger.kernel.org

--nextPart1682294.7psFZYP9Ge
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

hi

i've encountered the same problem working the code while writing a plugin. =
i=20
managed to get around it by taking a copy of the counters every few minutes=
=20
and noting when they loop around to zero (i.e. when old_value > new_value).=
=20
its a bit of a hack, but it seems to work for my purposes.

david ananian-cooper

On Wed, 29 Sep 2004 15:20, Dmitry Vereschaka wrote:
> Hello linux-ppp,
>
>   The problem is that counters for 'bytes in' and 'bytes out' are 32 bit
> integers, which is enough for counting data while connected via modem, but
> really small while using pppoe or pptpd-based solutions deployed over
> 100/1000mbit network.

--nextPart1682294.7psFZYP9Ge
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBBWlCBqKJjsK82VBsRAhQ2AKCdcG0NvgbHL7igvHesAgNe8MFUfgCgmy/3
baYBf844Swev2GXM8eXIHVs=
=Agon
-----END PGP SIGNATURE-----

--nextPart1682294.7psFZYP9Ge--
