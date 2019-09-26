From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Date: Thu, 26 Sep 2019 07:21:03 +0000
Subject: [PATCH 6/9] pppd: remove unused rcsid variables
Message-Id: <1569482466-9551-7-git-send-email-dev.kurt@vandijck-laurijssen.be>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
---
 pppd/auth.c        | 1 -
 pppd/cbcp.c        | 1 -
 pppd/ccp.c         | 1 -
 pppd/chap_ms.c     | 1 -
 pppd/demand.c      | 1 -
 pppd/eap.c         | 1 -
 pppd/ecp.c         | 1 -
 pppd/eui64.c       | 1 -
 pppd/fsm.c         | 1 -
 pppd/ipcp.c        | 1 -
 pppd/ipv6cp.c      | 1 -
 pppd/ipxcp.c       | 1 -
 pppd/lcp.c         | 1 -
 pppd/magic.c       | 1 -
 pppd/main.c        | 1 -
 pppd/options.c     | 1 -
 pppd/sys-solaris.c | 1 -
 pppd/upap.c        | 1 -
 pppd/utils.c       | 1 -
 19 files changed, 19 deletions(-)

diff --git a/pppd/auth.c b/pppd/auth.c
index 7457eda..f5c9acd 100644
--- a/pppd/auth.c
+++ b/pppd/auth.c
@@ -119,7 +119,6 @@
 #include "pathnames.h"
 #include "session.h"
 
-static const char rcsid[] = RCSID;
 
 /* Bits in scan_authfile return value */
 #define NONWILD_SERVER	1
diff --git a/pppd/cbcp.c b/pppd/cbcp.c
index 7f2f787..f735ab9 100644
--- a/pppd/cbcp.c
+++ b/pppd/cbcp.c
@@ -45,7 +45,6 @@
 #include "fsm.h"
 #include "lcp.h"
 
-static const char rcsid[] = RCSID;
 
 /*
  * Options.
diff --git a/pppd/ccp.c b/pppd/ccp.c
index 7d7922a..61947d9 100644
--- a/pppd/ccp.c
+++ b/pppd/ccp.c
@@ -43,7 +43,6 @@
 #include "lcp.h"	/* lcp_close(), lcp_fsm */
 #endif
 
-static const char rcsid[] = RCSID;
 
 /*
  * Unfortunately there is a bug in zlib which means that using a
diff --git a/pppd/chap_ms.c b/pppd/chap_ms.c
index c2bd00f..1de5042 100644
--- a/pppd/chap_ms.c
+++ b/pppd/chap_ms.c
@@ -94,7 +94,6 @@
 #include "pppcrypt.h"
 #include "magic.h"
 
-static const char rcsid[] = RCSID;
 
 
 static void	ascii2unicode __P((char[], int, u_char[]));
diff --git a/pppd/demand.c b/pppd/demand.c
index 5e57658..72e379c 100644
--- a/pppd/demand.c
+++ b/pppd/demand.c
@@ -52,7 +52,6 @@
 #include "ipcp.h"
 #include "lcp.h"
 
-static const char rcsid[] = RCSID;
 
 char *frame;
 int framelen;
diff --git a/pppd/eap.c b/pppd/eap.c
index 6ea6c1f..94407f5 100644
--- a/pppd/eap.c
+++ b/pppd/eap.c
@@ -76,7 +76,6 @@
 #define	SHA_DIGESTSIZE 20
 #endif
 
-static const char rcsid[] = RCSID;
 
 eap_state eap_states[NUM_PPP];		/* EAP state; one for each unit */
 #ifdef USE_SRP
diff --git a/pppd/ecp.c b/pppd/ecp.c
index e5754e5..dada8e6 100644
--- a/pppd/ecp.c
+++ b/pppd/ecp.c
@@ -59,7 +59,6 @@
 
 #define RCSID	"$Id: ecp.c,v 1.4 2004/11/04 10:02:26 paulus Exp $"
 
-static const char rcsid[] = RCSID;
 
 #include <string.h>
 
diff --git a/pppd/eui64.c b/pppd/eui64.c
index d025eff..e7be0e1 100644
--- a/pppd/eui64.c
+++ b/pppd/eui64.c
@@ -39,7 +39,6 @@
 
 #include "pppd.h"
 
