From: Jakub Kicinski <kuba@kernel.org>
Date: Mon, 09 Aug 2021 19:25:46 +0000
Subject: Re: [PATCH] ppp: Add rtnl attribute IFLA_PPP_UNIT_ID for specifying ppp unit id
Message-Id: <20210809122546.758e41de@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20210807163749.18316-1-pali@kernel.org>
In-Reply-To: <20210807163749.18316-1-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Pali =?UTF-8?B?Um9ow6Fy?= <pali@kernel.org>
Cc: Paul Mackerras <paulus@samba.org>, "David S. Miller" <davem@davemloft.net>, Guillaume Nault <gnault@redhat.com>, linux-ppp@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat,  7 Aug 2021 18:37:49 +0200 Pali Roh=C3=A1r wrote:
> Currently there are two ways how to create a new ppp interface. Old method
> via ioctl(PPPIOCNEWUNIT) and new method via rtnl RTM_NEWLINK/NLM_F_CREATE
> which was introduced in v4.7 by commit 96d934c70db6 ("ppp: add rtnetlink
> device creation support").
>=20
> ...

Your 2 previous patches were fixes and went into net, this patch seems
to be on top of them but is a feature, so should go to net-next.=20
But it doesn't apply to net-next given net was not merged into net-next.
Please rebase on top of net-next or (preferably) wait until next week
so that the trees can get merged and then you can repost without causing
any conflicts.

>  static const struct nla_policy ppp_nl_policy[IFLA_PPP_MAX + 1] =3D {
>  	[IFLA_PPP_DEV_FD]	=3D { .type =3D NLA_S32 },
> +	[IFLA_PPP_UNIT_ID]	=3D { .type =3D NLA_S32 },
>  };

set .strict_start_type, please so new attrs get validated better

>  static int ppp_nl_validate(struct nlattr *tb[], struct nlattr *data[],
> @@ -1274,6 +1277,15 @@ static int ppp_nl_validate(struct nlattr *tb[], st=
ruct nlattr *data[],
> =20
>  	if (!data[IFLA_PPP_DEV_FD])
>  		return -EINVAL;
> +
> +	/* Check for IFLA_PPP_UNIT_ID before IFLA_PPP_DEV_FD to allow userspace
> +	 * detect if kernel supports IFLA_PPP_UNIT_ID or not by specifying
> +	 * negative IFLA_PPP_DEV_FD. Previous kernel versions ignored
> +	 * IFLA_PPP_UNIT_ID attribute.
> +	 */
> +	if (data[IFLA_PPP_UNIT_ID] && nla_get_s32(data[IFLA_PPP_UNIT_ID]) < -1)
> +		return -EINVAL;

please use NLA_POLICY_MIN() instead, no need to open-code

>  	if (nla_get_s32(data[IFLA_PPP_DEV_FD]) < 0)
>  		return -EBADF;
