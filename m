From: David Miller <davem@davemloft.net>
Date: Thu, 05 Jul 2012 10:00:27 +0000
Subject: Re: [PATCH next-next] ppp: change default for incoming protocol filter to NPMODE_DROP
Message-Id: <20120705.030027.655926012207641451.davem@davemloft.net>
List-Id: <linux-ppp.vger.kernel.org>
References: <20120704013258.GA26225@kvack.org>
In-Reply-To: <20120704013258.GA26225@kvack.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bcrl@kvack.org
Cc: netdev@vger.kernel.org, linux-ppp@vger.kernel.org

From: Benjamin LaHaise <bcrl@kvack.org>
Date: Tue, 3 Jul 2012 21:32:58 -0400

> By default, the ppp_generic code initializes the npmode array that filters
> incoming packet to accept packets for all protocols.  This behaviour is
> incorrect, as it results in packets for protocols that an older version
> of a PPP implementation may not be aware of to be incorrectly accepted.
> This behaviour is visible, for example, when sending IPv6 packets across a
> ppp link where pppd has only been configured to use IPv4.
> 
> This change should be safe since pppd will correctly set the protocols it
> negotiates to NPMODE_PASS as the appropriate protocols transition to an Up
> state.
> 
> Signed-off-by: Benjamin LaHaise <bcrl@kvack.org>

As far as I can tell, this has been this way for a very long time.

Therefore it is the applications responsibility to adjust the filters
to suit their needs and we really can't make such adjustments to this
behavior.
