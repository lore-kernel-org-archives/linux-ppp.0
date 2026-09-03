Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA23433E9D
	for <linux-ppp@vger.kernel.org>; Thu,  3 Sep 2026 08:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788425073; cv=pass; b=iOfapbJ80+Ha/4+t3hqIq6rdD0nHMcT+pqWCwTWNybGGkguc/8NfQ81vXo+G17+gX3FujYsoUp+DKvjftLrOPu3+t2ZVksiMS7UPkWEOHOat8ObKQT4+/L9TKJXLNvtGpBJmlmtalNNKUkfMpB53GL3LlSG7TiZStAPrZZdODkg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788425073; c=relaxed/simple;
	bh=eo/mKAbZ8+ZAo6pNEeH1tClKeAv5a7K+pTLrtQ6S67w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tnCcsCE2xfcXtcMCx059SvcoOdSOCHZCmQzeXQqQsIDnVy/zY3e64TotFGJKufsxPThsL9JxaN4Dlu8UZnwk4HojAFYse8cRJT+waDfD41fiHtQAjf8nfxYEawgUrNTeESFpYUt4sldh6r+HImIeo3rfTxosRa6SJSNBb/CZWmw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=K6kiAv3f; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K6kiAv3f"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5302b692c8eso19686341cf.2
        for <linux-ppp@vger.kernel.org>; Thu, 03 Sep 2026 01:44:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788425071; cv=none;
        d=google.com; s=arc-20260327;
        b=DRgOPEbOj/Et60HzFJmoJLGHMxIFLTnYx1F4GegI7+0kM5dWxSY1bZEZUPHKVTW8os
         udKvb8wn7By2ajLILyNqO4wcVJbhjwlGwK+g0pXT/A+3NdxX7Z2FcT2LSR2eAgx0p8t+
         kNuKV23f6UIbAgKVlK/KJxq8VCStEw1Hw2jar5j8nLn38JFX8uRYpVBi0b82Kh0KK/Pb
         SVSmLlu8FRZbxuFI1CE5GECqrvgDFj8Uh/Zo7N30lD3KevA28vpNFno3OiEJaumXUkvt
         xAcHor4CPduHwXJdtzJUr1MXv610BEdCgW4nutMmGfEvlR9sHfR1TVJFkAk8rstsgGC1
         gltg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UGXcmmUVVzmY3X69FZhKc8apP0syqk+bcVAviicg0iQ=;
        fh=vLIQTdqwCJhC3OO/0GfqC5yY9GG4jYNgIdiBbLOVyKM=;
        b=qfrqq6Qjd2tpSKrgeyHBVMpZeeXUf2S82wroUJS2w/7fT0kDuk2hePPWcXO1vNj3A1
         6Q7cu17JFY7/Gmo/aMhhbiG+6U/wdMZTBNgqG3fBC7qgp2ySDRMF7ZW9GQuOg/17P47q
         Krm4PoqRlg4Fd1tp5cx6czTEZZlVMG4YeQHf2Un8Zmrpns3bh+5DesQw53brZ48Klmgw
         7L6RAh9nNxGCfKzOAkWUzgec8H6MGfyvxnII0rdCWscko3II6tJzshteatYgxjgzhJQ3
         /7/ToX20amQ22W0cmzy3LEoL/eEXbJt6PMP2PFWjFm3TpncMAWcyvGE023OqRMgyTgZf
         3EyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788425071; x=1789029871; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UGXcmmUVVzmY3X69FZhKc8apP0syqk+bcVAviicg0iQ=;
        b=K6kiAv3fjWk24m0b08pvLqLEYgRTmYEtPUBxvN3wgrYRbEMZM28PCUWCjnWzwWcbSh
         uGTPbQo03cLbm8V4PV9tFHgWP+mtmy4SblAM0rOocccBe7Ar6R1u6DSaKB/cWGij9ulP
         aLNUqMssasLEYzzxh3eib9F7PCRub2d9OThGZux26GcUHIB62QB6nf1k11aSnYlacRDN
         VPy4bl77Z7cF142k8TctNHE0IHCPhpZzB5wtqCCwK9Re+I+cAXHobLVpsrh6F0L/MC3p
         2pEctyS0mgYpHUDTi/Egi1taKRsKY6OYfaaq0sKspG0ROw6QL4qy+U/fB3jvqJYedICF
         gs/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788425071; x=1789029871;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UGXcmmUVVzmY3X69FZhKc8apP0syqk+bcVAviicg0iQ=;
        b=HvKY0eU2sDAUOcuoYduyqBatQRp1Rx9ORpn8o1yVE+pxwVF2woM0OJPTYPj9Qe89PD
         v4Gv+On3DLVYezQ1BNQamxLTM+/dkQsFZYcxmQVlypLPDXf4tWORnWjeRHdrxGIL85zt
         L9QMODVmxZvHPNPIvsapBG/FzPoiQc+c8yD5vk+iXhlcAwrzuGklDO1yUeLE4/TBIRwE
         h+z9hr1i+ghORFswHgx4U0llFKRSOEvrOkK9Z0cRfkjkYkGOr2e1IRmYdVZ4McbuO5Kb
         ztAW1Ud7ejKd4mabMqBPxs2RBcOBV0eW2c5aFinsCh5G5chaxNAipiVt7xI14iwhObp/
         Uv2A==
