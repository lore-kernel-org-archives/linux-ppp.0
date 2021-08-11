From: Guillaume Nault <gnault@redhat.com>
Date: Wed, 11 Aug 2021 17:19:18 +0000
Subject: Re: [PATCH] ppp: Add rtnl attribute IFLA_PPP_UNIT_ID for specifying ppp unit id
Message-Id: <20210811171918.GD15488@pc-32.home>
List-Id: <linux-ppp.vger.kernel.org>
References: <20210807163749.18316-1-pali@kernel.org>
 <20210809122546.758e41de@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <20210809193109.mw6ritfdu27uhie7@pali>
 <20210810153941.GB14279@pc-32.home>
 <20210810160450.eluiktsp7oentxo3@pali>
In-Reply-To: <20210810160450.eluiktsp7oentxo3@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Paul Mackerras <paulus@samba.org>, "David S. Miller" <davem@davemloft.net>, linux-ppp@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Aug 10, 2021 at 06:04:50PM +0200, Pali Roh=E1r wrote:
> On Tuesday 10 August 2021 17:39:41 Guillaume Nault wrote:
> > On Mon, Aug 09, 2021 at 09:31:09PM +0200, Pali Roh=E1r wrote:
> > > Better to wait. I would like hear some comments / review on this patch
> > > if this is the correct approach as it adds a new API/ABI for userspac=
e.
> >=20
> > Personally I don't understand the use case for setting the ppp unit at
> > creation time.
>=20
> I know about two use cases:
>=20
> * ppp unit id is used for generating network interface name. So if you
>   want interface name ppp10 then you request for unit id 10. It is
>   somehow common that when ppp interface has prefix "ppp" in its name
>   then it is followed by unit id. Seems that existing ppp applications
>   which use "ppp<num>" naming expects this. But of course you do not
>   have to use this convention and rename interfaces as you want.

Really, with the netlink API, the interface name has to be set with
IFLA_IFNAME. There's no point in adding a new attribute just to have a
side effect on the device name.

> * Some of ppp ioctls use unit id. So you may want to use some specific
>   number for some network interface. So e.g. unit id 1 will be always
>   for /dev/ttyUSB1.

But what's the point of forcing unit id 1 for a particular interface?
One can easily get the assigned unit id with ioctl(PPPIOCGUNIT).

> > I didn't implement it on purpose when creating the
> > netlink interface, as I didn't have any use case.
> >=20
> > On the other hand, adding the ppp unit in the netlink dump is probably
> > useful.
>=20
> Yes, this could be really useful as currently if you ask netlink to
> create a new ppp interface you have to use ioctl to retrieve this unit
> id. But ppp currently does not provide netlink dump operation.
>=20
> Also it could be useful for this "bug":
> https://lore.kernel.org/netdev/20210807132703.26303-1-pali@kernel.org/t/#u

This patch itself makes sense, but how is that related to unit id?

> And with unit id there also another issue:
> https://lore.kernel.org/netdev/20210807160050.17687-1-pali@kernel.org/t/#u

This patch shows why linking unit id and interface name are a bad idea.

Instead of adding more complexity with unit id, I'd prefer to have a
new netlink attribute that says "don't generate the interface name
based on the unit id". That's how the original implementation worked by
the way and I'm really sad I accepted to change it...

> But due to how it is used we probably have to deal with it how ppp unit
> id are defined and assigned...
>=20
