From: =?UTF-8?Q?David_Bala=C5=BEic?= <xerces9@gmail.com>
Date: Sun, 26 Apr 2020 12:48:51 +0000
Subject: Re: PPPoE Modem hangup after random time - how to debug?
Message-Id: <CAPJ9Yc-Tj+pLJ_vfLuERUi-2oGadeaWTJSkDFNw0rLoqMCmL3Q@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
In-Reply-To: <CAPJ9Yc8Wvxb_UoqGu=wrrWX2HP5AwE98jvcS3XYnvevxa0RZpg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-ppp@vger.kernel.org

On Sun, 26 Apr 2020 at 03:38, Michael Richardson <mcr@sandelman.ca> wrote:
>
>
> David Bala=C5=BEic <xerces9@gmail.com> wrote:
>     >> OK, more data:
>     >> I started tcpdump with the -e option as suggested on openwrt forum:
>     >> tcpdump -e -v -i eth1.3902 pppoed
>     >>
>     >> on disconnect, this was logged (times are UTC):
>     >>
>     >>
>     >> tcpdump: listening on eth1.3902, link-type EN10MB (Ethernet), capt=
ure
>     >> size 262144 bytes
>     >> 18:23:09.204991 a4:7b:2c:9e:c7:44 (oui Unknown) > 44:4e:6d:fd:c7:39
>     >> (oui Unknown), ethertype PPPoE D (0x8863), length 97: PPPoE PADO
>     >> [Service-Name] [AC-Name "SIMB_TABOR_BNG1"] [Host-Uniq
>     >> 0x44************long_number******************************AA]
>     >> [AC-Cookie ".5b************v"]
>
>     > Isnt this strange? The dst addr is not my router or any other known.
>     > Also the Host-Uniq value is different.
>     > As if is traffic meant for someone else.
>
> oh, I understand.
> thank you for noting this.
> So, it's as if you are getting a PPPoE message for someone else, and when
> that happens, the interface is dying.
> Is it always the same ethernet address?

Yes,the same.

> Do you have ebtables?  Could you arrange to filter out packets like that?
> That would point to there being some kernel bug.
>
> Clearly, your ISP has some other bug that they are sending stuff down the
> wrong pipe, but that could just be hash collisions that they assume are
> "harmless".

Those packets don't seem to be a problem. In the last connection, I
received 15 of them and no reconnect.

As suggested on OpenWRT, I removed a IPv6 wan device config that was
running DHCPv6 on eth1.

Then he connection was up for 45 hours before dropping. Could be a
coincidence...

I posted the logs at
https://forum.openwrt.org/t/pppoe-disconnects-every-few-hours/61239/22
(gmail wraps lines...)

Regards,
David
