From: Charles Price <cpwp@w3z.co.uk>
Date: Tue, 19 Oct 2004 09:09:49 +0000
Subject: Re: Kernel-mode PPPoE server.
Message-Id: <200410191009.53428.cpwp@w3z.co.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="nextPart6928906.mazlSfipBf"
List-Id: <linux-ppp.vger.kernel.org>
References: <200410181453.16399.cpwp@w3z.co.uk>
In-Reply-To: <200410181453.16399.cpwp@w3z.co.uk>
To: linux-ppp@vger.kernel.org

--nextPart6928906.mazlSfipBf
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Monday 18 October 2004 23:39, Michal Ostrowski wrote:
> I think one can attribute this to a pppd behavior change.  There are
> some options to pppd that control this behavior (silent?).  I'd check to
> see if one of those options is sneaking in somewhere.  (Try using the
> dryrun option to check?)
>
The configuration options that pppd printed to syslog are listed below.  No=
te=20
that I am using PAP this time, because I will be using RADIUS but the=20
concentrator does not send the first packet if I replace require-pap with=20
require-chap.

debug   # (from /etc/ppp/pppoe-server-options)
nodetach   # (from command line)
idle 43200   # (from /etc/ppp/options)
dryrun   # (from /etc/ppp/pppoe-server-options)
plugin /etc/ppp/plugins/rp-pppoe.so   # (from /etc/ppp/pppoe-server-options)
plugin /etc/ppp/plugins/radius.so   # (from /etc/ppp/pppoe-server-options)
plugin /etc/ppp/plugins/radattr.so   # (from /etc/ppp/pppoe-server-options)
require-pap   # (from /etc/ppp/pppoe-server-options)
login   # (from /etc/ppp/pppoe-server-options)
eth1   # (from command line)
rp_pppoe_service   # (from command line)
rp_pppoe_sess 234:00:03:47:92:cf:e1   # (from command line)
eth1   # (from command line)
rp_pppoe_service   # (from command line)
rp_pppoe_sess 234:00:03:47:92:cf:e1   # (from command line)
noaccomp   # (from command line)
default-asyncmap   # (from command line)
mru 1492   # (from /etc/ppp/options)
mtu 1492   # (from /etc/ppp/options)
nopcomp   # (from command line)
lcp-echo-failure 5   # (from /etc/ppp/pppoe-server-options)
lcp-echo-interval 60   # (from /etc/ppp/pppoe-server-options)
novj   # (from command line)
novjccomp   # (from command line)
ms-dns xxx # [don't know how to print value]   # (from /etc/ppp/options)
proxyarp   # (from /etc/ppp/options)
80.168.87.200:10.67.15.234   # (from command line)
nobsdcomp   # (from command line)
nodeflate   # (from command line)
noipx   # (from /etc/ppp/options)


Any ideas on my next call of action? Would 'lsof' of pppoe-server and pppd=
=20
processes on working and non-working configurations be of any use?

I have tried replacing my kernel with the 2.4.20 from the working SuSE=20
configuration, to no avail - should I start downgrading pppd or rp-pppoe ?

Regards,

Charlie Price

--nextPart6928906.mazlSfipBf
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBBdNnh3k8SswDN/tkRAtfGAKCeqy0RZwRQuSWt45i2yQBthx52GwCfVGDY
pgfmFCrlrxjQwMsiQzQ/9hM=
=X9iu
-----END PGP SIGNATURE-----

--nextPart6928906.mazlSfipBf--
