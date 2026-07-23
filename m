Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282163CF1E1
	for <linux-ppp@vger.kernel.org>; Thu, 23 Jul 2026 06:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784789300; cv=pass; b=moI0Tnu8WxVQ3Y01JpqbcMaxpJOiNcxt3lQMXZPcoqW8Sgm3d6C4koOZrx8xy8gx6b4iQ89qmOEcybuFupPfV4MW52Vnree9BSsxaQIzRYWXqVLOG25eZ+vIa2wq/Dq3tEaUenV2h9UUMqxC/p+faMZh3wZmEj9HrGQBi08jV6E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784789300; c=relaxed/simple;
	bh=4c3hYEcHpyqPmegtbKtV7D8WgaaAL1Hn5tKhB9WAczE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YRBu9HUBOzeNmO62KAto5wjamwjAZxdWqi4M15ChNGtSPEeBltKeRywxxS09qTTCNoaGh8eaARbvoMtsI95YECwLXZ8gRvi8TVnFOOu87AmIczFtBHVl61SFNK+KPK2pHLdIeSl674SzhyfY7xyPN43uMZbl3rKgkDMjboUa68w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SIEDlx3D; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SIEDlx3D"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-51c149c5722so1361071cf.0
        for <linux-ppp@vger.kernel.org>; Wed, 22 Jul 2026 23:48:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784789298; cv=none;
        d=google.com; s=arc-20260327;
        b=LZdglz5XPIM9ltwaYuIlLFUNAY5KVmpnUpPQS1T25VK15clgmUosMtfKckpzJhREi8
         EGPXY7kGa6cdpJFPq18mLv07RX0ZaR+kTOiNqQ2Rcl7rfjHJYT9ZWM5ttHM5FmUK+ZFM
         I43DmmGE0jOQVNddKDJhBXQcts5L2utRFka0f6Op/fhsHWdcl5r/4rgeO5f+vqs5PvsO
         YlFIQXd+Zl1S0LbDKJxjkVi1O1z/aIMQOnPx739k8YO7nhl2xkQCAygnEFV1CyxC3waB
         NgA+N7ijhW4Rs+hMaJaZnOIztw7Y8gaCopjcWrFw+zK/OsVc+1jyBmjsE9+hPlpwQXt8
         US7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Fopt4fHG6AZ8ylrJsUtfBCilhZJrwdqtqno3S8Vh420=;
        fh=aFLQ0cYmkQLzYOl5HVUlhtauSJIDXZZ2kxh6341YGVY=;
        b=r4y0acll+5roNXjw4+v7CDT5lq+/A+eDWAeNvxdXbC7VKbGAHVvZLFbnjs4iTwFxp8
         +XbWFaCAw8se5NN+XnTQWnEq17rxgiUGAuSPJbo4B/tq3oyjYDuDFkdbeF6TwDbSs0jF
         4s2Uh3rBph9Xvj530q/BPtOp0cnNabDqZDyrWwtwcsnaLDXFIDZjnZpEIbx05690BL5O
         rf/YokmXdlE1qNxkG0AwZDmR3lKdDrxv9moEYHr6SbyrPh7jkp3hcmNR5tsGUYYhtDKE
         v332o7GRdIzVjhGWu6oGfkEuf/v7w+R9IlmAgQf64bPWEiET9JJy7aYgTjaMTNkQyIcs
         4dJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784789298; x=1785394098; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Fopt4fHG6AZ8ylrJsUtfBCilhZJrwdqtqno3S8Vh420=;
        b=SIEDlx3DgmAi6WhptnT0MjczshdWCyyjJeERZbmF4Yz+Z+TlJLzBhO02GWPmLRoOfu
         4/OFPmvoTH6odaTETpuecDSvVCAixS1tRUbcytuWg2YUkI9YP5XP6nj/gTjFopB6YXYa
         jqv+LPm0EyXHGopL8uQDycQdVMSmGINfhUeVaT5nAjn2HU1qcA1THPmdM1Hy6/NLjEzR
         6LYFzcJ76YbB3dxsRJiQPIRYfd1kUD36TC6NnV8bb8SUPXvORnNK0dthvJz2IBRUH4IS
         UrPB+r1zBhi61C1asGvaoRRCU4yTcfv+/DCAHtlvRvlIK/bcHPG1NXiwBglOCu1dJc+G
         ticA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784789298; x=1785394098;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fopt4fHG6AZ8ylrJsUtfBCilhZJrwdqtqno3S8Vh420=;
        b=WDDhwz561CPTUrjWuUpHlNfbzej4TZFnKLHj8nGIlj/u9k1XC2ZywK5BL7yTCmGpUG
         xZHGJVBjqO1F9bNpZasfzlHE3RRX+APNZYjACg0uKybu9T0gKQNYX/b8iH+l8+sc24Ob
         Gj1gTWIwdz/bp0ULYwwMMoCk9Lr3gWZWOi9ty57QUsYq3xiC7a9T6s9lpZ6kzUYbhtX1
         AHSqckx5Yw5+FcLor57ZnkXjo7T1bp/KrsJvwfjG+zDqjJigp1uKmG/g1bQw5ThEh18t
         JTPNYahb1wJGRpQJU76IZvcfhgAk6lx/4HGoL8uWOATrRliy0aZUWv328tq0FcA3REz/
         4tOw==
