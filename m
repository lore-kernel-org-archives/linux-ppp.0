From: patchwork-bot+netdevbpf@kernel.org
Date: Sun, 08 Aug 2021 12:10:06 +0000
Subject: Re: [PATCH] ppp: Fix generating ifname when empty IFLA_IFNAME is specified
Message-Id: <162842460619.22263.12540809953818710205.git-patchwork-notify@kernel.org>
List-Id: <linux-ppp.vger.kernel.org>
References: <20210807132703.26303-1-pali@kernel.org>
In-Reply-To: <20210807132703.26303-1-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?utf-8?b?UGFsaSBSb2jDoXIgPHBhbGlAa2VybmVsLm9yZz4=?=@ci.codeaurora.org
Cc: paulus@samba.org, davem@davemloft.net, kuba@kernel.org, g.nault@alphalink.fr, linux-ppp@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (refs/heads/master):

On Sat,  7 Aug 2021 15:27:03 +0200 you wrote:
> IFLA_IFNAME is nul-term string which means that IFLA_IFNAME buffer can be
> larger than length of string which contains.
> 
> Function __rtnl_newlink() generates new own ifname if either IFLA_IFNAME
> was not specified at all or userspace passed empty nul-term string.
> 
> It is expected that if userspace does not specify ifname for new ppp netdev
> then kernel generates one in format "ppp<id>" where id matches to the ppp
> unit id which can be later obtained by PPPIOCGUNIT ioctl.
> 
> [...]

Here is the summary with links:
  - ppp: Fix generating ifname when empty IFLA_IFNAME is specified
    https://git.kernel.org/netdev/net/c/2459dcb96bcb

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html

