From: Mohan V <mohanv@aftek.com>
Date: Wed, 24 Nov 2004 05:49:40 +0000
Subject: Problem getting the PPP interface.
Message-Id: <41A4219C.20506@aftek.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hello All,

I am using a usb-char driver of linux-2.4.19-rmk7-pxa1 kernel for PPP. 
The host is 2.6.3 kernel(Mandrake 10). After plugging in the USB cable, 
I get the /dev/usb/acm/0 device on host. On the host side I type this 
command:
pppd -detach crtscts lock 192.168.100.2: /dev/usb/acm/0 38400

On the device side I use:
pppd -detach crtscts lock 192.168.100.1: /dev/usbchar 38400

But i don't get the PPP interface.

Log messages are:

Nov 22 15:56:13 mohan pppd[3051]: pppd 2.4.1 started by root, uid 0
Nov 22 15:56:13 mohan pppd[3051]: using channel 6
Nov 22 15:56:13 mohan pppd[3051]: Using interface ppp0
Nov 22 15:56:13 mohan pppd[3051]: Connect: ppp0 <--> /dev/usb/acm/0
Nov 22 15:56:13 mohan pppd[3051]: sent [LCP ConfReq id=0x1 <asyncmap 
0x0> <magic 0xd6d30db5> <pcomp> <accomp>]
Nov 22 15:56:40 mohan last message repeated 9 times
Nov 22 15:56:43 mohan pppd[3051]: Connection terminated.

On the device side I get:

usbctl: usb-char registered.
tcgetattr failed. unkown error 515.
usbctl: usb-char closed.

If I don't give the -detach crtscts lock options, I get the same 
messages on host side, but on device side, "tcgetattr failed" doesn't 
come. I just get:

usbctl: usb-char registered
usbctl: usb-char closed

I also used "passive" option(either on host or device), but with the 
same result.
So my questions are:
a) Can a usb-char device be used for PPP? If it can be used, what 
changes needs to be done to the char driver? Or only a driver with 
terminal interface be used for PPP?
b) Am I using wrong options to get the PPP interface?

Sorry for posting the query again and again, but I wanted to make myself 
clear.
Thanks in advance.

Regards,
mohan.
