From: Bill Unruh <unruh@physics.ubc.ca>
Date: Thu, 14 Oct 2004 16:45:40 +0000
Subject: Re: even after PPP connection established, pings don't work
Message-Id: <Pine.LNX.4.58.0410140944060.24959@string.physics.ubc.ca>
List-Id: <linux-ppp.vger.kernel.org>
References: <Pine.LNX.4.60.0410141106110.21794@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.60.0410141106110.21794@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Thu, 14 Oct 2004, Robert P. J. Day wrote:

> On Thu, 14 Oct 2004, Bill Unruh wrote:
> 
> > You need to give us detailed info ...
> 
> i realize i wasn't overly detailed, but the question was a fairly
> generic one -- even if i don't use the "defaultroute" option when
> creating the PPP link, should i (theoretically) still be able to ping
> the IP address at the other end of the PPP link (given that the
> routing table entry for that link should have the "UH" flags for a
> host-specific entry?)

Yes. You should, assuming that the two machines allow pings and respond
to pings, assuming your firewall lets stuff through, etc.

So, to ask it another way, can I ping two ppp connected machines, one
from the other even though the default route points to eth0? Yes.

> 
>   as long as i'm convinced that what i'm doing *should* work, i'll
> carry on with additional troubleshooting.
> 
> rday
> 

-- 
William G. Unruh   |  Canadian Institute for|     Tel: +1(604)822-3273
Physics&Astronomy  |     Advanced Research  |     Fax: +1(604)822-5324
UBC, Vancouver,BC  |   Program in Cosmology |     unruh@physics.ubc.ca
Canada V6T 1Z1     |      and Gravity       |  www.theory.physics.ubc.ca/
