From: David Miller <davem@davemloft.net>
Date: Fri, 24 Feb 2012 22:52:30 +0000
Subject: Re: [PATCH] ppp: fix 'ppp_mp_reconstruct bad seq' errors
Message-Id: <20120224.175230.2288284076227953420.davem@davemloft.net>
List-Id: <linux-ppp.vger.kernel.org>
References: <Pine.LNX.4.58.1202241616590.5575@benxen>
In-Reply-To: <Pine.LNX.4.58.1202241616590.5575@benxen>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ben@netservers.co.uk
Cc: paulus@samba.org, netdev@vger.kernel.org, linux-ppp@vger.kernel.org

From: Ben McKeegan <ben@netservers.co.uk>
Date: Fri, 24 Feb 2012 16:33:56 +0000 (GMT)

> 
> This patch fixes a (mostly cosmetic) bug introduced by the patch
> 'ppp: Use SKB queue abstraction interfaces in fragment processing'
> found here: http://www.spinics.net/lists/netdev/msg153312.html
> 
> The above patch rewrote and moved the code responsible for cleaning
> up discarded fragments but the new code does not catch every case
> where this is necessary.  This results in some discarded fragments
> remaining in the queue, and triggering a 'bad seq' error on the
> subsequent call to ppp_mp_reconstruct.  Fragments are discarded
> whenever other fragments of the same frame have been lost.
> This can generate a lot of unwanted and misleading log messages.
> 
> This patch also adds additional detail to the debug logging to
> make it clearer which fragments were lost and which other fragments
> were discarded as a result of losses. (Run pppd with 'kdebug 1'
> option to enable debug logging.)
> 
> Signed-off-by: Ben McKeegan <ben@netservers.co.uk>

I'll apply this, thanks.
