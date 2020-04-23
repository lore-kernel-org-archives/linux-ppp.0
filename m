From: =?UTF-8?Q?David_Bala=C5=BEic?= <xerces9@gmail.com>
Date: Thu, 23 Apr 2020 12:13:14 +0000
Subject: Re: PPPoE Modem hangup after random time - how to debug?
Message-Id: <CAPJ9Yc9AYUeaZy7UnmfJG+9zLZd0ud3STRpdW-+c1Qgazgdt0g@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
In-Reply-To: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-ppp@vger.kernel.org

Oh, i'm "lucky", shortly after starting "tcpdump -i eth1.3902 pppoed"
there was another disconnect:

Thu Apr 23 11:44:13 2020 daemon.notice pppd[10756]: Modem hangup

tcpdump output:

listening on eth1.3902, link-type EN10MB (Ethernet), capture size 262144 bytes
11:44:09.749322 PPPoE PADO [Service-Name] [AC-Name "SIMB_TABOR_BNG1"]
[Host-Uniq 0x44************long_number******************************AA]
[AC-Cookie ".5b************v"]
11:44:09.754297 PPPoE PADS [ses 0x1] [Service-Name] [Host-Uniq
0x44*******************long_number*********************************AA]
11:44:13.115312 PPPoE PADT [ses 0x1]
11:44:13.126422 PPPoE PADT [ses 0x1] [Host-Uniq 0x00002A04] [AC-Cookie
0xED****************************75]
tcpdump: pcap_loop: The interface went down
4 packets captured
22 packets received by filter
0 packets dropped by kernel


The ifconfig packet counter for the VLAN interface eth1.3902 is reset,
compare to values in quested message below, this is th eoutpu a few
minutes after the reconnect:

eth1      Link encap:Ethernet  HWaddr C4:3D:C7:90:CE:ED
          inet6 addr: fe80::c63d:c7ff:fe90:ceed/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:24193753 errors:0 dropped:0 overruns:3 frame:0
          TX packets:12513809 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:4171215264 (3.8 GiB)  TX bytes:2485973 (2.3 MiB)
          Interrupt:5

eth1.3902 Link encap:Ethernet  HWaddr C4:3D:C7:90:CE:ED
          inet6 addr: fe80::c63d:c7ff:fe90:ceed/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:255930 errors:0 dropped:0 overruns:0 frame:0
          TX packets:42015 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:126494373 (120.6 MiB)  TX bytes:25853728 (24.6 MiB)


PS: The IPv6 address is according to standards, ignore that question.



On Thu, 23 Apr 2020 at 13:12, David Balažic <xerces9@gmail.com> wrote:
>
> One more thing I noticed:
>
> the packet count for eth1 is much higher than for eth1.3902:
>
>
> eth1      Link encap:Ethernet  HWaddr C4:XX:XX:XX:XX:ED
>           inet6 addr: fe80::c6xx:xxff:fexx:xxed/64 Scope:Link
>           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
>           RX packets:23147175 errors:0 dropped:0 overruns:3 frame:0
>           TX packets:12334230 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:1000
>           RX bytes:3553425618 (3.3 GiB)  TX bytes:4237688514 (3.9 GiB)
>           Interrupt:5
>
> eth1.3902 Link encap:Ethernet  HWaddr C4:XX:XX:XX:XX:ED
>           inet6 addr: fe80::c6xx:xxff:fexx:xxed/64 Scope:Link
>           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
>           RX packets:682037 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:91218 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:1000
>           RX bytes:373700490 (356.3 MiB)  TX bytes:26176360 (24.9 MiB)
>
> As if the eth1.3902 is somehow reset every now and then. I'll keep my eye on it.
>
>
> Also: the IPv6 address (the part derived from hwaddr) starts with c6
> instead of c4 like the actual hw address. Is that normal?
>
>
>
> On Thu, 23 Apr 2020 at 12:37, David Balažic <xerces9@gmail.com> wrote:
> >
> > Some more info:
> >
> >  - the connect time is random:
> > # logread  | grep "Connect time"
> > Wed Apr 22 16:42:18 2020 daemon.info pppd[7960]: Connect time 1742.8 minutes.
> > Wed Apr 22 19:13:03 2020 daemon.info pppd[9563]: Connect time 150.7 minutes.
> > Thu Apr 23 09:38:31 2020 daemon.info pppd[9884]: Connect time 865.5 minutes.
> >
> >
> >
> >  - the assigned IP address is different on each connection
> >
> >
> >  - logs
> > On Thu, 23 Apr 2020 at 00:00, James Carlson <carlsonj@workingcode.com> wrote:
> > >
> > > On 2020-04-22 13:45, David Balažic wrote:
> > > > Hi!
> > > >
> > > > I have a router running openwrt connected to a GPON ONT, running a
> > > > PPPoE connection (hw details below).
> > >
> > > This looks to be (possibly) a PPPoE failure, though there's nothing
> > > interesting in the log messages provided.  If there were an interesting
> > > log message, it would almost certainly come somewhere (perhaps even
> > > *minutes*) before that initial "Modem hangup" message.
> >
> > Nothing there:
> >
> > Thu Apr 23 08:59:02 2020 daemon.info hostapd: wlan0: STA
> > 58:XX:XX:XX:XX:b9 IEEE 802.11: deauthenticated due to inactivity
> > (timer DEAUTH/REMOVE)
> > Thu Apr 23 09:38:31 2020 daemon.notice pppd[9884]: Modem hangup
> >
> > I'll try packet capture next.
> >
> > Regards,
> > David
