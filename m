From: Jochen Roedenbeck <roe@spl-spindel.de>
Date: Sat, 22 Jan 2005 12:48:14 +0000
Subject: proxyarp, pppd does not remove the arp entries
Message-Id: <41F24B8E.2020600@spl-spindel.de>
List-Id: <linux-ppp.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

I set up a dialin server with mgetty and pppd. It works in general,
but there is a strange problem.

I use the option "proxyarp". When the connection is opened, an arp
entry is created with the address of the remote client, for example
192.168.76.72, which I checked using "arp -n". All works fine.

When the connection gets closed, the arp entry is not removed, as
it should. Instead the first number of the IP address, 192, is
changed to 191.

The arp chache gets longer and longer, and after some time it does not
work any more.

It is version 2.4.1 of pppd, and Linux kernel version 2.4.21. The
distribution is Suse.

What can I do?

Jochen Roedenbeck
