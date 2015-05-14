From: Douglas Gilbert <dgilbert@interlog.com>
Date: Thu, 14 May 2015 00:30:15 +0000
Subject: ppp over serial problems in lk 4.0.x
Message-Id: <5553EC97.7040001@interlog.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Since lk 4.0.0 came out running ppp connected to a serial
port (GPRS) has failed on my hardware (at91sam9g25 based ARM
system). It works in lk 3.19-rc4 which is the last kernel I
tried prior to lk 4.0.0 . The fix to ppp_generic.c in lk
4.0.2 did not help.

With older kernels I see:

...
chat[1760]: ATD*99***1#^M^M
chat[1760]: CONNECT
chat[1760]:  -- got it
chat[1760]: send (^M)
pppd[1758]: Serial connection established.
pppd[1758]: Using interface ppp0
...

and about 5 ppp related modules loaded including ppp_async.

With lk 4.0.x the "Serial connection established" line never
appears and only the ppp_generic module is loaded.

I get the same results (i.e. depends on the kernel version)
with both an up to date Debian 7 (wheezy) and a freshly
minted Debian 8 (jessie) system.

Doug Gilbert
