From: Nolan Eakins <sneakin@semanticgap.com>
Date: Wed, 19 Jan 2005 16:52:28 +0000
Subject: Disconnecting sockets on PPP interface going down
Message-Id: <csm328$qbc$1@sea.gmane.org>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,
~  For random reasons (phone cord getting kicked out of the wall,
incoming call, ISP trouble) I get disconnected. I have KPPP setup to
automatically redial when this happens, but each time I have to manually
reconnect Gaim, Psi, ssh, etc. or wait 20 minutes, and it gets annoying.

This is something Windows has been able to do for God knows how long,
and I don't want to hear that it's some "feature" of some protocol
layer. It's annoying and a complete hassle, and I'd like it fixed.

Obviously the solution is to have the applications signaled so they know
that the socket's interface has died. How do I set this up? Can I set
this up so all of my applications will get notified of the
disconnection? Or how do I set things up so the connections can live
through a reconnect and change of IP address, if they can?

Any help would be appreciated.

Regards,
Nolan
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFB7pBMhuPszQVSPEARAgAGAJ9EEui1wCKv22R9l800yfTn3iekrACgv5D7
PjIzB3hcDAA/Mlj1LX6gCW0=7Z2k
-----END PGP SIGNATURE-----

