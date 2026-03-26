Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF524391839
	for <linux-ppp@vger.kernel.org>; Thu, 26 Mar 2026 08:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774513597; cv=pass; b=U+n0mMHjEH7NeW6Gu6Orv6KFhmTr9BbpQJS36G/KB9nT9IRd6Q4bNPZcAfXuJBdtR/TeSCZnJthRrSBk7whkLOMqd7O7CRjFB99mLPLbNU9HLdSrzAx06Vhhh3CvgdLa/8Y2A9KKSQz/zRyiv8Wtu0cZzzHPJyXsM1dYET3zSiI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774513597; c=relaxed/simple;
	bh=OJrTyAprx+F4u+3CkvC3F7RmtUcy+qiuWiiriH2dj2Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M7nO9EVTcm0gIhvxGWMEUTrdLPKQLcdBL1tY/33jLG18jj2lSxRbzfgualh8R3NLceY+gxHIWLpwXWf4wG5ZgRCJueKFPk5AEGW93dWbd7goTuDPLTQc8xwEJ0UFIuEeouMXS2pmnNp7a7QHdXqeGx274VGTFV9krhNMY09RMDw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EVNhpJXI; arc=pass smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EVNhpJXI"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-7947cf097c1so6784327b3.2
        for <linux-ppp@vger.kernel.org>; Thu, 26 Mar 2026 01:26:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774513595; cv=none;
        d=google.com; s=arc-20240605;
        b=gCqL8lTQj9I6bjXYkD9nb7i8LyDe3jknui6YZSwse4/PDn/FAZlXkXL4xnS/dBjx/m
         FIpby1iFfC0EGfydX4wqznOxURXwBZpIdxH9WWsac81oE9sLtWi7YoFuVA/pjLw4tQiH
         ujgrtaYGo6lo3LV+BirI7wDd7DKqnW5fA/alfROSML2LvegqsyhWzzbPpipt/SNmDKbr
         Y+XlRfafazNpNqRUIAcYfFonErNEp7Oe3Pq1VR8K4UJBJ8IdXLBv7xlwkS6te2o7/cBn
         d9nEpMnkID1YA+0HIoByvniRczGACPrw1GzGVVQ+f9Mt4e2j5CGQuCsfPaNXQkq3Nknv
         JeiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OJrTyAprx+F4u+3CkvC3F7RmtUcy+qiuWiiriH2dj2Q=;
        fh=SZZYwOkGgUUHQpPpOMAL2BSOaSYY0BtTI/5YhhCAOcw=;
        b=W9QLxQx/wtmt7xEsN9BhuVabalOYeTEYj78rChP6QELbfzP9yIyZPFSqIV1jCqpUtO
         J+VyoR8tAqy605CDon2DoMPE0hdLIe/KP1rM3bl2yHZ8CWKCFrAuXepELdvetmp05E4h
         pauPfAuOHkW0PKfB4eongJAG3TKkhK2PjvCvv030dS0FLtpAhfzzW1QGzUylWMGiZ0g+
         QbLQL9VDS7rQNRJa6yh3xKaY1m1GR7YE7HSrxwbeU1i3YtTD2YthPBKk6g9o8peLyWRh
         +YESvPkAFoV2AfIW7lE156bO1iAU2mnzMHsiQxtwF27zuW39c0TTgTjOtA+sT+bfxQV4
         sgdg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774513595; x=1775118395; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OJrTyAprx+F4u+3CkvC3F7RmtUcy+qiuWiiriH2dj2Q=;
        b=EVNhpJXIzS1Wo3JWLqs8C/YYXDrGugVOxfHsB7LYt/UWt+II08RRUnFmWCdPZRYCRB
         fjtzgKMO58j9g6uQ9wNkhwo9pDWCrjpkUdf/Wxdnrv03YsvOYS4iEV9OTw6GR408vy5l
         NASTZhPGLxd38RPFPdpl0xgh2v18i17EUifz018WADrQ+vAfr60VHYnnVBsZQgMfs+rY
         I2TpltHQkDLNOWYyXchuDQVXhwkHhAK72PDbTdpcC9NRycvj7S+yA9szRu6mQ2TvwVbL
         nIx8j0ojsPMQ8tD+w09vfGU9VR4Kpm+ODVpfQIex/A1aPWrPCFWtSZe9rTwfzmZHW1RX
         4b0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774513595; x=1775118395;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OJrTyAprx+F4u+3CkvC3F7RmtUcy+qiuWiiriH2dj2Q=;
        b=HkbU1oJldU3a8lR89krhrhZoKxxnIPjj8riv0HIPkd+/0Dkw3AMvnPB1CbCgMw9Z29
         wZFY1Azvj4ZFG0h0UfQGrHFVf2pANgrRWTSJ1+1ze0cnLMqBgczq7/bYg2czi7FpTNkK
         wpirQ2G7tAvCIeF3fckR2pttALJV1aIH9zB7qO9lBZ0ypubqLbkZEy0wMDpq6EDxNTLM
         rbKZvZREhexriCpsqV+ZQGSC+DVJ/mzoi6rjYD7cyTyX60MAIUzOP8WxpBqE9WO+Wdq+
         EsCalkSwVt8ucChGBvWwl8i13LZAq/1R2vn5qpT2bxxdLl7d2L2hE5PHXWEFze+1msoc
         gxfA==
