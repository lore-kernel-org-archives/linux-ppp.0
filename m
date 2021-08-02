From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 02 Aug 2021 12:37:22 +0000
Subject: Re: [bug report] ppp: fix 'ppp_mp_reconstruct bad seq' errors
Message-Id: <20210802123722.GI25548@kadam>
List-Id: <linux-ppp.vger.kernel.org>
References: <20210729141617.GC1267@kili>
In-Reply-To: <20210729141617.GC1267@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Sat, Jul 31, 2021 at 02:36:03PM -0400, James Carlson wrote:
> On 7/30/21 1:15 PM, James Carlson wrote:
> > On 7/30/21 4:48 AM, Dan Carpenter wrote:
> > > > --> 2840 		ppp->nextseq = PPP_MP_CB(tail)->sequence + 1;
> > > >                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > > 
> > > Here is where Smatch complains.
> > 
> > If that's Smatch's analysis of the situation, then Smatch is wrong.
> > It's a bogus warning.
> 
> For what it's worth, it's not my code, and I agree that it's at least a bit
> hard to follow, and may well harbor bugs.  If you're suggesting either some
> kind of suppression directive (I tried looking for some Smatch documentation
> but couldn't find much to suggest that's possible, though I guess now that
> you'd be the one who knows for sure), or adding something like "u32 nextseq
> = PPP_CB(tail)->sequence + 1;" around line 2795, and then using
> "ppp->nextseq = nextseq;" on 2840, then I'd be in favor of that, at least to
> make the tool happy.

No. No.  Never change the code just to make the tool happy.  Of course,
I misread this in two different ways because the first time I didn't
spot the break statement and the second time I got skb_queue_walk_safe()
and skb_queue_walk_from_safe().  But it's not really hard to read if
you're more familiar with those macros.

I've investigated this and it turns out the problem is a kind of known
issue with how Smatch parses lists.  I've avoided fixing this for years
because parsing lists correctly will be a big slow down and it's a
quite a big project but probably I should just fix it.  Maybe later this
year.

regards,
dan carpenter


