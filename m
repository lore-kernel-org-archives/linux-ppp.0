From: Pasi =?iso-8859-1?Q?K=E4rkk=E4inen?= <pasik@iki.fi>
Date: Mon, 06 Sep 2004 15:15:49 +0000
Subject: Patch for ppp 2.4.2 to support dns/wins from radius
Message-Id: <20040906151549.GE3349@edu.joroinen.fi>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

Hi!

http://nrg.joroinen.fi/ppp/ppp-2.4.2-radius-dns-wins-1.patch

I need to assign dns and wins addresses to ppp-client from radius-server, so
I did this small patch. The patch also seems to do some stupid
whitespace-changes, just ignore them :)

Configure your radius-server to assign these vendor-specific attributes:

MS-Primary-DNS-Server
MS-Secondary-DNS-Server
MS-Primary-NBNS-Server
MS-Secondary-NBNS-Server

If these attributes are not given by the radius server, the values from the
pppd config file will be used.

There might be some bugs left, but it worked ok in my little test. I'm not
very sure if I did everything correctly so feel free to comment..

-- Pasi K=E4rkk=E4inen
      =20
                                   ^
                                .     .
                                 Linux
                              /    -    \
                             Choice.of.the
                           .Next.Generation.
