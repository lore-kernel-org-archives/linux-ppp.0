From: Toralf =?utf-8?q?F=C3=B6rster?= <toralf.foerster@gmx.de>
Date: Wed, 05 Jan 2011 13:25:29 +0000
Subject: unmet direct dependencies (NETDEVICES)
Message-Id: <201101051425.29481.toralf.foerster@gmx.de>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

Hello,

a "make randconfig 1>/dev/null" gave today :

warning: (PPP && NETDEVICES || SLIP_COMPRESSED && NETDEVICES && SLIP ||=20
ISDN_PPP && ISDN && ISDN_I4L && INET) selects SLHC which has unmet direct=20
dependencies (NETDEVICES)

for the current git kernel sources.
Is this an already known issue ?

--=20
MfG/Kind regards
Toralf F=C3=B6rster

pgp finger print: 7B1A 07F4 EC82 0F90 D4C2 8936 872A E508 7DB6 9DA3

