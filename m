From: =?UTF-8?Q?David_Bala=C5=BEic?= <xerces9@gmail.com>
Date: Sun, 26 Apr 2020 12:44:44 +0000
Subject: Re: PPPoE Modem hangup after random time - how to debug?
Message-Id: <CAPJ9Yc_=ZDNAGBRw4wZJ+ibBF6mW3bj4Dv5ehvOGrX=4aamkmA@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
In-Reply-To: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

On Sun, 26 Apr 2020 at 03:34, Michael Richardson <mcr@sandelman.ca> wrote:
>
> David Bala=C5=BEic <xerces9@gmail.com> wrote:
>     > OK, more data:
>     > I started tcpdump with the -e option as suggested on openwrt forum:
>     > tcpdump -e -v -i eth1.3902 pppoed
>
> tcpdump isn't going to be able to see what happens after the interface go=
es
> down.
>         tcpdump -e -v -i eth1 vlan 3902 pppoed
>
> ought to work slightly better, but due to the way vlans are evaluated, mi=
ght
> not work properly.  {as maintainer, it's a major PITA...}

tcpdump -e -v -i eth1 vlan 3902 and pppoed

seems to work, it started it and wait for results. (just "tcpdump -e
-v -i eth1 vlan 3902" shows a lot of packets)
