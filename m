From: Ray Van Dolson <rayvd@digitalpath.net>
Date: Mon, 24 Jan 2005 16:28:53 +0000
Subject: Re: proxyarp, pppd does not remove the arp entries
Message-Id: <20050124162853.GA8413@digitalpath.net>
List-Id: <linux-ppp.vger.kernel.org>
References: <41F24B8E.2020600@spl-spindel.de>
In-Reply-To: <41F24B8E.2020600@spl-spindel.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

I use proxyarp and have not seen this problem myself.  When users disconnect,
the arp entry is properly cleared.  However, I am using PPP 2.4.3 -- 2.4.1 is
a bit old; have you considered upgrading?

Ray

On Sat, Jan 22, 2005 at 01:48:14PM +0100, Jochen Roedenbeck wrote:
> I set up a dialin server with mgetty and pppd. It works in general,
> but there is a strange problem.
>
> I use the option "proxyarp". When the connection is opened, an arp
> entry is created with the address of the remote client, for example
> 192.168.76.72, which I checked using "arp -n". All works fine.
>
> When the connection gets closed, the arp entry is not removed, as
> it should. Instead the first number of the IP address, 192, is
> changed to 191.
>
> The arp chache gets longer and longer, and after some time it does not
> work any more.
>
> It is version 2.4.1 of pppd, and Linux kernel version 2.4.21. The
> distribution is Suse.
>
> What can I do?
>
> Jochen Roedenbeck
