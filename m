From: Sascha Kiefer <sk@intertivity.com>
Date: Thu, 08 May 2008 05:27:24 +0000
Subject: Re: [Poptop-server] Restrict user access
Message-Id: <48228F3C.50503@intertivity.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <002a01c8af4a$6e329ab0$9602a8c0@saschaxp1>
In-Reply-To: <002a01c8af4a$6e329ab0$9602a8c0@saschaxp1>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

James Cameron wrote:
> On Wed, May 07, 2008 at 03:46:38PM +0400, Sascha Kiefer wrote:
>   
> The IP address is allocated by the RADIUS server, passed in a message to
> the pppd RADIUS plugin which was selected by pptpd, and pppd then passes
> it to the client within IPCP.  The client perceives it has got it from
> the server running pptpd.  But you know that it has come from the RADIUS
> server.
>
>   
thanks
. i do not do it this way. i let the pptpd server decide whar it address 
to use.
somehow the pptpd server tells that the radius server. which is fine for me.
can this lead to any problems?
