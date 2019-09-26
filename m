From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Date: Thu, 26 Sep 2019 07:21:05 +0000
Subject: [PATCH 8/9] make: avoid using host include for cross-compiling
Message-Id: <1569482466-9551-9-git-send-email-dev.kurt@vandijck-laurijssen.be>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Prepend include paths with the toolchain's sysroot directory.
In case of a non-sysroot-aware toolchain, this does not help,
but does not break either.

Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
---
 pppd/Makefile.linux | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/pppd/Makefile.linux b/pppd/Makefile.linux
index 8d5ce99..12a986e 100644
--- a/pppd/Makefile.linux
+++ b/pppd/Makefile.linux
@@ -125,7 +125,7 @@ CFLAGS   += -DHAS_SHADOW
 #LIBS     += -lshadow $(LIBS)
 endif
 
-ifneq ($(wildcard /usr/include/crypt.h),)
+ifneq ($(wildcard $(shell $CC --print-sysroot)/usr/include/crypt.h),)
 CFLAGS  += -DHAVE_CRYPT_H=1
 LIBS	+= -lcrypt
 endif
@@ -137,7 +137,7 @@ endif
 
 ifdef NEEDDES
 ifndef USE_CRYPT
-CFLAGS   += -I/usr/include/openssl
+CFLAGS   += -I$(shell $CC --print-sysroot)/usr/include/openssl
 LIBS     += -lcrypto
 else
 CFLAGS   += -DUSE_CRYPT=1
-- 
1.8.5.rc3
