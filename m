From: carlsonj@workingcode.com
Date: Fri, 15 Oct 2004 18:55:15 +0000
Subject: Re: absolutely baffled as to why PPP link doesn't allow pings
Message-Id: <16752.7443.381436.601249@carlson.workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <Pine.LNX.4.60.0410151211340.11955@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.60.0410151211340.11955@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Robert P. J. Day writes:
> well, we're making progress, although not the way i would have liked.
> as a simple test, we just hooked up the serial ports of the systems
> direct connect with a serial cable, and PPP worked just dandy.
> 
> putting the modems back in the circuit re-introduced the problem.  so
> it could be the modems or the initialization strings we're using.
> back to the drawing board ...

That certainly points in a different direction.  One possibility is
that you're running into flow control problems or transparency issues
with the modems.

If they're like USR modems, then "AT&F1" usually does the trick.  If
they're not, then see the manual.  :-/

Two things to try: "asyncmap 0xa0000" and "noasyncmap".  The former
will escape XON/XOFF characters, on the theory that the modems are
eating those characters by default.  The latter will escape all
control characters.

-- 
James Carlson                                 <carlsonj@workingcode.com>
