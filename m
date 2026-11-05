Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793881952;
	b=PvzMXmJhgm5UuPMHXziE9/vQ0mK8/xSeq7OZJRYMK6Ib77BHluxikBPPoJgRPjmymh7m
	 I8pfkbmy36/BGhNKQlBDna0xlWHbw6JDyErRJsVXGVwXBlOxDi7LolgIw1HMqrAZZhWdf
	 NhvpzvfEb4gkMZU5oVAq1GYR16FSaNxDExt6HUYIAyrUzRbbmp7ppedx0bDEijnf+x/fb
	 9ALoCtWxb8L41XG07Pn/nzHA31QylreoufwTxEXYtrS4/crpJ2x7reWI13rPtWLqR8wOF
	 MyS80JdjyT6yvmohs/BmWdLz3/YOu9GJ7o52HA/ODvj4ocTBQERGA6oBvpQP3bYNi0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793881952;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=bhW8bgTEwMPwLTiCb1KEBA42lBnDT9eGZiSGg8XBodg=;
	b=bXV1oFhYLD5uFzh3hHX3uZa1yzoTQ6A/w2RRHzLFd+i8mzX2Rbz7ar6+DQ39cHp/vwNH
	 xgfvDeufA58O3HM9YgdV6nTmeosRxVZX0POo7hv/NAhrE+GbvAKI5HTi0iMH9oF4sUTvR
	 BloHJIkWHbXY+7MPmjADlRdiYKM+kFP80TsLSP6cuf1ZV3Xo1dqKbbu1GaXZfEir1Zygl
	 I+GhH44pvXpf+KX92N9nyphM67QwEn+JK7IzSeo8E+H/QylkIxdl+sLGSxOVGrNh3SFGR
	 QISm1FDYC9+S/gLbAMZpb0F+v5ola/A5/stiBWxX730tXQPabsFEil4+bykL96h5aZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XtYGf1W9;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=KTr4haOe;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E2C606A326
	for <linux-ppp@vger.kernel.org>; Thu,  5 Nov 2026 12:32:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1E2C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XtYGf1W9;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=KTr4haOe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793881950;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bhW8bgTEwMPwLTiCb1KEBA42lBnDT9eGZiSGg8XBodg=;
	b=XtYGf1W9bBNUiNdVGmgGcmGQd/CTx7I8my0rflxtHeV7EGFnucp4eF0bEgyeh//ywQ3nso
	rIoXEtrOADru9g6pwvyamQXkUKdLjFfFInIsKjgjF0taWEz8mDoD0FxN/QDO8cdG/obUOx
	E0akaBWUNiS4uxuYmqT7joMpOi7RvlE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-436-S8puyCImPoq1WdEKS9D-uQ-1; Thu, 05 Nov 2026 07:32:29 -0500
X-MC-Unique: S8puyCImPoq1WdEKS9D-uQ-1
X-Mimecast-MFC-AGG-ID: S8puyCImPoq1WdEKS9D-uQ_1793881948
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4994d67d0e3so12387845e9.2
        for <linux-ppp@vger.kernel.org>; Thu, 05 Nov 2026 04:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793881948; x=1794486748; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bhW8bgTEwMPwLTiCb1KEBA42lBnDT9eGZiSGg8XBodg=;
        b=KTr4haOegaA3Jpyzhjf04TmHcXImXFzzrfo1/QXl3+rSGpcMj9LXnWc7qzQxL2wk56
         KDb/jWbyRyRQpeGb0T5Z6e7Wjd9R2RztyJDxexRdL+JS7W7bz/R6uHNn3YEQYNXAvC/t
         B4VNYfKb4EkNJj5FOA3Mh9cCveZOpvpUfecOwYudFRYg0x8YX2Nv6S7eCFLJVUbvSKuw
         RxLL5pyERNblWFAq4ptYqEZaDpdv7xyVYYNkFn8Cgi6auLyinBUaX1MN/1kzW16gI/Ar
         iGA2Kqek0dRvXbJ6brTsBW2k9HeNFmeBkNZII8ST/RwxCFoIK2fxDP71bxO6CibSliOL
         kuxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793881948; x=1794486748;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bhW8bgTEwMPwLTiCb1KEBA42lBnDT9eGZiSGg8XBodg=;
        b=kOq240qHanjr2nSziQ7f4APoMTb4F2XFnOjuAxfw0uLbX/LBoLAoqSsPIV9spMdqdL
         WmnKsYFDvmmi9R+/HTM1VPoK86anDjaX+7BZlGcAZfx3mQIZHMx1y0phgCvswah4N5lt
         lEcaKm/Fxto7QIoISyEexLdUnw2f2tjBaam5uKkunWwhf097XDjJQ8HcCzjXi6GVEqom
         2r8ZKJ0lzumFiTB1ACPH125L86jQVN1FCebXhL1vj7+BrM+IBiHetb5ufdNiFFD43Y/N
         q35s2e6L+4udqA/IHTFKVjXK2xzPNFh3x1jyezacDx0yH1M06ymwHAbas9qH98SsQ9qP
         JO4w==
