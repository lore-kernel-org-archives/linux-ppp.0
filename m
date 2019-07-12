From: Eric Biggers <ebiggers@kernel.org>
Date: Fri, 12 Jul 2019 23:39:31 +0000
Subject: [PATCH net] ppp: mppe: Revert "ppp: mppe: Add softdep to arc4"
Message-Id: <20190712233931.17350-1-ebiggers@kernel.org>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, linux-ppp@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, Paul Mackerras <paulus@samba.org>
Cc: linux-crypto@vger.kernel.org, Takashi Iwai <tiwai@suse.de>, Ard Biesheuvel <ard.biesheuvel@linaro.org>

From: Eric Biggers <ebiggers@google.com>

Commit 0e5a610b5ca5 ("ppp: mppe: switch to RC4 library interface"),
which was merged through the crypto tree for v5.3, changed ppp_mppe.c to
use the new arc4_crypt() library function rather than access RC4 through
the dynamic crypto_skcipher API.

Meanwhile commit aad1dcc4f011 ("ppp: mppe: Add softdep to arc4") was
merged through the net tree and added a module soft-dependency on "arc4".

The latter commit no longer makes sense because the code now uses the
"libarc4" module rather than "arc4", and also due to the direct use of
arc4_crypt(), no module soft-dependency is required.

So revert the latter commit.

Cc: Takashi Iwai <tiwai@suse.de>
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 drivers/net/ppp/ppp_mppe.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ppp/ppp_mppe.c b/drivers/net/ppp/ppp_mppe.c
index bd3c80b0bc77d..de3b57d09d0cb 100644
--- a/drivers/net/ppp/ppp_mppe.c
+++ b/drivers/net/ppp/ppp_mppe.c
@@ -64,7 +64,6 @@ MODULE_AUTHOR("Frank Cusack <fcusack@fcusack.com>");
 MODULE_DESCRIPTION("Point-to-Point Protocol Microsoft Point-to-Point Encryption support");
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_ALIAS("ppp-compress-" __stringify(CI_MPPE));
-MODULE_SOFTDEP("pre: arc4");
 MODULE_VERSION("1.0.2");
 
 #define SHA1_PAD_SIZE 40
-- 
2.22.0
