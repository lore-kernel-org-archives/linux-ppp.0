From: Alexey Mahotkin <squadette@gmail.com>
Date: Thu, 27 May 2010 18:21:34 +0000
Subject: [PATCH 1/6] Remove unused code, fix compilation warnings
Message-Id: <1274984499-9633-1-git-send-email-squadette@gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Partially taken from ppp-2.4.3-fix.patch in Fedora RPM

pppd/utils.c: Fedora even patches this code in ppp-2.4.1-varargs.patch,
even though it is not used
---
 pppd/ipv6cp.c      |    5 ++++-
 pppd/utils.c       |   13 -------------
 pppdump/bsd-comp.c |    8 ++++----
 pppdump/deflate.c  |    5 +++--
 pppdump/pppdump.c  |    5 +++--
 5 files changed, 14 insertions(+), 22 deletions(-)

diff --git a/pppd/ipv6cp.c b/pppd/ipv6cp.c
index 4a09c9a..2f9232d 100644
--- a/pppd/ipv6cp.c
+++ b/pppd/ipv6cp.c
@@ -151,6 +151,7 @@
  */
 
 #include <stdio.h>
+#include <stdlib.h>
 #include <string.h>
 #include <unistd.h>
 #include <netdb.h>
@@ -1064,7 +1065,9 @@ endswitch:
     return (rc);			/* Return final code */
 }
 
-
+#if defined(SOL2) || defined(__linux__)
+int ether_to_eui64(eui64_t *p_eui64);
+#endif
 /*
  * ipv6_check_options - check that any IP-related options are OK,
  * and assign appropriate defaults.
diff --git a/pppd/utils.c b/pppd/utils.c
index 062b17e..cf30f69 100644
--- a/pppd/utils.c
+++ b/pppd/utils.c
@@ -287,19 +287,6 @@ vslprintf(buf, buflen, fmt, args)
 		     (ip >> 16) & 0xff, (ip >> 8) & 0xff, ip & 0xff);
 	    str = num;
 	    break;
-#if 0	/* not used, and breaks on S/390, apparently */
-	case 'r':
-	    f = va_arg(args, char *);
-#ifndef __powerpc__
-	    n = vslprintf(buf, buflen + 1, f, va_arg(args, va_list));
-#else
-	    /* On the powerpc, a va_list is an array of 1 structure */
-	    n = vslprintf(buf, buflen + 1, f, va_arg(args, void *));
-#endif
-	    buf += n;
-	    buflen -= n;
-	    continue;
-#endif
 	case 't':
 	    time(&t);
 	    str = ctime(&t);
diff --git a/pppdump/bsd-comp.c b/pppdump/bsd-comp.c
index 1413326..4c504a4 100644
--- a/pppdump/bsd-comp.c
+++ b/pppdump/bsd-comp.c
@@ -383,7 +383,7 @@ bsd_init(db, options, opt_len, unit, hdrlen, mru, debug, decomp)
 	|| options[0] != CI_BSD_COMPRESS || options[1] != CILEN_BSD_COMPRESS
 	|| BSD_VERSION(options[2]) != BSD_CURRENT_VERSION
 	|| BSD_NBITS(options[2]) != db->maxbits
-	|| decomp && db->lens = NULL)
+	|| (decomp && db->lens = NULL))
 	return 0;
 
     if (decomp) {
@@ -556,11 +556,11 @@ bsd_decompress(state, cmsg, inlen, dmp, outlenp)
     u_int n_bits = db->n_bits;
     u_int tgtbitno = 32-n_bits;	/* bitno when we have a code */
     struct bsd_dict *dictp;
-    int explen, i, seq, len;
+    int explen, seq, len;
     u_int incode, oldcode, finchar;
     u_char *p, *rptr, *wptr;
     int ilen;
-    int dlen, space, codelen, extra;
+    int dlen=0, codelen, extra;
 
     rptr = cmsg;
     if (*rptr = 0)
@@ -616,7 +616,7 @@ bsd_decompress(state, cmsg, inlen, dmp, outlenp)
 	}
 
 	if (incode > max_ent + 2 || incode > db->maxmaxcode
-	    || incode > max_ent && oldcode = CLEAR) {
+	    || (incode > max_ent && oldcode = CLEAR)) {
 	    if (db->debug) {
 		printf("bsd_decomp%d: bad code 0x%x oldcode=0x%x ",
 		       db->unit, incode, oldcode);
diff --git a/pppdump/deflate.c b/pppdump/deflate.c
index 0136966..32c7528 100644
--- a/pppdump/deflate.c
+++ b/pppdump/deflate.c
@@ -39,6 +39,7 @@
 #include <sys/types.h>
 #include <stdio.h>
 #include <stddef.h>
+#include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
 #include "ppp_defs.h"
@@ -237,8 +238,8 @@ z_decompress(arg, mi, inlen, mo, outlenp)
 {
     struct deflate_state *state = (struct deflate_state *) arg;
     u_char *rptr, *wptr;
-    int rlen, olen, ospace;
-    int seq, i, flush, r, decode_proto;
+    int rlen, olen;
+    int seq, r;
 
     rptr = mi;
     if (*rptr = 0)
diff --git a/pppdump/pppdump.c b/pppdump/pppdump.c
index 95e692c..901a937 100644
--- a/pppdump/pppdump.c
+++ b/pppdump/pppdump.c
@@ -34,6 +34,7 @@
  * OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
  */
 #include <stdio.h>
+#include <stdlib.h>
 #include <unistd.h>
 #include <stdlib.h>
 #include <time.h>
@@ -191,7 +192,7 @@ dumplog(f)
 	    show_time(f, c);
 	    break;
 	default:
-	    printf("?%.2x\n");
+	    printf("?%.2x\n", c);
 	}
     }
 }
@@ -421,7 +422,7 @@ dumpppp(f)
 	    show_time(f, c);
 	    break;
 	default:
-	    printf("?%.2x\n");
+	    printf("?%.2x\n", c);
 	}
     }
 }
-- 
1.6.2.5

