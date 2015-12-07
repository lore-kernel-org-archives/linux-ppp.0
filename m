From: Yan Seiner <yan@seiner.com>
Date: Mon, 07 Dec 2015 12:17:07 +0000
Subject: Re: Netflix and pppd
Message-Id: <566578C3.2050508@seiner.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <566461FE.4090003@seiner.com>
In-Reply-To: <566461FE.4090003@seiner.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org



On 12/6/2015 11:05 PM, Michael Richardson wrote:
> Yes, like James, I'd say that your problem is MTU issues with the PPPoE.
> Aside from the usual mss-clamping solution, you could also lower the MTU
> on the "lan2" to 1460 or so.
> DHCP should tell the other boxes about that, and things may work better.

Yes, I am forcing the MTU to 1464 via DHCP.  However, I tried adding this:

iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN -j TCPMSS 
--clamp-mss-to-pmtu

to my iptables script and that seems to have cured the problem, at least 
for this morning.  Thanks for the nudge.

--Yan

>
> --
> ]               Never tell me the odds!                 | ipv6 mesh networks [
> ]   Michael Richardson, Sandelman Software Works        | network architect  [
> ]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails    [
>

