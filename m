Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795058894;
	b=a59uugOiGTwBRKaJI3p+LzF62psyPHRXHIeHXESHuB7R5gAqeBjg/AK1iazWclook3mN
	 FIxZ2VH7alYyguVhQWxsUH3YJFKYPROtRiLgQPhR49eSrXMcGcC7ykTnBoheWPAw/Aupd
	 GPA1CD9Cu5XB576ruJA0GBk0by4y+vHGaPFiESFIL4ZPzKs9AI/SM4ay0vKxzyYRbKCeq
	 KGbXeGjQ64bmDvPZz2FFOmzwDs4ix/L2NR5zzRys6nhkUs/nPryLZubdgZCZeylfpUWXw
	 dD+EX72TJrQ8Huu9xiOp0urBVhJAPXX7rMkEhMHIeR/aRCB3qEH7x4uuP8ybOrcOyEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795058894;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=CbyFwhwRvvW2mN25jQgNpahIvkeid+7JDvgpXv4XI84=;
	b=MZ4DkRaWe12LD92JZvtNSv9ix68rxUKSWMIyzyz6W/S+QpHiFCMLMaeRDGRsry81UsQQ
	 IrohcGFwlTuZ8ue/8EV3L9vpmTdWhkAE2TVZsqZRkb9EQfGadsbP8zkqAHCVXr7tCBibd
	 oIwug4gFhfXgBP534NrH6tjnGFJ2FE7o+nsMbnSQfy1mUdfLTAxEwU9SncHaPtexmI9f9
	 TTSpf6RzHtL4SY59NfZUqJyG6/V7SRSZrD3Zm0BkP8Eii53FQYqFBAquwI4bj4/ziHWqX
	 ChwMAlvjyGU9QYGvf6VX/ev76fzyVHk8qX2Q//tERQDaZQPbmCV+rJI9VRuMv4ojQ0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Djm8nA4F;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EBE2606A31C;
	Thu, 19 Nov 2026 03:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Djm8nA4F
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A782F1F000C4;
	Thu, 19 Nov 2026 03:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795058894;
	bh=CbyFwhwRvvW2mN25jQgNpahIvkeid+7JDvgpXv4XI84=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Djm8nA4F62eL/RWgAuon2+cBDcTrvpzZtsnhkbTuQKtFcUfF0VHQeVgUpmvYxRmWw
	 aBAWQeTlEK7Ar7VptenxR1YtOh2YCWZnXRyVUDi7dHbU3Df6cu+l/OXbyQkaYgB7Be
	 E358m0opS/hOW8T8WiT4J6BdqlhQrn7rC9By+OJtAvKtEz3rj1qSDeSL8dWPB8sFQP
	 Ah1XKcTu1dLZQfYj7ri+qJwKBotcfBe6nygynb5A+hRtOZaXzdO/sUQQ7QEvxp26Oi
	 iQ9catzK6IHzCQeVgw2p9ILnz4ULVYBBBVDDla1ahl8ONvJM73Pzr3WzNy5nYaFroP
	 xpjftm+d4pCIA==
Subject: Re: [PATCH net] ppp: serialize channel connect with unregister
From: netdev-bot+sashiko@kernel.org
To: 26031212468@stu.xidian.edu.cn
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, linux-ppp@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzbot+6b18da3ef22e33061add@syzkaller.appspotmail.com,
 qingfang.deng@linux.dev, 25031212117@stu.xidian.edu.cn, byu@xidian.edu.cn
Date: Thu, 19 Nov 2026 03:28:13 +0000
Message-ID: <179505889320.3136.16828129332871650938@kernel.org>
In-Reply-To: <20261116122750.23294-1-26031212468@stu.xidian.edu.cn>
References: <20261116122750.23294-1-26031212468@stu.xidian.edu.cn>
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Post: <mailto:linux-ppp@vger.kernel.org>
List-Help: <mailto:linux-ppp+help@vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-ppp+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 1 (1) · Medium: 0 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] ppp: race between PPPIOCDISCONN and ppp_unregister_channel()
- [Low] In ppp_unregister_channel()
  (drivers/net/ppp/ppp_generic.c:3097-3105), the patch moves…

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the patch
  closes the PPPIOCCONNECT re-attach race and leaves the other channel-…

