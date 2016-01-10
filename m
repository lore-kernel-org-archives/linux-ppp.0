From: Charlie Brady <charlieb-linux-ppp@budge.apana.org.au>
Date: Sun, 10 Jan 2016 22:52:23 +0000
Subject: Re: Add support for IPv6 RADIUS attributes
Message-Id: <Pine.LNX.4.64.1601101749470.13191@e-smith.charliebrady.org>
List-Id: <linux-ppp.vger.kernel.org>
References: <20160108142012.GL19014@drscott.swordarmor.fr>
In-Reply-To: <20160108142012.GL19014@drscott.swordarmor.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org



On Sun, 10 Jan 2016, Michael Richardson wrote:

> I also have patches to the radius module to use the latest (and maintained)
> radcli client library at:  https://github.com/nmav/radcli
> 
> What is your application? As I read your patches, they just make ppp ignore
> the attributes.  Do you intend to do more with the data?

On the face of it, the reason for Alarig's patch is to prevent pppd 
calling 'error()' in response to unknown attributes. As I've already 
pointed out, there is a much simpler patch to achieve that end.

The radius plugin of pppd shouldn't be trying to validate radius config 
files; it should just read the data it needs from the file. If it finds 
other stuff, it can just ignore it.

> 
> I have patches on both radcli and pppd sides, which haven't all settled yet,
> so I haven't pushed them anywhere yet.
> 
> I'm not sure what the ultimate point of your patches are though.
> Non-LL IPv6 addresses are not assigned through IP6CP, but rather through RA
> and/or DHCPv6.   I have a daemon, called rfc6204d, which does this at scale,
> but it is not yet sufficiently field tested to release.
> 
> --
> ]               Never tell me the odds!                 | ipv6 mesh networks [
> ]   Michael Richardson, Sandelman Software Works        | network architect  [
> ]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails    [
> 
> 
