From: James Carlson <carlsonj@workingcode.com>
Date: Tue, 23 Nov 2004 16:10:52 +0000
Subject: Re: PPP using char device
Message-Id: <16803.24844.915285.461304@carlson.workingcode.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <41A336CD.8020608@aftek.com>
In-Reply-To: <41A336CD.8020608@aftek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Mohan V writes:
> Has anyone of you tried PPP over USB? I am using a usb-char device in 
> linux-2.4.19-rmk7-pxa1 kernel to get the PPP interface. But I am not 
> getting the PPP interface.  The usb-char driver is closed immediately 
> after registering.
> I use the command on the device side:
> pppd passive /dev/usbchar 38400 192.168.100.1:192.168.100.2 netmask 
> 255.255.255.0 noauth
> 
> On the host Linux(driver cdc-acm.c) I give the command:
> pppd /dev/usb/acm/0 38400 192.168.100.2:192.168.100.1 netmask 
> 255.255.255.0 noauth

Debug messages would be helpful here.

Note that 'netmask' doesn't really do much for point-to-point links.
The option is there for legacy reasons.

Also, it's not necessary to configure the IP addresses redundantly
like that.  You can configure them both on one side, or one on each
side.  (E.g., have "192.168.100.1:" on one system and "192.168.100.2:"
on the other.)

-- 
James Carlson                                 <carlsonj@workingcode.com>
