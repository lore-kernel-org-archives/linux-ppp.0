From: joe@perches.com
Date: Mon, 13 Aug 2007 06:34:10 +0000
Subject: [PATCH] [384/2many] MAINTAINERS - PPP PROTOCOL DRIVERS AND
Message-Id: <46bffb62.YUHsMJB9NIlhwots%joe@perches.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: torvalds@linux-foundation.org, paulus@samba.org, linux-ppp@vger.kernel.org, linux-kernel@vger.kernel.org, akpm@linux-foundation.org

Add file pattern to MAINTAINER entry

Signed-off-by: Joe Perches <joe@perches.com>

diff --git a/MAINTAINERS b/MAINTAINERS
index 62354a9..70667e6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3679,6 +3679,7 @@ P:	Paul Mackerras
 M:	paulus@samba.org
 L:	linux-ppp@vger.kernel.org
 S:	Maintained
+F:	drivers/net/ppp_*
 
 PPP OVER ATM (RFC 2364)
 P:	Mitchell Blank Jr
