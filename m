From: Paul Mackerras <paulus@samba.org>
Date: Sun, 01 Feb 2004 01:09:54 +0000
Subject: Re: pppd not setting netmask
Message-Id: <16412.20962.895093.323247@cargo.ozlabs.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20040130190514.GB16326@willow.seitz.com>
In-Reply-To: <20040130190514.GB16326@willow.seitz.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Ross Vandegrift writes:

> 	This is bad because the connected route that gets installed is
> for the opposite end of the tunnel (ie, 10.100.100.1/32) and not the
> route for the 10.100.100.0/30.  This confuses OSPF quite a bit (see my
> quagga-users thread with all the gorey OSPF details and routes:
> http://lists.quagga.net/pipermail/quagga-users/2004-January/001382.html)

The netmask has no meaning on a point-to-point interface.  If other
software isn't looking at the IFF_POINTOPOINT bit in the interface
flags, then I suggest you fix that other software.

Paul.
