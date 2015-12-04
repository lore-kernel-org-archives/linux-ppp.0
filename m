From: Kirill Smirnov <kirill.k.smirnov@gmail.com>
Date: Fri, 04 Dec 2015 13:28:13 +0000
Subject: [PATCH] ppp: avoid hard-coded magic constants
Message-Id: <CAFbyWyeVfGJqKpaQBhdV6B_4ENPYYMuQWujjfJ_fsMM34HAi4w@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Use predefined macros for PPP address and control
instead of the hard-coded constants.

Signed-off-by: Kirill Smirnov <kirill.k.smirnov@gmail.com>
---
 drivers/net/ppp/ppp_async.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ppp/ppp_async.c b/drivers/net/ppp/ppp_async.c
index 9c889e0..d1eefef 100644
--- a/drivers/net/ppp/ppp_async.c
+++ b/drivers/net/ppp/ppp_async.c
@@ -571,10 +571,10 @@ ppp_async_encode(struct asyncppp *ap)
                 * Put in the address/control bytes if necessary
                 */
                if ((ap->flags & SC_COMP_AC) = 0 || islcp) {
-                       PUT_BYTE(ap, buf, 0xff, islcp);
-                       fcs = PPP_FCS(fcs, 0xff);
-                       PUT_BYTE(ap, buf, 0x03, islcp);
-                       fcs = PPP_FCS(fcs, 0x03);
+                       PUT_BYTE(ap, buf, PPP_ALLSTATIONS, islcp);
+                       fcs = PPP_FCS(fcs, PPP_ALLSTATIONS);
+                       PUT_BYTE(ap, buf, PPP_UI, islcp);
+                       fcs = PPP_FCS(fcs, PPP_UI);
                }
        }

-- 
2.6.3
