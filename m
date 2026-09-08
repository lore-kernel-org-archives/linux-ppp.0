Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA343E763B
	for <linux-ppp@vger.kernel.org>; Tue,  8 Sep 2026 08:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788855619; cv=pass; b=NKgMn5P6QE5DleocCXMaVuRv65B+abqzstNOs48HEqPhqQmQw2vcVuOaysPGq87T79K4n98107OOGl7MyhglTTiBQ46oKwag4Yb5IeIdvDR7R6yCchnuod6nx16+5hI5D3j4T5aNQA/S9r5KbVI7zxUGrLgBV6jhiZoIs+Z9/GE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788855619; c=relaxed/simple;
	bh=hsjTDp8GxgJOwpED1Wg/Qo5pHHkBB4Ysmhw6O6ZbUK4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OFNKOMseP20ElOmZ94nBNPTCqpTcO97vWQdsD7mFw9Wn9lSNjow7RSrwAldX4QzQVIbO6AHxbmg+9XoBqdfednDt4Voq49KErPlnaSAoQWpxjTRc4a+XT782kuNy8HM+EtaBBGFn9iebgDITlhc6DIVhOt13QbwTRkzga9FvUno=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sO8ebbnR; arc=pass smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sO8ebbnR"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-91041ee9230so45517226d6.2
        for <linux-ppp@vger.kernel.org>; Tue, 08 Sep 2026 01:20:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788855616; cv=none;
        d=google.com; s=arc-20260327;
        b=m1so/davTcvcfh6C1gpdTYTDna6etOFVwb0T8WG8L3cSDHa8KiKQp6ulnVHEwJW+MJ
         z0cpt1HnGDZVnZN8tLXcPQ2gpLLROKZSl8dFpl1e2d5MQj5Gi5FT9Avc64K8byqlfSJK
         jrkANR+w6Tr343BLkdmKOvkMSH0VXFSFuHewvFG9vsKRhfU7wG4CYV7ixbhCZvzqYnhw
         z6kx8aapzFqjGA06obqFaq8iiq7BRABynpSfXhjjzl5KgSXfHo8IABQ9deVP/53DoOeL
         Fn4sH8QTB2ECmrd9deElQH1L12Bbb+F1sfCVFWZOGzSdX8p1CHckYgCuvZf4hlypO5Zc
         zWxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hsjTDp8GxgJOwpED1Wg/Qo5pHHkBB4Ysmhw6O6ZbUK4=;
        fh=ahfsAAAVtuh7ykEQevmpqfPtWNEhThscrXKKwN50wuo=;
        b=DWIPj6f1lqiuG9fAU8oM2eTOrNc0hCGwyi20dNO0vF9aJJuMvaN/wzo4Z2TX4ecIwu
         An0bGhMyYxkJ5yFGHQi5TBF8Y7iLp+udHenHdtiUNdNG+d7cKgYHxVdy6+1JRiJm9Qlo
         HXGwSf3KdHz3Z3poPJ5kspjzt89+VRkX+u3SFFVWR2BF4/GCao5kWzLWSPaoECI1NSUb
         4D5qhfIyEO6Mx2M9pK7PPN8L55UaywEC5h/NExEBCm5D16POVZ3z+2Qg8ONBzK1fyxJY
         mZYl9H4i0Hsef2cofu2DyYpKYH123zSj/Bjs732SxKjsQVj3ZixGOJAdseMXZIq8a3SK
         D3vQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788855616; x=1789460416; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hsjTDp8GxgJOwpED1Wg/Qo5pHHkBB4Ysmhw6O6ZbUK4=;
        b=sO8ebbnRRyogAoRUoEKrDUIrV9/y3WCeanjkAFp/SRpg/dbdT0cqX+wN2pNTpuFDX/
         +d9L75Qm2B5nKiNt8BOFJ7xKu/VPzEwH1XXltWfXF8MfArLid1o/wwxXOMSudlwqkf5b
         iv+2MJpKykr9OOcDdb0iGuOtCwXDS97rFgfbVWVftInFIhwAN9mfYyr4Etkr2Xcf85+O
         dmPWy+RMlAO6KgtbEr/+LskeSzf6StieEdPwll9jU/hP2DA4DYZgHWhxmymgCqWysBBS
         sIjpHQv5bpjIFh8kBlqHDCsL/zGpVHKEz0AyDi8msAhBSUvwlfMKCMnH9bC3ntPrEys4
         IJcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788855616; x=1789460416;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hsjTDp8GxgJOwpED1Wg/Qo5pHHkBB4Ysmhw6O6ZbUK4=;
        b=FTFlz3YEaxFa8Ve6Ix5AFCnSzSmFxIFjppuRhG4d9nJyUjiesFthqwJETS3fquoG8W
         4Ndpn7T9VIEV0MaDOHGspUp9CQA0hYm8dZL4MTQVwFF+MrbH5sgz/YvWl0H18QyLuTKM
         VPpU20mNWow/PqBvlzWTKabyyDJlczVOXYRVr8XXh+noguqrWIcy34HUas/gJszmsv7r
         uuR7C7YLRmws01nKNaAWJrn0dsMRC1nSReHHqUtiyp1O06/pxTFbCjZ3ESNhjEuC9IT1
         HSOE8/XCYNbbKCzDP3VMeEB/jlAc8V0z95ZOL9YhJqdyuIgD8tEep4XJjbQy4Dq39DWG
         Tn+Q==
