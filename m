From: Greg Stark <gsstark@mit.edu>
Date: Fri, 10 Dec 2004 19:12:50 +0000
Subject: Re: Kernel memory leak with PPPoE
Message-Id: <871xdy6k7h.fsf@stark.xeocode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <87d5xi7ji9.fsf@stark.xeocode.com>
In-Reply-To: <87d5xi7ji9.fsf@stark.xeocode.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


Michal Ostrowski <mostrows@watson.ibm.com> writes:

> Can you try doing this another way?  When pppd fails,let pppd die and
> start a new one.

I could do it for debugging. It's not acceptable for a real solution since
then the interface would appear and disappear and clients would get networking
errors for transient network reconnections.

> My concern is that by trying to stick within one pppd process you may be
> leaking something in pppd (e.g. not closing file-descriptors).  If the
> leak does not occur when you run new pppd processes, then I'd be
> inclined to think that it's a problem within pppd.

Well fds would normally get cleaned up when pppd exits.

> > I know it's suboptimal to report a bug report without reproducing it with a
> > clean unpatched, preferably recent, version. However this is my router box and
> > I upgrading it to linux 2.6 would be a major project (and I believe 2.4 suits
> > the 486 better). And with the unpatched pppd I would have to script restarting
> > pppd repeatedly (and deal with the consequences of the interface disappearing
> > and reappearing) since the pppoe module has a hard coded constant number of
> > retries before it aborts.
> > 
> 
> You can change that if you'd like.  I just decided on something that
> seemed sane.

Well really the PAD* retries ought to be a configurable parameter, along with
the timeouts, just like the ppp level retries. I tried adding parameters for
these but never finished the job.

For users manually dialing out it ought to fail after a few retries. But for a
router box that is supposed to maintain a 24x7 connection it really ought to
do exponential backoff at first and then keep retrying about once a minute or
so forever.

> I've looked through the 2.4.21 code, and in pppoe code there are few
> allocations to begin with.   The ones that could be a leak I've verified
> are not, or would only be a leak if the leak was actually in core net
> code (in which case it probably would have manifested itself in other
> ways and been dealt with already).

Hm. Perhaps it's elsewhere in the kernel but only triggered by the way pppox
creates and destroys interfaces dynamically?

-- 
greg

