From: Guillaume Nault <gnault@redhat.com>
Date: Fri, 24 Apr 2020 15:54:59 +0000
Subject: Re: PPPoE Modem hangup after random time - how to debug?
Message-Id: <20200424155459.GB21114@pc-3.home>
List-Id: <linux-ppp.vger.kernel.org>
References: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
In-Reply-To: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

On Thu, Apr 23, 2020 at 02:13:14PM +0200, David Bala=C5=BEic wrote:
> Oh, i'm "lucky", shortly after starting "tcpdump -i eth1.3902 pppoed"
> there was another disconnect:
>=20
> Thu Apr 23 11:44:13 2020 daemon.notice pppd[10756]: Modem hangup
>=20
> tcpdump output:
>=20
> listening on eth1.3902, link-type EN10MB (Ethernet), capture size 262144 =
bytes
> 11:44:09.749322 PPPoE PADO [Service-Name] [AC-Name "SIMB_TABOR_BNG1"]
> [Host-Uniq 0x44************long_number******************************AA]
> [AC-Cookie ".5b************v"]
> 11:44:09.754297 PPPoE PADS [ses 0x1] [Service-Name] [Host-Uniq
> 0x44*******************long_number*********************************AA]
> 11:44:13.115312 PPPoE PADT [ses 0x1]
> 11:44:13.126422 PPPoE PADT [ses 0x1] [Host-Uniq 0x00002A04] [AC-Cookie
> 0xED****************************75]
> tcpdump: pcap_loop: The interface went down
> 4 packets captured
> 22 packets received by filter
> 0 packets dropped by kernel
>=20
>=20
> The ifconfig packet counter for the VLAN interface eth1.3902 is reset,
> compare to values in quested message below, this is th eoutpu a few
> minutes after the reconnect:
>=20
> eth1      Link encap:Ethernet  HWaddr C4:3D:C7:90:CE:ED
>           inet6 addr: fe80::c63d:c7ff:fe90:ceed/64 Scope:Link
>           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
>           RX packets:24193753 errors:0 dropped:0 overruns:3 frame:0
>           TX packets:12513809 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:1000
>           RX bytes:4171215264 (3.8 GiB)  TX bytes:2485973 (2.3 MiB)
>           Interrupt:5
>=20
> eth1.3902 Link encap:Ethernet  HWaddr C4:3D:C7:90:CE:ED
>           inet6 addr: fe80::c63d:c7ff:fe90:ceed/64 Scope:Link
>           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
>           RX packets:255930 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:42015 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:1000
>           RX bytes:126494373 (120.6 MiB)  TX bytes:25853728 (24.6 MiB)
>=20
You can monitor the evolution of you network devices with rtmon:
$ rtmon file ./some/file.log link

Then read it with ip monitor:
$ ip monitor file ./some/file.log

That should tell if eth1.3902 is ever passed down or even deleted.
