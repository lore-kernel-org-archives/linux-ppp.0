From: Paul Mackerras <paulus@samba.org>
Date: Thu, 03 May 2012 00:05:32 +0000
Subject: Re: ppp_mppe discards 50% of packets from some servers
Message-Id: <20120503000532.GB6921@bloggs.ozlabs.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <4FA184EB.8090308@cisco.com>
In-Reply-To: <4FA184EB.8090308@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Wed, May 02, 2012 at 03:03:07PM -0400, Phil Hord wrote:
> ppp_mppe discards 50% of packets from some servers
> 
> [2.] Full description of the problem/report:
> 
> When I connect to a server using MPPE, I receive about every other
> packet with the FLUSHED bit turned off. These packets are dropped by
> ppp_mppe.c just like the SPEC says they should be. I am not able to
> maintain tcp connections through the VPN with these packets being discarded.
> 
> I found a patch discussed here:
> http://ubuntuforums.org/showthread.php?t95189
> 
> When I stop dropping those packets (by making this change to the driver;
> see patch at end), the problem went away.

Thanks for the patch.  Since the patch is for a kernel network driver,
please send your patch together with your description of the problem
and how you solved it to netdev@vger.kernel.org.  For it to be accepted,
you will need to add a Signed-off-by: line as described in
Documentation/SubmittingPatches.

Thanks,
Paul.