X-Forwarded-Encrypted: i=1; AKwUvBw8BUzWQ/sTCd8/t0mx7nmeugsXR9ptVHnx2vIbPE7x3AuoLT7E0pd5R1GWBvgQ0to1iMdh45NjHjE=@vger.kernel.org
X-Gm-Message-State: AFuF++kXl2azTOmiJfsopIhHXM5PEDiG8lNQbEg9KgDNU4QeM6fjr2fE
	4Vl5RH4wzfD9w+6MDbNsbot/5p3pUfWdIn0PDODlHGhTtDgS+WLyczM7We4d+RQVyjfXZatywzD
	k3DHz8vCUEH7ovnWz4HWcQdXBaVeJCLkFP2moauGd
X-Gm-Gg: AYBFou3pML9ipa6k1OWrrTytnSUKeAfL9SwVdJ3EwlU2HeNCISj671F1utbsjemis8B
	CPnDWJU6IGFeyPQDC6VaSd6tp4wZS0qrSoyrCpOdO4ui9tTOgpDQgVVl2Uvstr6B3A5kEYkmtJR
	7/d5Oz3wmebPSV+aobZ2xstPJwvCugOyPDcgVaolm7IXDIqjf96XOk37ziTV+jGWCeEssk/79vI
	MBJbD3ufczTOne/rdIRIFHPESaCSVsUBRnyjBfKcwIE2ZRQ5tiL+xRUjPvcEvR64FmcGvCNgF4b
	2WnjF8mpyFrcW2a+7h4lZ/WLslbTPIYL1MBNnJrOYpqBPrVD/zVUCUd7hONYYsrEHhOfw5R/d8R
	xADgRyVvwb74eCW48pvwQXApJ3ZbUzfi5Nejq8BkiIhSwj04XJ/2h3FVBDA==
X-Received: by 2002:a05:620a:2855:b0:936:eb7f:d2c7 with SMTP id
 af79cd13be357-93980400609mr3654539685a.27.1788855615776; Tue, 08 Sep 2026
 01:20:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908072135.877364-1-qingfang.deng@linux.dev>
In-Reply-To: <20260908072135.877364-1-qingfang.deng@linux.dev>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 8 Sep 2026 10:20:03 +0200
X-Gm-Features: AcwNN1Xe-V-EjnVcuPI54J8HF_f0_7IiJQXu4AsaIKhTCzrczAlMe4wF4WaYDBY
Message-ID: <CANn89i+w-txLUf9KbUORYy03x2GS8Z=Uroh+rqiBKztdc9hqFQ@mail.gmail.com>
Subject: Re: [PATCH net] ppp_synctty: ensure a writeable skb header
To: Qingfang Deng <qingfang.deng@linux.dev>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>, Kees Cook <kees@kernel.org>, Tom Parkin <tparkin@katalix.com>, 
	linux-ppp@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Markus Elfring <Markus.Elfring@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 9:21=E2=80=AFAM Qingfang Deng <qingfang.deng@linux.d=
ev> wrote:
>
> ppp_sync_txmunge() checks headroom before prepending the address and
> control bytes, but does not ensure that the skb header is writable.
> A received skb can reach this function through PPP channel bridging
> without passing through ppp_start_xmit(), which calls skb_cow_head().
>
> For example, a PPPoE frame may share its buffer with a clone queued to
> an AF_PACKET socket. If it is bridged to a synchronous tty channel, the
> address/control bytes can overwrite data still visible to that socket.
>
> Use skb_cow_head() to ensure both sufficient headroom and a writable
> header.
>
> Fixes: 4cf476ced45d ("ppp: add PPPIOCBRIDGECHAN and PPPIOCUNBRIDGECHAN io=
ctls")
> Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>

SGTM. I will fix pppoatm_send() in net/atm/pppoatm.c which has a similar bu=
g.

Reviewed-by: Eric Dumazet <edumazet@google.com>
