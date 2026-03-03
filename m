Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E08E47D926
	for <linux-ppp@vger.kernel.org>; Tue,  3 Mar 2026 14:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772549245; cv=none; b=QQM8n7dzOLEmS+C0MUl4UVa8Tv1lO3jYx9IUccRWj0ywCSYD+7egvFO3BWh0JlmTLJt65R0Wj4kMOUwbhgq7029/hP9jb9eqn8T6t/bGD5ytAcTzwV6mHNG2JWDGm1ChfT7Mlqtjm5Z5bJ7ZK103NNai/cHS6UUgmGaTslAi/R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772549245; c=relaxed/simple;
	bh=aafqM+GNg+7UUlsYTti9elao/v6E5UQ+f1Pn96W16TQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bhoy3F45UGaEHwVh/IkRogQjKTdPH5VhiuK1zKqD2RVbuwiISFXGPNueJwiZfN3o8DuTFN+djeIlJJnqQUk5y1hGsfcFCMbujfbxIidjbGhmK9LJlsyTOs+JTHCVqBWgie+PwpryuNU+czKT0jmMjJ/RB1/76w30hZ38m+gAg9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bEm0QpW4; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=q8EEpOSd; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bEm0QpW4";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="q8EEpOSd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772549243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EaHhy8s6ARdZrnZkBCXXvqhKOPUMYAmxS8AExzjsLrA=;
	b=bEm0QpW4JWa4rsZHOZAcrv21+qBjt2ujSg8J97nNkvDUWDGV3EbQG0CcgScIczdpa+PC5i
	Iphi6CG2Ft6RLRoacRVLVVVJsgsCKEnwJmCRXEnZY4EqUpzcZ8Z2Pu1Hy7qmXC492jyCYt
	w1bl4HlxBvIsDQmWrWO3XIcVpISo7yI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-Ptm1e5BfOzK5tvTo3VdI8A-1; Tue, 03 Mar 2026 09:47:22 -0500
X-MC-Unique: Ptm1e5BfOzK5tvTo3VdI8A-1
X-Mimecast-MFC-AGG-ID: Ptm1e5BfOzK5tvTo3VdI8A_1772549241
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4830e7c6131so60275015e9.2
        for <linux-ppp@vger.kernel.org>; Tue, 03 Mar 2026 06:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772549240; x=1773154040; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EaHhy8s6ARdZrnZkBCXXvqhKOPUMYAmxS8AExzjsLrA=;
        b=q8EEpOSdFHwYAkMvD0RuOyNT+c06t3mOr//hyPjjJbDwmcGmHSAPIyAbLJ9HQHCkjg
         kpDOalCGgA7bAdO+y84eKqZNuYENom7+pkwRHbqX7uQSabFtv4ECAdssAfP9Qcq7zO6+
         9XUtq1gi0pY46qKM+7XjZDfqCsI5IbRH428FRWQ/WrfMpk/m7CvNGUWmiQfchT6H8dcP
         lRwTwyNm0xM9ZsxnwqYDidx9Kg64vuxfppQiun39w2bOhAg5prTAKmXQa006ndoSQtfX
         8MeLh84DCsOTU8M284W+r8+hoijbc5sKc/qJxa3y9qVF1uGN0+ATo9bhwPHWUdmrB4Fr
         OgVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772549240; x=1773154040;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EaHhy8s6ARdZrnZkBCXXvqhKOPUMYAmxS8AExzjsLrA=;
        b=YpJa+E6cpfvIU1DpQeB7/Kah0milh6R/w0NZLRIWelf/pLtyqj6cRklyGC0t56UR5o
         khqwBxMXqQH4vezKauBlkaCKRzwf8EfWe06NS0idLjGygDhmroNmkg34ik8KPoc66koZ
         x1/QzEx0uuteBIbp2Aa/x48C+n3BpfT5WGp2gkrALKS6Mo0ZCPLLi0A4tQJFQdXygUBW
         TzHOwd6gyzKwb41f5cz3ikgnXKaF5/GT9T06fHV+4kjkvCAXL0x2ZTIhbhH6MnfcTIZL
         cwpvEGCCorly2vcLz8S/nOSoMiFbuL3j8w+V/sfdsoMDCYinetG84HoRWZDKa1YrLDOu
         Ou+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVP7RvCedyvrgz56CpvCxSu8HiV90EejLFrbXBlL+ZEBG9Ur8AbUfbd3doJa9d5dx+24KLMkVt0GsE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSKrpWNTK5chp+f/xSA03+MrzwPCxdKdfjorMoFqCWRHGLpCRA
	wj6Hf2nLX5Ar8EbkIpOaz8h2TcRoKVVUGIh+Pri3nHsHzFtgSpiICvj85u521uslIjhhyR8/B6v
	QyQGPMPJWUGz+xUBmsr7+oEsLFC66BaEcjpkaf1AJ15Ypw/z4WLwbNHaogr9OuFl2Y+l//A==
