From: James Carlson <carlsonj@workingcode.com>
Date: Mon, 04 Jun 2012 15:08:05 +0000
Subject: Re: Upcoming 2.4.6 release
Message-Id: <4FCCCF55.8030701@workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <20120602100037.GE17089@pale.ozlabs.ibm.com>
In-Reply-To: <20120602100037.GE17089@pale.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Daniel Golle wrote:
> This is the pptp plugin for pppd, taken from accel-pptp.sf.net.
> 
> Since the previous post I removed the logging macros from util.h so and fixed
> things so that the plugin now uses the pppd.h supplied logging functions.
> Probably some more pruning makes sense here and there, I'm open for suggestions.

Much improved on logging; thanks!

Yes, it does look like some light clean-up work could still be done
(particularly with the man page), but I think it's a good improvement as
it stands.

Paul?

-- 
James Carlson         42.703N 71.076W         <carlsonj@workingcode.com>
