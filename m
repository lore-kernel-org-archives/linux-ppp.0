From: ben_gal@libero.it
Date: Thu, 24 Feb 2005 19:02:31 +0000
Subject: Re: Client requesting its authentication
Message-Id: <20050224190231.GA2443@ytsejam>
List-Id: <linux-ppp.vger.kernel.org>
References: <20050224162619.GB5787@ytsejam>
In-Reply-To: <20050224162619.GB5787@ytsejam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Thu, Feb 24, 2005 at 01:53:20PM -0500, James Carlson wrote:
> If it doesn't request it, then, clearly, it doesn't support it or want
> to demand it of its peers.  If your local policy rules are such that
> you won't talk to someone who doesn't initiate authentication, then I
> think the best answer is just to disconnect.

Right.

> OK ... but it still seems rather pointless to me.
> 
> That said, I see the point now, and, no, there's no option that
> currently does that.  You'll need to add one or, better yet, make pppd
> just do that by default when EAP TLS client side is configured.

Ok. Thanks for the long discussion :)

