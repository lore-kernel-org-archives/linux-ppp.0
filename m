From: James Chapman <jchapman@katalix.com>
Date: Thu, 19 Jun 2008 16:28:52 +0000
Subject: Re: [Bridge] kernel doesn't support bridge with a ppp interface ?
Message-Id: <485A8944.7030005@katalix.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <8D8854F742224C1BB834FE0BA4E76BEC@vpn.com>
In-Reply-To: <8D8854F742224C1BB834FE0BA4E76BEC@vpn.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

c.j wrote:
> 
>> I'm not sure if this is even possible using standard protocols.  
>> Bridging is
>> for Ethernet; PPP is not Ethernet.  

You can bridge any bridgable protocol. You can even bridge ethernet to 
token ring or other media using translation bridges.

People used to use PPP to bridge two remote networks together using a 
PPP link. The BCP PPP protocol was used as the PPP network control 
protocol. Each bridge would learn each other's MAC addresses as if the 
remote network were on the same LAN.

>> So this would require some sort of 
>> nonstandard Ethernet-over-PPP encapsulation protocol, and would only 
>> make sense if the PPP devices at both ends of the link talked this 
>> protocol.

If pppd supported BCP, I think the pppN network interfaces could be 
added to a Linux bridge just like regular eth interfaces. It's BCP 
(rfc1638 / rfc2878) support that is missing.

That said, these days people prefer to use routing, where remote 
networks are connected together, not bridging. So there is no demand to 
add BCP support.

>> This sounds like a job for something outside the kernel, e.g. OpenVPN 
>> as suggested or a simpler Ethernet-over-IP tunnelling app.

L2TPv3 can carry raw ethernet frames. We're working on it now. :) It 
will be possible to add L2TP ethernet interfaces to a Linux bridge to 
bridge ethernet frames over L2TP.

> You are right I think. Thanks.
> 
> Regards~
> 
> -- 
> c.j

-- 
James Chapman
Katalix Systems Ltd
http://www.katalix.com
Catalysts for your Embedded Linux software development

