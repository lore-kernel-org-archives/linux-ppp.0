From: Toralf =?iso-8859-15?q?F=F6rster?= <toralf.foerster@gmx.de>
Date: Sun, 25 May 2008 15:42:30 +0000
Subject: [PATCH] net: fix 2 "unused variable(s)" warnings
Message-Id: <200805251742.33354.toralf.foerster@gmx.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="nextPart1211735565.ArEv918XBx"
List-Id: <linux-ppp.vger.kernel.org>
To: linux-ppp@vger.kernel.org

--nextPart1211735565.ArEv918XBx
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hello,

this patch should fix 2 compiler warnings if CONFIG_INET is not set :

  CC      drivers/net/wan/syncppp.o
drivers/net/wan/syncppp.c: In function 'sppp_cisco_input':
drivers/net/wan/syncppp.c:767: warning: unused variable 'ifa'
drivers/net/wan/syncppp.c:766: warning: unused variable 'in_dev'

Signed-off-by: Toralf F=F6rster <toralf.foerster@gmx.de>
=2D--
diff --git a/drivers/net/wan/syncppp.c b/drivers/net/wan/syncppp.c
index 29b4b94..c938d4c 100644
=2D-- a/drivers/net/wan/syncppp.c
+++ b/drivers/net/wan/syncppp.c
@@ -763,10 +763,10 @@ static void sppp_cisco_input (struct sppp *sp, struct=
 sk_buff *skb)
        case CISCO_ADDR_REQ:
                /* Stolen from net/ipv4/devinet.c -- SIOCGIFADDR ioctl */
                {
=2D               struct in_device *in_dev;
=2D               struct in_ifaddr *ifa;
                __be32 addr =3D 0, mask =3D htonl(~0U); /* FIXME: is the ma=
sk correct? */
 #ifdef CONFIG_INET
+               struct in_device *in_dev;
+               struct in_ifaddr *ifa;
                rcu_read_lock();
                if ((in_dev =3D __in_dev_get_rcu(dev)) !=3D NULL)
                {
=2D-=20
MfG/Sincerely

Toralf F=F6rster
pgp finger print: 7B1A 07F4 EC82 0F90 D4C2 8936 872A E508 7DB6 9DA3

--nextPart1211735565.ArEv918XBx
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)

iEYEABECAAYFAkg5iOkACgkQhyrlCH22naOnhwCfWUuIEcmU1m0cyYGOiGF41Va2
glkAoJxd1yohjUosYozpGQ5PuZpxZOQa
=AxO8
-----END PGP SIGNATURE-----

--nextPart1211735565.ArEv918XBx--