X-Forwarded-Encrypted: i=1; AJvYcCXJNihSmcV8a5tqhbVnaBaAvWCslZ2dPj4gYOqq3b/dnZLmrDh/Utbo//Kf0PwfwQ6tnDYjkbCjHek=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMR03r8oYOBngYvAkrH8vR+HFrYJRudUurJZRgPlFaJOetJ+xu
	ehtNcM/DFCKdoiMaoNJ7IGY3BAKNcAuB0siWK2QAd36rfmOMHEn9ltQM2EbQsJ4Nq5TkzgaNQOZ
	TuWfKpQdXRkhxAH3NGHI91hGQfXDsgmk=
X-Gm-Gg: ATEYQzyD0cT2/NBgi9mQuB7DPiio/R+nKHJhxN5d7BtmCDwrnS7hS6dKdTR+rV97K5w
	MJbuSWqOg2LvZjmRj/fZEp6c4VM0oGFN2AsqVcLSzGIvEQeqzsbPxof9CevqHsHdrBU7YhoJwnr
	mpcVbU2uSty2McqwaWhJX7j+XztqJcdDntH/guMYII6GrV1c0EU9H0E4T7fmm84m3Uzf+n9i2bI
	W2IZPI3z2u1nRs93N0hhTGMr1WHpvhMCchhZ5x1TONa/OjY4cFiZTJwKxzXgPYer4QlXW/ttf9D
	hRCBJSLc/mYHgjI0POVs+gHBAf8=
X-Received: by 2002:a05:690c:a:b0:79a:b983:b44f with SMTP id
 00721157ae682-79acf2e95ccmr68192227b3.5.1774513594860; Thu, 26 Mar 2026
 01:26:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326021642.29170-1-dqfext@gmail.com> <20260326081304.xKa7-s_1@linutronix.de>
In-Reply-To: <20260326081304.xKa7-s_1@linutronix.de>
From: Qingfang Deng <dqfext@gmail.com>
Date: Thu, 26 Mar 2026 16:26:23 +0800
X-Gm-Features: AQROBzAqSiYwDVv-JZ4YazMfucMB6x1v8l0fzYVRYEFWN75xZh-iD6Nf7djB4VU
Message-ID: <CALW65jYdzn_rZWa2zwYd5J+Gd=kyaGMsVFyX0fMJfKfgULMO6w@mail.gmail.com>
Subject: Re: [PATCH net-next v4] selftests: net: add tests for PPP
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Shuah Khan <shuah@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Felix Maurer <fmaurer@redhat.com>, 
	Antonio Quartulli <antonio@openvpn.net>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-ppp@vger.kernel.org, 
	netdev@vger.kernel.org, Paul Mackerras <paulus@ozlabs.org>, 
	Guillaume Nault <gnault@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sebastian,

On Thu, Mar 26, 2026 at 4:13=E2=80=AFPM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>
> On 2026-03-26 10:16:24 [+0800], Qingfang Deng wrote:
> > Add ping and iperf3 tests for ppp_async.c and pppoe.c.
>
> Oh thank you for doing this.
> I haven't look in detail but this cover the "invalid loop" cases that
> ppp tries to catch?

By "invalid loop", do you mean transmit recursion?
https://lore.kernel.org/all/20250715150806.700536-2-bigeasy@linutronix.de/

AFAIK, this can only happen with PPTP or L2TP, which were not included
in this patch.

Add Cc: Guillaume Nault


Regards,
Qingfang
