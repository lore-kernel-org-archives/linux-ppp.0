From: Konstantin Sharlaimov <konstantin.sharlaimov@gmail.com>
Date: Fri, 01 Jun 2007 10:31:48 +0000
Subject: [PATCH 2.6.21.3] ppp_mppe: account for osize too small errors in
Message-Id: <465FF594.50901@gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Prevent mppe_decompress() from generating "osize too small" errors
when checking for output buffer size. When receiving a packet of mru
size the output buffer for decrypted data is 1 byte too small since
mppe_decompress() tries to account for possible PFC, however later
in code it is assumed no PFC.

Adjusting the check prevented there errors from occurring.

Signed-off-by: Konstantin Sharlaimov <konstantin.sharlaimov@gmail.com>
---
--- linux-2.6.21.3/drivers/net/ppp_mppe.c.orig  2007-06-01
20:57:04.000000000 +1100
+++ linux-2.6.21.3/drivers/net/ppp_mppe.c       2007-06-01
21:08:03.000000000 +1100
@@ -493,14 +493,14 @@ mppe_decompress(void *arg, unsigned char
 
        /*
         * Make sure we have enough room to decrypt the packet.
-        * Note that for our test we only subtract 1 byte whereas in
-        * mppe_compress() we added 2 bytes (+MPPE_OVHD);
-        * this is to account for possible PFC.
+        * To account for possible PFC we should only subtract 1
+        * byte whereas in mppe_compress() we added 2 bytes (+MPPE_OVHD);
+        * However, we assume no PFC, thus subtracting 2 bytes.
         */
-       if (osize < isize - MPPE_OVHD - 1) {
+       if (osize < isize - MPPE_OVHD - 2) {
                printk(KERN_DEBUG "mppe_decompress[%d]: osize too small! "
                       "(have: %d need: %d)\n", state->unit,
-                      osize, isize - MPPE_OVHD - 1);
+                      osize, isize - MPPE_OVHD - 2);
                return DECOMP_ERROR;
        }
        osize = isize - MPPE_OVHD - 2;  /* assume no PFC */

