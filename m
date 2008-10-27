From: Paulius Zaleckas <paulius.zaleckas@teltonika.lt>
Date: Mon, 27 Oct 2008 08:41:15 +0000
Subject: Re: pppd and it's baud rate setting with HSDPA gsm modems
Message-Id: <49058B16.2000809@teltonika.lt>
List-Id: <linux-ppp.vger.kernel.org>
References: <57c6377703cbf5b94675e4331c5d03c6.squirrel@netlandzone.dyndns.org>
In-Reply-To: <57c6377703cbf5b94675e4331c5d03c6.squirrel@netlandzone.dyndns.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ppp@vger.kernel.org

Jar wrote:
> Hello
> 
> I am using usbserial+option kernel modules with my HSDPA gsm modem. The
> dialer is wvdial.
> 
> wvdial.conf
> 
> [Dialer Defaults]
> Modem = /dev/ttyUSB0
> Baud = 3600000
> ...
> ...
> 
> When I use "Baud = 3600000" in wvdial's config file, the pppd complains
> "pppd[12246]: speed 3600000 not supported". But still I get the 1Mbit/s
> download speed. However if I set "Baud = 460800" the I get also 1Mbit/s
> download speed. But 460800bit/s < 1Mbit/s ??

Option driver doesn't care about baudrate. It can be 9600 and you would
still get 1Mbit/s. This is virtual serial port and it has little common
with real UART.

> Is this kind of "USB serial link" some special case, where pppd doesn't
> use the speed setting at all?

thats driver who is not using speed setting, not pppd.
