From: Petr Slansky <slansky@usa.net>
Date: Tue, 14 Dec 2004 14:38:53 +0000
Subject: No xon/xoff support in Linux ppp driver?
Message-Id: <978iLNoM29696S07.1103035133@cmsweb07.cms.usa.net>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hello Paul,

do you know why no xon/xoff support is in Linux ppp kernel driver?

http://www.ussg.iu.edu/hypermail/linux/kernel/0307.3/0739.html
http://www.cs.helsinki.fi/linux/linux-kernel/2003-23/0103.html

It was big supprise for me yesterday when I found that Windows ppp client has
significantly better performance when I connect over GSM. I use Siemens mobile
and it has no wires for RTS/CTS handshaking and software data flow control
have to be used. Later I found with serial line analyser that Linux ignores
xoff characters send by mobile even pppd is configured to xonxoff mode.

I beleive this is a serious issue. Do you know why this feature is ignored in
Linux ppp driver for ages? I checked sources and cannot find xon/xoff support
in 2.4.27 and 2.6.9 kernels. Do you know why? Many mobile GSM phones have to
use software data flow control (only rx, tx and gnd wires, no rts and cts). I
found some patches on the internet but I cannot find those submited in the
kernel...

Thanks for your help,
Petr


---------------------------------
  Petr Slansky, slansky@usa.net
---------------------------------


