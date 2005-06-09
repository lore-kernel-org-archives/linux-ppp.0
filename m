From: magicfox <magicfox@magic.fr>
Date: Thu, 09 Jun 2005 08:23:58 +0000
Subject: Kernel 2.4.x  with CONFIG_PPP_FILTER (warning remove)
Message-Id: <42A7FC9E.3020907@magic.fr>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Dears,

uprog.len is defined in struct as unsigned short and can't be > 65535.
May be this legitime warning may be removed.

ppp_generic.c: In function `ppp_ioctl':
ppp_generic.c:662: warning: comparison is always true due to limited
range of data type

-               if (uprog.len > 0 && uprog.len < 65536) {
+               if (uprog.len > 0) {

Best regards.