X-Forwarded-Encrypted: i=1; AHgh+Rpt5sUDJtVZadL2aZb+ZUtpLvfGFmN/XmjOlgKTVF8BpOOpPKlqdQZ2HQzB+WPFOUcMbHw4Y70eyH0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxkc+YwKPUX+x4UFLvxG08+XJZfy9rVue6XfpgnfqDwuPe7KptG
	oOc9Osb1usfZtHXBUHYkJ/Ag3+zSprPUpR8Ru3Fp8Nfl5kDooEGem2YrRonh4BqLc0NlQAqzrAj
	pGfonZTcgrR1ieP9aW29hJpOR0eR4Z1mTGJrz+AAW
X-Gm-Gg: AR+sD12Q7JHHurYiSEZlT3Nh6oe8f8fpNPOtyREQuOCP0jaz/KK9igkW9WVaPZBgwAI
	9FJzZVkdK3GdrAcmUsaMHCdHo88xKkmOYOoW4FP3pKorLlMBuutVxtFYgOzZNwil5s7+YuSKOF0
	7p3eYfzVJVrbC9iay5ooTI/IJI7UGEMGhnOuTbZvFc+C4k7f61xxOuPFiRYuv9cuwkMyylAa+I7
	ExtqCmIc2WKI0+AVX08iw8TE5FsWC2wPDlQGEPdbwsK1MgaHieFJ8DTxf8aI+sMH5xoaB/xaJcS
	btfZnfq1QyEE3bUkTaVSFzWGz6NIbD34nB2tc8XpbM3PR9OiAKJc4H4/egDjiw/1Wb2SqMbvHN1
	857CFaA==
X-Received: by 2002:a05:622a:588f:b0:51c:7aa7:e0eb with SMTP id
 d75a77b69052e-5283ee29359mr11912951cf.40.1784789297090; Wed, 22 Jul 2026
 23:48:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722101605.2868548-1-edumazet@google.com> <b16aec0f-a90f-4132-820e-239ddadbe8f0@linux.dev>
In-Reply-To: <b16aec0f-a90f-4132-820e-239ddadbe8f0@linux.dev>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 23 Jul 2026 08:48:06 +0200
X-Gm-Features: AUfX_mzfwjmTNyJFDDWM3usED32OxNE4Kw8gwv9kJEeTjMZwSCqsswLX5fagY3Y
Message-ID: <CANn89i+E=JBRGj3cK+6mfVEX+PUjYrpkkWk1dB3VswnW4X_KGw@mail.gmail.com>
Subject: Re: [PATCH net] ppp: annotate data races in ppp_generic
To: Qingfang Deng <qingfang.deng@linux.dev>
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, netdev@vger.kernel.org, eric.dumazet@gmail.com, 
	linux-ppp@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 23, 2026 at 8:24=E2=80=AFAM Qingfang Deng <qingfang.deng@linux.=
dev> wrote:
>
> Hi,
>
> On 2026/7/22 18:16, Eric Dumazet wrote:
> > diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generi=
c.c
> > index ef54e0a0462a175bb989db8dda895e9ae755965f..cacc4c3a37d2cda0aea2e17=
6e5d0638f959e18a3 100644
> > --- a/drivers/net/ppp/ppp_generic.c
> > +++ b/drivers/net/ppp/ppp_generic.c
> > @@ -866,16 +870,16 @@ static long ppp_ioctl(struct file *file, unsigned=
 int cmd, unsigned long arg)
> >               break;
> >
> >       case PPPIOCGIDLE32:
> > -                idle32.xmit_idle =3D (jiffies - ppp->last_xmit) / HZ;
> > -                idle32.recv_idle =3D (jiffies - ppp->last_recv) / HZ;
> > -                if (copy_to_user(argp, &idle32, sizeof(idle32)))
> > +             idle32.xmit_idle =3D max(0L, (long)(jiffies - READ_ONCE(p=
pp->last_xmit))) / HZ;
> > +             idle32.recv_idle =3D max(0L, (long)(jiffies - READ_ONCE(p=
pp->last_recv))) / HZ;
> In the original code, the difference will wrap around on a 32-bit kernel
> with HZ=3D1000 if the session sits idle for 4,294,967.295 seconds
> (approximately 49.7 days). With this change, as the difference is cast
> to a long, it will be negative after 2,147,483.647 seconds
> (approximately 24.9 days) and then clamped to zero by max(), making the
> situation worse.

I do not think the code was ready to handle long idle sessions to begin wit=
h.

Can you elaborate on the 'worse' part, because I do not get it,

We perform a max(0L, delta) quite often in the kernel, in lockless contexts=
.

delta =3D jiffies - ppp->last_recv ; can be ~0UL if another cpu was able
to update last_recv to (jiffies+1).

We prefer in this case returning 0 instead of ~infinity.
