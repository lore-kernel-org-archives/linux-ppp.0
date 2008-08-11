From: James Cameron <james.cameron@hp.com>
Date: Mon, 11 Aug 2008 05:09:15 +0000
Subject: Re: How to fix continuous ConfReq's on celluar internet connection
Message-Id: <20080811050915.GF6024@hp.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <489F746B.3040002@123mail.org>
In-Reply-To: <489F746B.3040002@123mail.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Mon, Aug 11, 2008 at 12:03:58AM -0500, Marshall Crocker wrote:
> What comes up are packets from a host in my local network getting sent  
> out over ppp!  Every time a packet with the source from my internal  
> network gets sent over ppp, the connection reconfigures. You were  
> exactly right!

Fantastic.  It suggests the mobile telephone networks probably use the
same software in their NAT implementations ... hey, it might even be a
feature.

> I guess its time to learn....

Yes, just block the packets that aren't from the source IP that pppd
assigns to the link.

-- 
James Cameron                         http://quozl.netrek.org/
HP Open Source, Volunteer             http://opensource.hp.com/
PPTP Client Project, Release Engineer http://pptpclient.sourceforge.net/
