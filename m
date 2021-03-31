From: patchwork-bot+netdevbpf@kernel.org
Date: Wed, 31 Mar 2021 00:10:09 +0000
Subject: Re: [PATCH] ppp: deflate: Remove useless call "zlib_inflateEnd"
Message-Id: <161714940934.32754.10257093294349777080.git-patchwork-notify@kernel.org>
List-Id: <linux-ppp.vger.kernel.org>
References: <1617097890-27020-1-git-send-email-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <1617097890-27020-1-git-send-email-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: paulus@samba.org, davem@davemloft.net, kuba@kernel.org, linux-ppp@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Tue, 30 Mar 2021 17:51:30 +0800 you wrote:
> Fix the following whitescan warning:
> 
> Calling "zlib_inflateEnd(&state->strm)" is only useful for its return
> value, which is ignored.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> 
> [...]

Here is the summary with links:
  - ppp: deflate: Remove useless call "zlib_inflateEnd"
    https://git.kernel.org/netdev/net-next/c/dc5fa2073f63

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html

