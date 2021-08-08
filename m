From: patchwork-bot+netdevbpf@kernel.org
Date: Sun, 08 Aug 2021 12:10:06 +0000
Subject: Re: [PATCH] ppp: Fix generating ppp unit id when ifname is not specified
Message-Id: <162842460623.22263.8898241891049192609.git-patchwork-notify@kernel.org>
List-Id: <linux-ppp.vger.kernel.org>
References: <20210807160050.17687-1-pali@kernel.org>
In-Reply-To: <20210807160050.17687-1-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?utf-8?b?UGFsaSBSb2jDoXIgPHBhbGlAa2VybmVsLm9yZz4=?=@ci.codeaurora.org
Cc: paulus@samba.org, davem@davemloft.net, kuba@kernel.org, g.nault@alphalink.fr, linux-ppp@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (refs/heads/master):

On Sat,  7 Aug 2021 18:00:50 +0200 you wrote:
> When registering new ppp interface via PPPIOCNEWUNIT ioctl then kernel has
> to choose interface name as this ioctl API does not support specifying it.
> 
> Kernel in this case register new interface with name "ppp<id>" where <id>
> is the ppp unit id, which can be obtained via PPPIOCGUNIT ioctl. This
> applies also in the case when registering new ppp interface via rtnl
> without supplying IFLA_IFNAME.
> 
> [...]

Here is the summary with links:
  - ppp: Fix generating ppp unit id when ifname is not specified
    https://git.kernel.org/netdev/net/c/3125f26c5148

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html

