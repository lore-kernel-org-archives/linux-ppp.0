Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8213A7591
	for <linux-ppp@vger.kernel.org>; Wed, 15 Apr 2026 13:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776260560; cv=none; b=RyxaI5ZwABbMiAhvofA8ldZ2kiRTNiDR2l3RKtW06vmuKiKpHXdelhTNX3vyxU7e2EDq3Kuh8TbzuWrYrrXUxxzXbeOWO6+Zrvf9cVl3THdGTn2kH9ChSZSiGw0etUNWAht263OFhwsiRHzJp3BTfZ/vP2c07rhBwTnyZaWa3RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776260560; c=relaxed/simple;
	bh=yXz3IHmHw32KcF6mPZgwa4GmacNrE3CcrPZo91cUb7Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=c6NhaB/GNDjghIDFdZ5bhKPf6fl/1etNoZpa1RBx4xiAoiECRBe/MPXtqPsKiv9xF3AkH4RNg5ScK1U3Nv/2yQNxCROlfGUfYkahbm0SM2/BpzTMEItkvTQTW8oNo7zarKktfIzNxpGBNQ/CfqsZMUTGskAvpfMJG+2/AWzL7gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=eBiP7Kuf; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="eBiP7Kuf"
Message-ID: <e1fd74dd-4fd5-4a67-b4c5-5911395b9dbe@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776260547;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O5oIioMHr7aD6sCHzsChx22C5Y/zbhyOkdBb96sokfI=;
	b=eBiP7Kuf/sIaaOhuCg3k3OZvoT7dcRd0/qBKbsngdMPrh6MvmlNlA8LHbWNMQhOxqKChTG
	uVkBjGh9QJTnHROFAoHdBs0pJssriDcDt5ytgFR7tzUE0FR2p0HVcIEOjyq2O6xxq2d7EX
	jhwHDx27h1Gq6UhhOKRoXos0jJ1umsU=
Date: Wed, 15 Apr 2026 21:42:09 +0800
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net v6 1/2] flow_dissector: do not dissect PPPoE PFC
 frames
To: linux-ppp@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260415022456.141758-1-qingfang.deng@linux.dev>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Qingfang Deng <qingfang.deng@linux.dev>
In-Reply-To: <20260415022456.141758-1-qingfang.deng@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

The patch state is "Changes Requested" in patchwork but I haven't 
received any feedback. Was it set by mistake?
