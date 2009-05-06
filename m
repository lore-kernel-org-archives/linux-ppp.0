From: Andrew Watts <systemstalker@gmail.com>
Date: Wed, 06 May 2009 12:56:05 +0000
Subject: Configuring a PPP Half Bridge/IP Passthru
Message-Id: <e6e2252e0905060556i78481be5va8c84635e4c8e227@mail.gmail.com>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org, linux-kernel@vger.kernel.org

Hi,

Im trying to create a PPP Half-Bridge/ZIPB/IP-Passthru so that I can
pass through my public IP address to a device connected to the
ethernet interface of a device that uses a 3G modem for connectivity.
This product exists but I want to do it with my own hardware.  I have
an NSLU2 that I have connected to a 3G cellular into the USB port, I
then want to take the IP address from the resulting PPP and give it to
an embedded device so that it has a publicly routable IP address that
can be accessed directly.  Cradlepoint has such a device, I want to do
the exact same thing just with Linux :).  The link below explains what
I am try to do as well including the product in question.  I cant
bridge a PPP interface to an Ethernet interface, if I had to do that
where would I start to make modifications to the kernel?

http://store.drwireless.com/crceippabrad.html

Anyone have any Idea how I might do that?
