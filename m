From: Matt Domsch <Matt_Domsch@dell.com>
Date: Wed, 23 Nov 2005 04:31:19 +0000
Subject: Re: [pptp-devel] Re: pppd and NetworkManager - 3 issues
Message-Id: <20051123043119.GB18231@lists.us.dell.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <438341FB.70709@ncl.ac.uk>
In-Reply-To: <438341FB.70709@ncl.ac.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Wed, Nov 23, 2005 at 10:39:30AM +1100, James Cameron wrote:
> a) The IP of the VPN server
[snip] 
> Another method is to do the DNS resolution before you call pppd or pptp,
> that way you'll have the IP address already.

For establishing static routes, the Microsoft Network Access
Quarantine feature of Windows Server 2003, and other uses, one really
does need to know the IP of the server.  For my purposes, my
hand-rolled scripts do the DNS resolution, then call pppd with the IP
address, and this works quite well.

Thanks,
Matt

-- 
Matt Domsch
Software Architect
Dell Linux Solutions linux.dell.com & www.dell.com/linux
Linux on Dell mailing lists @ http://lists.us.dell.com
