From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
Date: Mon, 09 Aug 2021 19:31:09 +0000
Subject: Re: [PATCH] ppp: Add rtnl attribute IFLA_PPP_UNIT_ID for specifying ppp unit id
Message-Id: <20210809193109.mw6ritfdu27uhie7@pali>
List-Id: <linux-ppp.vger.kernel.org>
References: <20210807163749.18316-1-pali@kernel.org>
 <20210809122546.758e41de@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20210809122546.758e41de@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Jakub Kicinski <kuba@kernel.org>
Cc: Paul Mackerras <paulus@samba.org>, "David S. Miller" <davem@davemloft.net>, Guillaume Nault <gnault@redhat.com>, linux-ppp@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

On Monday 09 August 2021 12:25:46 Jakub Kicinski wrote:
> On Sat,  7 Aug 2021 18:37:49 +0200 Pali Roh=C3=A1r wrote:
> > Currently there are two ways how to create a new ppp interface. Old met=
hod
> > via ioctl(PPPIOCNEWUNIT) and new method via rtnl RTM_NEWLINK/NLM_F_CREA=
TE
> > which was introduced in v4.7 by commit 96d934c70db6 ("ppp: add rtnetlink
> > device creation support").
> >=20
> > ...
>=20
> Your 2 previous patches were fixes and went into net, this patch seems
> to be on top of them but is a feature, so should go to net-next.=20

Yes

> But it doesn't apply to net-next given net was not merged into net-next.
> Please rebase on top of net-next or (preferably) wait until next week
> so that the trees can get merged and then you can repost without causing
> any conflicts.

Better to wait. I would like hear some comments / review on this patch
if this is the correct approach as it adds a new API/ABI for userspace.

> >  static const struct nla_policy ppp_nl_policy[IFLA_PPP_MAX + 1] =3D {
> >  	[IFLA_PPP_DEV_FD]	=3D { .type =3D NLA_S32 },
> > +	[IFLA_PPP_UNIT_ID]	=3D { .type =3D NLA_S32 },
> >  };
>=20
> set .strict_start_type, please so new attrs get validated better
>=20
> >  static int ppp_nl_validate(struct nlattr *tb[], struct nlattr *data[],
> > @@ -1274,6 +1277,15 @@ static int ppp_nl_validate(struct nlattr *tb[], =
struct nlattr *data[],
> > =20
> >  	if (!data[IFLA_PPP_DEV_FD])
> >  		return -EINVAL;
> > +
> > +	/* Check for IFLA_PPP_UNIT_ID before IFLA_PPP_DEV_FD to allow userspa=
ce
> > +	 * detect if kernel supports IFLA_PPP_UNIT_ID or not by specifying
> > +	 * negative IFLA_PPP_DEV_FD. Previous kernel versions ignored
> > +	 * IFLA_PPP_UNIT_ID attribute.
> > +	 */
> > +	if (data[IFLA_PPP_UNIT_ID] && nla_get_s32(data[IFLA_PPP_UNIT_ID]) < -=
1)
> > +		return -EINVAL;
>=20
> please use NLA_POLICY_MIN() instead, no need to open-code
>=20
> >  	if (nla_get_s32(data[IFLA_PPP_DEV_FD]) < 0)
> >  		return -EBADF;

I will look at both issues... and I would like to know what is preferred
way to introduce new attributes in a way that userspace can detect if
kernel supports them or not.
