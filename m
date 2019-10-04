From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Date: Fri, 04 Oct 2019 17:40:46 +0000
Subject: [PATCH] time.h: include header before using time_t
Message-Id: <20191004174046.GA868@x1.vandijck-laurijssen.be>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On vr, 04 okt 2019 10:49:17 -0400, James Carlson wrote:
> On 10/04/19 10:29, Kurt Van Dijck wrote:
> > Now that I know that that file is used as include for kernel code, I'd
> > rather include time.h in the userspace c-files.
> 
> My point is that include/net/ isn't strictly userspace.
> 
> If you feel the need, then go ahead and include <time.h> in user level
> files.  This just isn't one of those.
> 
> If you must do this in ppp_def.h, then it needs to be guarded against
> *all* of the systems where including a top-level header file inside a
> kernel module is the wrong thing to do, not just "ifndef SOLARIS".  Do
> you know which systems those are?  I can tell you that Solaris/Illumos
> is at least one such system, but I can't tell you that it's *all* of them.
> 
> I think this include is out of place here.
ack

I think you confirm 4x what I said, but I probably expressed myself
badly, so "show me code!", I created this patch.
It (1) works for me and (2) does not mix userspace headers in kernel
space anywhere.
Would this work for you?

---
commit 567d505b1b8eff3d1579e849a4272d114f047bf3
Author: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Date:   Fri Oct 4 19:24:22 2019

    time.h: include header before using time_t
    
    Since include/net/ppp_defs.h is used in both kernelspace and userland
    makes it hard to put time.h include there.
    This commit fixes the problems in userspace code individually and leaves
    ppp_defs.h as-is.
    
    Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>

diff --git a/pppd/plugins/rp-pppoe/pppoe-discovery.c b/pppd/plugins/rp-pppoe/pppoe-discovery.c
index 8b2e946..f19c6d8 100644
--- a/pppd/plugins/rp-pppoe/pppoe-discovery.c
+++ b/pppd/plugins/rp-pppoe/pppoe-discovery.c
@@ -15,6 +15,7 @@
 #include <unistd.h>
 #include <errno.h>
 #include <string.h>
+#include <time.h>
 
 #include "pppoe.h"
 
diff --git a/pppd/sha1.c b/pppd/sha1.c
index f4f975c..4e51cee 100644
--- a/pppd/sha1.c
+++ b/pppd/sha1.c
@@ -17,6 +17,7 @@
 /* #define SHA1HANDSOFF * Copies data before messing with it. */
 
 #include <string.h>
+#include <time.h>
 #include <netinet/in.h>	/* htonl() */
 #include <net/ppp_defs.h>
 #include "sha1.h"
