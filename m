From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
Date: Tue, 17 Aug 2021 16:21:55 +0000
Subject: Re: [PATCH] ppp: Add rtnl attribute IFLA_PPP_UNIT_ID for specifying ppp unit id
Message-Id: <20210817162155.idyfy53qbxcsf2ga@pali>
List-Id: <linux-ppp.vger.kernel.org>
References: <2f10b64e-ba50-d8a5-c40a-9b9bd4264155@workingcode.com>
 <20210811173811.GE15488@pc-32.home>
 <20210811180401.owgmie36ydx62iep@pali>
 <20210812092847.GB3525@pc-23.home>
 <20210812134845.npj3m3vzkrmhx6uy@pali>
 <20210812182645.GA10725@pc-23.home>
 <20210812190440.fknfthdk3mazm6px@pali>
 <20210816161114.GA3611@pc-32.home>
 <20210816162355.7ssd53lrpclfvuiz@pali>
 <20210817160525.GA20616@pc-32.home>
In-Reply-To: <20210817160525.GA20616@pc-32.home>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Guillaume Nault <gnault@redhat.com>
Cc: James Carlson <carlsonj@workingcode.com>, Chris Fowler <cfowler@outpostsentinel.com>, Jakub Kicinski <kuba@kernel.org>, Paul Mackerras <paulus@samba.org>, "David S. Miller" <davem@davemloft.net>, "linux-ppp@vger.kernel.org" <linux-ppp@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tuesday 17 August 2021 18:05:25 Guillaume Nault wrote:
> On Mon, Aug 16, 2021 at 06:23:55PM +0200, Pali Roh=C3=A1r wrote:
> > On Monday 16 August 2021 18:11:14 Guillaume Nault wrote:
> > > Do you have plans for adding netlink support to pppd? If so, is the
> > > project ready to accept such code?
> >=20
> > Yes, I have already some WIP code and I'm planning to send a pull
> > request to pppd on github for it. I guess that it could be accepted,
>=20
> I guess you can easily use the netlink api for cases where the "unit"
> option isn't specified and fall back to the ioctl api when it is. If
> all goes well, then we can extend the netlink api to accept a unit id.
>=20
> But what about the lack of netlink feedback about the created
> interface? Are you restricted to use netlink only when the "ifname"
> option is provided?

Exactly, this is how I wrote my WIP code...

> > specially if there still would be backward compatibility via ioctl for
> > kernels which do not support rtnl API.
>=20
> Indeed, I'd expect keeping compatiblitity with old kernels that only
> have the ioctl api to be a must (but I have no experience contributing
> to the pppd project).
>=20
> > One of the argument which can be
> > used why rtnl API is better, is fixing issue: atomic creating of
> > interface with specific name.
>=20
> Yes, that looks useful.
>=20