--

ppp: serialize channel connect with unregister

This commit takes pch->chan_sem around ppp_connect_channel() in the
PPPIOCCONNECT ioctl. In ppp_unregister_channel() it moves the mutex_lock()
to before ppp_disconnect_channel(), so a concurrent connect cannot re-add
the channel's clist to a PPP unit between the disconnect and the clearing
of pch->chan.

Closes: https://syzbot.org/bug?extid=6b18da3ef22e33061add

> diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
> index 29847dc4bb454..ba2359f0899f3 100644
> --- a/drivers/net/ppp/ppp_generic.c
> +++ b/drivers/net/ppp/ppp_generic.c

[ ... ]

> @@ -755,7 +755,9 @@ static long ppp_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>  		case PPPIOCCONNECT:
>  			if (get_user(unit, p))
>  				break;
> +			mutex_lock(&pch->chan_sem);
>  			err = ppp_connect_channel(pch, unit);
> +			mutex_unlock(&pch->chan_sem);
>  			break;
>  
>  		case PPPIOCDISCONN:

[Severity: High]
This is a pre-existing issue. The commit message says the patch
preserves the disconnect-before-null ordering that the transmit path
needs. Does that ordering still hold when PPPIOCDISCONN races with
ppp_unregister_channel()?

The PPPIOCDISCONN case right below calls ppp_disconnect_channel()
without taking chan_sem. ppp_disconnect_channel() clears pch->ppp
under pch->upl and then drops upl. Only after that does it take
ppp_lock(ppp), unlink pch->clist and wait in synchronize_net().

Consider this sequence:

1. Thread A issues PPPIOCDISCONN on the channel's /dev/ppp file.
   ppp_disconnect_channel() replaces pch->ppp with NULL under upl and
   drops upl. It has not yet taken ppp_lock(ppp).

2. Thread B runs ppp_unregister_channel() on the same channel, for
   example because the pppoe socket or the tty is closed. It takes
   chan_sem without contention. Its ppp_disconnect_channel() sees
   pch->ppp == NULL and returns at once.

3. Thread B sets pch->chan = NULL under downl and returns. The
   channel driver is now free to release its struct ppp_channel.

4. pch->clist is still on ppp->channels. ppp_push(), running under
   ppp_xmit_lock(), picks pch, takes pch->downl, loads pch->chan and
   dereferences chan->direct_xmit.

ppp_mp_explode() and ppp_fill_forward_path() also dereference
pch->chan without a NULL check. Those checks were removed on the
assumption that unregister fully disconnects the channel before
clearing chan.

Thread A may already have done list_del_rcu() by the time B runs. B
still does not wait for A's synchronize_net(), so RCU readers such as
ppp_fill_forward_path() can keep using pch->chan after the driver has
freed it.

That is a NULL dereference or a use-after-free on the transmit path.
ppp_open() only requires CAP_NET_ADMIN in the user namespace, so an
unprivileged user namespace can reach this.

Would taking chan_sem around ppp_disconnect_channel() in the
PPPIOCDISCONN case close the race? Unregister would then wait for an
in-progress disconnect to finish its list_del_rcu() and
synchronize_net(). Alternatively, should ppp_disconnect_channel() be
reworked so that pch->ppp is not cleared until the channel has been
unlinked from the unit?

[Severity: High]
This is a pre-existing issue, but now that the PPPIOCCONNECT re-attach race
is closed, can the PPPIOCBRIDGECHAN case next to it still attach a channel
that is being unregistered?

ppp_bridge_channels() looks only at ->ppp and ->bridge under upl. It does
not check pch->chan or pch->file.dead:

