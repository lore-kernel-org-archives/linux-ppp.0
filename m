From: Paul Mackerras <paulus@samba.org>
Date: Wed, 22 Mar 2006 03:39:59 +0000
Subject: Re: Maximum simultaneous interfaces ppp
Message-Id: <17440.50959.511967.316012@cargo.ozlabs.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <441E83BB.1030302@knet.es>
In-Reply-To: <441E83BB.1030302@knet.es>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

James Cameron writes:
> On Wed, Mar 22, 2006 at 01:50:00PM +1100, Paul Mackerras wrote:
> > Julio Rodanes - KNET writes:
> > > How many interfaces ppp is possible create with ppp-2.4.2 and kernel
> > > 2.4.22 ? Is 100 interfaces ppp the max limit??
> > 
> > There is no hard limit, you can create as many as you like within the
> > constraints of the amount of memory your machine has.
> 
> Are you sure about that, Paul?
> 
> 2.4.22 net/core/dev.c has a limit of 100 on dev_alloc_name().
> 2.6.15 net/core/dev.c has a limit of 8*8*PAGE_SIZE.

ppp_generic.c doesn't use dev_alloc_name, it uses its own allocator
for unit numbers.

Paul.
