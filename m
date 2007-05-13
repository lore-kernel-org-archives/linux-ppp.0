From: Oliver McBride <mcbride_oliver@yahoo.com>
Date: Sun, 13 May 2007 01:11:58 +0000
Subject: problem installing ppp
Message-Id: <10451321.post@talk.nabble.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


im using kernel 2.6.9 and its configurations do not support PPP.
unfortunately imnot allowed to change server config.
i get this error while running pppd:
This system lacks kernel support for PPP. This could be because the PPP
kernel module could not be loaded, or because PPP was not included in the
kernel configuration. If PPP was included as a module, try `/sbin/modprobe
-v ppp'. If that fails, check that ppp.o exists in /lib/modules/`uname
-r`/net. See README.linux file in the ppp distribution for more details.

i want to know if i can solve this problem without changing  server
config,for example by installing a rpm,or adding other files?
best regards
-- 
View this message in context: http://www.nabble.com/problem-installing-ppp-tf3733701.html#a10451321
Sent from the linux-ppp mailing list archive at Nabble.com.

