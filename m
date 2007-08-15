From: James Cameron <james.cameron@hp.com>
Date: Wed, 15 Aug 2007 07:00:40 +0000
Subject: Re: ppp_async kfree patch
Message-Id: <20070815070040.GB4471@hp.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <2fa101c7dea0$43531340$f9b5a8c0@pii350>
In-Reply-To: <2fa101c7dea0$43531340$f9b5a8c0@pii350>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

G'day Gilles,

I'll test this patch.

I've been having almost daily hangs or loss of receive data on a system
that has a USB HSDPA modem using the airprime driver, with an instance
of PPP for the modem, an instance of PPP used by PPTP, and one for an
SSH over PPP tunnel.  So the probability of the event is increased.

-- 
James Cameron                         http://quozl.netrek.org/
HP Open Source, Volunteer             http://opensource.hp.com/
PPTP Client Project, Release Engineer http://pptpclient.sourceforge.net/
