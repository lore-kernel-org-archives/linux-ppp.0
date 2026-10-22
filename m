Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792641949;
	b=c5iQ+qB0aZ4PfAFRhnHOXvlQ6tZ1Kwo+zxEtH/RmDe3LuqGmSG+aUcBNUm7w/jKgj87g
	 PyVrLs1+vlfkUc+onBwXhGB57MJOB4U9sDh37O6tOfxIrzLg0FCjzXj4gvxXzMllfAcxM
	 mFzVSn5clYlB0bDUdF4/YTSzUj4W8hgI0wQcOzZ9bqgaNeLJgBu0myykrk9HHKgh7O6uI
	 E4/k/CkR+PpbVJA9vDGdQwPWiBXrFtb/Mw+PdRBDw1qnEpf+ub3E0yPaG8dn5GkOawJyR
	 7EO+t8j8mbnR7Yb+uLBa7MH3kN/aITM1IA/GHfUfOXzIYz+rZgdSac0h3tRfxz5vWZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792641949;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=TiImOToCOTXq8bZ8fUxI8UXbwrtFjndQ9HG7GJvNlgM=;
	b=ulKlI01fhKsWTicapg4zjRU5H/IqlPHAbJZO5SGFAFFWOoNJHVx+kvRQOXiwxytpJwaF
	 UezM9SWLNRHhE+e2CJQCEzZpmAURPgMo8ZthjgGv8umjztKfdtPfXNTqaspylLouZiXBW
	 PCkpaiO+uXVEW6R3p6Wome+xQDRlf7MThwAwxh5TQ6h/kGErdQmygnFH3+jEfxitpHeAq
	 E4XjvYBCmoj+NCG3gumzoxhHETSd2gYEPZbJo3ZNSQxWcdPJYUPz0dpgYZc61V99Ln6DG
	 rOnKs1LcT5+U7xnWHm6mm1N109Nc8AEJ+93O79PZ6zIJJKOL0SGujO1g7opVzzNOy0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PyojM8GG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58850606A31B
	for <linux-ppp@vger.kernel.org>; Thu, 22 Oct 2026 04:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PyojM8GG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E917F1F000C6
	for <linux-ppp@vger.kernel.org>; Thu, 22 Oct 2026 04:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792641948;
	bh=TiImOToCOTXq8bZ8fUxI8UXbwrtFjndQ9HG7GJvNlgM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=PyojM8GGlPjjPIIbZ2yVRxJR2i0CqYs+xhSXN1UoEHQXPsAWpIqCO8fpHtquflV+Y
	 UxlU+u3GYrnbmDxyDkbtNw8yklh4BI6vl+SB23j9bv+iFx4C1GOJMOGhqsquG4GinJ
	 fzAUp/hjr9yJiN5Gc0FK1mzq5bcJyy9Brr2rkgUgoTA7dE0XCPXhqp84VTytFWLLVo
	 X+bhN3FbnTsgbGGwiwz08T0MQY2KOROI09/fEQGXR+TDyZWMczmKkIh096uioW6mWF
	 6NV8fY7d7fygd+bP+bpA0aill682O53ikX1u8El3QiYVmy6BbZT+JiQ7xKzs131d3c
	 R6GVTve9CDQpQ==
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-4a755bbe158so293501fac.0
        for <linux-ppp@vger.kernel.org>; Wed, 21 Oct 2026 21:05:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzBWsUKOrIXusnmD+CW446x5mpeKLg/bcPPCCU2KGoqjUsh6MHOO5kJLS61ztIABVRx+0JhV4M1n20=@vger.kernel.org
X-Gm-Message-State: AFq9FYLXSmboQnhALp+xK/NnJRytaE6bXXKJW1lC7BAnbWXbgYmtxkw5
	zbmzx0PwtJ356VoI6ufklKUjaSOQD4fneNExQJdKDcCZbWEyTk6zNB/uoWz0b0qkfIE5gpITR05
	EsDEWYlHjvhjgHmFegx+Tr3bDlPjMyYE=
