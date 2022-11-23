Return-Path: <linux-ppp-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 157CFC4167D
	for <linux-ppp@archiver.kernel.org>; Wed, 23 Nov 2022 13:21:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238658AbiKWNVk (ORCPT <rfc822;linux-ppp@archiver.kernel.org>);
        Wed, 23 Nov 2022 08:21:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237105AbiKWNVU (ORCPT
        <rfc822;linux-ppp@vger.kernel.org>); Wed, 23 Nov 2022 08:21:20 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2D7698259;
        Wed, 23 Nov 2022 05:00:16 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 274CD61C81;
        Wed, 23 Nov 2022 13:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 83108C433D7;
        Wed, 23 Nov 2022 13:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669208415;
        bh=kZxsC1hm32r7YyaTZD/P/7ASbbc/9KJNcymZ2OeOuFE=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Zy2H1tGCFSVvDD4H9lRQIFtazwj4AAVsTD5IlaDJC3cZ1qRMT16RPStBLxjQ4ZJel
         cwVvdrwc3vxdm3dHeAeTLIfYrLdWEFPM/sgIqgXyEffL7XPf38cyamOT3RNzYS/VFp
         lW2jyip/65oIy8//h35Nk5LEhdGXuOhLi6HIr0aJyM/Tr5s66yU9fu9b/nb4vIJ1wH
         Wj7rsODNGGyp54w4rN9sCdPYqoSq+5UvqswUfYTuEEMD9FdbldhM8y8t2bna7IpyL3
         rn3tR9U/hiKupgS6QcgMFf0S/Xfv0f8GC5bMo9mv39IXEbKEFIMqQZhku9GOr6pPXe
         kAG/cRR9oSeNg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 67479C395ED;
        Wed, 23 Nov 2022 13:00:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] ppp: associate skb with a device at tx
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <166920841541.12824.3595109437839088103.git-patchwork-notify@kernel.org>
Date:   Wed, 23 Nov 2022 13:00:15 +0000
References: <20221121182913.2166006-1-sdf@google.com>
In-Reply-To: <20221121182913.2166006-1-sdf@google.com>
To:     Stanislav Fomichev <sdf@google.com>
Cc:     netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, paulus@samba.org,
        linux-ppp@vger.kernel.org,
        syzbot+41cab52ab62ee99ed24a@syzkaller.appspotmail.com
Precedence: bulk
List-ID: <linux-ppp.vger.kernel.org>
X-Mailing-List: linux-ppp@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (master)
by David S. Miller <davem@davemloft.net>:

On Mon, 21 Nov 2022 10:29:13 -0800 you wrote:
> Syzkaller triggered flow dissector warning with the following:
> 
> r0 = openat$ppp(0xffffffffffffff9c, &(0x7f0000000000), 0xc0802, 0x0)
> ioctl$PPPIOCNEWUNIT(r0, 0xc004743e, &(0x7f00000000c0))
> ioctl$PPPIOCSACTIVE(r0, 0x40107446, &(0x7f0000000240)={0x2, &(0x7f0000000180)=[{0x20, 0x0, 0x0, 0xfffff034}, {0x6}]})
> pwritev(r0, &(0x7f0000000040)=[{&(0x7f0000000140)='\x00!', 0x2}], 0x1, 0x0, 0x0)
> 
> [...]

Here is the summary with links:
  - [net-next] ppp: associate skb with a device at tx
    https://git.kernel.org/netdev/net-next/c/9f225444467b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


