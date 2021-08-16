From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
Date: Mon, 16 Aug 2021 16:23:55 +0000
Subject: Re: [PATCH] ppp: Add rtnl attribute IFLA_PPP_UNIT_ID for specifying ppp unit id
Message-Id: <20210816162355.7ssd53lrpclfvuiz@pali>
List-Id: <linux-ppp.vger.kernel.org>
References: <BN0P223MB0327A247724B7AE211D2E84EA7F79@BN0P223MB0327.NAMP223.PROD.OUTLOOK.COM>
 <20210810171626.z6bgvizx4eaafrbb@pali>
 <2f10b64e-ba50-d8a5-c40a-9b9bd4264155@workingcode.com>
 <20210811173811.GE15488@pc-32.home>
 <20210811180401.owgmie36ydx62iep@pali>
 <20210812092847.GB3525@pc-23.home>
 <20210812134845.npj3m3vzkrmhx6uy@pali>
 <20210812182645.GA10725@pc-23.home>
 <20210812190440.fknfthdk3mazm6px@pali>
 <20210816161114.GA3611@pc-32.home>
In-Reply-To: <20210816161114.GA3611@pc-32.home>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Guillaume Nault <gnault@redhat.com>
Cc: James Carlson <carlsonj@workingcode.com>, Chris Fowler <cfowler@outpostsentinel.com>, Jakub Kicinski <kuba@kernel.org>, Paul Mackerras <paulus@samba.org>, "David S. Miller" <davem@davemloft.net>, "linux-ppp@vger.kernel.org" <linux-ppp@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Monday 16 August 2021 18:11:14 Guillaume Nault wrote:
> On Thu, Aug 12, 2021 at 09:04:40PM +0200, Pali Roh=C3=A1r wrote:
> > The point here is that there is application (pppd) which allows
> > specifying custom unit id as an option argument. Also it allows to call
> > external applications (at some events) with sharing file descriptors.
> > And it is one of the options how to touch part of ppp connection via
> > external scripts / applications. You start pppd for /dev/ttyUSB<N> with
> > unit id <N> and then in external script you use <N> for ioctls. And I do
> > not know if there is a way how to retrieve unit id in those external
> > scripts. There was already discussion about marking all file descriptors
> > in pppd as close-on-exec and it was somehow rejected as it will broke
> > custom scripts / applications which pppd invokes on events. So looks
> > like that people are using these "features" of pppd.
>=20
> Potential external pppd scripts, that depend on the unit id, may be a
> valid use case for letting the netlink api define this identifier (if
> pppd ever gets netlink support).
>=20
> > Option "unit" in pppd specifies ppp unit id. And if new API (rtnl) would
> > not provide equivalent for allowing to specify it then migrating pppd
> > from ioctl to rtnl is not possible without breaking compatibility.
> >=20
> > As you already described, we can simulate setting default interface name
> > in pppd application. But above usage or any other which expose pppd API
> > to other application is not possible to simulate.
>=20
> If the pppd project is interested in adding support for the netlink
> api, then I'm fine with adding this feature. I just want to make sure
> that it'll have a real world use case.
>=20
> > So I think we need to first decide or solve issue if rtnl ppp API should
> > provide same functionality as ioctl ppp API. If answer is yes, then some
> > kind of specifying custom ppp unit id is required. If answer is no (e.g.
> > because we do not want ppp unit id in rtnl API as it looks legacy and
> > has issues) then rtnl ppp API cannot be used by ppp as it cannot provide
> > all existing / supported features without breaking legacy compatibility.
> >=20
> > I see pros & cons for both answers. Not supporting legacy code paths in
> > new code/API is the way how to clean up code and prevent repeating old
> > historic issues. But if new code/API is not fully suitable for pppd --
> > which is de-facto standard Linux userspace implementation -- does it
> > make sense to have it? Or does it mean to also implement new userspace
> > part of implementation (e.g. pppd2) to avoid these legacy / historic
> > issues? Or... is not whole ppp protocol just legacy part of our history
> > which should not be used in new modern setups? And for "legacy usage" is
> > current implementation enough and it does not make sense to invest time
> > into this area? I cannot answer to these questions, but I think it is
> > something quite important as it can show what should be direction and
> > future of ppp subsystem.
>=20
> PPP isn't legacy, but very few people are interested in working on and
> maintaining the code.
>=20
> Do you have plans for adding netlink support to pppd? If so, is the
> project ready to accept such code?

Yes, I have already some WIP code and I'm planning to send a pull
request to pppd on github for it. I guess that it could be accepted,
specially if there still would be backward compatibility via ioctl for
kernels which do not support rtnl API. One of the argument which can be
used why rtnl API is better, is fixing issue: atomic creating of
interface with specific name.

But pppd is maintained by Paul (already in loop), so I hope we could
hear some feedback.

> BTW, sorry for the delay.
>=20
