From: Kevin K <k_krieser@sbcglobal.net>
Date: Mon, 06 Aug 2007 22:45:39 +0000
Subject: sending raw packets via PPP
Message-Id: <35B9865F-38B4-4603-A2B7-F4ABACE5520F@sbcglobal.net>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org
Cc: Linux-kernel Mailing List <linux-kernel@vger.kernel.org>

Is it possible to send raw packets via ppp under Linux?

More specifically, in 2.4 series kernels such as RH's 2.4.21-47 kernel?

I've trying to modify the DHCP 3.0.1 code provided with RH 3 so I can  
send requests via a PPP connection (standard RS-232), and it is just  
being dropped by the stack according to ifconfig and debug statements  
in ppp_generic.c.

Thanks,
Kevin
