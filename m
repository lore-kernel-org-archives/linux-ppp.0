From: Libor Pechacek <lpechacek@suse.cz>
Date: Thu, 12 Nov 2009 16:51:51 +0000
Subject: [PATCH 2/3] man page update - meaning of *-max-failure
Message-Id: <20091112165151.GN30818@fm.suse.cz>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

The *-max-failure values are used not only for the configure-NAKs sent, but
also for NAKs received - see commit ec27e674.

Signed-off-by: Libor Pechacek <lpechacek@suse.cz>
---
 pppd/pppd.8 |   12 ++++++++----
 1 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/pppd/pppd.8 b/pppd/pppd.8
index 47c5c40..622ce97 100644
--- a/pppd/pppd.8
+++ b/pppd/pppd.8
@@ -433,7 +433,8 @@ Set the maximum number of IPCP configure-request transmissions to
 .TP
 .B ipcp\-max\-failure \fIn
 Set the maximum number of IPCP configure-NAKs returned before starting
-to send configure-Rejects instead to \fIn\fR (default 10).
+to send configure-Rejects instead to \fIn\fR (default 10).  This option
+applies to configure-NAKs received as well.
 .TP
 .B ipcp\-max\-terminate \fIn
 Set the maximum number of IPCP terminate-request transmissions to
@@ -455,7 +456,8 @@ Set the maximum number of IPv6CP configure-request transmissions to
 .TP
 .B ipv6cp\-max\-failure \fIn
 Set the maximum number of IPv6CP configure-NAKs returned before starting
-to send configure-Rejects instead to \fIn\fR (default 5).
+to send configure-Rejects instead to \fIn\fR (default 5).  This option
+applies to configure-NAKs received as well.
 .TP
 .B ipv6cp\-max\-terminate \fIn
 Set the maximum number of IPv6CP terminate-request transmissions to
@@ -522,7 +524,8 @@ system will send to \fIn\fR. The default is 10.
 .TP
 .B ipxcp\-max\-failure \fIn
 Set the maximum number of IPXCP NAK frames which the local system will
-send before it rejects the options. The default value is 5.
+send before it rejects the options. The default value is 5.  This option
+applies to configure-NAKs received as well.
 .TP
 .B ipxcp\-max\-terminate \fIn
 Set the maximum nuber of IPXCP terminate request frames before the
@@ -572,7 +575,8 @@ Set the maximum number of LCP configure-request transmissions to
 .TP
 .B lcp\-max\-failure \fIn
 Set the maximum number of LCP configure-NAKs returned before starting
-to send configure-Rejects instead to \fIn\fR (default 5).
+to send configure-Rejects instead to \fIn\fR (default 5).  This option
+applies to configure-NAKs received as well.
 .TP
 .B lcp\-max\-terminate \fIn
 Set the maximum number of LCP terminate-request transmissions to
-- 
1.6.0.2

