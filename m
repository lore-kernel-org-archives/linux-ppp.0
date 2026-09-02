Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6641774C14
	for <linux-ppp@vger.kernel.org>; Wed,  2 Sep 2026 06:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788332373; cv=pass; b=qP6leKALOhmVxFJGif1S1mSOWoh5kNgsXJrEAKQVk5P753EQno91hXaE73WiU+hw5THDPRwYk3gcbGbVnWw7r7DBnLkVw+J28AUZxbSyrK7qSqGr2H1Xot/iHDzBCrwQH9Zl6y9BtjU3R5PpmqaqyQyxonG1dmKYDcJCBSFbO+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788332373; c=relaxed/simple;
	bh=N85RJ+R7r9Ai0hOOjY7YpH5Ytqqm74t2AFNML4GFVK4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aSYqFtgVqsbypEMGUn6Ctl6DwgXTZKwAy4PTbSqW+6GO38cEgXweeE+CU6US0vhmZNhYr+NmiVs9v3U9E6t7wLVo/VrpIrVhAzE6l3H/ELpWCfhKZ+KZW+ov72wATjpV532G59e+WTyegmmFayJZ6c/8YjU3qqDootl6xpfY2vw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Rz0ubruT; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Rz0ubruT"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-51c0c45c580so7273701cf.0
        for <linux-ppp@vger.kernel.org>; Tue, 01 Sep 2026 23:59:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788332369; cv=none;
        d=google.com; s=arc-20260327;
        b=hsDlMIz9ofxvDub0gJNCmJIw7hHoPadQMvhcqSrlO6WvIvzRLWw4kqyihtJ4fNiDNT
         UqO5WwI6+EqR8rpPKOKDhSu0DCTRHjJe1fPGA8obudaqM0a/aiPnceh93UAsT64hm9d+
         tubVDfrhIckf2TaB3KcVYLZR6kCCWT8gcooJgGy93oLlJsMQjbA6OQDOdDQ1vG+uBvHE
         cRs9Usceo+sdI/hSNifaAc5z+MoNID92mYC7KW0rrN83cUqRAbpvv0kGW/RIU87HhTCT
         OlX152dLEbWALBCJx37kOjAQpVk5OPUKFsVqlKsG+Y+oEFRbR+drrDK81Owk4R5k5X+7
         kgdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oOP9Z7HNYiswXIyPHT63AslF3SPZRjDN0nxwMCDDVtk=;
        fh=hnWCftoBQRip3ktPde72+FLObzwjMsFykDzsLJ2YR5o=;
        b=N4rTCVTsOy2F+LAfqx2xKMbgzLk1fKh7FhQubh2YwgTJa2GSYZRe7johQZC4B+U8oQ
         oRHz9zGt6Ur9pwl2iYz8VPVj1sHM080qr2HlCGyd1mETm4DIv4VUCp8rGljOpWs+7XuR
         q6beDzF1B3akM3NLEwWUsSAM6pL3pirV2Ln5NkhljBzlNktmhMi9j+0a2r9xESVpXsDD
         jOqIeV+R+V+G5twjHhtnRs61Q78DjQ1tAueS8t1Q+3woLlrjb3srI1Msj4vYVKvdLOT/
         W1zOTap5wnE3b9f1kWqyfMhphmWn8ADV3X/7s3cfD/fZwDQ02l2OxQmorf+IJ6bJ4CC7
         Vc1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788332369; x=1788937169; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oOP9Z7HNYiswXIyPHT63AslF3SPZRjDN0nxwMCDDVtk=;
        b=Rz0ubruTCj46vPENnFbN8lNeC1130gr0rjTez8fpJn3zcAMEIafczV5/ZNacYaKS9S
         U+kC6hy1i1d7bPee5vNLYdmIUcnrgXdqdHeyAhcCJApPeGAPFqnMad1XuSGCjbgU4DmV
         597DuWf27eWXJVz/Re66pvpjste/d23C5DI7M1pM0uW2oiWjY4s/CveUj4Uq6WnWtB/Q
         FNda7zcUBvtncwOS1WJsY/vNgsxtaqvF+k3+G7C9JchAEhOTc4Zm49sd4i9a/PKEDnh3
         3jylk/d4s47yOI47dnOWgdkBCHp6Gb7i6hXp3AKp6DYHdnjODIOEEW4QRRybTphSqOhQ
         1WYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788332369; x=1788937169;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oOP9Z7HNYiswXIyPHT63AslF3SPZRjDN0nxwMCDDVtk=;
        b=dBWH2+UdwjdKyA6lL+4n+qwLlyO9193GgjDK5HuwIz7ZfwRiPiA3y1N/0wApbn/1rw
         2WuanCjmIyJuNw1noLAVIvb8AHVgj7S+GvRZnhsGhQLvWOA/ZBhqjNakJfcK+nDqmGgY
         zBkS9LNvuuQoRromHDU3qafB6+CK8bHR+nx0V6j4TWJ+3ARuDS7pTswf332oUxTpZrXg
         6c0jFArac1yDx/EDRG7uTIiSEH8xwUVbGBpmkCbLmhNR1JpssN4sxUSWVcvZRQ+Ng4ci
         XqnTKYiy0JRMiRU+om2Uy7ENbB6fLtPPQ8HuDsgpdDjeFsvFrZNBIJM9CI23HE+dT4zz
         27gg==
