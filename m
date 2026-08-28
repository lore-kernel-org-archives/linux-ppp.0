Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AAD9466AF1
	for <linux-ppp@vger.kernel.org>; Fri, 28 Aug 2026 14:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787927650; cv=pass; b=ZGCKvOzPvgX8SSR5LG8o0ExPxdqu/hHIZ7Ub8CfdQAGXsjwExUzSEs7K52UGOc7e2tJjx86emTIquxEDVc0tIB2EetoJdx9xbfC10Vhej8xpbcTh/Fs3RAH9kr2pD/oBmFGnYVJ1O1PA7wRIo34xLH4C5kFqgkLMWMQU2Lvknt8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787927650; c=relaxed/simple;
	bh=h6urPZgF8bTfvFzVWce3FkqNPdyyhEqvIBFSzMK7R9s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jny/thJ5KapsX00/AMLyZHejcPn07jzCVuB6UxKSgs1K8nAPgj32ZgOeLNoO//Aza2bj2L3lwTALXiSbKJxF8b6rC+K9Tf0XvE/8RVRujm0W/1qwCsmEBFae7Hy9nT6BDVAlW2Ly8q4Py57i7nsZeJO9vBcfEVkU69PW+FcT5II=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PV+24Fli; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PV+24Fli"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-52f83889a93so8925571cf.2
        for <linux-ppp@vger.kernel.org>; Fri, 28 Aug 2026 07:34:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787927647; cv=none;
        d=google.com; s=arc-20260327;
        b=gCmziSmckSQsqxwynjcBy2QDGYC9Dk9BZ7DdzGg6irlFXVKeOBJldDBq42HrPahZrw
         RKwSCDp/E1ewpvx3pLkNjIbfnWTF4MzzqxPFW3LJX1cV1n/ll1z2Vp4nEFa0z+7xG9A0
         g2V7mBJ62gdC3wSRzao15bGy7XoMTvFyyuFTB2x1aThJBUANml6l1f9/8U0aY/iA0Bsf
         XZD4cDSjbBCEAFX1ryaJ0T8qFtFb0n56/SsCjF3OJ6yBKCtABrK7Yn0Jsgeia3wmLKXf
         ghoJkLNRrtNPi8UGdq0TlypSzRgZ8/nDE1Y3LzhmzIkEYC44fpuRS6ELuhbqE1VFoqxb
         D6iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YumHW+3Khcd3HlEzxF3Gk3LiB4e45hriCCvI83W4xOA=;
        fh=2cQacn4RmEMYu+mtid0o5ZywVs4e3MrxgPt5RPZvzZ0=;
        b=lNjIKCqHW3LIeAlL4DSGZBJ/bA/nR9+wptWJhoocX2zNCEljhZTu1Cuw3/7b5KmJRn
         s+VZncWPdr0rLjsjAUAAWFcUsF7YQ3dIR0DVLd8izmuSd+mYgS6ce6swm3MvLHOqYMjU
         l/4dZPenRqjAFA47izRy+rpAhY/RS4mGBgz34iF9/7rdDcHq9ekzWR2rFIggvy1j0Y7T
         HykCAQaks55iXmcvy6smTqbHr/RZlWcC2gPqxDJyIHkt8otB02UrX+Fq4zvmGaaAqMel
         J5BK8lhasMPhf/nEVODVkYQ0pvKkA7WgNWsBPghK83ek1OXBHiy6m//0fMmZDNapCl8o
         tIOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787927647; x=1788532447; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YumHW+3Khcd3HlEzxF3Gk3LiB4e45hriCCvI83W4xOA=;
        b=PV+24FlinxZYo4O+wz86GSfYocJt9h8gu4/B3ENqClxT1pRNumsocQy1E/bskA9C5d
         8PTqDpruTr3W95CVLFMU631dbacg/Rf9nSMu2f4MUD57uy0aeFIEfrL3+86QGo5gj1x+
         4wJbiBaf+YO+uffa9xW8ANloLqp3w/OlIUutdHeS3tQA3EDNS3zE3+SOwMat8NyHwKfz
         HINtHPMdA1jEQEqVxeHwzXjMp5/KVs2VqFMZxlN+yLmJBvtZwAcuNJEQ/iPTsHMRsXA6
         Lc9iqRo4E9i8QbmMNfJsd/jW1JXx60wWOMynuCylkNxd96pVF3a5ccXQy1SIVZrkSTXk
         YmrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787927647; x=1788532447;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YumHW+3Khcd3HlEzxF3Gk3LiB4e45hriCCvI83W4xOA=;
        b=RFX+lpt/CPKE9HmDxPwb/URUm393oi28vOETLF00xlEslv1Fre81UP8annB+CqYJxS
         wbpE0o9tE7KPT+TrQwLeNumCjUN43EdA8sNLNguEFd4ummj4rtL2SPg16fAi8DFCpsfI
         iMCtkMbw+LgWjVYzKKbleFR0mdAWRZ54WLMUN+jqnrICt2OLuzZ1HOjbfE1RGlSjUff4
         JZwZym6nVja5Uuwd5Uhd/Zhak0zKlYww8V1+pbuo16o/uQBmnibZYpIkHYAQX8vMNthp
         hMZ7rd60vrEBOWUs4GNzBskq1QDAG7pjZKcNNlrv3UucdVld+4HLK5WCy0qYJ70yMcgY
         IoSw==