X-Gm-Gg: ATEYQzy13I6tcgtuV+ip/68miuUHva5Bk7mPjaHb+oxEEw/SXpbWqi/242g+pTW9fqa
	CaPDyLms37KoPtMs5oSNdpsoacKwxXfoJke2ad9Cq7zC0T741ojID1bldbU7r6RHFm2uYq8ZXMJ
	SuieDP5b83NL5MWV/dVbGLQBQ01lhkznj0LTSjcS+xRexqDfQhIhfXIU8I+R5HLuL2QDFJD9/hY
	ZW5Zwx1NPykcoHtRfrPbw3tICCmy8uZeEn8GO89PeAmBDS8OckpcQ4NSHgXxnCYgTx3QQr6Api2
	p6X4Wbif8XsYDNDTaUmdrNWyD6LXJrTgQ8hijEXVSvnPB2upXDHYkorCnBk+8BbE4p2DlC+fl3k
	59HY+wmZ4z+bVIHrveBvYt3zp
X-Received: by 2002:a05:600c:1e89:b0:482:f564:d613 with SMTP id 5b1f17b1804b1-483c9ba37b1mr284897995e9.15.1772549240625;
        Tue, 03 Mar 2026 06:47:20 -0800 (PST)
X-Received: by 2002:a05:600c:1e89:b0:482:f564:d613 with SMTP id 5b1f17b1804b1-483c9ba37b1mr284897475e9.15.1772549240121;
        Tue, 03 Mar 2026 06:47:20 -0800 (PST)
Received: from [192.168.88.32] ([212.105.155.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd7507adsm523195585e9.9.2026.03.03.06.47.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 06:47:19 -0800 (PST)
Message-ID: <d5038e0c-a9e8-46a9-a5f6-e19537cf9557@redhat.com>
Date: Tue, 3 Mar 2026 15:47:17 +0100
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4] net: pppoe: implement GRO/GSO support
To: Qingfang Deng <dqfext@gmail.com>, linux-ppp@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, David Ahern <dsahern@kernel.org>,
 Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>
References: <20260228032317.146855-1-dqfext@gmail.com>
 <CALW65jbAGUxsyNw229uHks92T3Vr1iuFs=hVeTB3N9awAuZVXg@mail.gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CALW65jbAGUxsyNw229uHks92T3Vr1iuFs=hVeTB3N9awAuZVXg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 3/2/26 8:34 AM, Qingfang Deng wrote:
> On Sat, Feb 28, 2026 at 11:23 AM Qingfang Deng <dqfext@gmail.com> wrote:
>> +       /* ignore packets with padding or invalid length */
>> +       if (skb_gro_len(skb) != be16_to_cpu(phdr->length) + hlen)
> 
> Both Claude (Netdev AI Review) and Gemini said `hlen` should be
> replaced with `sizeof(*phdr)`. Is that correct?

AFAICS, yes.

Side note: I think vlan encap it's not needed to observed the issue. You
should notice it even with plain PPPoE, if the ethernet NIC driver uses
napi_frags.

/P

