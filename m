From: Libor Pechacek <lpechacek@suse.cz>
Date: Thu, 12 Nov 2009 16:52:55 +0000
Subject: [PATCH 3/3] man page update - default value of ipcp-max-failure
Message-Id: <20091112165255.GO30818@fm.suse.cz>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Default maximum number of IPCP NAKs received before sending REJs was changed to
100 by commit 29bdd4bc.

Signed-off-by: Libor Pechacek <lpechacek@suse.cz>
---
 pppd/pppd.8 |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/pppd/pppd.8 b/pppd/pppd.8
index 622ce97..03d128c 100644
--- a/pppd/pppd.8
+++ b/pppd/pppd.8
@@ -433,7 +433,7 @@ Set the maximum number of IPCP configure-request transmissions to
 .TP
 .B ipcp\-max\-failure \fIn
 Set the maximum number of IPCP configure-NAKs returned before starting
-to send configure-Rejects instead to \fIn\fR (default 10).  This option
+to send configure-Rejects instead to \fIn\fR (default 100).  This option
 applies to configure-NAKs received as well.
 .TP
 .B ipcp\-max\-terminate \fIn
-- 
1.6.0.2

