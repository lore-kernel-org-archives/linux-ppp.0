From: Oleg Makarenko <mole@quadra.ru>
Date: Tue, 15 Jun 2004 20:00:42 +0000
Subject: Re: Fw: sha1 linux/mppe fix for 64-bit Linux
Message-Id: <40CF556A.6050403@quadra.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------020207060907010103000502"
List-Id: <linux-ppp.vger.kernel.org>
References: <20040615124206.00006526@ma1033>
In-Reply-To: <20040615124206.00006526@ma1033>
To: linux-ppp@vger.kernel.org

This is a multi-part message in MIME format.
--------------020207060907010103000502
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Guy,

Guy Rouillier wrote:

>The major set of changes was to convert long data types to data types
>with explicit length.  Basically, I changed longs to 32-bit data values
>and unsigned chars to 8-bit values.  
>

Do you really need to change unsigned char to u8? Does algorithm break 
without that change? Or are to trying to preform some optimization?

While it doesn't hirt to change unsigned char to u8 and unsigned 
int/long to u32 it only makes sense when the int/long size does matter.

int32_t i;

is not a good replacement for plain

int i;

it only makes reader wonder why in hell it does matter if i is only used 
in for (i = 0; i < 8; i++)

Agree?

For the  sha1.c code the only 4-bit unclean place is a macro definition 
for rol, blk0 and hence R0, R1 etc . These macros all expect 32-bits 
arguments (as you have found in your previous mails)

That is why the only needed change to make it work on AMD64 (and 
hopefully not to break it on other platforms) is

 SHA1_Transform(unsigned long state[5], const unsigned char buffer[64])
 {
-    unsigned long a, b, c, d, e;
+    u_int32_t a, b, c, d, e;
     typedef union {
        unsigned char c[64];
-       unsigned long l[16];
+       u_int32_t l[16];
     } CHAR64LONG16;
     CHAR64LONG16 *block;

(replace u_int32_t with u8 for linux code part).

That is the change (see attachment for the patch) I use for several days 
without any problems.

Why to change other (not broken) parts of code? Do you gain some 
speed/size/other benefits with your unsigned char->u8 changes?

>I also included a wrapper sha1()
>function that I found in later versions of the code by the author, Steve
>Reid.
>  
>

What is the point to define a new function sha1() that is never used in 
the code? Probably something else is missed from your patch?

It is better to read man etc for diff/patch usage but still here is a 
quick guide.

Try to get clean ppp code and save it to (say) ppp-cvs20040615/ 
directory, make the directory copy to something like ppp.orig/, make all 
your changes in the ppp-cvs20040615/ directory (for both linux/sha1.* 
and pppd/sha1.*  files) and then run

diff -urN ppp.orig ppp-cvs20040615 > guy-x86_64.patch

Hope that helps

And in case you've missed it there is a patch on pptp-devel list to get 
rid of sha1.c in kernel code. This patch doesn't work for me so I still 
use a trivial fix to sha1.c but it seems the way to go. Did you try it?

regards,
Oleg


--------------020207060907010103000502
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
 

--------------020207060907010103000502--
