From: Michael Richardson <mcr@sandelman.ca>
Date: Mon, 27 Apr 2020 02:14:11 +0000
Subject: Re: PPPoE Modem hangup after random time - how to debug?
Message-Id: <5466.1587953651@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-=-="
List-Id: <linux-ppp.vger.kernel.org>
References: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
In-Reply-To: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
To: linux-ppp@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


David Bala=C5=BEic <xerces9@gmail.com> wrote:
    > Sun Apr 26 17:34:57 2020 daemon.debug pppd[20289]: sent [IPV6CP
    > ConfReq id=3D0x1 <addr fe80::d035:60ed:928e:f741>]
    > Sun Apr 26 17:35:00 2020 daemon.debug pppd[20289]: sent [IPV6CP
    > ConfReq id=3D0x1 <addr fe80::d035:60ed:928e:f741>]
    > Sun Apr 26 17:35:03 2020 daemon.debug pppd[20289]: sent [IPV6CP
    > ConfReq id=3D0x1 <addr fe80::d035:60ed:928e:f741>]
    > Sun Apr 26 17:35:06 2020 daemon.debug pppd[20289]: sent [IPV6CP
    > ConfReq id=3D0x1 <addr fe80::d035:60ed:928e:f741>]
    > Sun Apr 26 17:35:09 2020 daemon.warn pppd[20289]: IPV6CP: timeout
    > sending Config-Requests

Could this be the reason for the hangup?
pppd gets tired of no IPv6, decides it should hangup?

    > The strange part is in the tcpdump there is a PADT sent to an
    > "unknown" MAC and my pppd responds. At least that is how I see it.

    > You think NOT putting the interface into promiscuous mode (done by
    > tcpdump) would prevent this?
    > Anyway, now I startted tcpdump with the -p option:  tcpdump -e -v -p
    > -i eth1 vlan 3902 and pppoed

It could be that promisc mode (no -p) means that the PADT makes something
break, different than what you are investigating.  -p avoid promisc mode, so
would avoid seeing that packet.

You mention in another thread that you were trying to do DHCPv6 on a
different (non-PPPoE) interface.  I don't see how that would matter unless
the failure caused netifd to decide to retry it all.

It seems that you ought to try the noipv6 option to pppd.


=2D-
]               Never tell me the odds!                 | ipv6 mesh network=
s [
]   Michael Richardson, Sandelman Software Works        |    IoT architect =
  [
]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails  =
  [


--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEbsyLEzg/qUTA43uogItw+93Q3WUFAl6mP/IACgkQgItw+93Q
3WUQAwgAi6hPqP63bW32GDO7qhjCkFt+BkOJLWdszSB5OBO5NzVYCNpbCIYn6qKk
/CNsSYAFfcSUVkeOSanWCGkcTdxWB5dbdRee6bhJ1aptHOqgW+fDk3L+uP9yE6b0
PMsYW2G71h6V34l0arXLGCTTKjm3bfQwZ8V54t0Zah3RZt6YVMvNVa35BPm+aeu0
/OznEodI/wKznq4wCc/qJT28MqV1NLkIs3ekiWXyd/svjDYpHyfIEaxrhsvHYex4
B3ecZA3SrtoVkeoRhiobPGmfHpBwh/Azhx3GLV8+uMjYJNxwYKdz7vNiwhBbH3/Y
X0Z9ab/q3MYufK0XGp9tz1FsvdWssQ==
=4h/b
-----END PGP SIGNATURE-----
--=-=-=--
