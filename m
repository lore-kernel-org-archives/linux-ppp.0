From: Marshall Crocker <marshall@iconux.org>
Date: Mon, 11 Aug 2008 00:04:11 +0000
Subject: Re: How to fix continuous ConfReq's on celluar internet connection
Message-Id: <489F81FB.6040108@iconux.org>
List-Id: <linux-ppp.vger.kernel.org>
References: <489F746B.3040002@123mail.org>
In-Reply-To: <489F746B.3040002@123mail.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

>
> The host was multi-homed, and when the 1x RTT link came up the default
> route was swung onto the link.  Existing connections began to emit
> packets to the modem link with a source IP corresponding to the previous
> default route.  It was these packets which caused the reconfiguration.
>   
I'm not doing any sort of multihoming so there is no default route until 
the ppp connection comes up. No invalid packets should be making it to 
the ISP but I'll do a capture and see what comes up...

> It looks like I've said all this before:
>
> http://osdir.com/ml/linux.ppp/2007-10/msg00011.html
>   
Sorry....I did a search on the Nabble archive for ConfReq but that 
thread wasn't returned or at least I didn't see it. 

Thanks for your help.

Marshall

