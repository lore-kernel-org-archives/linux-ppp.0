From: Beniamino Galvani <bgalvani@redhat.com>
Date: Fri, 06 Oct 2017 08:09:03 +0000
Subject: Re: BUG in free_netdev() on ppp link deletion
Message-Id: <20171006080902.GA11223@tp>
List-Id: <linux-ppp.vger.kernel.org>
References: <20171003074413.GA26158@tp>
 <20171003164003.f5yay2oe6dhxnump@alphalink.fr>
 <20171005145503.ehv34hkzm5gtrjcp@alphalink.fr>
In-Reply-To: <20171005145503.ehv34hkzm5gtrjcp@alphalink.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Guillaume Nault <g.nault@alphalink.fr>
Cc: linux-ppp@vger.kernel.org, netdev@vger.kernel.org, Paul Mackerras <paulus@samba.org>, David Ahern <dsahern@gmail.com>, Gao Feng <gfree.wind@vip.163.com>

On Thu, Oct 05, 2017 at 04:55:03PM +0200, Guillaume Nault wrote:
> Sorry for the delay, I've followed a few complicated dead ends before
> getting to this simple and rather obvious fix.
> 
> Can you try this patch?
> 
> [..]

The patch solves the issue, thanks.

Beniamino
