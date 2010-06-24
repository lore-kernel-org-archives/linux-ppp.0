From: James Cameron <quozl@laptop.org>
Date: Thu, 24 Jun 2010 07:23:45 +0000
Subject: Re: PPP comression and extension info required...
Message-Id: <20100624072345.GD18363@us.netrek.org>
List-Id: <linux-ppp.vger.kernel.org>
References: <4C2246C1.2000206@workingcode.com>
In-Reply-To: <4C2246C1.2000206@workingcode.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Thu, Jun 24, 2010 at 10:31:27AM +0530, arun b wrote:
> Below are the logs, obtained I can see there is CCP-protocol
> negotiation initiated and got rejected.

Yes, according to your log, the peer (not the host) rejected CCP.  That
probably means the peer is not capable of processing CCP.

To prevent the host from trying CCP, add the noccp option to the host
pppd configuration.

According to manual page for pppd, noccp means "Disable CCP (Compression
Control Protocol) negotiation.  This option should only be required if
the peer is buggy and gets confused by requests from pppd for CCP
negotiation."

> Well I need to bring up the setup for both data and header
> compression..

You will need to fix the peer then.  On the evidence provided, it does
not support this.

-- 
James Cameron
http://quozl.linux.org.au/
