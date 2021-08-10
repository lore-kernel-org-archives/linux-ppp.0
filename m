From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
Date: Tue, 10 Aug 2021 16:04:50 +0000
Subject: Re: [PATCH] ppp: Add rtnl attribute IFLA_PPP_UNIT_ID for specifying ppp unit id
Message-Id: <20210810160450.eluiktsp7oentxo3@pali>
List-Id: <linux-ppp.vger.kernel.org>
References: <20210807163749.18316-1-pali@kernel.org>
 <20210809122546.758e41de@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <20210809193109.mw6ritfdu27uhie7@pali>
 <20210810153941.GB14279@pc-32.home>
In-Reply-To: <20210810153941.GB14279@pc-32.home>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Guillaume Nault <gnault@redhat.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Paul Mackerras <paulus@samba.org>, "David S. Miller" <davem@davemloft.net>, linux-ppp@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

On Tuesday 10 August 2021 17:39:41 Guillaume Nault wrote:
> On Mon, Aug 09, 2021 at 09:31:09PM +0200, Pali Roh=C3=A1r wrote:
> > Better to wait. I would like hear some comments / review on this patch
> > if this is the correct approach as it adds a new API/ABI for userspace.
>=20
> Personally I don't understand the use case for setting the ppp unit at
> creation time.

I know about two use cases:

* ppp unit id is used for generating network interface name. So if you
  want interface name ppp10 then you request for unit id 10. It is
  somehow common that when ppp interface has prefix "ppp" in its name
  then it is followed by unit id. Seems that existing ppp applications
  which use "ppp<num>" naming expects this. But of course you do not
  have to use this convention and rename interfaces as you want.

* Some of ppp ioctls use unit id. So you may want to use some specific
  number for some network interface. So e.g. unit id 1 will be always
  for /dev/ttyUSB1.

> I didn't implement it on purpose when creating the
> netlink interface, as I didn't have any use case.
>=20
> On the other hand, adding the ppp unit in the netlink dump is probably
> useful.

Yes, this could be really useful as currently if you ask netlink to
create a new ppp interface you have to use ioctl to retrieve this unit
id. But ppp currently does not provide netlink dump operation.

Also it could be useful for this "bug":
https://lore.kernel.org/netdev/20210807132703.26303-1-pali@kernel.org/t/#u

And with unit id there also another issue:
https://lore.kernel.org/netdev/20210807160050.17687-1-pali@kernel.org/t/#u

But due to how it is used we probably have to deal with it how ppp unit
id are defined and assigned...
