From: Paul Mackerras <paulus@samba.org>
Date: Thu, 30 Sep 2004 02:10:58 +0000
Subject: Re: counters overflow
Message-Id: <16731.27442.190351.358212@cargo.ozlabs.ibm.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <262655318.20040929092029@rsl.ru>
In-Reply-To: <262655318.20040929092029@rsl.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Bill Unruh writes:

> You have the source code. Make the counters longs instead. Does not seem
> a terribly difficult hack. 

They would need to be long long, and the problem (from my point of
view, at least) is that that changes the user/kernel ABI, which causes
all sorts of compatibility problems.

I think I will make pppd maintain the upper 32 bits of a count in
userspace, by having it wake up periodically and poll the 32-bit
counters from the kernel and see if they have wrapped.

Paul.
