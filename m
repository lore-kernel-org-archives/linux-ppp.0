From: mole <mole@quadra.ru>
Date: Tue, 08 Jun 2004 07:16:14 +0000
Subject: pppd segfaults on AMD64 with ms-chap
Message-Id: <40C59FC1.6070007@quadra.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------080705030607070807020601"
List-Id: <linux-ppp.vger.kernel.org>
To: linux-ppp@vger.kernel.org

This is a multi-part message in MIME format.
--------------080705030607070807020601
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

I am new to this list, sorry if this problem is already solved.

I have tried to use pptp on fedora Core 2 for AMD64 and found that pppd 
segfaults on my machine when ms-chap is in use.

If pppd is compiled with openssl's sha then pppd doesn't segfault on 
authentication but mppe-enabled kernel then gives me oops in mppe sha code.

The same kernel/pppd work fine in 32 bit mode.

The problem proved to be in the broken sha1 implementation that assumes 
that unsigned long is 32-bit wide.

The quick/minimal change to make it all work in 64-bit mode is in the 
attached patch. But it looks like the code needs more cleanups to make 
it obviously 64-bit safe.

Best,
Oleg Makarenko







--------------080705030607070807020601
Content-Type: text/plain;
 name="pppd-x86_64.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="pppd-x86_64.patch"

diff -urN ppp-2.4.2_cvs_20030610.orig/linux/mppe/sha1.c ppp-2.4.2_cvs_20030610/linux/mppe/sha1.c
--- ppp-2.4.2_cvs_20030610.orig/linux/mppe/sha1.c	2002-04-02 18:01:37.000000000 +0400
+++ ppp-2.4.2_cvs_20030610/linux/mppe/sha1.c	2004-06-08 14:55:46.000000000 +0400
@@ -19,6 +19,7 @@
 #if defined(__linux__)
 #include <asm/byteorder.h>
 #include <linux/string.h>
+#include <linux/types.h>
 #else if defined(__solaris__)
 #include <sys/isa_defs.h>
 #include <sys/ddi.h>
@@ -59,10 +60,10 @@
 static void
 SHA1_Transform(unsigned long state[5], const unsigned char buffer[64])
 {
-    unsigned long a, b, c, d, e;
+    u32 a, b, c, d, e;
     typedef union {
 	unsigned char c[64];
-	unsigned long l[16];
+	u32 l[16];
     } CHAR64LONG16;
     CHAR64LONG16 *block;
 
diff -urN ppp-2.4.2_cvs_20030610.orig/pppd/sha1.c ppp-2.4.2_cvs_20030610/pppd/sha1.c
--- ppp-2.4.2_cvs_20030610.orig/pppd/sha1.c	2002-04-02 17:54:59.000000000 +0400
+++ ppp-2.4.2_cvs_20030610/pppd/sha1.c	2004-06-08 14:54:44.000000000 +0400
@@ -18,6 +18,7 @@
 
 #include <string.h>
 #include <netinet/in.h>	/* htonl() */
+#include <sys/types.h>	/* u_int32_t */
 #include "sha1.h"
 
 static void
@@ -44,10 +45,10 @@
 static void
 SHA1_Transform(unsigned long state[5], const unsigned char buffer[64])
 {
-    unsigned long a, b, c, d, e;
+    u_int32_t a, b, c, d, e;
     typedef union {
 	unsigned char c[64];
-	unsigned long l[16];
+	u_int32_t l[16];
     } CHAR64LONG16;
     CHAR64LONG16 *block;
 

--------------080705030607070807020601--
