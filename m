From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 22 Jul 2019 23:35:25 +0000
Subject: [PATCH] pppcrypt: Add headers for encrypt and setkey
Message-Id: <20190722233525.29203-1-rosenp@gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Fixes compilation with musl when building against strict C standard.
Implicit function declarations are a GNU extension.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 pppd/pppcrypt.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/pppd/pppcrypt.h b/pppd/pppcrypt.h
index adcdcbc..48d0d1a 100644
--- a/pppd/pppcrypt.h
+++ b/pppd/pppcrypt.h
@@ -41,6 +41,9 @@
 #include <des.h>
 #endif
 
+#include <stdlib.h>		/* for encrypt */
+#include <unistd.h>		/* for setkey */
+
 extern bool	DesSetkey __P((u_char *));
 extern bool	DesEncrypt __P((u_char *, u_char *));
 extern bool	DesDecrypt __P((u_char *, u_char *));
-- 
2.17.1
