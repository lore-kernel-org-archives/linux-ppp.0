Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792635519;
	b=gAZhIuNxdOaLGKXRGL9fMwdF4zq0XZUw0qs9KNtK/78av25iMBS7zBQ91Idy3z1ADDph
	 bCJ65T61QU2RkyeXQJ5UiWHUsuTnOhEyfOmniuJ8kt+3gtj2NZqsRm1JX0wzekfLafWnX
	 t0fUSZJdi9p0IdQ5ScGB7f0bB6TE7y7BUndkPdls9CH4whgVAvT+8hd81EtdPstpIblvZ
	 HzlsUb21A8S1vsgL+Ayx7EJzaesM/5SCke+uHjGYJt7Otta/rYC5zdnp39KZkrjneRo2V
	 8k2mt81k8HaeGSHJddAutKj6/b+Oa5+eExRzavXiwvtF4cDVIwwGCmB5I/i/6FFOM/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792635519;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=V/bK1oHMn1rt+dKdcCYOSmcwkHw/5HHuvQOfHL/lIbY=;
	b=L0GDxtVy6h4uikfDGWI7qn74wtKNEi/iPEV+omUDQdLaGuew3HQgN6GqLR1Hyuxyl9Rn
	 9M7RTM+PU0ZG7RlxU/rpvL0nWClyQu9X8ljt0TLt8/vylQtrdM6nth8crX+fKcrh8+FgF
	 SeMWc6KxbPoi0eiwkayxvtkxCXaC9JJyGZVTjHSbtXTJK5UHbr58eL2gva7SDBrMgjjeI
	 NpR1soO0Oilb22L1yweVSUaKmDdjeQN5wtKQ63U9dcllEZctI1cQDsN0l/g/22fFHsy9i
	 6qi3aZQmU0giyVbyIjNSMEnk9t7U0po/OZCXjYQMCdhNGRhprNcjnNccmB98sI6LgQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HgAXSlwc;
	arc=none smtp.remote-ip=95.215.58.76
Received: from mta1.migadu.com (out-76.mta1.migadu.com [95.215.58.76])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C19C606A320
	for <linux-ppp@vger.kernel.org>; Thu, 22 Oct 2026 02:18:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C19C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HgAXSlwc
X-Envelope-To: linux-ppp@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ooqyk9o6+mpPrkv3GOQDSDUiZawfX8BzqiIhm5l6pnQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792635503; v=1; x=1793240303;
 b=HgAXSlwchmv9Y+9KUXMqqEP/X3dvSR4dnagDzZyQV+xIkneaqn9/Mevv0XToW189HH8UMw4d
 w5SpfGVvRFduIkWS3FUDNKxEK/i3LgWWusv1sAwtkoB6kl9DTC5Pl7hweELWfDiPGfZMuJ/WePj
 BurxRwlRCGPDBb0udenPRyrs=
X-Envelope-To: linux-ppp@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e1ec92438c6690db;
	Thu, 22 Oct 2026 02:18:23 +0000
X-Mizu-Trace-ID: e1ec92438c6690db
X-Migadu-Flow: FLOW_OUT
Message-ID: <b3091ab0-0e1b-4835-ae36-14978af46fa3@linux.dev>
Date: Thu, 22 Oct 2026 10:18:12 +0800
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Post: <mailto:linux-ppp@vger.kernel.org>
List-Help: <mailto:linux-ppp+help@vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-ppp+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] ppp: linearize bridged packets when required
To: Eric Dumazet <edumazet@kernel.org>
Cc: netdev-bot+sinfo@kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Breno Leitao <leitao@debian.org>,
 Kees Cook <kees@kernel.org>, Taegu Ha <hataegu0826@gmail.com>,
 Tom Parkin <tparkin@katalix.com>, linux-ppp@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 James Chapman <jchapman@katalix.com>, Sashiko <sashiko-bot@kernel.org>,
 Felix Fietkau <nbd@nbd.name>, Pablo Neira Ayuso <pablo@netfilter.org>
References: <20261021023608.55867-1-qingfang.deng@linux.dev>
 <179255036282.3290.8488375760281728576@kernel.org>
 <c0f348bf-0e13-4cb1-8014-cd9b7787bfe6@linux.dev>
 <CAL4WiirRPnbSBgcoh8Aiq8zGVzsy34w9uaqAgSKQwpgJ0ht7aA@mail.gmail.com>
 <315a8794-db40-4d0f-9e4c-0cad66174bff@linux.dev>
 <CAL4WiiouaJ5QU24uKt=CuxpfgHmWHS5oxoE2E_C6KFCLbDh0+w@mail.gmail.com>
 <51ccddcc-53b0-47cd-9526-ccd825f0f6d9@linux.dev>
 <CAL4Wiip2F59XO3BrjUHVrFqYMuD-LxNmZXhtftkV-JG0Ya84Yg@mail.gmail.com>
From: Qingfang Deng <qingfang.deng@linux.dev>
In-Reply-To: <CAL4Wiip2F59XO3BrjUHVrFqYMuD-LxNmZXhtftkV-JG0Ya84Yg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2026/10/22 1:55, Eric Dumazet wrote:
>> What about NETIF_F_FRAGLIST?
> I do not see your point. Can you elaborate?
>
> There’s also nothing left to gain on fraglist packets.
>
> SKB_GSO_FRAGLIST packets already go through skb_segment_list(),
> which just unchains the original skbs without copying, as the fraglist
> test run showed.
>
> Frag_list skbs that aren’t fraglist GRO go through skb_segment(),
> which with NETIF_F_SG already shares the pages of the chained skbs
> instead of copying them.

I've run selftests and confirmed that NETIF_F_FRAGLIST is unnecessary here.

One extra finding: passing NETIF_F_SG conditionally can avoid an extra 
reallocation in skb_linearize().

segs = skb_gso_segment(skb, chan->direct_xmit ? NETIF_F_SG : 0);

