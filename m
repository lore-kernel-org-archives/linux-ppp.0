From: Andrew Morton <akpm@linux-foundation.org>
Date: Mon, 22 Oct 2007 19:03:59 +0000
Subject: Re: kernel panic when running tcpdump
Message-Id: <20071022120359.26403bf0.akpm@linux-foundation.org>
List-Id: <linux-ppp.vger.kernel.org>
References: <20071011213126.cf92efb7.akpm@linux-foundation.org>
	<200710222040.19921.m.kozlowski@tuxland.pl>
In-Reply-To: <200710222040.19921.m.kozlowski@tuxland.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Cc: Jeff Garzik <jeff@garzik.org>, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linux-ppp@vger.kernel.org

On Mon, 22 Oct 2007 20:40:18 +0200 Mariusz Kozlowski <m.kozlowski@tuxland.pl> wrote:

> 	I'm seeing reproducible oops on 2.6.23-mm1 when trying to run tcpdump
> over ppp0 interface.

Can you please test the latest Linus kernel from
ftp://ftp.kernel.org/pub/linux/kernel/v2.6/snapshots/?

Because all netwrking things which were in 2.6.23-mm1 are now in mainline.
So if mainline is OK then that bug presumably got fixed.

Thanks.