-static const char rcsid[] = RCSID;
 
 /*
  * eui64_ntoa - Make an ascii representation of an interface identifier
diff --git a/pppd/fsm.c b/pppd/fsm.c
index e9bd34f..d78ef79 100644
--- a/pppd/fsm.c
+++ b/pppd/fsm.c
@@ -55,7 +55,6 @@
 #include "pppd.h"
 #include "fsm.h"
 
-static const char rcsid[] = RCSID;
 
 static void fsm_timeout __P((void *));
 static void fsm_rconfreq __P((fsm *, int, u_char *, int));
diff --git a/pppd/ipcp.c b/pppd/ipcp.c
index e9738fe..e47ca78 100644
--- a/pppd/ipcp.c
+++ b/pppd/ipcp.c
@@ -61,7 +61,6 @@
 #include "ipcp.h"
 #include "pathnames.h"
 
-static const char rcsid[] = RCSID;
 
 /* global vars */
 ipcp_options ipcp_wantoptions[NUM_PPP];	/* Options that we want to request */
diff --git a/pppd/ipv6cp.c b/pppd/ipv6cp.c
index 356ff84..f9badc1 100644
--- a/pppd/ipv6cp.c
+++ b/pppd/ipv6cp.c
@@ -168,7 +168,6 @@
 #include "magic.h"
 #include "pathnames.h"
 
-static const char rcsid[] = RCSID;
 
 /* global vars */
 ipv6cp_options ipv6cp_wantoptions[NUM_PPP];     /* Options that we want to request */
diff --git a/pppd/ipxcp.c b/pppd/ipxcp.c
index aaff10f..04605b1 100644
--- a/pppd/ipxcp.c
+++ b/pppd/ipxcp.c
@@ -62,7 +62,6 @@
 #include "pathnames.h"
 #include "magic.h"
 
-static const char rcsid[] = RCSID;
 
 /* global vars */
 ipxcp_options ipxcp_wantoptions[NUM_PPP];	/* Options that we want to request */
diff --git a/pppd/lcp.c b/pppd/lcp.c
index 8ed2778..625d2f7 100644
--- a/pppd/lcp.c
+++ b/pppd/lcp.c
@@ -56,7 +56,6 @@
 #include "chap-new.h"
 #include "magic.h"
 
-static const char rcsid[] = RCSID;
 
 /*
  * When the link comes up we want to be able to wait for a short while,
diff --git a/pppd/magic.c b/pppd/magic.c
index 3f3ce32..e8bb71f 100644
--- a/pppd/magic.c
+++ b/pppd/magic.c
@@ -51,7 +51,6 @@
 #include "pppd.h"
 #include "magic.h"
 
-static const char rcsid[] = RCSID;
 
 extern long mrand48 (void);
 extern void srand48 (long);
diff --git a/pppd/main.c b/pppd/main.c
index e09b6ff..b0d772b 100644
--- a/pppd/main.c
+++ b/pppd/main.c
@@ -121,7 +121,6 @@
 #include "atcp.h"
 #endif
 
-static const char rcsid[] = RCSID;
 
 /* interface vars */
 char ifname[MAXIFNAMELEN];	/* Interface name */
diff --git a/pppd/options.c b/pppd/options.c
index 5db580a..5e1489f 100644
--- a/pppd/options.c
+++ b/pppd/options.c
@@ -79,7 +79,6 @@
 char *strdup __P((char *));
 #endif
 
-static const char rcsid[] = RCSID;
 
 struct option_value {
     struct option_value *next;
diff --git a/pppd/sys-solaris.c b/pppd/sys-solaris.c
index 93d9033..633cf5f 100644
--- a/pppd/sys-solaris.c
+++ b/pppd/sys-solaris.c
@@ -166,7 +166,6 @@
 #define	UDP6_DEV_NAME	"/dev/udp6"
 #endif /* !defined(UDP6_DEV_NAME) && defined(SOL2) */
 
-static const char rcsid[] = RCSID;
 
 #if defined(SOL2)
 /*
diff --git a/pppd/upap.c b/pppd/upap.c
index 8a73621..8733533 100644
--- a/pppd/upap.c
+++ b/pppd/upap.c
@@ -52,7 +52,6 @@
 #include "pppd.h"
 #include "upap.h"
 
-static const char rcsid[] = RCSID;
 
 static bool hide_password = 1;
 
diff --git a/pppd/utils.c b/pppd/utils.c
index 3ac1b60..12ae21a 100644
--- a/pppd/utils.c
+++ b/pppd/utils.c
@@ -59,7 +59,6 @@
 #include "fsm.h"
 #include "lcp.h"
 
-static const char rcsid[] = RCSID;
 
 #if defined(SUNOS4)
 extern char *strerror();
-- 
1.8.5.rc3
