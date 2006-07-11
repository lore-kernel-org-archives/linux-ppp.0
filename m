From: Ray Van Dolson <rayvd@digitalpath.net>
Date: Tue, 11 Jul 2006 15:25:16 +0000
Subject: Re: Radius plugin bug.
Message-Id: <20060711152516.GA6737@digitalpath.net>
List-Id: <linux-ppp.vger.kernel.org>
References: <20060629065205.GA18383@digitalpath.net>
In-Reply-To: <20060629065205.GA18383@digitalpath.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Wed, Jul 05, 2006 at 12:40:21PM -0700, Ray Van Dolson wrote:
> Well have been working on this a little, and may have found a potential
> solution that works.
> 
> Feedback would be appreciate from real programmers as to negative
> consequences of reorganizing the code a little...
> 
> Basically, I am removing the calls to free the ppp interface from the
> link_terminated function and relocating them to later in the process --
> after the plugin cleanup functions have been called removing the radius
> attribute file.
> 
> Seems to be working OK so far on our server...

Been a few days, and still having no problems with this patch.  Problems
still arise if a customer connects and then disconnects before the ip-up
scripts have completed their initial run, but this isn't as much of an
issue. :)

Ray
