From: Clifford Kite <kite_linux-ppp@ev1.net>
Date: Thu, 27 Oct 2005 15:48:32 +0000
Subject: Re: Error message with persist option
Message-Id: <Pine.LNX.4.21.0510270946070.18101-100000@corncob.inetport.tld>
List-Id: <linux-ppp.vger.kernel.org>
References: <20051026194149.GA17341@test-scsi>
In-Reply-To: <20051026194149.GA17341@test-scsi>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

On Wed, 26 Oct 2005, Gregory Colpart wrote:

|I have a i386 Debian 3.1 box with a kernel 2.4.30 and pppd 2.4.3
|My DSL connnection is PPPoA with a modem PCI card Bewan ST
|(unicorn driver).
|
|When I pon/poff, it works fine. But every 24 hours, my ISP reset
|my connection and persist option fails to reactivate it.

My two cents:  I think Bill Unruh is correct, i.e., persist only
works when a PPP link has gone down but the physical layer remains
functional.  A workaround such as you and Unruh described is likely
required to automatically reestablish the physical layer after the
ISP hangup and then the PPP link.

---
Clifford Kite


