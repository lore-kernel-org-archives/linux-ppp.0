From: David Miller <davem@davemloft.net>
Date: Fri, 14 Dec 2018 21:27:22 +0000
Subject: Re: [PATCH] hamradio, ppp: change semaphore to completion
Message-Id: <20181214.132722.1406978308882485818.davem@davemloft.net>
List-Id: <linux-ppp.vger.kernel.org>
References: <20181210215318.1982562-1-arnd@arndb.de>
In-Reply-To: <20181210215318.1982562-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: arnd@arndb.de
Cc: ajk@comnets.uni-bremen.de, paulus@samba.org, viro@zeniv.linux.org.uk, colin.king@canonical.com, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-ppp@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 10 Dec 2018 22:52:56 +0100

> ppp and hamradio have copies of the same code that uses a semaphore
> in place of a completion for historic reasons. Make it use the
> proper interface instead in all copies.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied, thanks.
