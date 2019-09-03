From: Baolin Wang <baolin.wang@linaro.org>
Date: Tue, 03 Sep 2019 07:00:38 +0000
Subject: [BACKPORT 4.14.y 7/8] ppp: mppe: Revert "ppp: mppe: Add softdep to arc4"
Message-Id: <f4b1ac760bbae28721996034be7198458aa68523.1567492316.git.baolin.wang@linaro.org>
List-Id: <linux-ppp.vger.kernel.org>
References: <cover.1567492316.git.baolin.wang@linaro.org>
In-Reply-To: <cover.1567492316.git.baolin.wang@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: stable@vger.kernel.org, paulus@samba.org
Cc: ebiggers@google.com, linux-ppp@vger.kernel.org, netdev@vger.kernel.org, arnd@arndb.de, baolin.wang@linaro.org, orsonzhai@gmail.com, vincent.guittot@linaro.org, linux-kernel@vger.kernel.org

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
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
 drivers/net/ppp/ppp_mppe.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ppp/ppp_mppe.c b/drivers/net/ppp/ppp_mppe.c
index d9eda7c..6c7fd98 100644
--- a/drivers/net/ppp/ppp_mppe.c
+++ b/drivers/net/ppp/ppp_mppe.c
@@ -63,7 +63,6 @@
 MODULE_DESCRIPTION("Point-to-Point Protocol Microsoft Point-to-Point Encryption support");
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_ALIAS("ppp-compress-" __stringify(CI_MPPE));
-MODULE_SOFTDEP("pre: arc4");
 MODULE_VERSION("1.0.2");
 
 static unsigned int
-- 
1.7.9.5
