From: "c.j" <c.james.cj@gmail.com>
Date: Fri, 20 Jun 2008 15:32:26 +0000
Subject: Re: [Bridge] kernel doesn't support bridge with a ppp interface ?
Message-Id: <9E5147F1944448508CC656FC5B040285@vpn.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <8D8854F742224C1BB834FE0BA4E76BEC@vpn.com>
In-Reply-To: <8D8854F742224C1BB834FE0BA4E76BEC@vpn.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org




> Pppd's proxyarp option won't do what you want?

In fact,  ppp linux box is front of a PC, I want to make this PC can connect 
to ISP through ppp linux box. which has two ethernet cards and a ppp0 
interface(it has done pppoe process).

PC's ip is same as  ppp0 we set manually,  and in this case PC cannot 
connect to ppp linux box. I'm not sure the same ip will bring me what 
result, ppp0's ip we don't care in fact.

So we do as follow:
Set PC's ip is not same with ppp0 but same class. It can work for me. And 
also I start kernel proxy_arp by sysctl and  is should be same as pppd's 
proxy_arp I think.

Regards~

--
c.j


