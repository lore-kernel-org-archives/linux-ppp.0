Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.160
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792552057;
	b=eu4XhNdHhkHV9qZ/ETBOI4rQw2x89lO7+mOcI7IPflEHg0mRNQnREonoX8L1GpcBnle5
	 cSstEd+mztF2ksl7IX6nVQbuA6rnbMIubD2IVlWiWWWLwBbVyAcaFpXS+K2LCy64NEy9d
	 NTv/WFvsc1C0Fl+76sRAHYbpvSR+3rbIr6Xza7heHlSRYUVhK9ofL5yRa5lh4iCh5sFV0
	 xx0BegF3HxcPZ47P8n3hkpfM9W6+jLWdYQUBMoATSrPZbocwMKjj/uTgPtB/TeJ41OmJ/
	 +KbUaLBN/AS/411wOhYPdXzWjZw0kdo9wOZPXNs3XT9WYIUKyJr8EN5JNZ0mJZEpBag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792552057;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=LXGO/Ihk9N7F64gTwFfu4H1jjMd/4KNmHzrx69idA3c=;
	b=Vn23cCO338p1OphYqmzeRUNXBdG0S/DdODJ2QCmJebiUlbxStuzGp390/QlnxB4yrtTV
	 qzbI/5RawrqbfhWwU+063lqqK5riE8KW9GmLjx7+LWj+z46wwaChmrbrem6n4tBfHfzBE
	 zepa3MxwWObuWWihzt67sglt/MjwdbAsmzllh+O8tzmY9YYHJl7UK/1KNAfPxCyy0JHFy
	 tnq0NCrXSwnutF7b7PaMnW4PMEyrsTslxyRm5sIApuo8UY6dYYHs6NZAvRNdI0YPc2KNa
	 9bswlmOhvSO8uoJhx8qMXzT1eYwLkBeDH1/SIfNoJZmibpZdPQy6RTxcwfAwlD0Mbrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=M8yYgPPo;
	arc=none smtp.remote-ip=91.218.175.160
Received: from mta0.migadu.com (out-160.mta0.migadu.com [91.218.175.160])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742CD606A319
	for <linux-ppp@vger.kernel.org>; Wed, 21 Oct 2026 03:07:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 742CD606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=M8yYgPPo
X-Envelope-To: linux-ppp@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=/uplozhpt4dcAKvCO16vQWyHQ5FbixVEQFL8xKVM96I=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792552054; v=1; x=1793156854;
 b=M8yYgPPoV4q7547aFDcoivPGdL1St8RTKNnolZ0Hene2Htbbwwjd1qDW7l0viyLmAJiFgLp0
 B5rhbkXporg8LeRtmzNXGaTAoM88ogE9KduOGiZNbuRm+t59Y81kmap3BT+J65CfY8humsmfr+b
 HkHdD57pIHvF5ZiJRTpwN3eM=
X-Envelope-To: linux-ppp@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id eed8bf568db21181;
	Wed, 21 Oct 2026 03:07:34 +0000
X-Mizu-Trace-ID: eed8bf568db21181
X-Migadu-Flow: FLOW_OUT
Message-ID: <c0f348bf-0e13-4cb1-8014-cd9b7787bfe6@linux.dev>
Date: Wed, 21 Oct 2026 11:07:27 +0800
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
To: netdev-bot+sinfo@kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Breno Leitao <leitao@debian.org>, Kees Cook <kees@kernel.org>,
 Taegu Ha <hataegu0826@gmail.com>, Tom Parkin <tparkin@katalix.com>,
 linux-ppp@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, James Chapman <jchapman@katalix.com>,
 Sashiko <sashiko-bot@kernel.org>
References: <20261021023608.55867-1-qingfang.deng@linux.dev>
 <179255036282.3290.8488375760281728576@kernel.org>
From: Qingfang Deng <qingfang.deng@linux.dev>
In-Reply-To: <179255036282.3290.8488375760281728576@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026/10/21 10:39, netdev-bot+sinfo@kernel.org wrote:
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>   - Whether the issue was actually triggered, or is only theoretical
>     (e.g. found by code inspection). If it was triggered please include
>     the symptoms, like the stack trace or error messages.

This is reproduced in a VM, with a TAP interface bridged to a PTY. When 
IFF_NAPI_FRAGS is set, a non-linear skb is passed to PPPoE and then to 
ppp_async_send() without linearization. The packet sent to the PTY then 
contains garbage data.

>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.
