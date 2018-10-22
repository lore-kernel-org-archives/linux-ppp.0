From: Morel =?UTF-8?B?QsOpcmVuZ2Vy?= <berenger.morel@sga-automation.com>
Date: Mon, 22 Oct 2018 10:28:18 +0000
Subject: How to know when a link is established or destroyed?
Message-Id: <20181022122818.1780e0bd@PC-dev2>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Sig_/iMs.RZ=SjmV.pV_PNAzyx7j"
List-Id: <linux-ppp.vger.kernel.org>
To: linux-ppp@vger.kernel.org

--Sig_/iMs.RZ=SjmV.pV_PNAzyx7j
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello.

I am using pppd to have network access through GPRS/3G/4G on systems I
do not have physical access to.

Since I want the system to be up almost always, I am trying to manage
my daemons through runit (daemontools), which works by keeping child
process foreground and restart it when it dies for a reason or another,
eventually logging whatever came on stdout.

I can run pppd in that way, but I have no idea about how to know if the
connection is really established or not, and on some systems manual
reboot is sometimes needed, because it seems that pppd only tries 3 or
4 times to restore connection when link is cut, and if not it just
stays alive doing nothing.

So, I think either I missed the options needed to do what I need, or
there is a tool to manage pppd that I don't know, or it is not
implemented at all.

If if is not implemented at all, is it intended? Would it be fine if I
submit a patch doing this?

Note:
I am using the 2.4.7 version from the Debian 9 (stretch) package
2.4.7-1+4 on amd64.
$ uname -a
Linux PC-dev2 4.9.0-5-amd64 #1 SMP Debian 4.9.65-3+deb9u2 (2018-01-04)
x86_64 GNU/Linux

Thanks in advance.

PS: I'm not registered to this list, so I added my mail in the CC field.

--=20
SGA Automation
27 Rue Jean-Philippe Rameau
P=C3=B4le Delta
76000 Rouen
Tel : 02 32 10 38 53
Fax : 02 32 10 11 30
www.sga-automation.com
Email : berenger.morel@sga-automation.com

--Sig_/iMs.RZ=SjmV.pV_PNAzyx7j
Content-Type: application/pgp-signature
Content-Description: Signature digitale OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEE6EOLY3cbbbyLd7blx7EBpfPu3/IFAlvNpkIACgkQx7EBpfPu
3/I3NQf/f2yUU7RL0Nng1f584EdeRPlrmKNVUC3r7zXsFV0vHDP5/3vQvgECETdQ
KNsSwqT5dVDI/X+DHQOutx4iToRLAua5wP9OStqIZ1A1au+5VFZxV+njVO0VLpqj
vGleGTyJ+Cng0NumtSic7u0zgagPo31haZgE3Zpf7ypLNsb5xTUeHMMBBetqEAqd
bvDygKikN9IUg7mTu3wi3bmdho3nqVkRxY7rMga55fOM2hbq8z4FFZBc+UUpS+iK
Pa9O2Eg/zQZBeXV3bOqzNIJdImWmOQEU4304uIBcaY1rGjirzgDbmHpatZkoSEUZ
l2lmlH83wC4PwahNbYc66TU7epap6Q==
=qZZn
-----END PGP SIGNATURE-----

--Sig_/iMs.RZ=SjmV.pV_PNAzyx7j--
