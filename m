From: James Cameron <james.cameron@hp.com>
Date: Fri, 24 Aug 2007 02:24:57 +0000
Subject: Re: ppp_async kfree patch
Message-Id: <20070824022457.GK4368@hp.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <2fa101c7dea0$43531340$f9b5a8c0@pii350>
In-Reply-To: <2fa101c7dea0$43531340$f9b5a8c0@pii350>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

This patch has fixed the kernel hangs I had been having on a system
using three instances of pppd a USB HSDPA modem.

In the situations where the hang would normally occur, what I now see is
disconnection and reconnection of the USB device, apparently triggered
by electrical noise or RF interference.

I presume that what was happening before this patch was that the
disconnection of the USB device caused a deadlock, associated with this
area of ppp_async.

-- 
James Cameron                         http://quozl.netrek.org/
HP Open Source, Volunteer             http://opensource.hp.com/
PPTP Client Project, Release Engineer http://pptpclient.sourceforge.net/