X-Received: by 2002:a05:6871:5212:b0:467:2b0b:d07d with SMTP id
 586e51a60fabf-4a7fbd19e5fmr799364fac.1.1792641948284; Wed, 21 Oct 2026
 21:05:48 -0700 (PDT)
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Post: <mailto:linux-ppp@vger.kernel.org>
List-Help: <mailto:linux-ppp+help@vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-ppp+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021023608.55867-1-qingfang.deng@linux.dev>
 <179255036282.3290.8488375760281728576@kernel.org> <c0f348bf-0e13-4cb1-8014-cd9b7787bfe6@linux.dev>
 <CAL4WiirRPnbSBgcoh8Aiq8zGVzsy34w9uaqAgSKQwpgJ0ht7aA@mail.gmail.com>
 <315a8794-db40-4d0f-9e4c-0cad66174bff@linux.dev> <CAL4WiiouaJ5QU24uKt=CuxpfgHmWHS5oxoE2E_C6KFCLbDh0+w@mail.gmail.com>
 <51ccddcc-53b0-47cd-9526-ccd825f0f6d9@linux.dev> <CAL4Wiip2F59XO3BrjUHVrFqYMuD-LxNmZXhtftkV-JG0Ya84Yg@mail.gmail.com>
 <b3091ab0-0e1b-4835-ae36-14978af46fa3@linux.dev>
In-Reply-To: <b3091ab0-0e1b-4835-ae36-14978af46fa3@linux.dev>
From: Eric Dumazet <edumazet@kernel.org>
Date: Thu, 22 Oct 2026 06:05:37 +0200
X-Gmail-Original-Message-ID: <CAL4WiirdFXnCnDNFGvzWQWcao3mO28RtRUxW3SMQhA=5dytRMw@mail.gmail.com>
X-Gm-Features: AclHuK9wNLzQ4G2rAXhCVxnW_W1Zrh82nJcNVv3s2smPAoJUev7jcw2ED7nE4ms
Message-ID: <CAL4WiirdFXnCnDNFGvzWQWcao3mO28RtRUxW3SMQhA=5dytRMw@mail.gmail.com>
Subject: Re: [PATCH net] ppp: linearize bridged packets when required
To: Qingfang Deng <qingfang.deng@linux.dev>
Cc: netdev-bot+sinfo@kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Breno Leitao <leitao@debian.org>, Kees Cook <kees@kernel.org>, Taegu Ha <hataegu0826@gmail.com>, 
	Tom Parkin <tparkin@katalix.com>, linux-ppp@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, James Chapman <jchapman@katalix.com>, 
	Sashiko <sashiko-bot@kernel.org>, Felix Fietkau <nbd@nbd.name>, 
	Pablo Neira Ayuso <pablo@netfilter.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 22 oct. 2026 =C3=A0 04:18, Qingfang Deng <qingfang.deng@linux.dev> =
a =C3=A9crit :
>
> On 2026/10/22 1:55, Eric Dumazet wrote:
> >> What about NETIF_F_FRAGLIST?
> > I do not see your point. Can you elaborate?
> >
> > There=E2=80=99s also nothing left to gain on fraglist packets.
> >
> > SKB_GSO_FRAGLIST packets already go through skb_segment_list(),
> > which just unchains the original skbs without copying, as the fraglist
> > test run showed.
> >
> > Frag_list skbs that aren=E2=80=99t fraglist GRO go through skb_segment(=
),
> > which with NETIF_F_SG already shares the pages of the chained skbs
> > instead of copying them.
>
> I've run selftests and confirmed that NETIF_F_FRAGLIST is unnecessary her=
e.
>
> One extra finding: passing NETIF_F_SG conditionally can avoid an extra
> reallocation in skb_linearize().
>
> segs =3D skb_gso_segment(skb, chan->direct_xmit ? NETIF_F_SG : 0);

Yep, I can do this, thanks.

I was hesitant to duplicate the logic for something that has never
worked in the past,
and at very low rates, unless in emulators/fuzzers perhaps.
