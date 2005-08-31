From: James Cameron <james.cameron@hp.com>
Date: Wed, 31 Aug 2005 05:33:15 +0000
Subject: Re: Spontaneous LCP ConfReq after connection made
Message-Id: <20050831053315.GF5800@hp.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="tThc/1wpZn/ma/RB"
List-Id: <linux-ppp.vger.kernel.org>
References: <20050812073342.GL28862@hp.com>
In-Reply-To: <20050812073342.GL28862@hp.com>
To: linux-ppp@vger.kernel.org


--tThc/1wpZn/ma/RB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Providing a touch more closure to this thread; since blocking certain
packets from being sent through the link, the symptom no longer occurs,
so I think the peer is indeed broken.

The ip-up script now does this;

# eth1 satellite service is 192.168.x.x
iptables --insert OUTPUT 1 --source 192.168.0.0/255.255.0.0 \
    --destination 0.0.0.0/0.0.0.0 --jump DROP \
    --out-interface ${PPP_IFACE}

# eth0 internal network is 10.0.x.x
iptables --insert OUTPUT 1 --source 10.0.0.0/255.255.0.0 \
    --destination 0.0.0.0/0.0.0.0 --jump DROP \
    --out-interface ${PPP_IFACE}

# block any PPTP VPN traffic
iptables --insert OUTPUT 1 --protocol GRE --jump DROP \
    --out-interface ${PPP_IFACE}

--=20
James Cameron
http://ftp.hp.com.au/sigs/jc/

--tThc/1wpZn/ma/RB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFDFUEbIiWKUhK+Mj4RAjU5AKCOG5XSvrvPRSZtOeDVBEHV0x2x/QCeOta7
viCDGFOOhpFyKpZnjGKuy18=
=bO8x
-----END PGP SIGNATURE-----

--tThc/1wpZn/ma/RB--