X-Forwarded-Encrypted: i=1; AKwUvBwEpw5RVfT0E3BwjhK+DBgd3/HFkoRcBJYrC1B52WBIFHQeIVIDMg+HEv611iduMDW4JIODa+JvDWQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lUEjpuMZgwkPlNuW2cbdL90w7Z65Ray8AA0vLveaDNSBUXlY5
	Cln4suJoS1GgbShMWhRHFN0kGM3GadtV1AaIVLeW5jZR3uGsjnlP3AOy7L9Vyp/VY8kXUeST9ik
	TIoMYY7Tf6f0JVVlSUXQC7SYAdwcsMen55qIMeHVBg8rdt5fL29Jz7pGaKyowbRkWqyUILQ==
X-Gm-Gg: AYBFou1FRFMdbLxOHCH2kwCccXeJi8Rq6bvg57otG0iQmX5x7hM/duCtPh5a950Dt0x
	PwZArYLHoTqLyceJX9DRvKmL4lW7kJXY/UsMrumLHRH4efYvC4VuA/8odYlBbqEak/Oa6IEP1vt
	KQrMkbONJ/YfYtDveIIaDVlK0Umyq6qea8nxukc2yahxheDuZi0mRunF0yXupCAlL0KYkXdQENn
	YKiJ+fD782TwUhzRDqA5s2j5IlHrsKSkCdTDRibfQgxhA/slLXodgPaUNr2u9+7qp1eGHghnPJm
	7kqheoyjzJP28yk19mShNK5j0oxJXG60srHv5IYsSoALSvzeYXyGtyg30TZMD8VqacJm5Q0kEcV
	Iw+ZCu/OA43XdFVfObdCcajsNuilKc7PMEDVWXPZujbLybzJ58WIedXkrdtnkmAqTltNSiT0Fyi
	wnY/QPgFhdeM3evqYawslyWq9obHMVeJDH7H6QoxIxmD0=
X-Received: by 2002:a05:600c:524d:b0:49f:e772:6ddf with SMTP id 5b1f17b1804b1-4ac18993ca7mr427334145e9.32.1793881948104;
        Thu, 05 Nov 2026 04:32:28 -0800 (PST)
X-Received: by 2002:a05:600c:524d:b0:49f:e772:6ddf with SMTP id 5b1f17b1804b1-4ac18993ca7mr427333405e9.32.1793881947627;
        Thu, 05 Nov 2026 04:32:27 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56f5e59d3sm69153765e9.10.2026.11.05.04.32.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 04:32:27 -0800 (PST)
Message-ID: <8e63cfcc-6120-4db5-ac2f-8214db2c1fe0@redhat.com>
Date: Thu, 5 Nov 2026 13:32:26 +0100
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
Subject: Re: [PATCH net v2] ppp: remove SC_MUST_COMP
To: Qingfang Deng <qingfang.deng@linux.dev>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Tristan Madani <tristan@talencesecurity.com>,
 Norbert Szetei <norbert@doyensec.com>, Andrew Morton <akpm@osdl.org>,
 Paul Mackerras <paulus@ozlabs.org>, Matt Domsch <Matt_Domsch@dell.com>,
 Brice Goglin <Brice.Goglin@ens-lyon.org>, linux-ppp@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261103015615.2704-1-qingfang.deng@linux.dev>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261103015615.2704-1-qingfang.deng@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/3/26 02:56, Qingfang Deng wrote:
> SC_MUST_COMP accidentally shares the same value with SC_DC_ERROR.
> PPPIOCGFLAGS combines configuration flags with transmit and receive
> state, so userspace cannot distinguish them, and a read-modify-write
> sequence can promote a decompression error into SC_MUST_COMP.
> 
> With SC_MUST_COMP set, intentional or not, a fatal decompression error
> (SC_DC_FERROR) causes the receive path to silently drop the failed
> packet before delivering it to userspace. pppd therefore cannot detect
> the error and reset the compressor's state. Subsequent incoming IP and
> CCP packets hit the same check and are also dropped, preventing normal
> recovery.
> 
> The flag entered Linux in 2005 with commit b3f9b92a6ec1 ("[PPP]: add PPP
> MPPE encryption module"). The original patch submission [1] said pppd
> would set it when CCP came up with MPPE enabled. That intended
> integration [2] appears never to have landed upstream.
> 
> Remove the broken and unused SC_MUST_COMP from SC_MASK and SC_FLAG_BITS,
> and remove its transmit and receive drop checks. Keep the uAPI macro and
> mark it as obsolete. PPPIOCSFLAGS will discard this bit while
> PPPIOCGFLAGS can still report it as SC_DC_ERROR.
> 
> [1] https://lore.kernel.org/netdev/20050814141046.GB20944@lists.us.dell.com/
> [2] https://lore.kernel.org/netdev/20050814190529.GA26802@lists.us.dell.com/
> Fixes: b3f9b92a6ec1 ("[PPP]: add PPP MPPE encryption module")
> Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
Given the 'broken from beginning' status and the hopefully low impact, I'm
applying this to net-next.

/P

