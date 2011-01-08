From: David Miller <davem@davemloft.net>
Date: Sat, 08 Jan 2011 04:37:10 +0000
Subject: Re: [PATCH v2] net: ppp: use {get,put}_unaligned_be{16,32}
Message-Id: <20110107.203710.71119403.davem@davemloft.net>
List-Id: <linux-ppp.vger.kernel.org>
References: <AANLkTim=1GCah0qp8HJK31LWXPb5vAZYp+d2BTQM+Q+B@mail.gmail.com>
	<20110107.171534.193718114.davem@davemloft.net>
	<20110108031320.GA28926@brick.ozlabs.ibm.com>
In-Reply-To: <20110108031320.GA28926@brick.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: paulus@samba.org
Cc: xiaosuo@gmail.com, harvey.harrison@gmail.com, linux-ppp@vger.kernel.org, netdev@vger.kernel.org

From: Paul Mackerras <paulus@samba.org>
Date: Sat, 8 Jan 2011 14:13:20 +1100

> On Fri, Jan 07, 2011 at 05:15:34PM -0800, David Miller wrote:
> 
>> I have to say that every time I go read the header parsing code in the
>> PPP driver, I absolutely regret it.
>> 
>> And Changli's patch fixes some of the readability problems.
> 
> It's up to you whether you merge the patch or not, but surely you
> agree it needs more than a zero-line description?

It's entire sufficient to me.

He de-open-coded {get,put}_unaligned_be{16,32}() and when open-coding
is eliminated in this way a commit message of "Use {helper function
foo}." is more than enough.
