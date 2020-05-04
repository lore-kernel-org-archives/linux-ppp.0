From: Guillaume Nault <gnault@redhat.com>
Date: Mon, 04 May 2020 12:27:40 +0000
Subject: Re: PPPoE Modem hangup after random time - how to debug?
Message-Id: <20200504122740.GA27585@pc-3.home>
List-Id: <linux-ppp.vger.kernel.org>
References: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
In-Reply-To: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

On Wed, Apr 29, 2020 at 01:58:37PM +0200, David Bala=C5=BEic wrote:
> Next disconnect:
>=20
> NOTE: c4:XX:XX:XX:XX:ed  is my wan interfaces MAC address
>=20
> tcpdump -e -v -i eth1 vlan 3902 and pppoed
>=20
This puts the parent interface in promiscuous mode.

> tcpdump: listening on eth1, link-type EN10MB (Ethernet), capture size
> 262144 bytes
> ** several PADO and PADS packet sent from server/AC to
> 44:4e:6d:fd:c7:39 before this, during the day **
> 05:03:44.348738 a4:7b:2c:9e:c7:44 (oui Unknown) > 00:0f:94:ef:64:e0
> (oui Unknown), ethertype 802.1Q (0x8100), length 75: vlan 3902, p 1,
> ethertype PPPoE D, PPPoE PADO [Service-Name] [AC-Name
> "SIMB_TABOR_BNG1"] [Host-Uniq 0x960B0000] [AC-Cookie
> 0xDCC3248D61A5D76C7C1DD4138431B17C]
> 06:40:27.668095 a4:7b:2c:9e:c7:44 (oui Unknown) > 44:4e:6d:fd:c7:39
> (oui Unknown), ethertype 802.1Q (0x8100), length 101: vlan 3902, p 1,
> ethertype PPPoE D, PPPoE PADO [Service-Name] [AC-Name
> "SIMB_TABOR_BNG1"] [Host-Uniq
> 0x444E6DFDC739AAAAAAAA92000000AAAAAAAA4621426F78202020AAAAAAAA]
> [AC-Cookie ".5b.u...~.F.mlKv"]
> 06:40:27.674078 a4:7b:2c:9e:c7:44 (oui Unknown) > 44:4e:6d:fd:c7:39
> (oui Unknown), ethertype 802.1Q (0x8100), length 62: vlan 3902, p 1,
> ethertype PPPoE D, PPPoE PADS [ses 0x1] [Service-Name] [Host-Uniq
> 0x444E6DFDC739AAAAAAAA92000000AAAAAAAA4621426F78202020AAAAAAAA]

> 06:40:30.552119 a4:7b:2c:9e:c7:44 (oui Unknown) > 44:4e:6d:fd:c7:39
> (oui Unknown), ethertype 802.1Q (0x8100), length 60: vlan 3902, p 1,
> ethertype PPPoE D, PPPoE PADT [ses 0x1]
>=20
Because the interface is in promiscuous mode, this PADT is accepted,
even though the destination MAC address is different from the one of
your interface. That's certainly the reason why you got disconnected
(assuming your PPPoE session Id. was 1).

Also, please avoid wrapping your log lines, that makes them close to
unreadable.
