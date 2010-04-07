From: Pavel Roskin <proski@gnu.org>
Date: Wed, 07 Apr 2010 06:19:55 +0000
Subject: Re: [PATCH v2] crypto: add blkcipher implementation of ARC4
Message-Id: <1270621195.31184.45.camel@mj>
List-Id: <linux-ppp.vger.kernel.org>
References: <1270280969-11357-1-git-send-email-sebastian@breakpoint.cc>
	 <1270280969-11357-3-git-send-email-sebastian@breakpoint.cc>
	 <20100405084209.GA16788@gondor.apana.org.au>
	 <20100405170406.GA24215@Chamillionaire.breakpoint.cc>
In-Reply-To: <20100405170406.GA24215@Chamillionaire.breakpoint.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, linux-crypto@vger.kernel.org, linux-wireless@vger.kernel.org, linux-ppp@vger.kernel.org

On Mon, 2010-04-05 at 19:04 +0200, Sebastian Andrzej Siewior wrote:

> +module_init(arc4_init);
> +module_exit(arc4_exit);

I'm feelings uneasy about using the same module init/exit functions
names in arc4blk.c and arc4cip.c.

Even though it doesn't break for me on x86_64 (whether I'm compiling
modules or a solid kernel), and even though the potential name conflict
is temporary until arc4cip.c is removed, it could break on some other
architecture or maybe with another linker.

Let's use arc4blk_init and arc4blk_exit.

-- 
Regards,
Pavel Roskin
