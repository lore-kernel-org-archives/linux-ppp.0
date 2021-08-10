From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
Date: Tue, 10 Aug 2021 17:16:26 +0000
Subject: Re: [PATCH] ppp: Add rtnl attribute IFLA_PPP_UNIT_ID for specifying ppp unit id
Message-Id: <20210810171626.z6bgvizx4eaafrbb@pali>
List-Id: <linux-ppp.vger.kernel.org>
References: <20210807163749.18316-1-pali@kernel.org>
 <20210809122546.758e41de@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <20210809193109.mw6ritfdu27uhie7@pali>
 <20210810153941.GB14279@pc-32.home>
 <BN0P223MB0327A247724B7AE211D2E84EA7F79@BN0P223MB0327.NAMP223.PROD.OUTLOOK.COM>
In-Reply-To: <BN0P223MB0327A247724B7AE211D2E84EA7F79@BN0P223MB0327.NAMP223.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Chris Fowler <cfowler@outpostsentinel.com>
Cc: Guillaume Nault <gnault@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Paul Mackerras <paulus@samba.org>, "David S. Miller" <davem@davemloft.net>, "linux-ppp@vger.kernel.org" <linux-ppp@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tuesday 10 August 2021 16:38:32 Chris Fowler wrote:
> Isn't the UNIT ID the interface number?  As in 'unit 100' will give me ppp100?

If you do not specify pppd 'ifname' argument then pppd argument 'unit 100'
will cause that interface name would be ppp100.

But you are free to rename interface to any string which you like, even
to "ppp99".

But this ppp unit id is not interface number. Interface number is
another number which has nothing with ppp unit id and is assigned to
every network interface (even loopback). You can see them as the first
number in 'ip -o l' output. Or you can retrieve it via if_nametoindex()
function in C.


... So if people are really using pppd's 'unit' argument then I think it
really make sense to support it also in new rtnl interface.

> I have it running on over 1000 interfaces.  I use PPP in a P-t-P VPN scenario between a central server and remote network devices.  Iuse the unit id to identify a primary key in a database for that connection.  This is calculated as 1000+N = UNIT ID.
> 
> I use 1000 because I've also used PPP on the same system with modem boards for demand dial PPP connections.  The up and down scripts executed by PPP are written in C and allow a system where if the VPN link is down, the remote can dial and obtain the same IP addressing via modem.  We don't use modems that often now due to reliability issues.  It has been harder obtaining clean lines in the US.
> 
> The C program also applies routes that are defined in the database.  That search is based on the IP assigned, not the unit id.
> 
> Chris
> 
> ________________________________
> From: Guillaume Nault <gnault@redhat.com>
> Sent: Tuesday, August 10, 2021 11:39 AM
> To: Pali Rohár <pali@kernel.org>
> Cc: Jakub Kicinski <kuba@kernel.org>; Paul Mackerras <paulus@samba.org>; David S. Miller <davem@davemloft.net>; linux-ppp@vger.kernel.org <linux-ppp@vger.kernel.org>; netdev@vger.kernel.org <netdev@vger.kernel.org>; linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>
> Subject: Re: [PATCH] ppp: Add rtnl attribute IFLA_PPP_UNIT_ID for specifying ppp unit id
> 
> On Mon, Aug 09, 2021 at 09:31:09PM +0200, Pali Rohár wrote:
> > Better to wait. I would like hear some comments / review on this patch
> > if this is the correct approach as it adds a new API/ABI for userspace.
> 
> Personally I don't understand the use case for setting the ppp unit at
> creation time. I didn't implement it on purpose when creating the
> netlink interface, as I didn't have any use case.
> 
> On the other hand, adding the ppp unit in the netlink dump is probably
> useful.
> 
