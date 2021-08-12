From: Guillaume Nault <gnault@redhat.com>
Date: Thu, 12 Aug 2021 19:12:57 +0000
Subject: Re: [PATCH] ppp: Add rtnl attribute IFLA_PPP_UNIT_ID for specifying ppp unit id
Message-Id: <20210812191257.GB10725@pc-23.home>
List-Id: <linux-ppp.vger.kernel.org>
References: <20210807163749.18316-1-pali@kernel.org>
 <20210809122546.758e41de@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <20210809193109.mw6ritfdu27uhie7@pali>
 <20210810153941.GB14279@pc-32.home>
 <20210810160450.eluiktsp7oentxo3@pali>
 <20210811171918.GD15488@pc-32.home>
 <20210811175449.5hrwoevw7xv2jxxn@pali>
 <20210812091941.GA3525@pc-23.home>
 <20210812140918.lfll55przd4ajtc7@pali>
In-Reply-To: <20210812140918.lfll55przd4ajtc7@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Paul Mackerras <paulus@samba.org>, "David S. Miller" <davem@davemloft.net>, linux-ppp@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Aug 12, 2021 at 04:09:18PM +0200, Pali Roh=E1r wrote:
> The problem is that ppp from rtnl is of the same class as ppp from
> ioctl. And if you want to use ppp, you still have to use lot of ioctl
> calls as rtnl does not implement them. And these ioctl calls use ppp
> unit id, not interface id / interface name.

Indeed, the netlink api only replaces ioctl(PPPIOCNEWUNIT). It's
technically feasible to implement other ppp unit ioctls with netlink,
but I didn't do that because:
  * some of them make no sense,
  * netlink wouldn't bring any advantage over ioctl() for these cases
    (and ppp is ioctl-centric anyway, so users will have to write
    ioctl() calls no matter what).

If there was a bright future for ppp in sight, I'd certainly work on a
new modern ioctl-less api. But in the current situation, that'd be just
feature duplication and code churn.

> So in the end you can use RTM_NEWLINK and then control ppp via ioctls.
> And for controlling you have to known that ppp unit id.
>=20
> If you are using ppp over serial devices, you can "simplify" it by
> forcing mapping that serial number device matches ppp unit id. And then
> you do not have to use dynamic ids (and need for call PPPIOCGUNIT).

How is dropping a single PPPIOCGUNIT call going to simplify the code
while you have to write netlink message handlers?

> With dynamic unit id allocation (which is currently the only option when
> creating ppp via rtnl) for single ppp connection you need to know:
> * id of serial tty device
> * id of channel bound to tty device
> * id of network interface
> * id of ppp unit bound to network interface

I see you're not working with L2TPv2 :). A few more things you'd need
to add to the list:
 * a UDP socket,
 * a tunnel id,
 * a session id,
 * a tunnel file descriptor,
 * a session file descriptor,
 * a new ioctl() to figure out which channel id is assigned to your
   L2TP session,
 * a bunch of setsockopt() to configure the whole thing,
 * ...
(and I'm not counting the ioctl() calls necessary to set up the channel,
which also apply to your use case).

Really, I'm sorry, but the possibility to drop a single PPPIOCGUNIT
call isn't going to simplify the ppp landscape.

> > As I already proposed, we can add an attribute to make the interface
> > name independant from the unit id.
>=20
> I agree, that above proposal with a new attribute which makes interface
> name independent from the ppp unit id is a good idea. Probably it should
> have been default rtnl behavior (but now it is too late for changing
> default behavior).

Well, it was the default, until a collegue complained and I accepted to
align the default device name with the original ioctl() behaviour. But
the beauty of netlink is that we can revise this behaviour without
breaking compatibility.

> But prior adding this attribute, we first need a way how to retrieve
> interface name of newly created interface. Which we agreed that
> NLM_F_ECHO for RTM_NEWLINK/NLM_F_CREATE is needed.

Yes, that'd be ideal. That might require quite some work though (I
haven't looked in detail). At last resort, if adding NLM_F_ECHO
support to rtnl proves too hard, it might be possible to add a call to
get the device name associated to a ppp unit file descriptor.

At least know I understand why we had this conversation about
NLM_F_ECHO :).
