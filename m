From: Dan Eble <dane@aiinet.com>
Date: Wed, 15 Sep 2004 14:01:31 +0000
Subject: more frugal pppd logging
Message-Id: <Pine.LNX.4.44.0409150953400.24957-100000@dane-linux.ai.aiinet.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

This change squelches repeated warning messages.  It does not affect debug
messages or more severe errors.  We need this change to avoid logging one
message per second when connected to a device that violates the RFC by
sending Protocol-Rejects for 802.1D spanning tree PDUs.

My guess is that this will apply cleanly to the latest pppd, but I have 
not tested it.

All comments are welcome, but note that I am not subscribed to this
mailing list.

-- 
Dan Eble <dane@aiinet.com>  _____  .
Software Engineer          |  _  |/|
Applied Innovation Inc.    | |_| | |
http://www.aiinet.com/     |__/|_|_|

--- pppd/pppd/utils.c	2004-09-15 09:33:27.000000000 -0400
+++ pppd/pppd/utils.c	2004-09-15 09:33:26.000000000 -0400
@@ -17,20 +17,21 @@
  * WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
  */
 
 #define RCSID	"$Id: utils.c,v 1.13 2001/03/16 02:08:13 paulus Exp $"
 
 #include <stdio.h>
 #include <ctype.h>
 #include <stdlib.h>
 #include <string.h>
 #include <unistd.h>
+#include <limits.h>
 #include <signal.h>
 #include <errno.h>
 #include <fcntl.h>
 #include <syslog.h>
 #include <netdb.h>
 #include <utmp.h>
 #include <pwd.h>
 #include <sys/param.h>
 #include <sys/types.h>
 #include <sys/wait.h>
@@ -613,21 +614,70 @@
 logit(level, prefix, fmt, args)
     int level;
     char *prefix;
     char *fmt;
     va_list args;
 {
     int n;
     char buf[1024];
 
     n = vslprintf(buf, sizeof(buf), fmt, args);
-    log_write(level, prefix, buf);
+
+    if (level = LOG_DEBUG) {
+        /* Always print all debug messages, and do not take them into account
+         * when squelching other repeated messages. */
+        log_write(level, prefix, buf);
+    } else {
+        /* When the same not-so-severe error message is logged many times
+         * consecutively, print it the first time only.  Then when a different
+         * message is logged, say how many times the previous message was
+         * repeated.  We also limit the size of the messages that can be handle
+         * like this, for systems which have a lot of PPP daemons running at
+         * once. */
+        static char prev_buf[160] = ""; /* sizeof(prev_buf) < sizeof(buf) */
+        static char prev_prefix[8] = "";
+        static unsigned prev_count = 0;
+        static int prev_level = LOG_DEBUG;
+
+        if ((level >= LOG_WARNING) && /* NB: more severe is numerically less */
+            (n < sizeof(prev_buf)) &&
+            (prev_level = level) &&
+            (0 = strncmp(prev_prefix, prefix, sizeof(prev_prefix))) &&
+            (0 = strncmp(prev_buf, buf, sizeof(prev_buf))) &&
+            (prev_count < UINT_MAX)) {
+            ++prev_count;
+        } else if (prev_count) {
+            /* Repeat the message once in case there are other messages
+             * interspersed with this one. Then tell how many times this
+             * message was squelched. */
+            log_write(prev_level, prev_prefix, prev_buf);
+            if (prev_count > 1) {
+                slprintf(prev_buf, sizeof(prev_buf),
+                         "last message repeated %u times\n", prev_count - 1);
+                log_write(prev_level, prev_prefix, prev_buf);
+            }
+            prev_count = 0;
+        }
+
+        if (!prev_count) {
+            log_write(level, prefix, buf);
+            prev_level = level;
+            if ((level >= LOG_WARNING) &&
+                (n < sizeof(prev_buf))) {
+                strncpy(prev_prefix, prefix, sizeof(prev_prefix));
+                memcpy(prev_buf, buf, n+sizeof((char)'\0'));
+            } else {
+                prev_prefix[0] = '\0';
+                prev_buf[0] = '\0';
+            }
+        }
+    }
 }
 
 static void
 log_write(level, prefix, buf)
     int level;
     char *prefix;
     char *buf;
 {
     syslog(level, "%s: %s", prefix, buf);
     if (log_to_fd >= 0 && (level != LOG_DEBUG || debug)) {

