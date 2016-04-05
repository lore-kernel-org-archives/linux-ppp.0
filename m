From: Guillaume Nault <g.nault@alphalink.fr>
Date: Tue, 05 Apr 2016 21:14:56 +0000
Subject: Re: [RFC PATCH 5/6] ppp: define reusable device creation functions
Message-Id: <20160405211456.GC1305@alphalink.fr>
List-Id: <linux-ppp.vger.kernel.org>
References: <cover.1459807527.git.g.nault@alphalink.fr>
 <522658eb90148cb670fb4f5db1429c41788aa4d8.1459807527.git.g.nault@alphalink.fr>
 <20160405082832.534257df@xeon-e3>
In-Reply-To: <20160405082832.534257df@xeon-e3>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephen Hemminger <stephen@networkplumber.org>
Cc: netdev@vger.kernel.org, linux-ppp@vger.kernel.org, Paul Mackerras <paulus@samba.org>, David Miller <davem@davemloft.net>

On Tue, Apr 05, 2016 at 08:28:32AM -0700, Stephen Hemminger wrote:
> On Tue, 5 Apr 2016 02:56:29 +0200
> Guillaume Nault <g.nault@alphalink.fr> wrote:
> 
> > Move PPP device initialisation and registration out of
> > ppp_create_interface().
> > This prepares code for device registration with rtnetlink.
> > 
> 
> Does PPP module autoload correctly based on the netlink attributes?
> 
Patch #6 has MODULE_ALIAS_RTNL_LINK("ppp"). This works fine for
auto-loading ppp_generic when creating a PPP device with rtnetlink.
Is there anything else required?

