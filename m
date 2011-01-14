From: James Carlson <carlsonj@workingcode.com>
Date: Fri, 14 Jan 2011 17:28:25 +0000
Subject: Re: ifconfig ppp0 errors
Message-Id: <4D3087B9.9000000@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <Pine.GSO.4.64.1101111527150.23601@sunfire13.eecs.tufts.edu>
In-Reply-To: <Pine.GSO.4.64.1101111527150.23601@sunfire13.eecs.tufts.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Slawomir Skret wrote:
> One comment that I have is that it would be useful to be able to
> retrieve the actual cause of the errors with the pppstats or some other
> way from the ppp driver. When they show up in the ifconfig it is not
> clear what's causing them and it requires some work to get to the actual
> cause.

The information you get from ifconfig -- the count of input errors -- is
essentially all that the driver knows.  It knows that it's getting bad
frames, but it can't really know _why_ they're bad.  That takes a human.

(It'd be possible to report some more details about edge cases here, and
some of the implementations do just that, but low-level problems that
drop hunks of data are, I think, inherently hard for a PPP driver to
diagnose on its own.)

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
