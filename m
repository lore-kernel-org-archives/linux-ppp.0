From: Libor Pechacek <lpechacek@suse.cz>
Date: Thu, 12 Nov 2009 16:50:25 +0000
Subject: [PATCH 1/3] man page update - default value of *-max-failure
Message-Id: <20091112165025.GM30818@fm.suse.cz>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Default maximum number of NAKs received before sending REJs was changed to 5 by
commit e9543fef.  There does not seem to be a special value for IPX, therefore
I change 3 to 5 for ipxcp-max-failure too.

Signed-off-by: Libor Pechacek <lpechacek@suse.cz>
---
 pppd/pppd.8 |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/pppd/pppd.8 b/pppd/pppd.8
index 8ea8200..47c5c40 100644
--- a/pppd/pppd.8
+++ b/pppd/pppd.8
@@ -455,7 +455,7 @@ Set the maximum number of IPv6CP configure-request transmissions to
 .TP
 .B ipv6cp\-max\-failure \fIn
 Set the maximum number of IPv6CP configure-NAKs returned before starting
-to send configure-Rejects instead to \fIn\fR (default 10).
+to send configure-Rejects instead to \fIn\fR (default 5).
 .TP
 .B ipv6cp\-max\-terminate \fIn
 Set the maximum number of IPv6CP terminate-request transmissions to
@@ -522,7 +522,7 @@ system will send to \fIn\fR. The default is 10.
 .TP
 .B ipxcp\-max\-failure \fIn
 Set the maximum number of IPXCP NAK frames which the local system will
-send before it rejects the options. The default value is 3.
+send before it rejects the options. The default value is 5.
 .TP
 .B ipxcp\-max\-terminate \fIn
 Set the maximum nuber of IPXCP terminate request frames before the
@@ -572,7 +572,7 @@ Set the maximum number of LCP configure-request transmissions to
 .TP
 .B lcp\-max\-failure \fIn
 Set the maximum number of LCP configure-NAKs returned before starting
-to send configure-Rejects instead to \fIn\fR (default 10).
+to send configure-Rejects instead to \fIn\fR (default 5).
 .TP
 .B lcp\-max\-terminate \fIn
 Set the maximum number of LCP terminate-request transmissions to
-- 
1.6.0.2

