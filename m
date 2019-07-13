From: David Miller <davem@davemloft.net>
Date: Sat, 13 Jul 2019 06:07:48 +0000
Subject: Re: [PATCH net] ppp: mppe: Revert "ppp: mppe: Add softdep to arc4"
Message-Id: <20190712.230748.1491964275720335140.davem@davemloft.net>
List-Id: <linux-ppp.vger.kernel.org>
References: <20190712233931.17350-1-ebiggers@kernel.org>
In-Reply-To: <20190712233931.17350-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ebiggers@kernel.org
Cc: netdev@vger.kernel.org, linux-ppp@vger.kernel.org, paulus@samba.org, linux-crypto@vger.kernel.org, tiwai@suse.de, ard.biesheuvel@linaro.org

From: Eric Biggers <ebiggers@kernel.org>
Date: Fri, 12 Jul 2019 16:39:31 -0700

> From: Eric Biggers <ebiggers@google.com>
> 
> Commit 0e5a610b5ca5 ("ppp: mppe: switch to RC4 library interface"),
> which was merged through the crypto tree for v5.3, changed ppp_mppe.c to
> use the new arc4_crypt() library function rather than access RC4 through
> the dynamic crypto_skcipher API.
> 
> Meanwhile commit aad1dcc4f011 ("ppp: mppe: Add softdep to arc4") was
> merged through the net tree and added a module soft-dependency on "arc4".
> 
> The latter commit no longer makes sense because the code now uses the
> "libarc4" module rather than "arc4", and also due to the direct use of
> arc4_crypt(), no module soft-dependency is required.
> 
> So revert the latter commit.
> 
> Cc: Takashi Iwai <tiwai@suse.de>
> Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Applied.
