From: James Cameron <quozl@laptop.org>
Date: Thu, 09 Jul 2009 22:42:47 +0000
Subject: Re: [PATCH] Accept ms-wins settings provided by server
Message-Id: <20090709224247.GC8937@us.netrek.org>
List-Id: <linux-ppp.vger.kernel.org>
References: <1241641599-32361-1-git-send-email-marcus@better.se>
In-Reply-To: <1241641599-32361-1-git-send-email-marcus@better.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Thu, Jul 09, 2009 at 12:38:36PM +0000, Libor Pechacek wrote:
> Yet it's hard to believe for me that the *modem* replies PPP packets,
> and establishes PPP connection *before* the physical link is up.  Does
> it really work this way?

Yes, it certainly does.  This can be demonstrated or reproduced quite
easily, with a modem inside an radiofrequency shield enclosure, or
without an antenna (non-radiating dummy load), or beyond reasonable
range.  PPP negotiation occurs between the host and the modem firmware,
yet there is no RF link.

-- 
James Cameron    mailto:quozl@us.netrek.org     http://quozl.netrek.org/
