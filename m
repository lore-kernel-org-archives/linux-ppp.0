From: maximilian attems <janitor@sternwelten.at>
Date: Mon, 21 Jun 2004 19:45:37 +0000
Subject: [patch-kj] mark __init/__exit static  drivers/net/ppp_deflate
Message-Id: <20040621194537.GG1545@sputnik.stro.at>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


more static, applies on 2.6.7
compile tested

Signed-off-by: Maximilian Attems <janitor@sternwelten.at>


---

 linux-2.6.7-max/drivers/net/ppp_deflate.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff -puN drivers/net/ppp_deflate.c~static-ppp_deflate drivers/net/ppp_deflate.c
--- linux-2.6.7/drivers/net/ppp_deflate.c~static-ppp_deflate	2004-06-18 09:21:35.000000000 +0200
+++ linux-2.6.7-max/drivers/net/ppp_deflate.c	2004-06-18 09:21:35.000000000 +0200
@@ -636,7 +636,7 @@ struct compressor ppp_deflate_draft = {
 	.owner =		THIS_MODULE
 };
 
-int __init deflate_init(void)
+static int __init deflate_init(void)
 {  
         int answer = ppp_register_compressor(&ppp_deflate);
         if (answer = 0)
@@ -646,7 +646,7 @@ int __init deflate_init(void)
         return answer;
 }
      
-void __exit deflate_cleanup(void)
+static void __exit deflate_cleanup(void)
 {
 	ppp_unregister_compressor(&ppp_deflate);
 	ppp_unregister_compressor(&ppp_deflate_draft);