X-Forwarded-Encrypted: i=1; AHgh+RrYPlO3srYLvcqzY4gy09Q09YYa7oMQIIbBwkBhRAdSv4sfdVjHDZuK1ydBTR/CpOzqqivw3ku/2w4=@vger.kernel.org
X-Gm-Message-State: AFuF++knctOJICJ+ipBvKI6NeBeKW82OjqPEh34zBi3Czgv+u3Gyma36
	rp+QDQYFB6JE4G9vM/exARerqX0uySPqyq40vrvqEj5G9p/TvUk79h5XiPK3sco2f4LZnpY4B70
	at4/guifd6mwYkquS0JDZcXmMRXo1nTTFVPE0ST+D
X-Gm-Gg: AR+sD13fPci+aKG+IIoekL0MUBgHAXAVQlQYrOcrwMgJqIV9JY3iVk9rZBSkPjubDEA
	7yTGLxQULK5LWGb0tAHZW6ziZclrndfPAWHX8b8DZW5i1iZLnyx583qFL0kcW6ZfXDIDFtXV/4M
	490NGIAOHJA8UYYKl1RGw9AOGqk55IwqWl8eDkqva9nx88UeK2x0VU9QSJno4GnLnWp9pSAWEa5
	yXtKOd537kdLnm4ZJ9Fip52tYmhEp2W2hu5W6/07RmYryDL4NhSMGckFfdKt2DJ3RZE27mcESDV
	awwlQfpG2jgh490USj/rky5N4aDogBR5dQVk4P5vw5P5bP0ZuynKp6GNkViuW1Rs06L3pMw4T1m
	YRzU6hfSXmPVY9AO7hdbmBnFs699f1XxML0JKKGu13RCO4NhJTzIgRfJP55M=
X-Received: by 2002:ac8:590d:0:b0:52f:ae2b:da0b with SMTP id
 d75a77b69052e-52fb942d67bmr84786531cf.16.1787927646262; Fri, 28 Aug 2026
 07:34:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828073245.126804-1-qingfang.deng@linux.dev>
In-Reply-To: <20260828073245.126804-1-qingfang.deng@linux.dev>
From: Eric Dumazet <edumazet@google.com>
Date: Fri, 28 Aug 2026 16:33:55 +0200
X-Gm-Features: AcwNN1UhdM8hO1u0XPNdtSnx727Mw5Sdf1F5y6RfcZsOSfmGeXvlUkBvd0DUx0c
Message-ID: <CANn89iJ1DTd-C65Ps-6C3djV=yihFinGpEqQjEwn7=7X6P3iHg@mail.gmail.com>
Subject: Re: [PATCH net 1/2] ppp: ppp_async: simplify tty disc_data access
To: Qingfang Deng <qingfang.deng@linux.dev>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Kees Cook <kees@kernel.org>, 
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>, linux-ppp@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+8e808eb853386f575d86@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 9:33=E2=80=AFAM Qingfang Deng <qingfang.deng@linux.=
dev> wrote:
>
> tty_ldisc_hangup() invokes the hangup callback while holding only a read
> lock on tty->ldisc_sem, so it can run concurrently with other line
> discipline callbacks. This currently forces async PPP to maintain
> separate lifetime protection around tty->disc_data.
>
> Line discipline close is called under the write lock during hangup
> processing. Remove the hangup callback and rely on close for teardown,
> as done for SLIP by commit 23c53269f2ba ("slip: remove slip_hangup() to
> fix use-after-free in slip_receive_buf()"). This serializes teardown
> with all other line discipline operations.
>
> disc_data_lock, refcount and completion are redundant with that
> serialization. Remove them and access tty->disc_data directly.
>
> This also eliminates a lockdep warning reported by syzbot. The warning
> does not indicate a real deadlock because the write side runs only in
> process context with hardirqs disabled.
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Reported-by: syzbot+8e808eb853386f575d86@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/all/0000000000002fbad30611e25849@google.c=
om/
> Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
> ---
>  drivers/net/ppp/ppp_async.c | 82 ++++---------------------------------
>  1 file changed, 7 insertions(+), 75 deletions(-)

Sweet.

Reviewed-by: Eric Dumazet <edumazet@google.com>
