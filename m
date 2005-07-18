From: Nolan Eakins <sneakin@semanticgap.com>
Date: Mon, 18 Jul 2005 07:35:14 +0000
Subject: Linux Greatest Feature
Message-Id: <dbfm3g$h6$1@sea.gmane.org>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

I just blogged this and thought it should be brought to your guys'
attention:

I want to bring more attention to this feature. As you may know I'm
stuck on lowly dialup that only costs me $6.95/month. One of the great
benefits of dialup is that I get disconnected periodically. This
wouldn't be worth blogging about if there wasn't something bugging me.
What's bothering me is that Linux DOES NOT disconnect those sockets,
while Windows does.

Since Windows is the pearl here, I'll describe what it does. Say I have
Psi and Thunderbird open, and I get disconnected. Windows immediately
tells them that their sockets are toast, and the application will try to
reconnect since it lost the connection.

Under Linux this doesn't happen. I get disconnected, and I have to wait
for the sockets to TIMEOUT. So I end up with Psi spewing things into a
blackhole, and Thunderbird flat out screws up and can barely function.

A long while back I made a post about this to the Linux PPP mailing
list. The reason that was laid out is that sockets and the devices are
in seperate layers so a socket doesn't know what device it is on. That's
nice if you have an ethernet cable powering a static IP, and you like to
unplug it just for shits. It's not so nice when you're on a dynamic IP
and well, those connections just don't make any sense anymore.

Regards,
Nolan Eakins

PS: Where can I get my penis enlargment and some spam?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFC21uxhuPszQVSPEARAuA8AJ0YrJekZig5DIHiwEGGBglRGpWM9ACeNAdZ
T7QkyhfnoPnSTrzwGPjO+qc=1Nmz
-----END PGP SIGNATURE-----

