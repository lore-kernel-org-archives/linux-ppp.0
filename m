From: Charles Price <cpwp@w3z.co.uk>
Date: Tue, 19 Oct 2004 15:25:50 +0000
Subject: Re: [SUCCESS] Kernel-mode PPPoE server.
Message-Id: <200410191625.55081.cpwp@w3z.co.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="nextPart1663686.a99FdkGxpX"
List-Id: <linux-ppp.vger.kernel.org>
To: linux-ppp@vger.kernel.org

--nextPart1663686.a99FdkGxpX
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

I find that when I build pppd and rp-pppoe, two copies of rp-pppoe.so are=20
created - one built by each package. The copy from rp-pppoe-3.5 is installe=
d=20
in /etc/ppp/plugins and doesn't work, but I copied the pppd-cvs version ove=
r=20
the top of it and everything works perfectly.

I'm not sure what went wrong - probably my installation technique ;-)

Thank you for your help on this one, Michel.

Regards,

Charlie Price

On Tuesday 19 October 2004 11:30, Michal Ostrowski wrote:
> Try using the binary from the system that works on the new system.  I'm
> not seeing there being any sort of pppoe specific problem.  It appears
> to be an issue of pppd not sending the first LCP packet.
>

--nextPart1663686.a99FdkGxpX
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBBdTIC3k8SswDN/tkRAj0/AJ9da6Ih8hMPwEF+pEFqQjFrfI5UuQCeMkjB
9S1aM/LMBpypK0KC85QXwD4=
=iyHT
-----END PGP SIGNATURE-----

--nextPart1663686.a99FdkGxpX--
