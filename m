From: Marcus Better <marcus@better.se>
Date: Wed, 06 May 2009 19:16:24 +0000
Subject: Re: pppd handling of ms-wins
Message-Id: <4A01E208.10300@better.se>
List-Id: <linux-ppp.vger.kernel.org>
References: <alpine.LNX.2.00.0905061523590.22532@wotan.suse.de>
In-Reply-To: <alpine.LNX.2.00.0905061523590.22532@wotan.suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Jiri Kosina skrev:
> there are situations out there, in which pppd is not able to handle 
> ms-wins negotiation with certain UMTS/HSDPA/.... modems properly. More can 
> be seen on [1] and [2], including the discussion patch which fixes the 
> issue.

Yes, at the moment my OpenWRT router with a Huawei E220 USB modem
invariably fails on the first connection attempt after boot, but not on
subsequent attempts.

> Was there any discussion about the patch being rejected, or has it just 
> never been submitted properly to maintainers?

The latter.

I've had some feedback on the patch from a couple of users, it worked
for them as well and nobody has reported problems with it.

Cheers,

Marcus

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEARECAAYFAkoB4ggACgkQXjXn6TzcAQlAmQCfdQXMc8sSxzxXTvAY8Fw3UXRd
FssAoNHM1nA2rKMIa8hPzQpwd+/dfalt
=uSQC
-----END PGP SIGNATURE-----