X-Gm-Message-State: AFuF++kpl+3+0uMND9DX0M4y5OETPlAHr/dSLGRoRxsRsBsFn2GlbBlv
	xjhB565pfLOKB+iOVUdzC3zu+aZd9WNNIjqn3WJOdamI90xyUg+qM0Ixwo4qvN5jI5Y6qnmEilX
	JcjxwsHfVHCzp6vQyXBCAY61CYp31ECUWIB9TKTthZOLBNcSjnLY/oQKR/cA=
X-Gm-Gg: AR+sD129+eKjFCJdYV2BMiulORoG33ewNkx1cFlMOTyiT9Yw5KE/rG1s+jrwM5iJnra
	koHwpOtrSfPWr+6WDbEJJUP33PcIDveIxMYigjHKQUuTCLJA3Ti0zll9xjCD9vWUqIkJ1E+MLqb
	YCuxpG0iPHRNaxNb8Es7e4qn/GlAXR86chR1jcF3D/SZAVd0q535Qz3MF1b4idADfWrPaoiqO8N
	PxaRWsidAU6mrxonJwpH52f0y0fKLCSihQJuUK6KvmdiyWb5R+Eu8UPkWUDcktSaH3/UIvubsXO
	TQvMTvVxo+rncr0X+s0A/+6iLK+g3xK99j4B2+C1fmsVAE3SYKqTjCO26nVr9JMHzbxnINftllB
	kvml8XOWRovKpjgqUkDGgT26dKdfX4a8o65/XGMNBzcnpu68C2Ov8MBS+WA==
X-Received: by 2002:a05:622a:5507:b0:52d:41d0:89e0 with SMTP id
 d75a77b69052e-53036d2c227mr28091701cf.40.1788332368021; Tue, 01 Sep 2026
 23:59:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-ppp@vger.kernel.org
List-Id: <linux-ppp.vger.kernel.org>
List-Subscribe: <mailto:linux-ppp+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-ppp+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAPAw8HE6QgnePG=UUfU2d9mYXNpY2O_kp5v0J82VuVoR6gwWOg@mail.gmail.com>
In-Reply-To: <CAPAw8HE6QgnePG=UUfU2d9mYXNpY2O_kp5v0J82VuVoR6gwWOg@mail.gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 2 Sep 2026 08:59:17 +0200
X-Gm-Features: AcwNN1U02nwDwCEqUG4sFb4t_cF5nFyslgDL7EwSIZZtJOIgdGasms2FHyekyOE
Message-ID: <CANn89iKHVP_opOhoeNuVQEORu3_haw0+4Aao6RfB-kN=_fd5Pg@mail.gmail.com>
Subject: Re: [PATCH] ppp: make room for the filter tag instead of assuming it
To: Vlatko Kosturjak <vlatko.kosturjak@gmail.com>
Cc: linux-ppp@vger.kernel.org, netdev@vger.kernel.org, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 8:22=E2=80=AFAM Vlatko Kosturjak
<vlatko.kosturjak@gmail.com> wrote:
>
> ppp_receive_nonmp_frame() prepends a two-byte direction tag before runnin=
g
> the pass/active BPF filters:
>
>         *(__be16 *)skb_push(skb, 2) =3D htons(PPP_FILTER_INBOUND_TAG);
>
> Nothing on the receive path guarantees those two bytes of headroom, and a
> peer can arrange for only one to be available. ppp_async.c contributes tw=
o
> halves of the problem.
>
> First, the frame-error path resets a reused skb's headroom to zero while
> claiming to restore it to a freshly allocated state - but a fresh skb fro=
m
> dev_alloc_skb() carries NET_SKB_PAD:
>
>         err:
>                 if (skb) {
>                         /* make skb appear as freshly allocated */
>                         skb_trim(skb, 0);
>                         skb_reserve(skb, - skb_headroom(skb));
>                 }
>

Thanks for the patch and the reproducer.

The analysis of the panic is correct, but instead of working around
this root cause,
I think we should drop the packet (like ppp_synctty does).

Resetting headroom to 0 completely violates the NET_SKB_PAD guarantee
provided by dev_alloc_skb().

Not only does this lead to the filter panic you observed, but if CCP
compression is enabled, ppp_decompress_frame() passes `skb->data - 2`
to decompress()/incomp(), which reads out of bounds before skb->head.

Use in V2 : Fixes:1da177e4c3f4 ("Linux-2.6.12-rc2")

Also please target [PATCH net] in the subject prefix.

Please wait ~24 hours before sending a V2.

Thanks!

I am guessing the skb_reseve() could be replaced with skb_reserve(skb,
NET_SKB_PAD - skb_headroom(skb));

But IMO a drop would be better.

diff --git a/drivers/net/ppp/ppp_async.c b/drivers/net/ppp/ppp_async.c
index ea7fe9608ffd6580f584afd3c61cdd29e67474d3..6e6e2b9441285d6e16ee7610bd5=
9344b9e3d3e52
100644
--- a/drivers/net/ppp/ppp_async.c
+++ b/drivers/net/ppp/ppp_async.c
@@ -742,11 +742,8 @@ process_input_packet(struct asyncppp *ap)
  err:
        /* frame had an error, remember that, reset SC_TOSS & SC_ESCAPE */
        ap->state =3D SC_PREV_ERROR;
-       if (skb) {
-               /* make skb appear as freshly allocated */
-               skb_trim(skb, 0);
-               skb_reserve(skb, - skb_headroom(skb));
-       }
+       kfree_skb(skb);
+       ap->rpkt =3D NULL;
 }

 /* Called when the tty driver has data for us. Runs parallel with the
