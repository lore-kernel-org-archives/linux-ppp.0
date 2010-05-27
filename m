From: Alexey Mahotkin <squadette@gmail.com>
Date: Thu, 27 May 2010 18:21:36 +0000
Subject: [PATCH 3/6] Implement ipv6cp-accept-remote
Message-Id: <1274984499-9633-3-git-send-email-squadette@gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

(Taken from Fedora ppp-2.4.3-ipv6-accept-remote.patch)
---
 pppd/ipv6cp.c |    5 ++++-
 pppd/ipv6cp.h |    3 ++-
 pppd/pppd.8   |    5 +++++
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/pppd/ipv6cp.c b/pppd/ipv6cp.c
index 2f9232d..3d63db6 100644
--- a/pppd/ipv6cp.c
+++ b/pppd/ipv6cp.c
@@ -235,6 +235,8 @@ static option_t ipv6cp_option_list[] = {
 
     { "ipv6cp-accept-local", o_bool, &ipv6cp_allowoptions[0].accept_local,
       "Accept peer's interface identifier for us", 1 },
+    { "ipv6cp-accept-remote", o_bool, &ipv6cp_allowoptions[0].accept_remote,
+      "Accept peer's interface identifier for itself", 1 },
 
     { "ipv6cp-use-ipaddr", o_bool, &ipv6cp_allowoptions[0].use_ip,
       "Use (default) IPv4 address as interface identifier", 1 },
@@ -427,6 +429,7 @@ ipv6cp_init(unit)
     memset(ao, 0, sizeof(*ao));
 
     wo->accept_local = 1;
+    wo->accept_remote = 1;
     wo->neg_ifaceid = 1;
     ao->neg_ifaceid = 1;
 
@@ -952,7 +955,7 @@ ipv6cp_reqci(f, inp, len, reject_if_disagree)
 		orc = CONFREJ;		/* Reject CI */
 		break;
 	    }
-	    if (!eui64_iszero(wo->hisid) && 
+	    if (!eui64_iszero(wo->hisid) && !wo->accept_remote &&
 		!eui64_equals(ifaceid, wo->hisid) && 
 		eui64_iszero(go->hisid)) {
 		    
diff --git a/pppd/ipv6cp.h b/pppd/ipv6cp.h
index cc4568d..8c7552e 100644
--- a/pppd/ipv6cp.h
+++ b/pppd/ipv6cp.h
@@ -150,7 +150,8 @@
 typedef struct ipv6cp_options {
     int neg_ifaceid;		/* Negotiate interface identifier? */
     int req_ifaceid;		/* Ask peer to send interface identifier? */
-    int accept_local;		/* accept peer's value for iface id? */
+    int accept_local;		/* accept peer's value for our iface id? */
+    int accept_remote;		/* accept peer's value for his iface id? */
     int opt_local;		/* ourtoken set by option */
     int opt_remote;		/* histoken set by option */
     int use_ip;			/* use IP as interface identifier */
diff --git a/pppd/pppd.8 b/pppd/pppd.8
index e75d2dd..b612e60 100644
--- a/pppd/pppd.8
+++ b/pppd/pppd.8
@@ -457,6 +457,11 @@ With this option, pppd will accept the peer's idea of our local IPv6
 interface identifier, even if the local IPv6 interface identifier
 was specified in an option.
 .TP
+.B ipv6cp\-accept\-remote
+With this option, pppd will accept the peer's idea of its (remote)
+IPv6 interface identifier, even if the remote IPv6 interface
+identifier was specified in an option.
+.TP
 .B ipv6cp\-max\-configure \fIn
 Set the maximum number of IPv6CP configure-request transmissions to
 \fIn\fR (default 10).
-- 
1.6.2.5

