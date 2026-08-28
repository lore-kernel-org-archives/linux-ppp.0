Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5B03CFF4D
	for <linux-ppp@vger.kernel.org>; Fri, 28 Aug 2026 14:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787927675; cv=pass; b=AZJNyxekwMld7ziEk2P/vUs9H+JgaA2TLNBcfivvsdZ6P9sfhgEvJHCYUKBY2W6v7FknYeSuXSKasg3cL0hAn+hcFMhFP79INIPNgJYeml3iwEXxkFsFWGx3XWx1m+0SIHf0YWJHazrahfY5N4IHw71TtiHGWELbROWm5WTc18w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787927675; c=relaxed/simple;
	bh=xiyP8E4wV+sMaqs4B/yZCVYaphrCAtJm7nVSylquv8w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h8hUyar0EiFexpwJgmx2O36w1U2VcME6nc9iC/4JBpunLCK/BLuRFtcV8n5KH3ZVc5kqGlc+TvDnKCHaOrQ+Q36R48xJ1ZxIeLLGUFTi4zh/dzrvNFobBYNL8wwq05bcwlxBo6eYswkW0ngk/2c+drpayBeIVILa9KKNyPJy96U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A56I2pMP; arc=pass smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A56I2pMP"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-52eaeddc837so5912341cf.2
        for <linux-ppp@vger.kernel.org>; Fri, 28 Aug 2026 07:34:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787927673; cv=none;
        d=google.com; s=arc-20260327;
        b=Wy4FdSd8H/7U5yqGAJC9CcfZn5FviURG36fkb6NNrWnLcEN7AYf6Rmh+oXqssGo5op
         aJYi1gfFM/DNmj8sK8Ibei5E1sT1SuxqatwnTZkOh5tJ/G5QanU9+AK3n18kbJEOwTDS
         TUpy3ghbKUXqo8yG5qp0nW9NmGPHr0xDAaJRFKt+4OrUl2o1voI9pncg7Yk0nrr5oOLT
         U7z9gzjAlOEyGvbXGiR9yO/REWHihu5M7Gwrx8XHgZDwKTh1xTm8dil2nVO8WpQ11FIc
         q7dt0MbYyfz5DY63406MqoYr+vhjVI3b+62uKgVOccOpnz3xoYHZ/Busm8zCM4HYXb8Y
         sNSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gUsOtdOdvL1xoenFKHekMoY65j1FyFMLBu32Ho5vB90=;
        fh=8TFYgnhT7vIAmnLKevLpIYylYVakgx5ilFgc4Di3eNg=;
        b=J6fsaicx34LXwPyNH3tgcSE8BNYSDFu3tcxsZPuZQ/WGgtTj15wKG5sX9CtIab/IYl
         A80eIspO1MQm8kFVcSOVuX2wXd6eL1RwTpCc7WVDHHT/xFKk/yi7EYeK+9Kr3WVC8xSh
         V5wKscK3TVWUTAmK5LUVrYCUu0+gVrSApeTjV6VZOxlCfm7sPdHzVWYQS1a9VuvUyHJP
         e3k7HyFyPV+BV4yQlVy66mUtRaHTfIOtD7T19R34LLcJTYQfjkQBFsOomnqg3DykZcu4
         NZPeIWAYrylp5WZ3AqTlQSbRhkuIy/YECyhBtdrXhs/53hBuY4HwLjBDckLwafZcDTph
         8Vag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787927673; x=1788532473; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gUsOtdOdvL1xoenFKHekMoY65j1FyFMLBu32Ho5vB90=;
        b=A56I2pMPzIBPMpKduBgM6i7FC7hvNRoFv/w1mPNZ++j2gmaG64lBY6N8PZ7IcLgv9F
         IZpKKsKVKjna8J74R0pTOXWVEXU8K06cOtyQ+CGD+Tu7tRIS5PHPfjTobkGbMvznekic
         E5GrP8EI1wAEUmih8CuGMtCV67HeBy6zvAIqDaEgpI6pXv3KBBl1U+Keg8rLLtGNMJ5v
         M5ljjVMjWtH6D5aLyB+EGe/0HE5x0T3p9f/hnBm/yNwwhsFa6VBMVtkNTGY8zU/1qXD+
         EPhiTAJRkpbl5Re7Qx6V/erbO+eeLNfpjutd6MwMpIjaOnVKc2Of8tMk1PqPq+75Bfz0
         Fm0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787927673; x=1788532473;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gUsOtdOdvL1xoenFKHekMoY65j1FyFMLBu32Ho5vB90=;
        b=lQ52ZFYLeesW4TbYUMC4zVbWGPV0J8zm/Pv9yF8nMI8wy0tyAUFEVgKSvFHb7IIcX7
         ub/wQ6yeMxnm42GA1l1rp2oEcAvDJekNdGJyzME5Zqx4xPbWvmAjyCy2TLJbzI84u8GD
         OkrybHUr9/iHEDkSy9EeogXfiM4kfgAqq13Ea4yv2tti5ESrVVIEAVPeG/FGfF3d3W0K
         X6qgcjyIMOSyBwgQFHAeRYbjVO+bZncGWBZGnypQGUhCzUZJ7w0qUjAoungYkZkk4VcP
         4MJZ9ooNA9FA0FWGcM3c/DNnrOftx3kzK9WxyIuYinKjBvbkLXvU/ZXleerjUXMk/rnt
         xthA==
