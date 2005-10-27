From: "Gilles Espinasse" <g.esp@free.fr>
Date: Thu, 27 Oct 2005 21:33:09 +0000
Subject: Re: Error message with persist option
Message-Id: <032d01c5db3e$06d4c5b0$f9b5a8c0@pii350>
List-Id: <linux-ppp.vger.kernel.org>
References: <20051026194149.GA17341@test-scsi>
In-Reply-To: <20051026194149.GA17341@test-scsi>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org


----- Original Message ----- 
From: "Clifford Kite" <kite_linux-ppp@ev1.net>
To: "Gregory Colpart" <gcolpart@evolix.net>
Cc: <linux-ppp@vger.kernel.org>
Sent: Thursday, October 27, 2005 5:48 PM
Subject: Re: Error message with persist option


> On Wed, 26 Oct 2005, Gregory Colpart wrote:
>
> |I have a i386 Debian 3.1 box with a kernel 2.4.30 and pppd 2.4.3
> |My DSL connnection is PPPoA with a modem PCI card Bewan ST
> |(unicorn driver).
> |
> |When I pon/poff, it works fine. But every 24 hours, my ISP reset
> |my connection and persist option fails to reactivate it.
>
> My two cents:  I think Bill Unruh is correct, i.e., persist only
> works when a PPP link has gone down but the physical layer remains
> functional.  A workaround such as you and Unruh described is likely
> required to automatically reestablish the physical layer after the
> ISP hangup and then the PPP link.
>
modem is still synchronized, atm link remain, is it not the physical layer?

Such PPPoA case was working well  for me with ppp-2.4.1 and a pppoatm.so
plugin.
But as there was sometime a problem with pppoe (and some usb modem driver
don't know to synchronise by themself, some other time usb harware has bug),
I made an ugly hack wich is a bit more complicated than restart the
connection when it goes down.
http://cvs.sourceforge.net/viewcvs.py/ipcop/ipcop/src/rc.d/Attic/rc.connectioncheck?rev=1.4.2.22&only_with_tag=IPCOP_v1_4_0&view=markup

It is a sum of various hack, it may have some races, it is not very
interactive user friendly due to the numerous wait.
But it does reconnect in every cases I know (ppp-2.4.3 is used without
persist option).

Gilles

