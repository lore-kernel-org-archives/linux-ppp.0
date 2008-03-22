From: Martin Ereth <martin.ereth@arcor.de>
Date: Sat, 22 Mar 2008 21:20:04 +0000
Subject: Re: Connection between Draytek 2500We and Eee fails with "No auth
Message-Id: <47E57804.7070609@arcor.de>
List-Id: <linux-ppp.vger.kernel.org>
References: <47E3EEA6.2010103@arcor.de>
In-Reply-To: <47E3EEA6.2010103@arcor.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

James Carlson wrote:
| Martin Ereth writes:
[...]
| You don't have it configured, so you refuse.  That's the problem.  You
| haven't set up your local credentials properly.
|
| You'll need to put correct entries into /etc/ppp/chap-secrets to make
| this work.
|
| Note that you'll also want to use the pppd "user" option *instead* of
| the "name" option.  The latter is designed for servers.  It may work
| here, but it's not quite what you want.

Thank you very much!
I was able to resolve my problem with your help!

Martin

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.7 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFH5XgEE5UqXaCvB8IRAs5gAKCWFe5P0i3lCiCrOj+dgchn8bLRpACgu6To
38LrA1WaknFX1uftVnu/Jj8=bhTc
-----END PGP SIGNATURE-----
