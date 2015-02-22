From: David Miller <davem@davemloft.net>
Date: Sun, 22 Feb 2015 02:58:22 +0000
Subject: Re: [PATCH] pppoe: Use workqueue to die properly when a PADT is received
Message-Id: <20150221.215822.1404722842047278123.davem@davemloft.net>
List-Id: <linux-ppp.vger.kernel.org>
References: <2498181.kKNYHvd3hx@f19simon>
	<20150220204923.13275ydcca5wwwcj@berry.schulz.ip-v6.eu>
	<2335170.7Jqfc2NRFK@hummingbird.farnz.org.uk>
In-Reply-To: <2335170.7Jqfc2NRFK@hummingbird.farnz.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: simon@farnz.org.uk
Cc: develop@kristov.de, netdev@vger.kernel.org, dcbw@redhat.com, mostrows@gmail.com, linux-ppp@vger.kernel.org

From: Simon Farnsworth <simon@farnz.org.uk>
Date: Fri, 20 Feb 2015 21:04:53 +0000

> However, I think I should probably do a v2 patch with a clear commit message, 
> so that if someone does bisect down to this commit as a cause of the "error" 
> they're seeing, they'll understand why it's not a problem.

Ok then, I'll wait for that v2.
