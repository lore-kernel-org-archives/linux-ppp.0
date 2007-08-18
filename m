From: Stephen Hemminger <shemminger@linux-foundation.org>
Date: Sat, 18 Aug 2007 01:42:26 +0000
Subject: [PATCH] slhc: sparse warning fix
Message-Id: <20070817184226.66622720@freepuppy.rosehill.hemminger.net>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Two functions are declared "static" in forward declaration, but not in
the actual code, so sparse complains.

Signed-off-by: Stephen Hemminger <shemminger@linux-foundation.org>

--- a/drivers/net/slhc.c	2007-08-06 04:25:48.000000000 -0400
+++ b/drivers/net/slhc.c	2007-08-17 14:55:24.000000000 -0400
@@ -174,7 +174,7 @@ put16(unsigned char *cp, unsigned short 
 
 
 /* Encode a number */
-unsigned char *
+static unsigned char *
 encode(unsigned char *cp, unsigned short n)
 {
 	if(n >= 256 || n = 0){
@@ -199,7 +199,7 @@ pull16(unsigned char **cpp)
 }
 
 /* Decode a number */
-long
+static long
 decode(unsigned char **cpp)
 {
 	register int x;
