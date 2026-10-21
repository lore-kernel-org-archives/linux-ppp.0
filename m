Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.165
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792602239;
	b=k5K79JNLSGh0OnV//NH8WB+371GYurdU8Q5obi8EXMvfFgiKnl2fZq7CYwAS0GhwQZT+
	 5M9ZmVR7BOq1FCLKInh69tkWrAJuxaKP2P+ftCmgq0RMjW+UDTe1tNTN4Q47nISqmQw5D
	 XlCND6ac1FNMKjuA+x4gzeTG7+8FrNDiDcdZvOs8+R81LuJFHFTnNQTJV+g49jUXAYZMV
	 ToRqdgmdBLq+1k0fCx4+AgHrsunnsQizwdCYndcLyPkpEqNpNYmRaboOqr8i5mo2h+97o
	 xRkk0OHDx1mh9wZaY9Yo2n782wFsoglKonuyUvRh4rfjLlAg0bKLkYL8BglA662SuxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792602239;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=XxkAtzk3cuV4R/7ZEJ4B77roig8TiSn44g1A3T9utgI=;
	b=BDZCGkA18S2uNEC2TzSThyE4nfGRpTzp+q35W3gXqBYFIq0x6q8Gy/cMqJTsBZrZjEE/
	 0lg217iM+bhITSv5CcI6jO7aYibCLi6iOmSZiGfi2q/WTRaDw9gCuCNrKI3yPBjv24Kqi
	 /VjOxIvERHOdkO4gx7gSXUke2VSmqle7e45nfbozio/mBsI0P+5cSR2ipE1RFPMMUkv/9
	 pYpkaaR9lj/U02Vv1T3yJvxckEPy4tK/QD+jUl+jPbTDU35yJIEHiR5PafIckCrINckwY
	 KWZTFG+1Og8yCgDdNh3cQ56dBkow933Ai327phmj8cL+vQc6DM8ZcEBwRafw7qKL9Zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OKzhBjGE;
	arc=none smtp.remote-ip=95.215.58.165
Received: from mta1.migadu.com (out-165.mta1.migadu.com [95.215.58.165])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F73606A31A
	for <linux-ppp@vger.kernel.org>; Wed, 21 Oct 2026 17:03:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5F73606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OKzhBjGE
X-Envelope-To: linux-ppp@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=xxzknvAGwBqrx+ryt5T3qM3aIvNfAZ9P3IcDt4rnT4w=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792602236; v=1; x=1793207036;
 b=OKzhBjGEncpgo3Uz3/LILxAqU/+xcGGiC7mavksAJYiq3PMGFkBOisxga95iE3oHTTuyKuhB
 M6cpiiUbcmVjfp75wVT6QnKK+Ui/yyjMS1BAZAZsCmOKVzrhmHTOh4+AZbDa6bzIAftpDE2xSeR
 qiZVGnmdkMLCYqQCxM8nt4/s=
X-Envelope-To: linux-ppp@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d445459a510384bd;
	Wed, 21 Oct 2026 17:03:56 +0000
X-Mizu-Trace-ID: d445459a510384bd
X-Migadu-Flow: FLOW_OUT
Message-ID: <51ccddcc-53b0-47cd-9526-ccd825f0f6d9@linux.dev>
Date: Thu, 22 Oct 2026 01:03:48 +0800
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
Content-Language: en-US
From: Qingfang Deng <qingfang.deng@linux.dev>
In-Reply-To: <CAL4WiiouaJ5QU24uKt=CuxpfgHmWHS5oxoE2E_C6KFCLbDh0+w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/22/2026 12:31 AM, Eric Dumazet wrote:
> Le mer. 21 oct. 2026 à 12:27, Qingfang Deng <qingfang.deng@linux.dev> a écrit :
>>> +       case PPP_IP:
>>> +               skb->protocol = htons(ETH_P_IP);
>>> +               break;
>>> +       case PPP_IPV6:
>>> +               skb->protocol = htons(ETH_P_IPV6);
>>> +               break;
>>> +       default:
>>> +               goto drop;
>>> +       }
>>> +       skb_set_network_header(skb, PPP_PROTO_LEN);
>>> +
>>> +       segs = skb_gso_segment(skb, 0);
>>
>> Passing zero features to skb_gso_segment will linearize every segment
>> prematurely.
> 
> Good point, PPTP and L2TP do not need linear packets.
> I will pass NETIF_F_SG: checksums are still computed in software by
> skb_segment(), as openvswitch does, and ppp_bridge_xmit() linearizes
> segments only for channels without direct_xmit.

What about NETIF_F_FRAGLIST?
