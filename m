Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793620124;
	b=GwImC4J+/nxbZpOMimrBd85LnWafs0BWw6sh/7fZ+aN1WJoVcOSaTuKQVtM2qPNbvl72
	 nJFvERqa3khiWxN19wHXSZa1n/XhXv8vk8YnyxdWuEDHRihDpibk1bJCujAkG9G2dXpWj
	 U9OMzxUoQaHK1ToAPh6g3iYrC/dZKCvzIEHEX65ebaEp0mJdMFMxHkZl+oBhAfeKGg4xg
	 vxuKJUeisW/CGIBRoVjN2c1AQEXeKHfvGczU99pE8XyLHzzNwqM+89WnLE9rSwjTrB4QK
	 Y+edQluRQeMeiUUPYLgLezQ4XPELST35oxMtyVHdfwYnZUzVLW2sj9vQ74Lx9iEAT2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793620124;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=SJMWixFaZLRsZ4Hl1XD4V62BsN02jkA9imQJRFP2Ruw=;
	b=EzpnnKu3HwouO+KTKz+oCi++ufNtt6xq16L2ZLpcZtyQ9TZVofyrgc4TVlXS+C3V7cNd
	 Rmdr+IKvsKwn7iY+YPpzqZ0d6lrobx2FmIw73Ug9DLaEXxQ9bCdHmxhh3K+ODX09ZxJIZ
	 CT+JmvJ/w5ztMjFNdNj8TF9ILgx2WwoX8S8v0Kj+b+32f7zDJTyidxN4Xwo72HQ4IaQbj
	 1s6OPjTa5YrNKTx7OTTDYsux1pGHeuVavlp26Xzm7ok8wkyma2jP8nI3iuD07ASgFfDd9
	 azSPDfyhd8GNOfsOpAqaKq4M8nEn2uHcrTExReohSjNPcdkpKTPpRclny883X0CSV2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HQjqHQTa;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=V+2Y3auc;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9BC1606A326
	for <linux-ppp@vger.kernel.org>; Mon,  2 Nov 2026 11:48:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9BC1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HQjqHQTa;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=V+2Y3auc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793620122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SJMWixFaZLRsZ4Hl1XD4V62BsN02jkA9imQJRFP2Ruw=;
	b=HQjqHQTax2ZlyVS1+4p8e9jvOZst13amCX5ozj09+bE94zsowplk1sUYDd58TfsECI1bKh
	kOAKb9PUTtPD83/TrTK7GtZ7NWVCFz+dL7rA/tyzNoZmnIx1N4RtlvTuE6K5W3WeloOYDP
	sIdXkc6Q5gNK6GJHVVihK2bofCPylPY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-YddXA-1xMc2iF4SJ5AbSPA-1; Mon, 02 Nov 2026 06:48:41 -0500
X-MC-Unique: YddXA-1xMc2iF4SJ5AbSPA-1
X-Mimecast-MFC-AGG-ID: YddXA-1xMc2iF4SJ5AbSPA_1793620120
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48c415561aaso1980811f8f.1
        for <linux-ppp@vger.kernel.org>; Mon, 02 Nov 2026 03:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793620120; x=1794224920; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SJMWixFaZLRsZ4Hl1XD4V62BsN02jkA9imQJRFP2Ruw=;
        b=V+2Y3aucgs5B+MhZba5RM/XB9p8JwmNL+C8mWwAACltGp1ifrzmBTEL/EU+BWRC9J8
         fObcOHZHLdreIpQzJPaMVPVetnfkQypmbM9+IqiNN6M3EppD68doozk2sYpFVeME2Wk5
         9dpsZn0gyEOGz/JPnXPOHd3tZen98QemsrwA3JY6vU6lWad6YLMBJmmVxzrpyVLllbAf
         c0/MQglXNNtBghT6VQljgimsU2zYgd42opEnzJpN3mla4FPv9we5zn1waEBnqRpIX8o2
         FNDaZOCNojx+T+08Rx53sNpd/Mom44tSYjXBpMhAEG4s6iEgthETvaK6uEOuADoN/iYF
         W84w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793620120; x=1794224920;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SJMWixFaZLRsZ4Hl1XD4V62BsN02jkA9imQJRFP2Ruw=;
        b=2KFugQU1fpQxUhFQSoiV9YwKklBjiM2M65Bn+mZ/G7Hb0uzkchmcTzv6yVcr2kdHBD
         Rz4iPgjkf0FvyBJq9LgJpgc7ALRqxfq7jMXBI1+Xn2ubqW9/pkPiMnZhs1Z+zE6IR72l
         i/TcI+H0RAuwIh/lPycvwnLD+V0FpBHxaDzbZ/+YSbNXBcl0aIynt8eh2Viu006qtWUE
         2igeS/gq8vKZnp/TEQfkQ1LXIp75Whh1nohNuPUanX8N5xFbnGGHWm5ruOZPkLDpcyZD
         qQwGnOP5h9Iy85MyTWQXH6pyZsFcHT18lDTeFZqTMmVh0uiMcUYOD2x8Wvm4PEkSy3A3
         qrHA==