X-Gm-Message-State: AFuF++mHEck0U0T2hdj5c+pJVD39XTlVVSDbRaZTFPZYgcq1PlgUrDt9
	vr6Em2hrdGfv7jITOW5SnoWq2NJxmUz4gtRjyOcwK4qIGsf1OV2HP65GjwK1eWm/J+1zEaFFng8
	pPcxcc8/iwzs9ISIJnZukbS3F/oJpx5jxFd8+Dw/TmaC6zlB/+OGwljDX
X-Gm-Gg: AYBFou3HlfIXh8545ZgcV9iPDtIjlbt+7kwssKt/fb9yCtlZDwUyo7STmoPImNM9RaM
	kM1UzunRALbGTHez2U+bS0v79A9pJj+Vl/mqxl9a6FPZjcbYDa+rZpx/VAUx1FoRdwYMGsGfZrG
	rZDXmJFj913fKkEEBnk/g5E4n8CR27SgvbeYIJa+sSJ4l15OTcwVlVq5Lro5WVe1n3CHnw+aph+
	Nh/W1VlbrOq5NWMWA5lYZbpxiDRcc1iZ5O2oJPj57kCIbGvbAWSknF/BE8QugVllX7RRJv2m1Rz
	G+j3HGNWuajRdwc4avwm5QGmdb56BEtK804mF+zRVQN12CjwVZVyEDzx4LhZeballSb0mxqWz2C
	8i86koHSLMoVuscGTMdYD3tmrVG0GwtDMxak5+9eaCjOGklJO+qb6LriTiA==
X-Received: by 2002:ac8:690b:0:b0:530:42e5:f3a2 with SMTP id
 d75a77b69052e-53042e5f5e8mr64804661cf.43.1788425070051; Thu, 03 Sep 2026
 01:44:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <apkR6ZU+tqP2C3Fl@griffin.linux.hr>
In-Reply-To: <apkR6ZU+tqP2C3Fl@griffin.linux.hr>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 3 Sep 2026 10:44:16 +0200
X-Gm-Features: AcwNN1V31QTbQHlVUR2Ei5qRHgvPD8qcEst2_28P8qGgpJy2SSyFXeEe1YOcxHE
Message-ID: <CANn89iJ+qV5T1xzwqUKzw+mCryOfKyncSB2WPA7vhsTMJ6DfGA@mail.gmail.com>
Subject: Re: [PATCH net v2] ppp_async: drop the errored frame instead of
 resetting its headroom
To: Vlatko Kosturjak <kost@linux.hr>
Cc: linux-ppp@vger.kernel.org, netdev@vger.kernel.org, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 8:21=E2=80=AFAM Vlatko Kosturjak <kost@linux.hr> wro=
te:
>
> ppp_receive_nonmp_frame() prepends a two-byte direction tag before runnin=
g
> the pass/active BPF filters:
>
>         *(__be16 *)skb_push(skb, 2) =3D htons(PPP_FILTER_INBOUND_TAG);
>
> Nothing on the receive path guarantees those two bytes of headroom. The
> frame-error path in ppp_async's process_input_packet() resets a reused sk=
b's
> headroom to zero while claiming to restore it to a freshly allocated stat=
e -
> but a fresh skb from dev_alloc_skb() carries NET_SKB_PAD:
>

Reviewed-by: Eric Dumazet <edumazet@google.com>
