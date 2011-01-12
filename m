From: James Cameron <quozl@laptop.org>
Date: Wed, 12 Jan 2011 21:51:25 +0000
Subject: Re: ifconfig ppp0 errors
Message-Id: <20110112215125.GE3760@us.netrek.org>
List-Id: <linux-ppp.vger.kernel.org>
References: <Pine.GSO.4.64.1101111527150.23601@sunfire13.eecs.tufts.edu>
In-Reply-To: <Pine.GSO.4.64.1101111527150.23601@sunfire13.eecs.tufts.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Wed, Jan 12, 2011 at 04:23:29PM -0500, James Carlson wrote:
> I think the most prosaic cause of this sort of problem -- given the
> evidence so far, which (if I recall correctly) started with OK behavior
> until large data transfers were attempted -- is simple overflow.

Yes, that seems most likely.  Overflow can be tested for as well though,
by sending large amounts of data over the link, in the absence of PPP.
Careful counting will show what is lost.

Although, if the link itself has no flow control, then some loss will
always be a possibility.  10% of packets affected by loss seems a bit
high, but I've no idea what the original poster's design threshold is.

-- 
James Cameron
http://quozl.linux.org.au/
