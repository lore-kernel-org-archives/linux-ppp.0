From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 02 Aug 2021 11:43:21 +0000
Subject: Re: [bug report] ppp: fix 'ppp_mp_reconstruct bad seq' errors
Message-Id: <20210802114321.GH25548@kadam>
List-Id: <linux-ppp.vger.kernel.org>
References: <20210729141617.GC1267@kili>
In-Reply-To: <20210729141617.GC1267@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Fri, Jul 30, 2021 at 01:15:39PM -0400, James Carlson wrote:
> >>     2798 			skb_queue_walk_safe(list, p, tmp) {
> >>     2799 				if (p = head)
> > 
> > One of the weak points of Smatch is how it parses lists...  Also it
> > doesn't have any implications for this if (p = head) condition.
> 
> This is where things break down.  That queue walker macro on line 2798
> re-assigns 'p'.  The code marches over the list and says "anything that
> still exists up to (but not including) the head for this completed
> packet is trash."  Note that *NOTHING* here is harming 'head' or
> anything in the list that follows that buffer -- which includes 'tail.'

Crud...  I can't believe I misread this code twice.

I'm not actually sure why Smatch doesn't get this correct.  I wanted to
blame it on the new unpublished bits but even the published code is
buggy.  :/  I will investigate and fix this.

Thanks for taking the time on this.

regards,
dan carpenter
