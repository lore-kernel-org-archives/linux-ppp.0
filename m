From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Date: Thu, 26 Sep 2019 07:20:58 +0000
Subject: [PATCH 1/9] magic: remove K&R style of arguments
Message-Id: <1569482466-9551-2-git-send-email-dev.kurt@vandijck-laurijssen.be>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

The __P() macro does not exist in libmusl e.g.
I swicthed magic.{c,h} to using the std-c argument style, which had
already been used in some functions.

Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
---
 pppd/magic.c | 15 +++++++--------
 pppd/magic.h |  6 +++---
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/pppd/magic.c b/pppd/magic.c
index 2fb23ff..3f3ce32 100644
--- a/pppd/magic.c
+++ b/pppd/magic.c
@@ -53,8 +53,8 @@
 
 static const char rcsid[] = RCSID;
 
-extern long mrand48 __P((void));
-extern void srand48 __P((long));
+extern long mrand48 (void);
+extern void srand48 (long);
 
 /*
  * magic_init - Initialize the magic number generator.
@@ -64,7 +64,7 @@ extern void srand48 __P((long));
  * and current time, currently.
  */
 void
-magic_init()
+magic_init(void)
 {
     long seed;
     struct timeval t;
@@ -78,7 +78,7 @@ magic_init()
  * magic - Returns the next magic number.
  */
 u_int32_t
-magic()
+magic(void)
 {
     return (u_int32_t) mrand48();
 }
@@ -102,20 +102,19 @@ random_bytes(unsigned char *buf, int len)
  */
 
 double
-drand48()
+drand48(void)
 {
     return (double)random() / (double)0x7fffffffL; /* 2**31-1 */
 }
 
 long
-mrand48()
+mrand48(void)
 {
     return random();
 }
 
 void
-srand48(seedval)
-long seedval;
+srand48(long seedval)
 {
     srandom((int)seedval);
 }
diff --git a/pppd/magic.h b/pppd/magic.h
index c81213b..9d399e3 100644
--- a/pppd/magic.h
+++ b/pppd/magic.h
@@ -42,8 +42,8 @@
  * $Id: magic.h,v 1.5 2003/06/11 23:56:26 paulus Exp $
  */
 
-void magic_init __P((void));	/* Initialize the magic number generator */
-u_int32_t magic __P((void));	/* Returns the next magic number */
+void magic_init (void);	/* Initialize the magic number generator */
+u_int32_t magic (void);	/* Returns the next magic number */
 
 /* Fill buffer with random bytes */
-void random_bytes __P((unsigned char *buf, int len));
+void random_bytes (unsigned char *buf, int len);
-- 
1.8.5.rc3