X-Forwarded-Encrypted: i=1; AHgh+RrQwwcqwaHQRzOiM5EzS0pnzwCl2Ht469gC8un+H7pEuwIvoRq/RGKIZOpl1TRae5ZIXd72QuxerEg=@vger.kernel.org
X-Gm-Message-State: AFuF++mDeiXeqTaWmkshUagSLf65ewl4xcRDAMEqp+9mQBVXwjSoC3SH
	MP6SO6SkTZPU+eIQrRWgSjxCYiPpA8Rx5BDK9HY6xXTLagCTwWmuqqTV8SAKUvcwsIxJJ5N/x/T
	EqnHTPzdr0EbriuM7WIDTjdh7Rt73DeosHnGB/Uie
X-Gm-Gg: AR+sD12TNZpI6fU5V3py0oa0ea0WNCdC0yAonyAl5xHXpbY8eUAaYEbwT4YQy33uI4+
	SCB7xYBEPKmv6YgijuJfeOOhjRKxxeC7GNnAm1cdOtdaMhne0oDOpV66ikmktivKuqaCr4mK4GX
	DIOj4+lwDclnmchnoftkmE5+KPmuh/rsO10fZwF9GTxg6MMfGl3r42fH+yeK9r1i1X9e3gK95kh
	Kr+MBSiPRxXNwhs3k7BJ3kTkzEl96ds+GMKRXBloF9XUOOoF02gGvhVkqSu8DWxKIfUfUb+gcQg
	AMk6GRmSMWxHRXe2cBbss8/f9nZoe60sYG6HTWvMQyaUX75VZ1FR70ts8WgIlAAmuub6OU2K9C8
	d1RLEJc6Ei2+xC8oVUhbwu75HLWMhyeE2VlGisf6ZatLD+2S7DWgXRbuNtW0=
X-Received: by 2002:ac8:7d8f:0:b0:52d:e425:9b83 with SMTP id
 d75a77b69052e-52fb97248b5mr88019541cf.32.1787927672410; Fri, 28 Aug 2026
 07:34:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828073245.126804-1-qingfang.deng@linux.dev> <20260828073245.126804-2-qingfang.deng@linux.dev>
In-Reply-To: <20260828073245.126804-2-qingfang.deng@linux.dev>
From: Eric Dumazet <edumazet@google.com>
Date: Fri, 28 Aug 2026 16:34:20 +0200
X-Gm-Features: AcwNN1W8LMMtqWUv4J0NuOtodTTi0QjyatQ1yJx85V2-e2L7wFRRAVaSw3UfPsM
Message-ID: <CANn89iLKco6kcgFRa4PkOsk1TepnCZq6emG=QJdfN+LAWVBoOw@mail.gmail.com>
Subject: Re: [PATCH net 2/2] ppp: ppp_synctty: simplify tty disc_data access
To: Qingfang Deng <qingfang.deng@linux.dev>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Kees Cook <kees@kernel.org>, 
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>, linux-ppp@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+b503105c2410c3433459@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 9:33=E2=80=AFAM Qingfang Deng <qingfang.deng@linux.=
dev> wrote:
>
> Apply the same simplification as the preceding ppp_async change.
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Reported-by: syzbot+b503105c2410c3433459@syzkaller.appspotmail.com
> Closes: https://syzbot.org/bug?extid=3Db503105c2410c3433459
> Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
> ---
>  drivers/net/ppp/ppp_synctty.c | 83 +++--------------------------------
>  1 file changed, 7 insertions(+), 76 deletions(-)

Reviewed-by: Eric Dumazet <edumazet@google.com>

Thanks!
