From: James Cameron <james.cameron@hp.com>
Date: Mon, 27 Oct 2008 22:08:36 +0000
Subject: Re: pppd and it's baud rate setting with HSDPA gsm modems
Message-Id: <20081027220836.GA10538@hp.com>
List-Id: <linux-ppp.vger.kernel.org>
References: <57c6377703cbf5b94675e4331c5d03c6.squirrel@netlandzone.dyndns.org>
In-Reply-To: <57c6377703cbf5b94675e4331c5d03c6.squirrel@netlandzone.dyndns.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Setting the speed on a HSDPA or GPRS modem is done using AT commands,
and this is part of the negotiation between the modem firmware and the
service provider's radio network.  The service provider may constrain
the speed.  The received signal strength and bit error rate may
constrain the speed.  The base station's uplink may constrain the speed.

To fiddle with the Quality of Service settings to change the speed, look
for the modem documentation.  The exact command depends on the modem,
but I've been able to reduce the speed using one of these: +CGEQREQ
+CGEQMIN +CGQREQ +CGQMIN ... I've never got it to go faster without
fixing the root cause of why it is slow.

The speed between the modem and the host is constrained by the USB
drivers.  Ensure you are using a USB 2.0 port.  Ensure you are using a
USB driver that pre-queues URBs.  The current usbserial and option
module in kernel 2.6.27 do this fine.

-- 
James Cameron
http://ftp.hp.com.au/sigs/jc/
