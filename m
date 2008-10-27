From: "Jar" <jar@pcuf.fi>
Date: Mon, 27 Oct 2008 06:37:24 +0000
Subject: pppd and it's baud rate setting with HSDPA gsm modems
Message-Id: <57c6377703cbf5b94675e4331c5d03c6.squirrel@netlandzone.dyndns.org>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


Hello

I am using usbserial+option kernel modules with my HSDPA gsm modem. The
dialer is wvdial.

wvdial.conf

[Dialer Defaults]
Modem = /dev/ttyUSB0
Baud = 3600000
...
...

When I use "Baud = 3600000" in wvdial's config file, the pppd complains
"pppd[12246]: speed 3600000 not supported". But still I get the 1Mbit/s
download speed. However if I set "Baud = 460800" the I get also 1Mbit/s
download speed. But 460800bit/s < 1Mbit/s ??

Is this kind of "USB serial link" some special case, where pppd doesn't
use the speed setting at all?


-- 
Best Regards, Jar
