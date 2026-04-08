Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C813AB290
	for <linux-ppp@vger.kernel.org>; Wed,  8 Apr 2026 08:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775637965; cv=none; b=GMiJ3zOefxoIVMnmfsU8O7ALjY+Gl4fw6OVHmbRSyifrSCDlBRace9G53RZtnSgpTxeuBhanapUncXAa8PCIJ24ydv1vh3JjaaSCMTNRmNqYmYBmcNVMlO1SD5xRuQ1pOqoN1egHVUbZ9Nn6qvPEb4mgoZ7AnmEYiH3U9afO68Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775637965; c=relaxed/simple;
	bh=8x8vc8D9egJ2Nzv01sylk4ZXVNBRuPY3+H3jcXm7TZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EooRTD8NCfWqXRKUOkfX/S6LipomHxMRBJSfglgr5CEuVqllGl/AKONuwMFLEihqbDJJSaQDyhIvGlxRZkHa8GSJlEWVotroV4a1CiHJjceHpsAmnPV0T8G3YRw9HsWKdXy280/xyQ+sGrc1KeDBNkimTkUUXWYqP90SvTsJObg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=I77LQLbu; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="I77LQLbu"
Message-ID: <bfc722c7-0e70-4e7a-98c6-64b762509469@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775637942;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3V78EK3mG2WKYBtg7w5ETpi7/fd1k9rE7OPVs8ofvwg=;
	b=I77LQLbulmG42TGY9+SkONDVoHMdhzgAiBzkWjsos2BGLMzwCiJWMBw0IDSKK+sFaNRlPW
	BHFxqSABQr1uIEIHYA1huHWp74PsVDru8w8KQwYosS9CevbwhWdL9d8SIxw7ZZ/n8YPxBC
	B29kEIba1P9verifiaeS9cBJsrrDYgc=
Date: Wed, 8 Apr 2026 16:45:36 +0800
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net v2] ppp: require CAP_NET_ADMIN in target netns for
 unattached ioctls
To: Taegu Ha <hataegu0826@gmail.com>
Cc: linux-ppp@vger.kernel.org, gnault@redhat.com, jaco@uls.co.za,
 richardbgobert@gmail.com, ericwouds@gmail.com, netdev@vger.kernel.org
References: <20260408065109.2171-1-hataegu0826@gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Qingfang Deng <qingfang.deng@linux.dev>
In-Reply-To: <20260408065109.2171-1-hataegu0826@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Hi, Taegu

Please wait at least 24 hours before posting a new patch to netdev. See 
https://docs.kernel.org/process/maintainer-netdev.html for more information.