drivers/net/ppp/ppp_generic.c:ppp_bridge_channels() {
	spin_lock(&pch->upl);
	if (rcu_dereference_protected(pch->ppp, lockdep_is_held(&pch->upl)) ||
	    rcu_dereference_protected(pch->bridge, lockdep_is_held(&pch->upl))) {
	...
	refcount_inc(&pchb->file.refcnt);
	rcu_assign_pointer(pch->bridge, pchb);
	...
}

The PPPIOCBRIDGECHAN case does not take chan_sem. ppp_unregister_channel()
calls ppp_unbridge_channels() only once, after chan_sem is dropped and
after list_del():

	mutex_unlock(&pch->chan_sem);
	...
	list_del(&pch->list);
	...
	ppp_unbridge_channels(pch);

Consider this sequence:

1. Channel A is unregistered while a /dev/ppp file is still attached to
   it. A stays alive with chan, ppp and bridge all NULL.

2. PPPIOCBRIDGECHAN is issued on A's file:

   ppp_ioctl()
     ppp_find_channel(pn, unit)          finds B under all_channels_lock
     refcount_inc(&pchb->file.refcnt)
     spin_unlock_bh(&pn->all_channels_lock)

3. At the same time, B's driver calls ppp_unregister_channel(B), for
   example because the pppoe socket is closed:

   ppp_unregister_channel(B)
     list_del(&B->list)
     ppp_unbridge_channels(B)            B->bridge is NULL, returns -EINVAL
     B->file.dead = 1
     ppp_release_channel(B)

4. ppp_bridge_channels(A, B) then sets A->bridge = B and B->bridge = A.
   Each channel takes a reference on the other.

ppp_unregister_channel() never runs again for A or B, and ppp_release()
only calls ppp_release_channel().

Once A's file is closed, is each channel's refcount held only by the
other? If so, ppp_release_channel() never gets to put_net_track().

That would leak both struct channel objects and keep their network
namespace pinned. ppp_open() only requires CAP_NET_ADMIN in the user
namespace. A failed attempt is harmless, so the race can be retried.

This doesn't look like a use-after-free, because
ppp_channel_bridge_input() checks pchb->chan under downl. A fix probably
needs a chan/dead check under upl in ppp_bridge_channels(), not wider
chan_sem coverage.

The new comments "Prevent PPPIOCCONNECT from reattaching the channel during
removal" and "serializes connect/unregister" are accurate for connect only.
The bridge attach path is still not serialized against unregister.

[ ... ]

> @@ -3092,12 +3094,15 @@ ppp_unregister_channel(struct ppp_channel *chan)
>  
>  	chan->ppp = NULL;
>  
> +	/*
> +	 * Prevent PPPIOCCONNECT from reattaching the channel during removal.
> +	 */
> +	mutex_lock(&pch->chan_sem);
>  	/*
>  	 * This ensures that we have returned from any calls into
>  	 * the channel's start_xmit or ioctl routine before we proceed.
>  	 */
>  	ppp_disconnect_channel(pch);

[Severity: Low]
This isn't a bug, but after this change the old comment about returning
from the channel's start_xmit or ioctl routine sits directly above
ppp_disconnect_channel(). The comment on chan_sem now mentions only
PPPIOCCONNECT.

ppp_disconnect_channel() only unlinks clist and calls synchronize_net(),
so it does not wait for chan->ops->ioctl().

The ioctl drain described in include/linux/ppp_channel.h and
Documentation/networking/ppp_generic.rst comes from chan_sem. The default
case in ppp_ioctl() holds it around chan->ops->ioctl():

	default:
		mutex_lock(&pch->chan_sem);
		chan = pch->chan;
		err = -ENOTTY;
		if (chan && chan->ops->ioctl)
			err = chan->ops->ioctl(chan, cmd, arg);
		mutex_unlock(&pch->chan_sem);

Could the comments say that the mutex drains channel ioctls as well as
blocking PPPIOCCONNECT?

> -	mutex_lock(&pch->chan_sem);
>  	spin_lock_bh(&pch->downl);
>  	pch->chan = NULL;
>  	spin_unlock_bh(&pch->downl);

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116122750.23294-1-26031212468%40stu.xidian.edu.cn
