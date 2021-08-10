From: Guillaume Nault <gnault@redhat.com>
Date: Tue, 10 Aug 2021 15:39:41 +0000
Subject: Re: [PATCH] ppp: Add rtnl attribute IFLA_PPP_UNIT_ID for specifying ppp unit id
Message-Id: <20210810153941.GB14279@pc-32.home>
List-Id: <linux-ppp.vger.kernel.org>
References: <20210807163749.18316-1-pali@kernel.org>
 <20210809122546.758e41de@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <20210809193109.mw6ritfdu27uhie7@pali>
In-Reply-To: <20210809193109.mw6ritfdu27uhie7@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Paul Mackerras <paulus@samba.org>, "David S. Miller" <davem@davemloft.net>, linux-ppp@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Aug 09, 2021 at 09:31:09PM +0200, Pali Roh=E1r wrote:
> Better to wait. I would like hear some comments / review on this patch
> if this is the correct approach as it adds a new API/ABI for userspace.

Personally I don't understand the use case for setting the ppp unit at
creation time. I didn't implement it on purpose when creating the
netlink interface, as I didn't have any use case.

On the other hand, adding the ppp unit in the netlink dump is probably
useful.
