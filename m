From: Marshall Crocker <marshall@iconux.org>
Date: Sun, 10 Aug 2008 23:28:46 +0000
Subject: Re: How to fix continuous ConfReq's on celluar internet connection
Message-Id: <489F79AE.400@iconux.org>
List-Id: <linux-ppp.vger.kernel.org>
References: <489F746B.3040002@123mail.org>
In-Reply-To: <489F746B.3040002@123mail.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

James Cameron wrote:
> Have you tried the demand option?  This keeps the network interface
> present over a reconfiguration.
Doh...after sending my original email I decided to add idle and demand
options to my peers file so the connection wouldn't be up all the time
(been meaning to that for a while anyway).  I read the man pages to see
what arguments they needed and saw that demand keeps the network
interface in between connections.  That appears to be working although
the ConfReq's are still coming and the connection is averaging about 0.2
minutes up.

I had no idea that the demand option would keep the ppp interface.  I
feel silly for putting up with this for over a year and the whole time a
simple pppd option would work around it.

Marshall

