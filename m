From: Mohan V <mohanv@aftek.com>
Date: Tue, 23 Nov 2004 13:22:37 +0000
Subject: PPP using char device
Message-Id: <41A336CD.8020608@aftek.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Hello All,

Has anyone of you tried PPP over USB? I am using a usb-char device in 
linux-2.4.19-rmk7-pxa1 kernel to get the PPP interface. But I am not 
getting the PPP interface.  The usb-char driver is closed immediately 
after registering.
I use the command on the device side:
pppd passive /dev/usbchar 38400 192.168.100.1:192.168.100.2 netmask 
255.255.255.0 noauth

On the host Linux(driver cdc-acm.c) I give the command:
pppd /dev/usb/acm/0 38400 192.168.100.2:192.168.100.1 netmask 
255.255.255.0 noauth

Thanks in advance,
regards,
mohan
