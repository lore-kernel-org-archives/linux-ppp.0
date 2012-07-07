From: David Miller <davem@davemloft.net>
Date: Sat, 07 Jul 2012 23:15:04 +0000
Subject: Re: [PATCH next-next] ppp: change default for incoming protocol filter to NPMODE_DROP
Message-Id: <20120707.161504.686059289738005570.davem@davemloft.net>
List-Id: <linux-ppp.vger.kernel.org>
References: <20120704013258.GA26225@kvack.org>
	<20120705.030027.655926012207641451.davem@davemloft.net>
	<20120706172800.GC19462@kvack.org>
In-Reply-To: <20120706172800.GC19462@kvack.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bcrl@kvack.org
Cc: netdev@vger.kernel.org, linux-ppp@vger.kernel.org

From: Benjamin LaHaise <bcrl@kvack.org>
Date: Fri, 6 Jul 2012 13:28:00 -0400

> How about the following addition instead to provide a list of
> protocols to disable?

The userspace programs must accomodate all existing kernels, so
the addition of this feature is rather pointless.
