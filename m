From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
Date: Wed, 11 Aug 2021 18:04:01 +0000
Subject: Re: [PATCH] ppp: Add rtnl attribute IFLA_PPP_UNIT_ID for specifying ppp unit id
Message-Id: <20210811180401.owgmie36ydx62iep@pali>
List-Id: <linux-ppp.vger.kernel.org>
References: <20210807163749.18316-1-pali@kernel.org>
 <20210809122546.758e41de@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <20210809193109.mw6ritfdu27uhie7@pali>
 <20210810153941.GB14279@pc-32.home>
 <BN0P223MB0327A247724B7AE211D2E84EA7F79@BN0P223MB0327.NAMP223.PROD.OUTLOOK.COM>
 <20210810171626.z6bgvizx4eaafrbb@pali>
 <2f10b64e-ba50-d8a5-c40a-9b9bd4264155@workingcode.com>
 <20210811173811.GE15488@pc-32.home>
In-Reply-To: <20210811173811.GE15488@pc-32.home>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Guillaume Nault <gnault@redhat.com>
Cc: James Carlson <carlsonj@workingcode.com>, Chris Fowler <cfowler@outpostsentinel.com>, Jakub Kicinski <kuba@kernel.org>, Paul Mackerras <paulus@samba.org>, "David S. Miller" <davem@davemloft.net>, "linux-ppp@vger.kernel.org" <linux-ppp@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wednesday 11 August 2021 19:38:11 Guillaume Nault wrote:
> On Tue, Aug 10, 2021 at 02:11:11PM -0400, James Carlson wrote:
> > On 8/10/21 1:16 PM, Pali Roh=C3=A1r wrote:
> > > On Tuesday 10 August 2021 16:38:32 Chris Fowler wrote:
> > > > Isn't the UNIT ID the interface number?  As in 'unit 100' will give=
 me ppp100?
> > >=20
> > > If you do not specify pppd 'ifname' argument then pppd argument 'unit=
 100'
> > > will cause that interface name would be ppp100.
> > >=20
> > > But you are free to rename interface to any string which you like, ev=
en
> > > to "ppp99".
> > >=20
> > > But this ppp unit id is not interface number. Interface number is
> > > another number which has nothing with ppp unit id and is assigned to
> > > every network interface (even loopback). You can see them as the first
> > > number in 'ip -o l' output. Or you can retrieve it via if_nametoindex=
()
> > > function in C.
> >=20
> > Correct; completely unrelated to the notion of "interface index."
> >=20
> > > ... So if people are really using pppd's 'unit' argument then I think=
 it
> > > really make sense to support it also in new rtnl interface.
> >=20
> > The pppd source base is old.  It dates to the mid-80's.  So it predates=
 not
> > just rename-able interfaces in Linux but Linux itself.
> >=20
> > I recall supported platforms in the past (BSD-derived) that didn't supp=
ort
> > allowing the user to specify the unit number.  In general, on those
> > platforms, the option was accepted and just ignored, and there were eit=
her
> > release notes or man page updates (on that platform) that indicated that
> > "unit N" wouldn't work there.
> >=20
> > Are there users on Linux who make use of the "unit" option and who would
> > mourn its loss?  Nobody really knows.  It's an ancient feature that was
> > originally intended to deal with systems that couldn't rename interfaces
> > (where one had to make sure that the actual interface selected matched =
up
> > with pre-configured filtering rules or static routes or the like), and =
to
> > make life nice for administrators (e.g., making sure that serial port 1=
 maps
> > to ppp1, port 2 is ppp2, and so on).
> >=20
> > I would think and hope most users reach for the more-flexible "ifname"
> > option first, but I certainly can't guarantee it.  It could be buried i=
n a
> > script somewhere or (god forbid) some kind of GUI or "usability" tool.
> >=20
> > If I were back at Sun, I'd probably call it suitable only for a "Major"
> > release, as it removes a publicly documented feature.  But I don't know=
 what
> > the considerations are here.  Maybe it's just a "don't really care."
>=20
> I'm pretty sure someone, somewhere, would hate us if we broke the
> "unit" option. The old PPP ioctl API has been there for so long,
> there certainly remains tons of old tools, scripts and config files
> that "just work" without anybody left to debug or upgrade them.
>=20
> We can't just say, "starting from kernel x.y.z the unit option is a
> noop, use ifname instead" as affected people surely won't get the
> message (and there are other tools beyond pppd that may use this
> kernel API).
>=20
> But for the netlink API, we don't have to repeat the same mistake.

ifname is not atomic (first it creates ppp<id> interface and later it is
renamed) and have issues. Due to bug described here:
https://lore.kernel.org/netdev/20210807160050.17687-1-pali@kernel.org/
you may get your kernel into state in which it is not possible to create
a new ppp interface. And this issue does not happen when using "unit"
argument.

To fix above issue it is needed to migrate pppd from ioctl API to rtnl.
But this would be possible only after rtnl API starts providing all
features, including specifying custom "unit" argument...

I hit above problem, so now I'm migrating all pppd setups from "ifname"
to "unit" option.