X-Forwarded-Encrypted: i=1; AKwUvBzi94+Mzp2amzfIHmzsALUmHMdt5Mv//qJysX0augEQaBFVjmXerdQMS3wAKTm0gA/hoZAOU0AHiCU=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9N7VbnatVxKqXUSNn/yGR+7ZIsGpmA7h+K+PuNfnoFoCpc83Z
	9JTVaxRqNHYpIbUxlZZg6QhJp6VGB/Tap7qnaIFUKVQ/6YVXqBHDcsdxYpitw4+Dk+5Hc6YgCMr
	moLWJLclNNAyFL7/bHKJ13fQiFVxGGWjY8p5wD/qVOFjgAJJjVklJ3JUGoSO2Ow==
X-Gm-Gg: AYBFou24zYDgvy8Sdw2W1C9AcM6b7CE/WbR75+qpKCXeeUWrG76+MAojit+go2x2UI3
	RIW+war1gkkuLetcnnv4n2utlkHfzR5XnFmIbtVr3AcfaMyXl4kYVNIIe7ArbeE8aweJQosxi4b
	8VaV1zq5TvAZzCzDAk5meChS5NmW1T6F2PwZ1uiqv+Yo/mco5fncx1bboNFeXvNt/9d9uR7YZb1
	IEbdMu058+p77Y9IE3GiZWI9GKRqRj+/XXQ0xuatkEXGzzZVVMMv4rY+0Dm1v6k5mkmacOUBUeZ
	nuGw2fYJzTZ/ntcCyXRzCGdfm5Li396bY71lgNsI0q3k59ChF89nHH+QtHYLKceRFRY0j2H43Fv
	xAe+ydEcG2G8BOF28psep57XyoBLIYkou1VoFjfBvbbgObNdX5FuhNHoj9nI5DvHtw++6ApMHd+
	XNL5JI4tYjDjVUn5XqJ6Yt1Pa1KPSZd5Fua8j3wtrRUAk=
X-Received: by 2002:a05:600c:3ba0:b0:4a1:e0db:8cf8 with SMTP id 5b1f17b1804b1-4ac151a84f0mr220535585e9.3.1793620120520;
        Mon, 02 Nov 2026 03:48:40 -0800 (PST)
X-Received: by 2002:a05:600c:3ba0:b0:4a1:e0db:8cf8 with SMTP id 5b1f17b1804b1-4ac151a84f0mr220535305e9.3.1793620120207;
        Mon, 02 Nov 2026 03:48:40 -0800 (PST)
Received: from [192.168.88.29] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa813d2640sm337173005e9.6.2026.11.02.03.48.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:48:39 -0800 (PST)
Message-ID: <4de42b50-1f80-418b-94ff-95d656f08bd2@redhat.com>
Date: Mon, 2 Nov 2026 12:48:37 +0100
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
Subject: Re: [PATCH net] ppp: remove SC_MUST_COMP
To: Qingfang Deng <qingfang.deng@linux.dev>, netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, leitao@debian.org, norbert@doyensec.com,
 hataegu0826@gmail.com, paulus@ozlabs.org, Brice.Goglin@ens-lyon.org,
 akpm@osdl.org, Matt_Domsch@dell.com, linux-ppp@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261029074935.40509-1-qingfang.deng@linux.dev>
 <179339596607.3131.10030375792154782283@kernel.org>
 <84396bab-166b-435f-9663-0aa2939de3fc@linux.dev>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <84396bab-166b-435f-9663-0aa2939de3fc@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/31/26 02:28, Qingfang Deng wrote:
> On 10/31/2026 5:32 AM, netdev-bot+sashiko@kernel.org wrote:
>> Would it work to keep the define, with a comment that the kernel ignores
>> it and that it aliases SC_DC_ERROR, while still dropping it from
>> SC_FLAG_BITS and SC_MASK and removing the checks?
> 
> I found no trace of existing users (searched GitHub). Even _if_ there are any, _and_ SC_MUST_COMP does not alias SC_DC_ERROR, the logic is still flawed - received packets are silently dropped without noticing the userspace.
> 
> If the goal is to prevent the removal from backports, I may split out the removal part into a net-next patch.

I'm sorry to disagree with Simon, but I think we should not
change uAPI unless strictly required.

I would just mark `SC_MUST_COMP` as obsoleted since <revision>.

/P

