From: Ray Van Dolson <rayvd@digitalpath.net>
Date: Thu, 29 Jun 2006 22:22:30 +0000
Subject: Re: Radius plugin bug.
Message-Id: <20060629222230.GA4716@digitalpath.net>
List-Id: <linux-ppp.vger.kernel.org>
References: <20060629065205.GA18383@digitalpath.net>
In-Reply-To: <20060629065205.GA18383@digitalpath.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Thu, Jun 29, 2006 at 10:37:30AM +0100, Ben McKeegan wrote:
> Hi Ray,
> 
> That's not the only problem with the way radattr handles its files. 
> With multilink enabled it doesn't work at all as it always misses the 
> interface name out of the filename, so all pppd processes write to 
> exactly the same file!

Thanks for the reply Ben.  I may indeed try to make use of your patch, but
it seems to me the best way to handle this would be to not release the ppp
unit number until the plugins have finished their cleanup() functions.

I'm by no means a C master and am trying to find out where in the code the
"lock" on the device name pppXXX is released at.  I'm trying to trace
backwards from the sifdown() call in sys-linux.c but getting a little lost.

Anyone have any pointers on how this works?  Is it a matter of just putting
the sys_cleanup() call in cleanup() in main.c after the cleanup calls for
the channels?

Ray
