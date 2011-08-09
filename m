From: David Miller <davem@davemloft.net>
Date: Tue, 09 Aug 2011 07:27:38 +0000
Subject: Re: [PATCH 12/12] headers, ppp: Add missing #include to
Message-Id: <20110809.002738.679747111943821641.davem@davemloft.net>
List-Id: <linux-ppp.vger.kernel.org>
References: <1312809302.2591.1139.camel@deadeye>
	<1312809919.2591.1152.camel@deadeye>
In-Reply-To: <1312809919.2591.1152.camel@deadeye>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ben@decadent.org.uk
Cc: netdev@vger.kernel.org, paulus@samba.org, linux-ppp@vger.kernel.org

From: Ben Hutchings <ben@decadent.org.uk>
Date: Mon, 08 Aug 2011 14:25:19 +0100

> <linux/if_ppp.h> uses various types defined in <linux/ppp_defs.h>.
> 
> Signed-off-by: Ben Hutchings <ben@decadent.org.uk>

Unfortunately there is a "net/if_ppp.h" provided by glibc that
includes "net/ppp_defs.h", and all of this is presumably in order
to discourage direct use of the kernel headers.

Even though net/ppp_defs.h ends up including linux/ppp_defs.h
anyways.

Whilst I think your efforts are to be commended, we can't start doing
or else we'll start breaking the build in various unexpected ways.

The SIOCDEVPRIVATE (defined by GLIBC in bits/ioctls.h) case is just
one such example.
