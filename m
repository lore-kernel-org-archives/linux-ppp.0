From: "c.j" <c.james.cj@gmail.com>
Date: Thu, 19 Jun 2008 15:42:52 +0000
Subject: Re: [Bridge] kernel doesn't support bridge with a ppp interface ?
Message-Id: <8D8854F742224C1BB834FE0BA4E76BEC@vpn.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


> I'm not sure if this is even possible using standard protocols.  Bridging 
> is
> for Ethernet; PPP is not Ethernet.  So this would require some sort of 
> nonstandard Ethernet-over-PPP encapsulation protocol, and would only make 
> sense if the PPP devices at both ends of the link talked this protocol.
>
> This sounds like a job for something outside the kernel, e.g. OpenVPN as 
> suggested or a simpler Ethernet-over-IP tunnelling app.


You are right I think. Thanks.

Regards~

--
c.j 

