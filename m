From: Pasi =?iso-8859-1?Q?K=E4rkk=E4inen?= <pasik@iki.fi>
Date: Tue, 25 Jan 2005 14:49:06 +0000
Subject: [PATCH] pppd 2.4.3 support for DNS and WINS from Radius
Message-Id: <20050125144906.GX16286@edu.joroinen.fi>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

Hi again!

http://nrg.joroinen.fi/ppp/pppd-2.4.3-radius-dns-wins-1.diff

Patch updated for pppd 2.4.3. It should have no effect to the normal
behaviour if Radius server does not return DNS and/or WINS addresses
for the user.

Could you please apply this to the cvs?

-- Pasi K=E4rkk=E4inen
      =20
                                   ^
                                .     .
                                 Linux
                              /    -    \
                             Choice.of.the
                           .Next.Generation.
