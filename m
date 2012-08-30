From: Charlie Brady <charlieb-linux-ppp@budge.apana.org.au>
Date: Thu, 30 Aug 2012 23:24:00 +0000
Subject: [PATCH] ppp: ignore unrecognised radiusclient configuration directives
Message-Id: <Pine.LNX.4.64.1208301919580.27411@e-smith.charlieb.ott.istop.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


New versions of freeradius occasionally add configuration keywords. 
There's no reason that the pppd plugin should fail when that occurs.

Signed-off-by:  Charlie Brady <charlieb@budge.apana.org.au>

--- ppp-2.4.5.rhel6/pppd/plugins/radius/config.c        2009-11-16 17:26:07.000000000 -0500
+++ ppp-2.4.5/pppd/plugins/radius/config.c      2012-08-30 16:59:19.911025000 -0400
@@ -216,8 +216,8 @@
                p[pos] = '\0';
 
                if ((option = find_option(p, OT_ANY)) = NULL) {
-                       error("%s: line %d: unrecognized keyword: %s", filename, line, p);
-                       return (-1);
+                       warn("%s: line %d: unrecognized keyword: %s", filename, line, p);
+                       continue;
                }
 
                if (option->status != ST_UNDEF) {

