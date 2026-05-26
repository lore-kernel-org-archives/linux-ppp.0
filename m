Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2382D2C08C8
	for <linux-ppp@vger.kernel.org>; Tue, 26 May 2026 07:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779779127; cv=none; b=cJAVwd1RHDOwOosk514UmttemWSg5p12HnmDiAtNzNtYHUnG3huZWj4MhdJ6ZX4KNoRdRyVKRqqnoepqX/IU3UcJIsj1Xhj1WYbDBfh6i4XEZOfFqIgSb5pdz1KoGCDx51IECRWHsanmQCgNDLD9NgPDHGsfKMxj8nb97ilPHOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779779127; c=relaxed/simple;
	bh=bMlBBMYKxGtq5Cp6eF6ZfJWXx0PmwZQKshZCvqB6uAc=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nZs8UzGBhROSNnqHhUZHLzQ3p7yWU+hqo5JoPGzp1tdG05JjNgKuXKlDfiJi3MGwN6WG/z4mas+w7bEc/qWd7VwQ26HxaxzCjv6qdFUMAjXr3jl5MiBGEwOiukAHxgga7UhYJDt5psAtavo54/WW5ktH6CJ/i6kVC+Hm37yWzAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=ozlabs.org header.i=@ozlabs.org header.b=txzpfRE8; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ozlabs.org header.i=@ozlabs.org header.b="txzpfRE8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1779779117;
	bh=m9vkaxhsMMRcdgv+HQ3mcLsCjDxo7VhhRY4SJ9evStA=;
	h=Date:From:To:Subject:From;
	b=txzpfRE8w2SKT49kty38OWxYYQKWauakqQ+9pfDGCRMKHmR8Hx52MgBK00PJ8+fXl
	 oq+cDnhme0lIa37glz0MvHvjnltZCFAmecsKHlbIZwZHJXj/1PBDA5Q1sEvKEDl6S1
	 yoJB0aB9lHTTF9fehmIk29T3S3s9gByuWjEhFOmfanQdIZ3lQRIB47ZRjfAR5zqY3x
	 +6mYa5BaE4uexFKVf2pSanjjRq7hSCbDA8B9V94xJkOOgXjLj6hPRKva1YtMKH7Sih
	 bqoPUCWzJ/Vu9lm0Pa/fE6cwCJsytRf59UeidXHHG9FuMD+qwrfouuV6VA7hm8QEMb
	 gfbH5GeiY2+Tw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1003)
	id 4gPkKT2Kldz4wKx; Tue, 26 May 2026 17:05:17 +1000 (AEST)
Date: Tue, 26 May 2026 17:05:12 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: linux-ppp@vger.kernel.org
Subject: PPP version 2.5.3 released
Message-ID: <ahVGKLw35vabzTIj@bruin>
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I just released PPP version 2.5.3.  The tarball is in the usual place,
https://download.samba.org/pub/ppp/.  This release includes several
security fixes, including fixes for a couple of bugs that can allow
out-of-bounds writes, so I would encourage people to upgrade.

Paul.
