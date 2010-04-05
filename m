From: Charlie Brady <charlieb-linux-ppp@budge.apana.org.au>
Date: Mon, 05 Apr 2010 14:49:08 +0000
Subject: Re: CentOS 5.4 repositories
Message-Id: <Pine.LNX.4.64.1004051048120.19701@e-smith.charlieb.ott.istop.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <W7592413235268421270476700@webmail34>
In-Reply-To: <W7592413235268421270476700@webmail34>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


On Mon, 5 Apr 2010, tony.chamberlain@lemko.com wrote:

> The pptp repository doesn't seem to work with 5.4.  yum list times out:
>
>
> http://poptop.sourceforge.net/yum/stable/rhel5/i386/repodata /primary.sqlite.bz2: [Errno 4] Socket Error: (104, 'Connection reset by peer')
> Trying other mirror.
> Same problem for other mirrors.

I suspect that this is due to ICMP filtering somewhere between your system 
and the sourceforge website:

http://www.usenix.org/event/lisa02/tech/full_papers/vanderberg/vanderberg.ps
