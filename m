From: Adrian Bunk <bunk@stusta.de>
Date: Fri, 18 Feb 2005 23:56:30 +0000
Subject: [2.6 patch] drivers/net/ppp_deflate.c: make 2 structs static
Message-Id: <20050218235630.GF4337@stusta.de>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jgarzik@pobox.com, paulus@samba.org
Cc: linux-ppp@vger.kernel.org, linux-net@vger.kernel.org, linux-kernel@vger.kernel.org

This patch makes two needlessly global structs static.

Signed-off-by: Adrian Bunk <bunk@stusta.de>

---

 drivers/net/ppp_deflate.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

--- linux-2.6.11-rc3-mm2-full/drivers/net/ppp_deflate.c.old	2005-02-16 18:06:29.000000000 +0100
+++ linux-2.6.11-rc3-mm2-full/drivers/net/ppp_deflate.c	2005-02-16 18:06:45.000000000 +0100
@@ -600,7 +600,7 @@
 /*
  * Procedures exported to if_ppp.c.
  */
-struct compressor ppp_deflate = {
+static struct compressor ppp_deflate = {
 	.compress_proto =	CI_DEFLATE,
 	.comp_alloc =		z_comp_alloc,
 	.comp_free =		z_comp_free,
@@ -618,7 +618,7 @@
 	.owner =		THIS_MODULE
 };
 
-struct compressor ppp_deflate_draft = {
+static struct compressor ppp_deflate_draft = {
 	.compress_proto =	CI_DEFLATE_DRAFT,
 	.comp_alloc =		z_comp_alloc,
 	.comp_free =		z_comp_free,

